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
