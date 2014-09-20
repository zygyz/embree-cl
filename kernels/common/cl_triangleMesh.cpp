#include "cl_triangleMesh.h"

namespace embree {

  TriangleMeshCL::TriangleMeshCL(SceneCL* parent, size_t numTriangles, size_t numVertices):GeometryCL(parent,numTriangles,TRIANGLE_MESH_CL) {
    vtriangles.reserve(numTriangles);
    vvertices.reserve(numVertices);
    vtriangleCL.reserve(numTriangles); 
  }

  void TriangleMeshCL::map(RTCBufferType type, void*ptr, size_t size) {
    switch(type) {
	case RTC_VERTEX_BUFFER:{
	    Vec3fa* tmptr = (Vec3fa*)ptr;
	    for(int i = 0; i < size; ++i) {
		Vec3fa tmp = tmptr[i];
		vvertices.push_back(tmp);	
	    }
	    parent->numMappedBuffers += size * sizeof(Vec3fa);

	    break;
	}
	case RTC_INDEX_BUFFER:{
	    std::cout << "RTC_INDEX_BUFFER size" <<  size <<  std::endl;
	    TriangleID* tmptr = (TriangleID*)ptr;
	    for(int i = 0; i < size; ++i) {
	        TriangleID tmp = tmptr[i];
		std::cout << "vtriangles.push_back" << i << std::endl;
		vtriangles.push_back(tmp);
	    }
	    parent->numMappedBuffers += size * sizeof(TriangleID);
	    parent->geom_num += 1;
	    break;
	}
    }
  }
    
  void TriangleMeshCL::unmap(RTCBufferType type) {
     vtriangles.clear();
     vvertices.clear();
     vtriangleCL.clear();
  }

  void TriangleMeshCL::buildTriangleCL() {
      int size = vtriangles.size();
      std::cout << "vtriangles.size() " << size << std::endl;   
      for(int i = 0; i < size; ++i) {
	 TriangleID tmp = vtriangles[i];
	 int v0 = tmp.v0;
	 int v1 = tmp.v1;
	 int v2 = tmp.v2;
	 int mID = tmp.materialID;
	 TriangleMeshCL::TriangleCL triangle;
	 triangle.v0 = vvertices[v0];
	 triangle.v1 = vvertices[v1];
	 triangle.v2 = vvertices[v2];
	 triangle.materialID = mID;
	 vtriangleCL.push_back(triangle);  
      }
      parent->numMappedBuffers += size * sizeof(TriangleCL);
  }


  void TriangleMeshCL::buildPrimitive() {
     buildTriangleCL();
  }
  
  void TriangleMeshCL::printinfo() {
      std::cout << "TriangleMeshCL::printinfo " << std::endl;
      std::cout << "vtriangleCL.size() " << vtriangleCL.size() << std::endl;
     for(int i = 0; i < vtriangleCL.size(); ++i) {
	TriangleCL tmp = vtriangleCL[i];
	std::cout << "Triangle Number " << i << std::endl;
	std::cout << "v0: (" << tmp.v0.x << "," << tmp.v0.y << "," << tmp.v0.z << ")" << std::endl;
	std::cout << "v1: (" << tmp.v1.x << "," << tmp.v1.y << "," << tmp.v1.z << ")" << std::endl;

	std::cout << "v2: (" << tmp.v2.x << "," << tmp.v2.y << "," << tmp.v2.z << ")" << std::endl;
     }
  }
 
}
