# guide setups

```bash
conan install . --output-folder=build --build=missing

cd build
# ------------------ for mac / linux
cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build .
# -------------------------


cmake .. -DCMAKE_INSTALL_PREFIX=./install -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release

# ------------------ win
$ cmake .. -G "Visual Studio 15 2017" -DCMAKE_TOOLCHAIN_FILE="conan_toolchain.cmake"
$ cmake --build . --config Release
# -------------------------
```

source <https://docs.conan.io/2.7/tutorial/consuming_packages/build_simple_cmake_project.html>
