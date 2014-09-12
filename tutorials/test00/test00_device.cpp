#include "../common/tutorial/tutorial_device.h"

struct ISPCTriangle 
{
  int v0;                /*< first triangle vertex */
  int v1;                /*< second triangle vertex */
  int v2;                /*< third triangle vertex */
  int materialID;        /*< material of triangle */
};

struct ISPCMaterial
{
  int illum;             /*< illumination model */
  
  float d;               /*< dissolve factor, 1=opaque, 0=transparent */
  float Ns;              /*< specular exponent */
  float Ni;              /*< optical density for the surface (index of refraction) */
  
  Vec3fa Ka;              /*< ambient reflectivity */
  Vec3fa Kd;              /*< diffuse reflectivity */
  Vec3fa Ks;              /*< specular reflectivity */
  Vec3fa Tf;              /*< transmission filter */
};

struct ISPCMesh
{
  Vec3fa* positions;    //!< vertex position array
  Vec3fa* normals;       //!< vertex normal array
  Vec2f* texcoords;     //!< vertex texcoord array
  ISPCTriangle* triangles;  //!< list of triangles
  int numVertices;
  int numTriangles;
  Vec3fa dir;
  float offset;
};

struct ISPCHair
{
 int vertex,id;  //!< index of first control point and hair ID
};

struct ISPCHairSet
{
 Vec3fa *positions;   //!< hair control points (x,y,z,r)
 ISPCHair *hairs;    //!< list of hairs
 int numVertices;
 int numHairs;
};


struct ISPCScene
{
  ISPCMesh** meshes;         //!< list of meshes
  ISPCMaterial* materials;  //!< material list
  int numMeshes;
  int numMaterials;
  ISPCHairSet** hairsets;
  int numHairSets;
  bool animate;
};

/* scene data */
extern "C" ISPCScene* g_ispc_scene;
RTCScene g_scene = NULL;

/* render function to use */
renderPixelFunc renderPixel;

/* error reporting function */
void error_handler(const RTCError code, const int8* str)
{
  printf("Embree: ");
  switch (code) {
  case RTC_UNKNOWN_ERROR    : printf("RTC_UNKNOWN_ERROR"); break;
  case RTC_INVALID_ARGUMENT : printf("RTC_INVALID_ARGUMENT"); break;
  case RTC_INVALID_OPERATION: printf("RTC_INVALID_OPERATION"); break;
  case RTC_OUT_OF_MEMORY    : printf("RTC_OUT_OF_MEMORY"); break;
  case RTC_UNSUPPORTED_CPU  : printf("RTC_UNSUPPORTED_CPU"); break;
  default                   : printf("invalid error code"); break;
  }
  if (str) { 
    printf(" ("); 
    while (*str) putchar(*str++); 
    printf(")\n"); 
  }
  abort();
}

Vec3fa renderPixelEyeLight(float x, float y, const Vec3fa& vx, const Vec3fa& vy, const Vec3fa& vz, const Vec3fa& p);

/* called by the C++ code for initialization */
extern "C" void device_init (int8* cfg)
{
  /* initialize ray tracing core */
    std::cout << "device_init " << std::endl;
  rtcInit(cfg);

  /* set error handler */
  rtcSetErrorFunction(error_handler);
    
  /* set start render mode */
  renderPixel = renderPixelStandard;
  //renderPixel = renderPixelEyeLight;	
}

RTCScene convertScene(ISPCScene* scene_in)
{
  /* create scene */
  std::cout << "convertScene" << std::endl;
  CLRTScene scene_cl_out = clrtNewScene();
  std::cout << "clrtNewScene end " << std::endl;
  
  RTCScene scene_out = rtcNewScene(RTC_SCENE_STATIC,RTC_INTERSECT1);


  /* add all meshes to the scene */
  for (int i=0; i<scene_in->numMeshes; i++)
  {
    /* get ith mesh */
    ISPCMesh* mesh = scene_in->meshes[i];

    /* create a triangle mesh */
    unsigned int geometry = rtcNewTriangleMesh (scene_out, RTC_GEOMETRY_STATIC, mesh->numTriangles, mesh->numVertices);

    unsigned int geometry_cl = clrtNewTriangleMesh(scene_cl_out, mesh->numTriangles, mesh->numVertices);   

    std::cout << "barrier " << std::endl;
#if !defined(__XEON_PHI__)
    /* share vertex buffer */
    std::cout << "share vertex buffer " << std::endl;
    clrtSetBuffer(scene_cl_out, geometry_cl, RTC_VERTEX_BUFFER, mesh->positions, mesh->numVertices);

    clrtSetBuffer(scene_cl_out, geometry_cl, RTC_INDEX_BUFFER, mesh->triangles, mesh->numTriangles);

    rtcSetBuffer(scene_out, geometry, RTC_VERTEX_BUFFER, mesh->positions, 0, sizeof(Vec3fa      ));
    rtcSetBuffer(scene_out, geometry, RTC_INDEX_BUFFER,  mesh->triangles, 0, sizeof(ISPCTriangle));
#else
    std::cout << "no share vertex buffer " << std::endl;
    /* set vertices */
    Vertex* vertices = (Vertex*) rtcMapBuffer(scene_out,geometry,RTC_VERTEX_BUFFER); 
    for (int j=0; j<mesh->numVertices; j++) {
      vertices[j].x = mesh->positions[j].x;
      vertices[j].y = mesh->positions[j].y;
      vertices[j].z = mesh->positions[j].z;
    }
    rtcUnmapBuffer(scene_out,geometry,RTC_VERTEX_BUFFER); 

    /* set triangles */
    Triangle* triangles = (Triangle*) rtcMapBuffer(scene_out,geometry,RTC_INDEX_BUFFER);
    for (int j=0; j<mesh->numTriangles; j++) {
      triangles[j].v0 = mesh->triangles[j].v0;
      triangles[j].v1 = mesh->triangles[j].v1;
      triangles[j].v2 = mesh->triangles[j].v2;
    }
    rtcUnmapBuffer(scene_out,geometry,RTC_INDEX_BUFFER);
#endif
  }

  /* commit changes to scene */
  clrtBuildPrimitives(scene_cl_out); 
  clrtPrintSceneInfo(scene_cl_out);
  rtcCommit (scene_out);
  return scene_out;
}

