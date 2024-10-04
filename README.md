# resource for research

# Cmake

binh thuong run c program: gcc -o nameproout source.c 

bigger c program
gcc -o      main         main.c         random.c               -lm 
       outputFilename  SourceFile1    SourceFile2       LinkWithMathsLibrary


Run power shell with admins

Chocolatey Software Docs | Setup / Install


Choco install minnow

choco install python --pre 

Download vim
https://www.vim.org/download.php


> choco install neovim -y


Rogger”1808


## cpp resource
https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md#S-faq

https://github.com/balloonwj/CppCoreGuidelines

https://github.com/applenob/Cpp_Primer_Practice/tree/master

https://github.com/AnkerLeng/Cpp-0-1-Resource

https://github.com/0voice/cpp_new_features

https://github.com/changkun/modern-cpp-tutorial

https://github.com/0voice/introduce_c-cpp_manual?tab=readme-ov-file

https://daobook.github.io/cpp/book.html



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


https://code.visualstudio.com/docs/cpp/config-wsl



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

-lssl: Liên kết thư viện libssl.
-lcrypto: Liên kết thư viện libcrypto của OpenSSL.


