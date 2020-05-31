module vglfw

import duarteroso.vsemver

// Common
#flag -I @VROOT/include
#flag -DGLFW_INCLUDE_VULKAN=
// Linux
#flag linux -lglfw
//
// C headers
#include <GLFW/glfw3.h>
#include <vulkan/vulkan.h>
#include "vidmode.h"
#include "gammaramp.h"
#include "image.h"
#include "gamepadstate.h"
// fn init() {}
//
pub fn module_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: 0
		minor: 1
		patch: 0
	}
}