/* task that renders a single screen tile */
Vec3fa renderPixelStandard(float x, float y, const Vec3fa& vx, const Vec3fa& vy, const Vec3fa& vz, const Vec3fa& p)
{
  /* initialize ray */
  RTCRay ray;
  ray.org = p;
  ray.dir = normalize(x*vx + y*vy + vz);
  ray.tnear = 0.0f;
  ray.tfar = inf;
  ray.geomID = RTC_INVALID_GEOMETRY_ID;
  ray.primID = RTC_INVALID_GEOMETRY_ID;
  ray.mask = -1;
  ray.time = 0;
  
  /* intersect ray with scene */
  rtcIntersect(g_scene,ray);
  
  /* shade background black */
  if (ray.geomID == RTC_INVALID_GEOMETRY_ID) return Vec3fa(0.0f);
  
  /* shade all rays that hit something */
  Vec3fa color = Vec3fa(0.0f);
  Vec3fa Ns = Vec3fa(0.0f);

#if 1 // FIXME: pointer gather not implemented on ISPC for Xeon Phi
  ISPCMesh* mesh = g_ispc_scene->meshes[ray.geomID];
  ISPCTriangle* tri = &mesh->triangles[ray.primID];

  /* load material ID */
  int materialID = tri->materialID;

  /* interpolate shading normal */
  if (mesh->normals) {
    Vec3fa n0 = Vec3fa(mesh->normals[tri->v0]);
    Vec3fa n1 = Vec3fa(mesh->normals[tri->v1]);
    Vec3fa n2 = Vec3fa(mesh->normals[tri->v2]);
    float u = ray.u, v = ray.v, w = 1.0f-ray.u-ray.v;
    Ns = normalize(w*n0 + u*n1 + v*n2);
  } else {
    Ns = normalize(ray.Ng);
  }

#else

  int materialID = 0;
  foreach_unique (geomID in ray.geomID) 
  {
    ISPCMesh* mesh = g_ispc_scene->meshes[geomID];
    
    foreach_unique (primID in ray.primID) 
    {
      ISPCTriangle* tri = &mesh->triangles[primID];
      
      /* load material ID */
      materialID = tri->materialID;

      /* interpolate shading normal */
      if (mesh->normals) {
        Vec3fa n0 = Vec3fa(mesh->normals[tri->v0]);
        Vec3fa n1 = Vec3fa(mesh->normals[tri->v1]);
        Vec3fa n2 = Vec3fa(mesh->normals[tri->v2]);
        float u = ray.u, v = ray.v, w = 1.0f-ray.u-ray.v;
        Ns = w*n0 + u*n1 + v*n2;
      } else {
        Ns = normalize(ray.Ng);
      }
    }
  }
  Ns = normalize(Ns);
#endif
  ISPCMaterial* material = &g_ispc_scene->materials[materialID];
  color = Vec3fa(material->Kd);

  /* apply ambient light */
  Vec3fa Nf = faceforward(Ns,neg(ray.dir),Ns);
  //Vec3fa Ng = normalize(ray.Ng);
  //Vec3fa Nf = dot(ray.dir,Ng) < 0.0f ? Ng : neg(Ng);
  color = color*dot(ray.dir,Nf);   // FIXME: *=
  return color;
}

/* task that renders a single screen tile */
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

/* called by the C++ code to render */
extern "C" void device_render (int* pixels,
                           const int width,
                           const int height, 
                           const float time,
                           const Vec3fa& vx, 
                           const Vec3fa& vy, 
                           const Vec3fa& vz, 
                           const Vec3fa& p)
{
  /* create scene */
    std::cout << "device_render called " << std::endl;
  if (g_scene == NULL) // only called once
    g_scene = convertScene(g_ispc_scene);

  /* render image */
  const int numTilesX = (width +TILE_SIZE_X-1)/TILE_SIZE_X;
  const int numTilesY = (height+TILE_SIZE_Y-1)/TILE_SIZE_Y;
  launch_renderTile(numTilesX*numTilesY,pixels,width,height,time,vx,vy,vz,p,numTilesX,numTilesY); 
  rtcDebug();
}

/* called by the C++ code for cleanup */
extern "C" void device_cleanup ()
{
  rtcDeleteScene (g_scene);
  rtcExit();
}
