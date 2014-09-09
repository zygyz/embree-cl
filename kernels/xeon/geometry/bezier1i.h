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

#include "common/default.h"
#include "primitive.h"
#include "bezier1.h"

namespace embree
{
#if defined(__SSE__) // FIXME: move to other place
  extern ssef sse_coeff0[4];
  extern ssef sse_coeff1[4];
#endif

#if defined(__AVX__)
  extern avxf coeff0[4];
  extern avxf coeff1[4];
#endif

  struct Bezier1i
  {
  public:

    /*! Default constructor. */
    __forceinline Bezier1i () {}

    /*! Construction from vertices and IDs. */
    __forceinline Bezier1i (const Vec3fa* p, const unsigned int geomID, const unsigned int primID)
      : p(p), geomID(geomID), primID(primID) {}

    /*! calculate the bounds of the triangle */
    __forceinline BBox3fa bounds() const {
      const BBox3fa b = merge(BBox3fa(p[0]),BBox3fa(p[1]),BBox3fa(p[2]),BBox3fa(p[3]));
      return enlarge(b,Vec3fa(b.upper.w));
    }

    /*! fill from list */
    __forceinline void fill(atomic_set<PrimRefBlockT<Bezier1> >::block_iterator_unsafe& iter, Scene* scene)
    {
      const Bezier1& curve = *iter; iter++;
      const BezierCurves* in = (BezierCurves*) scene->get(curve.geomID);
      const Vec3fa& p0 = in->vertex(in->curve(curve.primID));
      new (this) Bezier1i(&p0,curve.geomID,curve.primID);
    }

  public:
    const Vec3fa* p;      //!< pointer to first control point (x,y,z,r)
    unsigned int geomID;  //!< geometry ID
    unsigned int primID;  //!< primitive ID
  };

  struct Bezier1iType : public PrimitiveType {
    Bezier1iType ();
    size_t blocks(size_t x) const;
    size_t size(const char* This) const;
  };

  struct SceneBezier1i : public Bezier1iType
  {
    static SceneBezier1i type;
    void pack(char* dst, atomic_set<PrimRefBlock>::block_iterator_unsafe& prims, void* geom) const; 
    void pack(char* dst, const PrimRef* prims, size_t num, void* geom) const;
    BBox3fa update(char* prim, size_t num, void* geom) const;
  };
}
