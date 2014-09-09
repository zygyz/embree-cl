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

#include "accel.h"
#include "builder.h"
#include <iostream>
using std::cout;
using std::endl;

namespace embree
{
  class AccelInstance : public Accel
  {
  public:
    AccelInstance (Bounded* accel, Builder* builder, Intersectors& intersectors)
      : accel(accel), builder(builder) 
    {
      this->intersectors = intersectors;
    }

    void immutable () {
      delete builder; builder = NULL;
    }

    ~AccelInstance() {
      delete builder; builder = NULL; // delete builder first!
      delete accel; accel = NULL;
    }

  public:
    void build (size_t threadIndex, size_t threadCount) {
      if (builder) builder->build(threadIndex,threadCount);
      cout << "AccelInstance build" << endl;
      bounds = accel->bounds;
    }

  private:
    Bounded* accel;
    Builder* builder;
  };
}
