module glfw

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

	#include "GLFW/glfw3.h"
}

$if windows {
	#flag -I/usr/include/GLFW
	#flag -I@VROOT/include
	#flag -lglfw
}

#include "gamepadstate.h"
#include "gammaramp.h"
#include "image.h"
#include "vidmode.h"
