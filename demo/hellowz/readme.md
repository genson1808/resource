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

```cpp
std::tm LicenseValidator::parse_date(const std::string &timeString) {
  std::tm tm = {};
  std::istringstream ss(timeString);

  // Use std::get_time to parse the string into a tm struct
  ss >> std::get_time(&tm, "%Y-%m-%d-%H:%M:%S");
  if (ss.fail()) {
    // Handle parsing error
    throw std::runtime_error("Failed to parse date");
  }

  return tm;
}
```

cmake .. -G "Visual Studio 17 2022" -DCMAKE_TOOLCHAIN_FILE=C:\Mac\Home\Downloads\leader-license-library-cpp\lib_conan\conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release

 cmake --build . --config Release

 install gtest, openssl
