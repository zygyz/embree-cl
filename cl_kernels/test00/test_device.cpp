#include "tutorial/tutorial_device.h"
#include <iostream>
using std::cout;
using std::endl;

const int numPhi = 5;
const int numTheta = 2 * numPhi;
Vec3fa colors[2];
float radius;
renderPixelFunc renderPixel;
RTCScene g_scene = NULL;
void error_handler(const RTCError code, const int8* str) {
    printf("Embree: ");
    switch(code) {
	case RTC_UNKNOWN_ERROR : printf("RTC_UNKNOWN_ERROR"); break;
        case RTC_INVALID_ARGUMENT: printf("RTC_INVALID_ARGUMENT");break;
	case RTC_INVALID_OPERATION: printf("RTC_INVALID_OPERATION");break;
	case RTC_OUT_OF_MEMORY: printf("RTC_OUT_OF_MEMORY"); break;
	default : printf("invalid error code");break;
    }
    if(str) {
	printf("(");
	while(*str) putchar(*str++);
	    printf(")\n");
    }
   abort(); 
}

unsigned int createSphere (const Vec3fa& pos, const float r) {
    unsigned int mesh = rtcNewTriangleMesh (g_scene, RTC_GEOMETRY_STATIC, 2 * numTheta * (numPhi-1), numTheta*(numPhi+1));
    Vertex* vertices = (Vertex* ) rtcMapBuffer(g_scene,mesh,RTC_VERTEX_BUFFER);
    Triangle* triangles = (Triangle*) rtcMapBuffer(g_scene,mesh,RTC_INDEX_BUFFER);
    int tri = 0;
    const float rcpNumTheta = rcp((float)numTheta); // rcpNumTheta = 1/numTheta
    const float rcpNumPhi = rcp((float)numPhi);
    cout << "numTheta : " << numTheta << " rcpNumTheta " << rcpNumTheta << endl;
    cout << "numPhi : " << numPhi << " rcpNumPhi " << rcpNumPhi << endl;
    for(int phi = 0; phi <= numPhi; ++phi) {
	cout << "phi " << phi << endl;
	for(int theta = 0; theta < numTheta; ++theta) {
	    const float phif = phi * float(pi) * rcpNumPhi;
	    const float thetaf = theta * 2.0f * float(pi) * rcpNumTheta;
	    cout << "thetaf: " << thetaf  << " phif " << phif << endl;
	    Vertex& v = vertices[phi*numTheta + theta];
	    v.x = pos.x + r*sin(phif)*sin(thetaf);
	    v.y = pos.y + r*cos(phif);
	    v.z = pos.z + r*sin(phif)*cos(thetaf);
	}
	if(phi == 0) continue;
	for(int theta = 1; theta <= numTheta; theta++) {
	    int p00 = (phi-1)*numTheta + theta -1;
	    int p01 = (phi-1)*numTheta + theta%numTheta;
	    int p10 = phi * numTheta + theta -1;
	    int p11 = phi * numTheta + theta%numTheta;
	    if(phi > 1) {
		triangles[tri].v0 = p10;
		triangles[tri].v1 = p00;
		triangles[tri].v2 = p01;
		tri++;
	    }
	    if(phi < numPhi) {
		triangles[tri].v0 = p11;
		triangles[tri].v1 = p10;
		triangles[tri].v2 = p01;
		tri++;
	    }
	}
    }
    rtcUnmapBuffer(g_scene,mesh,RTC_VERTEX_BUFFER);
    rtcUnmapBuffer(g_scene,mesh,RTC_INDEX_BUFFER);
    return mesh;
}

unsigned int addGroundPlane(RTCScene scene_i) {
    unsigned int mesh = rtcNewTriangleMesh(scene_i, RTC_GEOMETRY_STATIC,2,4);
    Vertex* vertices = (Vertex*) rtcMapBuffer(scene_i,mesh,RTC_VERTEX_BUFFER);
    vertices[0].x = -10; vertices[0].y = -2; vertices[0].z = -10;
    vertices[1].x = -10; vertices[1].y = -2; vertices[1].z = 10;
    vertices[2].x = 10;  vertices[2].y = -2; vertices[2].z = -10;
    vertices[3].x = 10;  vertices[3].y = -2; vertices[3].z = 10;
    rtcUnmapBuffer(scene_i,mesh,RTC_VERTEX_BUFFER);
    Triangle* triangles = (Triangle*) rtcMapBuffer(scene_i,mesh,RTC_INDEX_BUFFER);
    triangles[0].v0 = 0; triangles[0].v1 = 2; triangles[0].v2 = 1;
    triangles[1].v0 = 1; triangles[1].v1 = 2; triangles[1].v2 = 3;
    rtcUnmapBuffer(scene_i,mesh,RTC_INDEX_BUFFER);
    return mesh;
}

