#pragma once

#include "common/default.h"
#include "common/scene.h"
#include "builders/primrefblock.h"

namespace embree
{
  struct PrimitiveType
  {
    /*! constructs the triangle type */
    PrimitiveType (const char* name, size_t bytes, size_t blockSize, bool needVertices, int intCost) 
      : name(name), bytes(bytes), blockSize(blockSize), needVertices(needVertices), intCost(intCost) {}

    /*! Computes the number of blocks required to store a number of triangles. */
    virtual size_t blocks(size_t x) const = 0;

    /*! Returns the number of stored primitives in a block. */
    virtual size_t size(const char* This) const = 0;

    /*! Packs triangles taken from primitive list. */
    virtual void pack(char* dst, atomic_set<PrimRefBlock>::block_iterator_unsafe& prims, void* geom) const {}

    /*! Updates all primitives stored in a leaf */
    virtual BBox3fa update(char* prim, size_t num, void* geom) const { return BBox3fa(empty); }

    /*! Updates all primitives stored in a leaf */
    virtual std::pair<BBox3fa,BBox3fa> update2(char* prim, size_t num, void* geom) const { return std::pair<BBox3fa,BBox3fa>(empty,empty); }

  public:
    std::string name;       //!< name of this primitive type
    size_t bytes;           //!< number of bytes of the triangle data
    size_t blockSize;       //!< block size
    bool   needVertices;    //!< determines if we need the vertex array
    int    intCost;         //!< cost of one ray/primitive intersection
  };
}
