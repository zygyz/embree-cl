// ======================================================================== //
// Copyright 2009-2014 Intel Corporation                                    //
//                                                                          //
// Licensed under the Apache License, Version 2.0 (the "License");          //
// you may not use this file except in compliance with the License.         //
// You may obtain a copy of the License at                                  //
//                                                                          //
//     http://www.apache.org/licenses/LICENSE-2.0                           //
//                                                                          //
// Unless required by applicable law or agreed to in writing, software      //
// distributed under the License is distributed on an "AS IS" BASIS,        //
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. //
// See the License for the specific language governing permissions and      //
// limitations under the License.                                           //
// ======================================================================== //

#pragma once

#include "primitive.h"

namespace embree
{
#if defined __AVX__

  /*! Precalculated representation for 8 triangles. Stores for each
      triangle a base vertex, two edges, and the geometry normal to
      speed up intersection calculations. */
  struct Triangle8
  {
  public:

    /*! Default constructor. */
    __forceinline Triangle8 () {}

    /*! Construction from vertices and IDs. */
    __forceinline Triangle8 (const avx3f& v0, const avx3f& v1, const avx3f& v2, const avxi& geomID, const avxi& primID, const avxi& mask)
      : v0(v0), e1(v0-v1), e2(v2-v0), Ng(cross(e1,e2)), geomID(geomID), primID(primID)
    {
#if defined(__USE_RAY_MASK__)
      this->mask = mask;
#endif
    }

    /*! Returns if the specified triangle is valid. */
    __forceinline bool valid(const size_t i) const { 
      assert(i<8); 
      return geomID[i] != -1; 
    }

    /*! Returns a mask that tells which triangles are valid. */
    __forceinline avxb valid() const { return geomID != avxi(-1); }

    /*! Returns a mask that tells which triangles are invalid. */
    __forceinline avxb invalid() const { return geomID == avxi(-1); }

    /*! Returns the number of stored triangles. */
    __forceinline unsigned int size() const {
      return __bsf(~movemask(valid()));
    }

    /*! calculate the bounds of the triangle */
    __forceinline BBox3fa bounds() const 
    {
      avx3f p0 = v0;
      avx3f p1 = v0+e1;
      avx3f p2 = v0+e2;
      avx3f lower = min(p0,p1,p2);
      avx3f upper = max(p0,p1,p2);
      avxb mask = valid();
      lower.x = select(mask,lower.x,avxf(pos_inf));
      lower.y = select(mask,lower.y,avxf(pos_inf));
      lower.z = select(mask,lower.z,avxf(pos_inf));
      upper.x = select(mask,upper.x,avxf(neg_inf));
      upper.y = select(mask,upper.y,avxf(neg_inf));
      upper.z = select(mask,upper.z,avxf(neg_inf));
      return BBox3fa(Vec3fa(reduce_min(lower.x),reduce_min(lower.y),reduce_min(lower.z)),
                    Vec3fa(reduce_max(upper.x),reduce_max(upper.y),reduce_max(upper.z)));
    }

    /*! non temporal store */
    __forceinline static void store_nt(Triangle8* dst, const Triangle8& src)
    {
      store8f_nt(&dst->v0.x,src.v0.x);
      store8f_nt(&dst->v0.y,src.v0.y);
      store8f_nt(&dst->v0.z,src.v0.z);
      store8f_nt(&dst->e1.x,src.e1.x);
      store8f_nt(&dst->e1.y,src.e1.y);
      store8f_nt(&dst->e1.z,src.e1.z);
      store8f_nt(&dst->e2.x,src.e2.x);
      store8f_nt(&dst->e2.y,src.e2.y);
      store8f_nt(&dst->e2.z,src.e2.z);
      store8f_nt(&dst->Ng.x,src.Ng.x);
      store8f_nt(&dst->Ng.y,src.Ng.y);
      store8f_nt(&dst->Ng.z,src.Ng.z);
      store8i_nt(&dst->geomID,src.geomID);
      store8i_nt(&dst->primID,src.primID);
#if defined(__USE_RAY_MASK__)
      store8i_nt(&dst->mask,src.mask);
#endif
    }

    /*! fill triangle from triangle list */
    __forceinline void fill(atomic_set<PrimRefBlock>::block_iterator_unsafe& prims, Scene* scene)
    {
      avxi geomID = -1, primID = -1, mask = -1;
      avx3f v0 = zero, v1 = zero, v2 = zero;
      
      for (size_t i=0; i<8 && prims; i++, prims++)
      {
	const PrimRef& prim = *prims;
	const TriangleMesh* mesh = scene->getTriangleMesh(prim.geomID());
	const TriangleMesh::Triangle& tri = mesh->triangle(prim.primID());
	const Vec3fa& p0 = mesh->vertex(tri.v[0]);
	const Vec3fa& p1 = mesh->vertex(tri.v[1]);
	const Vec3fa& p2 = mesh->vertex(tri.v[2]);
	geomID [i] = prim.geomID();
	primID [i] = prim.primID();
	mask   [i] = mesh->mask;
	v0.x[i] = p0.x; v0.y[i] = p0.y; v0.z[i] = p0.z;
	v1.x[i] = p1.x; v1.y[i] = p1.y; v1.z[i] = p1.z;
	v2.x[i] = p2.x; v2.y[i] = p2.y; v2.z[i] = p2.z;
      }
      new (this) Triangle8(v0,v1,v2,geomID,primID,mask);
    }

  public:
    avx3f v0;      //!< Base vertex of the triangles.
    avx3f e1;      //!< 1st edge of the triangles (v0-v1).
    avx3f e2;      //!< 2nd edge of the triangles (v2-v0).
    avx3f Ng;      //!< Geometry normal of the triangles.
    avxi geomID;   //!< user geometry ID
    avxi primID;   //!< primitive ID
#if defined(__USE_RAY_MASK__)
    avxi mask;     //!< geometry mask
#endif

  };
#endif

#if defined (__AVX__)

    __forceinline std::ostream &operator<<(std::ostream &o, const Triangle8 &tri)
    {
      o << "v0    " << tri.v0 << std::endl;
      o << "e1    " << tri.e1 << std::endl;
      o << "e2    " << tri.e2 << std::endl;
      o << "Ng    " << tri.Ng << std::endl;
      o << "geomID" << tri.geomID << std::endl;
      o << "primID" << tri.primID << std::endl;
      return o;
    }
#endif


  struct Triangle8Type : public PrimitiveType {
    Triangle8Type ();
    size_t blocks(size_t x) const;
    size_t size(const char* This) const;
  };

  struct SceneTriangle8 : public Triangle8Type
  {
    static SceneTriangle8 type;
    void pack(char* This, atomic_set<PrimRefBlock>::block_iterator_unsafe& prims, void* geom) const;
    void pack(char* dst, const PrimRef* prims, size_t num, void* geom) const;
    BBox3fa update(char* prim, size_t num, void* geom) const;
  };

  struct TriangleMeshTriangle8 : public Triangle8Type
  {
    static TriangleMeshTriangle8 type;
    void pack(char* This, atomic_set<PrimRefBlock>::block_iterator_unsafe& prims, void* geom) const;
    BBox3fa update(char* prim, size_t num, void* geom) const;
  };
}