extern "C" void device_init (int8* cfg) {
    cout << "device_init " << endl;
    rtcInit(cfg);
    rtcSetErrorFunction(error_handler);
    g_scene = rtcNewScene(RTC_SCENE_STATIC,RTC_INTERSECT1);
    const float r = 1.0f;
    const Vec3fa p = 1.0f*Vec3fa(0,0,1);
    int id = createSphere(p,r);
    cout << "id " << id << endl;
    colors[id] = Vec3fa(1.0,0.0,0.0); 
    radius = r;
    id = addGroundPlane(g_scene);
    colors[id] = Vec3fa(1.0f,1.0f,1.0f);
    
    rtcCommit(g_scene);
    cout << "commit ok" << endl;
    cout << "device_init bbb" << endl;
    renderPixel = renderPixelStandard;
    cout << "device_init ok " << endl;
}

Vec3fa renderPixelStandard(float x, float y, const Vec3fa& vx, const Vec3fa& vy, const Vec3fa& vz, const Vec3fa& p) {
    RTCRay ray;
    ray.org = p;
    ray.dir = normalize(x*vx + y*vy + vz);
    ray.tnear = 0.0f;
    ray.tfar = inf;
    ray.geomID = RTC_INVALID_GEOMETRY_ID;
    ray.primID = RTC_INVALID_GEOMETRY_ID;
    ray.mask = -1;
    ray.time = 0;
    cout << "ray before intersect: " << ray << endl;
    rtcIntersect(g_scene,ray);
    cout << "ray after intersect: " << ray << endl;
    Vec3fa color = Vec3fa(0.0f);
    if(ray.geomID != RTC_INVALID_GEOMETRY_ID) {
	Vec3fa diffuse = colors[ray.geomID];// the color of the intersected object
	color = color + diffuse * 0.1f;
	Vec3fa lightDir = normalize(Vec3fa(-1,-1,-1));
	RTCRay shadow;
	shadow.org = ray.org + ray.tfar*ray.dir;
	shadow.dir = neg(lightDir);
	shadow.tnear = 0.001f;
	shadow.tfar = inf;
	shadow.geomID = 1;
	shadow.primID = 0;
	shadow.mask = -1;
	shadow.time = 0;
	rtcOccluded(g_scene,shadow);
	if(shadow.geomID)
	    color = color + diffuse * clamp(-dot(lightDir,normalize(ray.Ng)),0.0f,1.0f);
    }
    return color;
}

void renderTile(int taskIndex, int* pixels,
                     const int width,
                     const int height, 
                     const float time,
                     const Vec3fa& vx, 
                     const Vec3fa& vy, 
                     const Vec3fa& vz, 
                     const Vec3fa& p,
                     const int numTilesX, 
                     const int numTilesY)
{
  const int tileY = taskIndex / numTilesX;
  const int tileX = taskIndex - tileY * numTilesX;
  const int x0 = tileX * TILE_SIZE_X;
  const int x1 = min(x0+TILE_SIZE_X,width);
  const int y0 = tileY * TILE_SIZE_Y;
  const int y1 = min(y0+TILE_SIZE_Y,height);

  for (int y = y0; y<y1; y++) for (int x = x0; x<x1; x++)
  {
    /* calculate pixel color */
    Vec3fa color = renderPixel(x,y,vx,vy,vz,p);

    /* write color to framebuffer */
    unsigned int r = (unsigned int) (255.0f * clamp(color.x,0.0f,1.0f));
    unsigned int g = (unsigned int) (255.0f * clamp(color.y,0.0f,1.0f));
    unsigned int b = (unsigned int) (255.0f * clamp(color.z,0.0f,1.0f));
    pixels[y*width+x] = (b << 16) + (g << 8) + r;
  }
}

extern "C" void device_render(int * pixels,
			    const int width,
			    const int height,
			    const float time,
			    const Vec3fa& vx,
			    const Vec3fa& vy,
			    const Vec3fa& vz,
			    const Vec3fa& p) {
    const int numTilesX = (width + TILE_SIZE_X-1)/TILE_SIZE_X;
    const int numTilesY = (height + TILE_SIZE_Y-1)/TILE_SIZE_Y;
   launch_renderTile(numTilesX*numTilesY, pixels,width,height,time,vx,vy,vz,p,numTilesX,numTilesY);
    rtcDebug();
}

extern "C" void device_cleanup() {
    rtcDeleteScene(g_scene);
    rtcExit();
}
