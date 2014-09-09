#pragma once

#include "common/default.h"

#include "scene_triangle_mesh.h"
#include "scene_user_geometry.h"
#include "scene_bezier_curves.h"

#include "common/acceln.h"
#include "geometry.h"

namespace embree
{
  /*! Base class all scenes are derived from */
  class Scene : public Accel
  {
    ALIGNED_CLASS;
  public:
    
    /*! Scene construction */
    Scene (RTCSceneFlags flags, RTCAlgorithmFlags aflags);

    void createTriangleAccel();
    void createHairAccel();

    /*! Scene destruction */
    ~Scene ();

    /*! Creates new user geometry. */
    unsigned int newUserGeometry (size_t items);

    /*! Creates a new scene instance. */
    unsigned int newInstance (Scene* scene);

    /*! Creates a new triangle mesh. */
    unsigned int newTriangleMesh (RTCGeometryFlags flags, size_t maxTriangles, size_t maxVertices, size_t numTimeSteps);

    /*! Creates a new collection of quadratic bezier curves. */
    unsigned int newBezierCurves (RTCGeometryFlags flags, size_t maxCurves, size_t maxVertices, size_t numTimeSteps);

    /*! Builds acceleration structure for the scene. */
    void build ();

    void build (size_t threadIndex, size_t threadCount);

    /*! build task */
    TASK_COMPLETE_FUNCTION(Scene,task_build);//important, that's the reason why _task_build has the front hyperline
    TaskScheduler::Task task;

    /* return number of geometries */
    __forceinline size_t size() const { return geometries.size(); }
    
    /* add user geometry to scene */
    unsigned int add (Geometry* geometry);
    
    /* removes user geometry from scene again */
    void remove(Geometry* geometry);

    /* determines of the scene is ready to get build */
    bool ready() { return numMappedBuffers == 0; }

    /* get mesh by ID */
    __forceinline       Geometry* get(size_t i)       { assert(i < geometries.size()); return geometries[i]; }
    __forceinline const Geometry* get(size_t i) const { assert(i < geometries.size()); return geometries[i]; }

    __forceinline       Geometry* get_locked(size_t i)  { 
      Lock<AtomicMutex> lock(geometriesMutex);
      Geometry *g = geometries[i]; 
      assert(i < geometries.size()); 
      return g; 
    }

    /* get triangle mesh by ID */
    __forceinline TriangleMesh* getTriangleMesh(size_t i) { 
      assert(i < geometries.size()); 
      assert(geometries[i]);
      assert(geometries[i]->type == TRIANGLE_MESH);
      return (TriangleMesh*) geometries[i]; 
    }
    __forceinline const TriangleMesh* getTriangleMesh(size_t i) const { 
      assert(i < geometries.size()); 
      assert(geometries[i]);
      assert(geometries[i]->type == TRIANGLE_MESH);
      return (TriangleMesh*) geometries[i]; 
    }
    __forceinline TriangleMesh* getTriangleMeshSafe(size_t i) { 
      assert(i < geometries.size()); 
      if (geometries[i] == NULL) return NULL;
      if (geometries[i]->type != TRIANGLE_MESH) return NULL;
      else return (TriangleMesh*) geometries[i]; 
    }
    __forceinline UserGeometryBase* getUserGeometrySafe(size_t i) { 
      assert(i < geometries.size()); 
      if (geometries[i] == NULL) return NULL;
      if (geometries[i]->type != USER_GEOMETRY) return NULL;
      else return (UserGeometryBase*) geometries[i]; 
    }
    __forceinline BezierCurves* getBezierCurves(size_t i) { 
      assert(i < geometries.size()); 
      assert(geometries[i]);
      assert(geometries[i]->type == BEZIER_CURVES);
      return (BezierCurves*) geometries[i]; 
    }


    /* test if this is a static scene */
    __forceinline bool isStatic() const { return embree::isStatic(flags); }

    /* test if this is a dynamic scene */
    __forceinline bool isDynamic() const { return embree::isDynamic(flags); }

    __forceinline bool isCompact() const { return embree::isCompact(flags); }
    __forceinline bool isCoherent() const { return embree::isCoherent(flags); }
    __forceinline bool isRobust() const { return embree::isRobust(flags); }
    __forceinline bool isHighQuality() const { return embree::isHighQuality(flags); }

    /* test if scene got already build */
    __forceinline bool isBuild() const { return is_build; }

  public:
    std::vector<int> usedIDs;
    std::vector<Geometry*> geometries; //!< list of all user geometries
    
  public:
    AccelN accels;
    atomic_t numMappedBuffers;         //!< number of mapped buffers
    RTCSceneFlags flags;
    RTCAlgorithmFlags aflags;
    bool needTriangles;
    bool needVertices;
    bool is_build;
    MutexSys mutex;
    AtomicMutex geometriesMutex;

  public:
    atomic_t numTriangleMeshes;        //!< number of enabled triangle meshes // FIXME: remove
    atomic_t numTriangleMeshes2;       //!< number of enabled motion blur triangle meshes // FIXME: remove
    atomic_t numTriangles;             //!< number of enabled triangles
    atomic_t numTriangles2;            //!< number of enabled motion blur triangles
    atomic_t numBezierCurves;                //!< number of enabled curves
    atomic_t numBezierCurves2;               //!< number of enabled motion blur curves

    atomic_t numUserGeometries1;        //!< number of enabled user geometries
    atomic_t numIntersectionFilters4;   //!< number of enabled intersection/occlusion filters for 4-wide ray packets
    atomic_t numIntersectionFilters8;   //!< number of enabled intersection/occlusion filters for 8-wide ray packets
    atomic_t numIntersectionFilters16;  //!< number of enabled intersection/occlusion filters for 16-wide ray packets
  };
}
