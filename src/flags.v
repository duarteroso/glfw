module glfw

//
// General
//
$if glfw_include_vulkan ? {
	#flag -DGLFW_INCLUDE_VULKAN=1
}
$if vk_version_1_0 ? {
	#flag -DVK_VERSION_1_0=1
}
$if glfw_include_es1 ? {
	#flag -DGLFW_INCLUDE_ES1=1
}
$if glfw_include_es2 ? {
	#flag -DGLFW_INCLUDE_ES2=1
}
$if glfw_include_es3 ? {
	#flag -DGLFW_INCLUDE_ES3=1
}
$if glfw_include_es31 ? {
	#flag -DGLFW_INCLUDE_ES31=1
}
$if glfw_include_es32 ? {
	#flag -DGLFW_INCLUDE_ES32=1
}
$if glfw_include_glcorearb ? {
	#flag -DGLFW_INCLUDE_GLCOREARB=1
}
$if glfw_include_glu ? {
	#flag -DGLFW_INCLUDE_GLU=1
}

//
// Platform specific
//
$if linux {
	#flag -I/usr/include/GLFW
	#flag -I@VROOT/include
	#flag -lglfw
	//#flag linux -DGLFW_INCLUDE_VULKAN=1

	#include "GLFW/glfw3.h"
	//#include "vulkan/vulkan.h"
}

$if macos {
	#flag -I/usr/local/opt/glfw/include
	#flag -I@VROOT/include
	#flag -lglfw

	#include "GLFW/glfw3.h"
}

$if windows {
	#flag -I/usr/include/GLFW
	#flag -I@VROOT/include
	#flag -lglfw
}

#include "gamepadstate.h"
#include "vidmode.h"
