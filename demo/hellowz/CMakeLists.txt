# cmake_minimum_required(VERSION 3.15)
# project(myApp)
#
# find_package(wxWidgets REQUIRED COMPONENTS net core base)
# if(wxWidgets_USE_FILE) # not defined in CONFIG mode
#     include(${wxWidgets_USE_FILE})
# endif()
#
# add_executable(${PROJECT_NAME} src/main.cpp)
# target_link_libraries(${PROJECT_NAME} wx::net wx::core wx::base)

cmake_minimum_required(VERSION 3.15)
project(MyApp)

# Thêm thư viện wxWidgets
find_package(wxWidgets REQUIRED COMPONENTS core base net)

# include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)
# include(${CMAKE_BINARY_DIR}/conan_paths.cmake)

# Include directories for the MathLib library
# include_directories(/usr/local/include)
include_directories(/Users/genson1808/workspace/cpp/MathLib/build/install/include)

add_executable(MyApp src/main.cpp)

# Link against the wxWidgets and the dynamic library
# target_link_libraries(MyApp ${wxWidgets_LIBRARIES} /usr/local/lib/libmathlib.0.0.1.dylib)
target_link_libraries(MyApp ${wxWidgets_LIBRARIES} /Users/genson1808/workspace/cpp/MathLib/build/install/lib/libmathlib.0.0.1.dylib)

# Ensure the library path is correctly set (optional, if not found)
# set(CMAKE_LIBRARY_PATH /usr/local/lib)

install(TARGETS MyApp
    RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)

