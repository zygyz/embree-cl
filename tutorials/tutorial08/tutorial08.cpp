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

#include "tutorial/tutorial.h"
#include "sys/taskscheduler.h"
#include "image/image.h"

/*! Defined in tutorial08_device.cpp. */
extern int subdivisionLevel;

namespace embree 
{
  static std::string g_rtcore = "";
  static size_t g_width = 512;
  static size_t g_height = 512;
  static bool g_fullscreen = false;
  static size_t g_numThreads = 0;
  static FileName outFilename = "";

    static void decreaseSubdivisionLevel(unsigned char key, int x, int y) {

        /*! Decrease the level of subdivision surface refinement. */
        subdivisionLevel = (subdivisionLevel > 0) ? subdivisionLevel - 1 : 0;

    }

    static std::string getParameterString(Ref<ParseStream> &cin, std::string &term) {

        /*! Parameter name and options. */
        std::string parameter = term + " ";  while (cin->peek() != "" && cin->peek()[0] != '-') parameter += cin->getString();  return(parameter);

    }

    static void increaseSubdivisionLevel(unsigned char key, int x, int y) {

        /*! Increase the level of subdivision surface refinement. */
        subdivisionLevel++;

    }

    static void initEmbreeState(std::string configuration) {

        /*! Initialize Embree state. */
        init(configuration.c_str());

    }

    static void parseCommandLine(Ref<ParseStream> cin, const FileName &path) {

        for (std::string term = cin->getString() ; term != "" ; term = cin->getString()) {

            /*! Command line parameters from a file. */
            if (term == "-c") { FileName file = path + cin->getFileName();  parseCommandLine(new ParseStream(new LineCommentFilter(file, "#")), file.path()); }

            /*! Camera field of view. */
            else if (term == "-fov") g_camera.fov = cin->getFloat();

            /*! Full screen mode. */
            else if (term == "-fullscreen") g_fullscreen = true;

            /* output filename */
            else if (term == "-o") outFilename = cin->getFileName();
      
            /*! Embree configuration. */
            else if (term == "-rtcore") g_rtcore = cin->getString();

            /*! Window size. */
            else if (term == "-size") { g_width = cin->getInt();  g_height = cin->getInt(); }

            /*! Thread count. */
            else if (term == "-threads") g_numThreads = cin->getInt();

            /*! Camera view direction. */
            else if (term == "-vd") g_camera.to = g_camera.from + cin->getVec3fa();

            /*! Camera look point. */
            else if (term == "-vi") g_camera.to = cin->getVec3fa();

            /*! Camera position. */
            else if (term == "-vp") g_camera.from = cin->getVec3fa();

            /*! Camera up vector. */
            else if (term == "-vu") g_camera.up = cin->getVec3fa();

            /*! Skip unknown command line parameters. */
            else std::cerr << "Unknown command line parameter: " << getParameterString(cin, term) << std::endl;

        }

    }

  void renderToFile(const FileName& fileName)
  {
    resize(g_width,g_height);
    AffineSpace3fa pixel2world = g_camera.pixel2world(g_width,g_height);

    render(0.0f,
           pixel2world.l.vx,
           pixel2world.l.vy,
           pixel2world.l.vz,
           pixel2world.p);
    
    void* ptr = map();
    Ref<Image> image = new Image4c(g_width, g_height, (Col4c*)ptr);
    storeImage(image, fileName);
    unmap();
  }

    void tutorial08(int argc, char **argv) {

        /*! Parse command line options. */  
        parseCommandLine(new ParseStream(new CommandLineStream(argc, argv)), FileName());

        /*! Set the thread count in the Embree configuration string. */
        if (g_numThreads) g_rtcore += ",threads=" + std::stringOf(g_numThreads);

        /*! Initialize the task scheduler. */
#if !defined(__EXPORT_ALL_SYMBOLS__)
        TaskScheduler::create(g_numThreads);
#endif

        /*! Initialize Embree state. */
        initEmbreeState(g_rtcore.c_str());

        /* render to disk */
        if (outFilename.str() != "") {
          renderToFile(outFilename);
          return;
        } 

        /*! Initialize GLUT window state. */
        initWindowState("tutorial08", g_width, g_height, g_fullscreen);

        /*! Keyboard bindings. */
        mapKeyToFunction('+', increaseSubdivisionLevel);  mapKeyToFunction('=', increaseSubdivisionLevel);  mapKeyToFunction('-', decreaseSubdivisionLevel);

        /*! Enter the main GLUT run loop. */
        enterWindowRunLoop();

    }

}

int main(int argc, char** argv) {

    /*! Tutorial entry point. */
    try { embree::tutorial08(argc, argv);  return(0); }

    /*! Known exception. */
    catch (const std::exception& e) { std::cout << "Error: " << e.what() << std::endl;  return(1); }

    /*! Unknown exception. */
    catch (...) { std::cout << "Error: unknown exception caught." << std::endl;  return(1); }

}

