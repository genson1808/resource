
### Get MAC Address of container:
```bash
docker inspect <container-id> |grep MacAddress|tr -d ' ,"'|sort -u
```

pip3 install --user conan --break-system-packages

task:
[] handle 02:42:c0:a8:d7:03 vs 02-42-c0-a8-d7-03  => equal


serialcode of pk, prkey, lskey is equal
private_key_6029cbaed40f9_07e8_000a_0004.pem
 public_key_6029cbaed40f9_07e8_000a_0004.pem
    license_6029cbaed40f9_07e8_000a_0004.key


14 (private_key_) + 16 (unicode) + 4 (year) + 4 (month) + 4 (day)
14 + 16 + 4 + 4 + 4 = 42 ký tự.
-> tat ca phu thuoc vao do dai cua unicode, do dai cua unicode thay doi thi sex thay doi


    license_6029cbaed40f9_07e8_000a_0004.key
-> extract: 28 ky tu cuoi
    -> 


Giả sử file_path = "private_key_6029cbaed40f9_07e8_000a_0004.pem", thì:

file_path.rsplit('.', 1) sẽ trả về ["private_key_6029cbaed40f9_07e8_000a_0004", "pem"]
Sau đó, lấy phần tử đầu tiên: "private_key_6029cbaed40f9_07e8_000a_0004"
Cuối cùng, lấy 28 ký tự cuối cùng: "6029cbaed40f9_07e8_000a_0004"
Kết quả là "6029cbaed40f9_07e8_000a_0004".

Vì vậy, serialcode sẽ là chuỗi "6029cbaed40f9_07e8_000a_0004"

https://gist.github.com/hash3liZer/4991c20ef3af15c69158b68723690a50


https://yogyui.tistory.com/entry/CLinux%EC%97%90%EC%84%9C-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%EC%96%B4%EB%8C%91%ED%84%B0-MAC-Address-%EA%B0%80%EC%A0%B8%EC%98%A4%EA%B8%B0


win
https://www.cnblogs.com/LyShark/p/17840833.html

linux 
https://segmentfault.com/a/1190000039772413

https://developer.aliyun.com/article/1418317   kha thi

```cpp
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <unordered_map>  // Include for using unordered_map
#include <algorithm>
#include <filesystem>

namespace fs = std::filesystem;

// Retrieve all network interface names from /sys/class/net directory
std::vector<std::string> getInterfaceNames() {
    std::vector<std::string> names;
    std::string path = "/sys/class/net/";

    // Iterate over each entry in the /sys/class/net directory
    for (const auto& entry : fs::directory_iterator(path)) {
        std::string interfaceName = entry.path().filename();
        std::ifstream operstateFile(path + interfaceName + "/operstate");
        std::string state;
        
        // Read the content of the operstate file to check if the interface is "up"
        if (operstateFile.is_open()) {
            std::getline(operstateFile, state);
            operstateFile.close();
            if (state == "up") {  // Only consider interfaces that are "up"
                names.push_back(interfaceName);
            }
        }
    }

    return names;
}

// Retrieve the MAC address of a given network interface from /sys/class/net/<interface>/address
std::string getMACAddress(const std::string& interfaceName) {
    std::string macAddress;
    std::ifstream file("/sys/class/net/" + interfaceName + "/address");
    
    if (file.is_open()) {
        std::getline(file, macAddress);
        file.close();
    }
    
    return macAddress;
}

// Remove colons or dashes from the MAC address to create a clean string key
std::string cleanMACAddress(const std::string& macAddress) {
    std::string cleanedMAC;
    // Remove all ':' or '-' characters
    for (char c : macAddress) {
        if (c != ':' && c != '-') {
            cleanedMAC += c;
        }
    }
    return cleanedMAC;
}

int main() {
    std::vector<std::string> interfaceNames = getInterfaceNames();
    std::unordered_map<std::string, int> macAddressMap;  // Hash map to store cleaned MAC addresses

    if (interfaceNames.empty()) {
        std::cout << "No active network interfaces found.\n";
        return 1;
    }

    for (const std::string& interfaceName : interfaceNames) {
        std::string macAddress = getMACAddress(interfaceName);
        
        if (!macAddress.empty()) {
            // Clean the MAC address by removing ':' or '-'
            std::string cleanedMAC = cleanMACAddress(macAddress);
            macAddressMap[cleanedMAC] = 1;  // Insert into hash map with default value of 1

            std::cout << "Interface: " << interfaceName << ", Cleaned MAC Address: " << cleanedMAC << "\n";
        }
    }

    // Display all MAC addresses stored in the hash map
    std::cout << "\nStored MAC Addresses in Hash Map:\n";
    for (const auto& [key, value] : macAddressMap) {
        std::cout << "MAC Address: " << key << ", Value: " << value << "\n";
    }

    return 0;
}
```

```cpp
#include <iostream>
#include <string>

enum class ErrorCode {
    SUCCESS = 3,
    USERNAME_INVALID = 0,
    PASSWORD_INVALID = 1,
};

template <typename T>
class Result {
public:
    ErrorCode code;           // Mã lỗi
    std::string error_message; // Thông báo lỗi
    T result;                // Giá trị trả về nếu thành công

    // Constructor cho trường hợp thành công
    Result(ErrorCode c, const T& res) : code(c), result(res), error_message("Success") {}

    // Constructor cho trường hợp lỗi
    Result(ErrorCode c, const std::string& msg) : code(c), result(T()), error_message(msg) {}
};

// Hàm mẫu
Result<std::string> validateUser(const std::string& username) {
    if (username.empty()) {
        return Result<std::string>(ErrorCode::USERNAME_INVALID, "Username cannot be empty");
    }
    return Result<std::string>(ErrorCode::SUCCESS, username); // Trả về username như là kết quả
}

int main() {
    Result<std::string> res = validateUser("test_user");
    
    if (res.code != ErrorCode::SUCCESS) {
        std::cout << "Error: " << res.error_message << std::endl;
    } else {
        std::cout << "Result: " << res.result << std::endl; // Hiển thị kết quả
    }

    return 0;
}
```
