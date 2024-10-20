
cmake_minimum_required(VERSION 3.15)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

project(mathLib VERSION 0.0.1 DESCRIPTION "MathLib library")

# Create the library
add_library(mathlib SHARED src/MathLib.cpp)

# Set properties for the library
set_target_properties(mathlib PROPERTIES
    VERSION ${PROJECT_VERSION}
    PUBLIC_HEADER include/MathLib.hpp
)

# Include directories
target_include_directories(mathlib
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

# # Install rules
# install(TARGETS mathlib 
#     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#     PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
# )

# Cross-platform settings for installation files
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    # Windows-specific settings
    set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install")
    set(MATHLIB_OUTPUT_DIR "${CMAKE_INSTALL_PREFIX}/bin")
    set(MATHLIB_INCLUDE_DIR "${CMAKE_INSTALL_PREFIX}/include")

    # Install the dynamic library
    install(FILES "${CMAKE_CURRENT_BINARY_DIR}/libmathlib.dll" DESTINATION ${MATHLIB_OUTPUT_DIR})

    # Install the header file
    install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/include/MathLib.hpp" DESTINATION ${MATHLIB_INCLUDE_DIR})
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    # macOS-specific settings
    set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install")
    set(MATHLIB_OUTPUT_DIR "${CMAKE_INSTALL_PREFIX}/lib")
    # Biến này xác định đường dẫn cài đặt cho các tệp tiêu đề (header files) sẽ là thư mục include bên trong thư mục cài đặt.
    set(MATHLIB_INCLUDE_DIR "${CMAKE_INSTALL_PREFIX}/include")

    # Install the dynamic library
    install(FILES "${CMAKE_CURRENT_BINARY_DIR}/libmathlib.0.0.1.dylib" DESTINATION ${MATHLIB_OUTPUT_DIR})

    # Install the header file
    install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/include/MathLib.hpp" DESTINATION ${MATHLIB_INCLUDE_DIR})
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    # Ubuntu-specific settings
    set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install")
    set(MATHLIB_OUTPUT_DIR "${CMAKE_INSTALL_PREFIX}/lib")
    set(MATHLIB_INCLUDE_DIR "${CMAKE_INSTALL_PREFIX}/include")

    # Install the dynamic library
    install(FILES "${CMAKE_CURRENT_BINARY_DIR}/libmathlib.so" DESTINATION ${MATHLIB_OUTPUT_DIR})

    # Install the header file
    install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/include/MathLib.hpp" DESTINATION ${MATHLIB_INCLUDE_DIR})

else()
    message(FATAL_ERROR "Unsupported platform: ${CMAKE_SYSTEM_NAME}")
endif()

