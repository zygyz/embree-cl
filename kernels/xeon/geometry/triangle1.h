
#pragma once

#include "primitive.h"

namespace embree
{
  struct Triangle1
  {
  public:

    /*! Default constructor. */
    __forceinline Triangle1 () {}

    /*! Construction from vertices and IDs. */
    __forceinline Triangle1 (const Vec3fa& v0, const Vec3fa& v1, const Vec3fa& v2, const unsigned int geomID, const unsigned int primID, const unsigned int mask)
      : v0(v0,primID), v1(v1,geomID), v2(v2,mask), Ng(cross(v0-v1,v2-v0)) {}

    /*! calculate the bounds of the triangle */
    __forceinline BBox3fa bounds() const {
      return merge(BBox3fa(v0),BBox3fa(v1),BBox3fa(v2));
    }

    /*! access hidden members */
    __forceinline unsigned int primID() const { return v0.a; }
    __forceinline unsigned int geomID() const { return v1.a; }
    __forceinline unsigned int mask  () const { return v2.a; }

    /*! fill triangle from triangle list */
    __forceinline void fill(atomic_set<PrimRefBlock>::block_iterator_unsafe& prims, Scene* scene)
    {
      const PrimRef& prim = *prims;
      const unsigned geomID = prim.geomID();
      const unsigned primID = prim.primID();
      const TriangleMesh* mesh = scene->getTriangleMesh(geomID);
      const TriangleMesh::Triangle& tri = mesh->triangle(primID);
      const Vec3fa& p0 = mesh->vertex(tri.v[0]);
      const Vec3fa& p1 = mesh->vertex(tri.v[1]);
       const Vec3fa& p2 = mesh->vertex(tri.v[2]);
      new (this) Triangle1(p0,p1,p2,mesh->id,primID,mesh->mask);
      prims++;
    }
    
  public:
    Vec3fa v0;          //!< first vertex and primitive ID
    Vec3fa v1;          //!< second vertex and geometry ID
    Vec3fa v2;          //!< third vertex and geometry mask
    Vec3fa Ng;          //!< Geometry normal of the triangles.
  };

  struct Triangle1Type : public PrimitiveType {
    Triangle1Type ();
    size_t blocks(size_t x) const;
    size_t size(const char* This) const;
  };

  struct SceneTriangle1 : public Triangle1Type
  {
    static SceneTriangle1 type;
    void pack(char* dst, atomic_set<PrimRefBlock>::block_iterator_unsafe& prims, void* geom) const; 
    void pack(char* dst, const PrimRef* prims, size_t num, void* geom) const;
    BBox3fa update(char* prim, size_t num, void* geom) const;
  };

  struct TriangleMeshTriangle1 : public Triangle1Type
  {
    static TriangleMeshTriangle1 type;
    void pack(char* dst, atomic_set<PrimRefBlock>::block_iterator_unsafe& prims, void* geom) const;
    void pack(char* dst, const PrimRef* prims, size_t num, void* geom) const;
    BBox3fa update(char* prim, size_t num, void* geom) const;
  };
}
