# resource for research

<https://plantuml-editor.kkeisuke.com/>

# Cmake

binh thuong run c program: gcc -o nameproout source.c

bigger c program
gcc -o main main.c random.c -lm
outputFilename SourceFile1 SourceFile2 LinkWithMathsLibrary

Run power shell with admins

Chocolatey Software Docs | Setup / Install

Choco install minnow

choco install python --pre

Download vim
<https://www.vim.org/download.php>

> choco install neovim -y

Rogger”1808

## cpp resource

<https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md#S-faq>

<https://github.com/balloonwj/CppCoreGuidelines>

<https://github.com/applenob/Cpp_Primer_Practice/tree/master>

<https://github.com/AnkerLeng/Cpp-0-1-Resource>

<https://github.com/0voice/cpp_new_features>

<https://github.com/changkun/modern-cpp-tutorial>

<https://github.com/0voice/introduce_c-cpp_manual?tab=readme-ov-file>

<https://daobook.github.io/cpp/book.html>

setup vim:

```
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- Better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", default_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", default_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", default_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", default_opts)

keymap("t", "<C-j>", require("cmp").mapping.select_next_item(), default_opts)
```

<https://code.visualstudio.com/docs/cpp/config-wsl>

# setting vscode

```json
{
    "workbench.colorTheme": "Andromeda",
    "tabnine.experimentalAutoImports": true,
    "workbench.iconTheme": "material-icon-theme",
    "editor.fontFamily": "'FireaCode nerdfont', Menlo, Monaco, 'Courier New', monospace",
    "editor.fontSize": 14,
    "debug.console.fontSize": 14,
    "scm.inputFontSize": 14,
    "terminal.integrated.fontSize": 13,
    "chat.editor.fontSize": 13,
    "[json]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "editor.cursorSmoothCaretAnimation": "on",
    "workbench.settings.applyToAllProfiles": [

    ],
    "editor.lineNumbers": "relative",
    "vim.easymotion": true,
    "vim.incsearch": true,
    "vim.useSystemClipboard": true,
    "vim.useCtrlKeys": true,
    "vim.hlsearch": true,
    "vim.insertModeKeyBindings": [
        {
        "before": ["j", "k"],
        "after": ["<Esc>"]
        }
    ],
    "vim.normalModeKeyBindingsNonRecursive": [
        {
        "before": ["<leader>", "d"],
        "after": ["d", "d"]
        },
        {
        "before": ["<C-n>"],
        "commands": [":nohl"]
        },
        {
        "before": ["K"],
        "commands": ["lineBreakInsert"],
        "silent": true
        }
    ],
    "vim.leader": "<space>",
    "vim.handleKeys": {
        "<C-a>": false,
        "<C-f>": false
    },
    "// To improve performance",
    "extensions.experimental.affinity": {
        "vscodevim.vim": 1
    }
}
```

```bash
sudo apt-get update
sudo apt-get install libssl-dev openssl
```

rsa_example.cpp

