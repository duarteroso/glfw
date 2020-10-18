module vglfw

import duarteroso.vsemver

// Common
#flag -I @VROOT/include
#flag -DGLFW_INCLUDE_VULKAN=
// Linux
#flag linux -lglfw
// C headers
#include <GLFW/glfw3.h>
#include <vulkan/vulkan.h>
#include "gamepadstate.h"
#include "gammaramp.h"
#include "image.h"
#include "vidmode.h"
// load_module loads GLFW module.
// Used to force the compiler to include the C pragmas
pub fn load_module() {
}

// unload_module unloads GLFW module
pub fn unload_module() {
}

// module_version returns the module semantic version
pub fn module_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: 0
		minor: 2
		patch: 2
		stage: .alpha
	}
}

// glfw_version return the GLFW semantic version
pub fn glfw_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: glfw_version_major
		minor: glfw_version_minor
		patch: glfw_version_revision
	}
}
