#pragma once

#include "../intrinsics.h"

namespace embree
{
  struct AtomicCounter {
  public:
    __forceinline AtomicCounter( void ) : data(0) {}
    __forceinline AtomicCounter( const atomic_t data ) : data(data) {}
    __forceinline AtomicCounter& operator =( const atomic_t input    ) { *(volatile atomic_t*)&data = input; return *this; }
    __forceinline void reset               ( const atomic_t input = 0) { *(volatile atomic_t*)&data = input; }
    __forceinline operator atomic_t() const { return data; }

  public:
    __forceinline atomic_t sub( const atomic_t input ) { return atomic_add(&data,-input) - input; }
    __forceinline atomic_t add( const atomic_t input ) { return atomic_add(&data, input) + input; }
    __forceinline friend atomic_t operator +=( AtomicCounter& value, const atomic_t input ) { return atomic_add(&value.data, +input) + input; }
    __forceinline friend atomic_t operator -=( AtomicCounter& value, const atomic_t input ) { return atomic_add(&value.data, -input) - input; }
    __forceinline friend atomic_t operator ++( AtomicCounter& value ) { return atomic_add(&value.data,  1) + 1; }
    __forceinline friend atomic_t operator --( AtomicCounter& value ) { return atomic_add(&value.data, -1) - 1; }
    __forceinline friend atomic_t operator ++( AtomicCounter& value, int ) { return atomic_add(&value.data,  1); }
    __forceinline friend atomic_t operator --( AtomicCounter& value, int ) { return atomic_add(&value.data, -1); }
    __forceinline atomic_t inc() { return atomic_add(&data,+1); }
    __forceinline atomic_t dec() { return atomic_add(&data,-1); }

  private:
    volatile atomic_t data;
  };

  class __aligned(64) AlignedAtomicCounter32
  {
  public:
    __forceinline AlignedAtomicCounter32 () : data(0) {}
    __forceinline AlignedAtomicCounter32 (const atomic32_t v) {  *(volatile atomic32_t*)&data = v; }
    __forceinline AlignedAtomicCounter32& operator =( const atomic32_t input    ) { *(volatile atomic32_t*)&data = input; return *this; }
    __forceinline void reset                        ( const atomic32_t input = 0) { *(volatile atomic32_t*)&data = input; }
    __forceinline operator atomic32_t() const { return data; }

  public:
    __forceinline unsigned int sub(const atomic32_t i) { return atomic_add(&data, -i); }
    __forceinline unsigned int add(const atomic32_t i) { return atomic_add(&data, +i); }
    __forceinline friend atomic32_t operator +=( AlignedAtomicCounter32& value, const atomic32_t input ) { return atomic_add(&value.data, +input) + input; }
    __forceinline friend atomic32_t operator -=( AlignedAtomicCounter32& value, const atomic32_t input ) { return atomic_add(&value.data, -input) - input; }
    __forceinline friend atomic32_t operator ++( AlignedAtomicCounter32& value ) { return atomic_add(&value.data,  1) + 1; }
    __forceinline friend atomic32_t operator --( AlignedAtomicCounter32& value ) { return atomic_add(&value.data, -1) - 1; }
    __forceinline friend atomic32_t operator ++( AlignedAtomicCounter32& value, int ) { return atomic_add(&value.data,  1); }
    __forceinline friend atomic32_t operator --( AlignedAtomicCounter32& value, int ) { return atomic_add(&value.data, -1); }
    __forceinline atomic32_t inc() { return atomic_add(&data,+1); }
    __forceinline atomic32_t dec() { return atomic_add(&data,-1); }

  private:
    volatile atomic32_t data;
    char align[64-sizeof(atomic32_t)]; // one counter per cache line
  };
}
