#!/bin/bash

# Cấu hình biến
INSTALL_PREFIX="./install"
GUI_APP_NAME="MyApp"
MATHLIB_NAME="mathlib"
VERSION="0.1.0"

# # Xây dựng thư viện MathLib
# echo "Building MathLib..."
# cd lib
# mkdir -p build
# cd build
# cmake .. -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX
# make
# make install
# cd ../../

# Xây dựng ứng dụng GUI
echo "Building GUI Application..."
# cd src
# mkdir -p build
# cd build
# cmake .. -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX
# make
# make install
# cd ../../

# Tạo cấu trúc tệp cài đặt cho macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
	echo "Creating installation package for macOS..."
	mkdir -p GENSONUI.pkg/Contents/{Resources,Applications}
	cp ./build/MyApp MyApp.pkg/Contents/Applications/

	# Tạo tệp Info.plist
	cat <<EOF >MyApp.pkg/Contents/Resources/Info.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleName</key>
    <string>$GUI_APP_NAME</string>
    <key>CFBundleVersion</key>
    <string>$VERSION</string>
    <key>CFBundleIdentifier</key>
    <string>com.genson.GENSONGUI</string>
    <key>CFBundleShortVersionString</key>
    <string>$VERSION</string>
</dict>
</plist>
EOF

	# Tạo tệp cài đặt
	pkgbuild --root $INSTALL_PREFIX --identifier com.genson.GENSONGUI --version $VERSION GENSONUI.pkg
	echo "macOS package created: GENSONGUI.pkg"
#
# # Tạo tệp cài đặt cho Ubuntu
# elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
# 	echo "Creating installation package for Ubuntu..."
#
# 	# Tạo cấu trúc thư mục cho .deb
# 	mkdir -p myguiapp_$VERSION/DEBIAN
# 	mkdir -p myguiapp_$VERSION/usr/local/bin
# 	mkdir -p myguiapp_$VERSION/usr/local/include
#
# 	# Tạo tệp control cho .deb
# 	cat <<EOF >myguiapp_$VERSION/DEBIAN/control
# Package: myguiapp
# Version: $VERSION
# Architecture: amd64
# Maintainer: Your Name <your.email@example.com>
# Installed-Size: $(du -ks $INSTALL_PREFIX | cut -f1)
# Depends: wx-common
# Section: utils
# Priority: optional
# Description: My GUI application using MathLib
# EOF
#
# 	# Sao chép tệp vào cấu trúc thư mục
# 	cp $INSTALL_PREFIX/bin/$GUI_APP_NAME myguiapp_$VERSION/usr/local/bin/
# 	cp $INSTALL_PREFIX/include/MathLib.hpp myguiapp_$VERSION/usr/local/include/
#
# 	# Tạo tệp cài đặt .deb
# 	dpkg-deb --build myguiapp_$VERSION
# 	echo "Debian package created: myguiapp_$VERSION.deb"
#
# Thông báo nếu không phải macOS hay Ubuntu
else
	echo "Unsupported OS. This script works on macOS and Ubuntu only."
	exit 1
fi

echo "Installation packages created successfully."
