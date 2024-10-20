# guidelines

```bash
# first run
cmake ..

# seconds run
make

# last run

make install
❯ make install
[100%] Built target mathlib
Install the project...
-- Install configuration: ""
-- Installing: /usr/local/lib/libmathlib.0.0.1.dylib
-- Installing: /usr/local/lib/libmathlib.dylib
-- Installing: /usr/local/include/MathLib.hpp

```

```cmake
cmake_minimum_required(VERSION 3.15)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Set the project name and version
project(MathLib VERSION 0.0.1 DESCRIPTION "MathLib library")

# Create the dynamic library
#Creates a shared library named mathlib from src/MathLib.cpp.
add_library(mathlib SHARED src/MathLib.cpp)

# Set the library properties
set_target_properties(mathlib PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    PUBLIC_HEADER include/MathLib.hpp)

# Include directories for the library
target_include_directories(mathlib PUBLIC include)

#VERSION: Phiên bản của thư viện.
#SOVERSION: Số phiên bản chia sẻ, thường được sử dụng để quản lý sự tương thích.
#PUBLIC_HEADER: Đường dẫn đến tệp tiêu đề công khai (header file) mà người dùng thư viện sẽ cần sử dụng.
# Installation rules for the dynamic library
install(TARGETS mathlib
    LIBRARY DESTINATION lib
    PUBLIC_HEADER DESTINATION include)

# Cross-platform settings for installation files
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    # Windows-specific settings
    set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install")
    set(MATHLIB_OUTPUT_DIR "${CMAKE_INSTALL_PREFIX}/bin")
    install(FILES "${CMAKE_CURRENT_BINARY_DIR}/libmathlib.dll" DESTINATION ${MATHLIB_OUTPUT_DIR})
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    # macOS-specific settings
    set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install")
    set(MATHLIB_OUTPUT_DIR "${CMAKE_INSTALL_PREFIX}/lib")
    install(FILES "${CMAKE_CURRENT_BINARY_DIR}/libmathlib.0.0.1.dylib" DESTINATION ${MATHLIB_OUTPUT_DIR})
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    # Ubuntu-specific settings
    set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install")
    set(MATHLIB_OUTPUT_DIR "${CMAKE_INSTALL_PREFIX}/lib")
    install(FILES "${CMAKE_CURRENT_BINARY_DIR}/libmathlib.so" DESTINATION ${MATHLIB_OUTPUT_DIR})
else()
    message(FATAL_ERROR "Unsupported platform: ${CMAKE_SYSTEM_NAME}")
endif()

```