```cpp
#include <iostream>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <string>

using namespace std;

// Hàm tạo khóa RSA và lưu vào file
void GenerateRSAKey(int keyLength, const string& publicKeyFile, const string& privateKeyFile) {
    // Tạo bộ sinh số ngẫu nhiên
    RSA* rsa = RSA_new();
    BIGNUM* bn = BN_new();
    BN_set_word(bn, RSA_F4);  // Sử dụng hằng số RSA_F4

    // Tạo khóa RSA
    RSA_generate_key_ex(rsa, keyLength, bn, NULL);

    // Lưu khóa công khai vào file
    FILE* pubFile = fopen(publicKeyFile.c_str(), "wb");
    PEM_write_RSA_PUBKEY(pubFile, rsa);
    fclose(pubFile);

    // Lưu khóa riêng vào file
    FILE* privFile = fopen(privateKeyFile.c_str(), "wb");
    PEM_write_RSAPrivateKey(privFile, rsa, NULL, NULL, 0, NULL, NULL);
    fclose(privFile);

    // Dọn dẹp bộ nhớ
    RSA_free(rsa);
    BN_free(bn);
}

// Hàm mã hóa bằng RSA
string RSAEncrypt(const string& publicKeyFile, const string& message) {
    FILE* pubFile = fopen(publicKeyFile.c_str(), "rb");
    RSA* rsa = PEM_read_RSA_PUBKEY(pubFile, NULL, NULL, NULL);
    fclose(pubFile);

    // Mã hóa thông điệp
    int rsaLen = RSA_size(rsa);
    unsigned char* encrypted = new unsigned char[rsaLen];
    RSA_public_encrypt(message.size(), (unsigned char*)message.c_str(), encrypted, rsa, RSA_PKCS1_OAEP_PADDING);

    string cipherText((char*)encrypted, rsaLen);
    delete[] encrypted;
    RSA_free(rsa);

    return cipherText;
}

// Hàm giải mã bằng RSA
string RSADecrypt(const string& privateKeyFile, const string& cipherText) {
    FILE* privFile = fopen(privateKeyFile.c_str(), "rb");
    RSA* rsa = PEM_read_RSAPrivateKey(privFile, NULL, NULL, NULL);
    fclose(privFile);

    // Giải mã thông điệp
    int rsaLen = RSA_size(rsa);
    unsigned char* decrypted = new unsigned char[rsaLen];
    RSA_private_decrypt(cipherText.size(), (unsigned char*)cipherText.c_str(), decrypted, rsa, RSA_PKCS1_OAEP_PADDING);

    string message((char*)decrypted);
    delete[] decrypted;
    RSA_free(rsa);

    return message;
}

int main() {
    // Tên file chứa khóa
    string publicKeyFile = "public.pem";
    string privateKeyFile = "private.pem";

    // Tạo cặp khóa RSA
    GenerateRSAKey(2048, publicKeyFile, privateKeyFile);
    cout << "Generated RSA Key Pair." << endl;

    // Thông điệp cần mã hóa
    string message = "Hello, OpenSSL RSA!";
    cout << "Original Message: " << message << endl;

    // Mã hóa thông điệp
    string cipherText = RSAEncrypt(publicKeyFile, message);
    cout << "Encrypted Message: " << cipherText << endl;

    // Giải mã thông điệp
    string decryptedMessage = RSADecrypt(privateKeyFile, cipherText);
    cout << "Decrypted Message: " << decryptedMessage << endl;

    return 0;
}

```

```bash
g++ rsa_example.cpp -o rsa_example -lssl -lcrypto

./rsa_example
```

