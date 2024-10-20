########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(wxwidgets_COMPONENT_NAMES "")
if(DEFINED wxwidgets_FIND_DEPENDENCY_NAMES)
  list(APPEND wxwidgets_FIND_DEPENDENCY_NAMES PNG TIFF JPEG expat PCRE2 ZLIB)
  list(REMOVE_DUPLICATES wxwidgets_FIND_DEPENDENCY_NAMES)
else()
  set(wxwidgets_FIND_DEPENDENCY_NAMES PNG TIFF JPEG expat PCRE2 ZLIB)
endif()
set(PNG_FIND_MODE "NO_MODULE")
set(TIFF_FIND_MODE "NO_MODULE")
set(JPEG_FIND_MODE "NO_MODULE")
set(expat_FIND_MODE "NO_MODULE")
set(PCRE2_FIND_MODE "NO_MODULE")
set(ZLIB_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(wxwidgets_PACKAGE_FOLDER_RELEASE "/Users/genson1808/.conan2/p/b/wxwid0e50eae803b14/p")
set(wxwidgets_BUILD_MODULES_PATHS_RELEASE )


set(wxwidgets_INCLUDE_DIRS_RELEASE "${wxwidgets_PACKAGE_FOLDER_RELEASE}/include/wx-3.2"
			"${wxwidgets_PACKAGE_FOLDER_RELEASE}/include")
set(wxwidgets_RES_DIRS_RELEASE )
set(wxwidgets_DEFINITIONS_RELEASE "-DwxUSE_GUI=1"
			"-D__WXMAC__"
			"-D__WXOSX__"
			"-D__WXOSX_COCOA__")
set(wxwidgets_SHARED_LINK_FLAGS_RELEASE )
set(wxwidgets_EXE_LINK_FLAGS_RELEASE )
set(wxwidgets_OBJECTS_RELEASE )
set(wxwidgets_COMPILE_DEFINITIONS_RELEASE "wxUSE_GUI=1"
			"__WXMAC__"
			"__WXOSX__"
			"__WXOSX_COCOA__")
set(wxwidgets_COMPILE_OPTIONS_C_RELEASE )
set(wxwidgets_COMPILE_OPTIONS_CXX_RELEASE )
set(wxwidgets_LIB_DIRS_RELEASE "${wxwidgets_PACKAGE_FOLDER_RELEASE}/lib")
set(wxwidgets_BIN_DIRS_RELEASE )
set(wxwidgets_LIBRARY_TYPE_RELEASE STATIC)
set(wxwidgets_IS_HOST_WINDOWS_RELEASE 0)
set(wxwidgets_LIBS_RELEASE wx_osx_cocoau_xrc-3.2 wx_osx_cocoau_stc-3.2 wxscintilla-3.2 wx_osx_cocoau_richtext-3.2 wx_osx_cocoau_ribbon-3.2 wx_osx_cocoau_qa-3.2 wx_osx_cocoau_propgrid-3.2 wx_osx_cocoau_html-3.2 wx_osx_cocoau_gl-3.2 wx_osx_cocoau_aui-3.2 wx_baseu_xml-3.2 wx_baseu_net-3.2 wx_osx_cocoau_adv-3.2 wx_osx_cocoau_core-3.2 wx_baseu-3.2)
set(wxwidgets_SYSTEM_LIBS_RELEASE )
set(wxwidgets_FRAMEWORK_DIRS_RELEASE )
set(wxwidgets_FRAMEWORKS_RELEASE Carbon Cocoa AudioToolbox OpenGL AppKit AVKit AVFoundation Foundation IOKit ApplicationServices CoreFoundation CoreText CoreGraphics CoreServices CoreMedia CFNetwork Security ImageIO System WebKit QuartzCore)
set(wxwidgets_BUILD_DIRS_RELEASE )
set(wxwidgets_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(wxwidgets_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${wxwidgets_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${wxwidgets_COMPILE_OPTIONS_C_RELEASE}>")
set(wxwidgets_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${wxwidgets_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${wxwidgets_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${wxwidgets_EXE_LINK_FLAGS_RELEASE}>")


set(wxwidgets_COMPONENTS_RELEASE )