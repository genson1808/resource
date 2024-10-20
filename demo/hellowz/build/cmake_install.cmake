# Install script for directory: /Users/genson1808/workspace/cpp/hellowz

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/genson1808/workspace/cpp/hellowz/build/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/genson1808/workspace/cpp/hellowz/build/install/bin/MyApp")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/genson1808/workspace/cpp/hellowz/build/install/bin" TYPE EXECUTABLE FILES "/Users/genson1808/workspace/cpp/hellowz/build/MyApp")
  if(EXISTS "$ENV{DESTDIR}/Users/genson1808/workspace/cpp/hellowz/build/install/bin/MyApp" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/genson1808/workspace/cpp/hellowz/build/install/bin/MyApp")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/genson1808/.conan2/p/b/wxwid0e50eae803b14/p/lib"
      -delete_rpath "/Users/genson1808/.conan2/p/b/libpn10e7f96255e68/p/lib"
      -delete_rpath "/Users/genson1808/.conan2/p/b/zlibb3be34597a744/p/lib"
      -delete_rpath "/Users/genson1808/.conan2/p/b/libti0264d581c86cc/p/lib"
      -delete_rpath "/Users/genson1808/.conan2/p/b/libde80eb015295297/p/lib"
      -delete_rpath "/Users/genson1808/.conan2/p/b/xz_ut9f47201026bce/p/lib"
      -delete_rpath "/Users/genson1808/.conan2/p/b/libjp80e41dcaf1de5/p/lib"
      -delete_rpath "/Users/genson1808/.conan2/p/b/jbigb3189945ae83d/p/lib"
      -delete_rpath "/Users/genson1808/.conan2/p/b/zstd887e48e234168/p/lib"
      -delete_rpath "/Users/genson1808/.conan2/p/b/libweb2265980da8f6/p/lib"
      -delete_rpath "/Users/genson1808/.conan2/p/b/expatff2b55e9fe416/p/lib"
      -delete_rpath "/Users/genson1808/.conan2/p/b/pcre263e427effe3a9/p/lib"
      -delete_rpath "/Users/genson1808/.conan2/p/b/bzip280ecff5ad3e71/p/lib"
      -delete_rpath "/Users/genson1808/workspace/cpp/MathLib/build/install/lib"
      "$ENV{DESTDIR}/Users/genson1808/workspace/cpp/hellowz/build/install/bin/MyApp")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -u -r "$ENV{DESTDIR}/Users/genson1808/workspace/cpp/hellowz/build/install/bin/MyApp")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
  file(WRITE "/Users/genson1808/workspace/cpp/hellowz/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