```cpp
#include <iostream>
#include <fstream>
#include <openssl/pem.h>
#include <openssl/rsa.h>
#include <openssl/err.h>
#include <string>

using namespace std;

// Định nghĩa mã lỗi theo bảng mã lỗi trong hình ảnh
enum ErrorCode {
    UNKNOWN_ERROR = -1,
    SUCCESS = 0,
    PUBLIC_KEY_READ_ERROR = 1,
    PUBLIC_KEY_FORMAT_ERROR = 2,
    PRIVATE_KEY_READ_ERROR = 3,
    PRIVATE_KEY_FORMAT_ERROR = 4,
    ACTIVE_KEY_READ_ERROR = 5,
    ACTIVE_KEY_FORMAT_ERROR = 6,
    LICENSE_KEY_OUTPUT_ERROR = 7,
    LICENSE_KEY_PATH_ERROR = 8,
    OPTION_CODE_READ_ERROR = 9,
    OPTION_CODE_FORMAT_ERROR = 10
};

// Hàm kiểm tra định dạng của khóa công khai RSA
int validatePublicKey(const string& publicKeyFile) {
    FILE* file = fopen(publicKeyFile.c_str(), "rb");
    if (!file) {
        return PUBLIC_KEY_READ_ERROR;  // Không thể đọc khóa công khai
    }

    RSA* rsa = PEM_read_RSA_PUBKEY(file, NULL, NULL, NULL);
    if (!rsa) {
        fclose(file);
        return PUBLIC_KEY_FORMAT_ERROR;  // Định dạng khóa công khai không hợp lệ
    }

    RSA_free(rsa);
    fclose(file);
    return SUCCESS;  // Khóa công khai hợp lệ
}

// Hàm kiểm tra định dạng của khóa riêng RSA
int validatePrivateKey(const string& privateKeyFile) {
    FILE* file = fopen(privateKeyFile.c_str(), "rb");
    if (!file) {
        return PRIVATE_KEY_READ_ERROR;  // Không thể đọc khóa riêng
    }

    RSA* rsa = PEM_read_RSAPrivateKey(file, NULL, NULL, NULL);
    if (!rsa) {
        fclose(file);
        return PRIVATE_KEY_FORMAT_ERROR;  // Định dạng khóa riêng không hợp lệ
    }

    RSA_free(rsa);
    fclose(file);
    return SUCCESS;  // Khóa riêng hợp lệ
}

// Hàm kiểm tra định dạng của khóa hoạt động
int validateActiveKey(const string& activeKeyFile) {
    FILE* file = fopen(activeKeyFile.c_str(), "rb");
    if (!file) {
        return ACTIVE_KEY_READ_ERROR;  // Không thể đọc khóa hoạt động
    }

    RSA* rsa = PEM_read_RSA_PUBKEY(file, NULL, NULL, NULL);
    if (!rsa) {
        fclose(file);
        return ACTIVE_KEY_FORMAT_ERROR;  // Định dạng khóa hoạt động không hợp lệ
    }

    RSA_free(rsa);
    fclose(file);
    return SUCCESS;  // Khóa hoạt động hợp lệ
}

// Hàm kiểm tra License Key và xuất ra file
int outputLicenseKey(const string& licenseKeyFile, const string& licenseKeyPath) {
    ofstream outFile(licenseKeyPath);
    if (!outFile.is_open()) {
        return LICENSE_KEY_OUTPUT_ERROR;  // Không thể xuất License Key ra file
    }

    outFile << licenseKeyFile;
    outFile.close();
    return SUCCESS;  // Xuất License Key thành công
}

// Hàm kiểm tra mã tùy chọn (option code)
int validateOptionCode(const string& optionCode) {
    if (optionCode.empty()) {
        return OPTION_CODE_READ_ERROR;  // Không thể đọc mã tùy chọn
    }

    // Kiểm tra định dạng của mã tùy chọn, ở đây chỉ là ví dụ về độ dài > 0
    if (optionCode.length() < 5) {
        return OPTION_CODE_FORMAT_ERROR;  // Định dạng mã tùy chọn không hợp lệ
    }

    return SUCCESS;  // Mã tùy chọn hợp lệ
}

// Hàm trả về mô tả mã lỗi
string getErrorDescription(int errorCode) {
    switch (errorCode) {
        case UNKNOWN_ERROR: return "Unknown error.";
        case SUCCESS: return "Success.";
        case PUBLIC_KEY_READ_ERROR: return "Public Key could not be read.";
        case PUBLIC_KEY_FORMAT_ERROR: return "Invalid Public Key format.";
        case PRIVATE_KEY_READ_ERROR: return "Private Key could not be read.";
        case PRIVATE_KEY_FORMAT_ERROR: return "Invalid Private Key format.";
        case ACTIVE_KEY_READ_ERROR: return "Active Key could not be read.";
        case ACTIVE_KEY_FORMAT_ERROR: return "Invalid Active Key format.";
        case LICENSE_KEY_OUTPUT_ERROR: return "Could not output License Key to the specified path.";
        case LICENSE_KEY_PATH_ERROR: return "Invalid License Key path format.";
        case OPTION_CODE_READ_ERROR: return "Could not read Option Code.";
        case OPTION_CODE_FORMAT_ERROR: return "Invalid Option Code format.";
        default: return "Error code not recognized.";
    }
}

int main() {
    string publicKeyFile = "public.pem";
    string privateKeyFile = "private.pem";
    string activeKeyFile = "active.pem";
    string licenseKey = "example_license_key";
    string licenseKeyPath = "license_key.txt";
    string optionCode = "12345";  // Mã tùy chọn để kiểm tra

    // Kiểm tra khóa công khai
    int pubKeyStatus = validatePublicKey(publicKeyFile);
    cout << "Public Key Validation: " << getErrorDescription(pubKeyStatus) << endl;

    // Kiểm tra khóa riêng
    int privKeyStatus = validatePrivateKey(privateKeyFile);
    cout << "Private Key Validation: " << getErrorDescription(privKeyStatus) << endl;

    // Kiểm tra khóa hoạt động
    int activeKeyStatus = validateActiveKey(activeKeyFile);
    cout << "Active Key Validation: " << getErrorDescription(activeKeyStatus) << endl;

    // Kiểm tra xuất License Key
    int licenseKeyStatus = outputLicenseKey(licenseKey, licenseKeyPath);
    cout << "License Key Output: " << getErrorDescription(licenseKeyStatus) << endl;

    // Kiểm tra mã tùy chọn
    int optionCodeStatus = validateOptionCode(optionCode);
    cout << "Option Code Validation: " << getErrorDescription(optionCodeStatus) << endl;

    return 0;
}

```

-lssl: Liên kết thư viện libssl.
-lcrypto: Liên kết thư viện libcrypto của OpenSSL.
