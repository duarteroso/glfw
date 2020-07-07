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
#include "vidmode.h"
#include "gammaramp.h"
#include "image.h"
#include "gamepadstate.h"

// Module init function
fn init() {}

// module_version Get module semantic versionin
pub fn module_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: 0
		minor: 1
		patch: 1
	}
}

// glfw_version Get GLFW semantic versioning
pub fn glfw_version() vsemver.SemVer {
	return vsemver.SemVer {
		major: glfw_version_major
		minor: glfw_version_minor
		patch: glfw_version_revision
	}
}

// is_fully_supported Returns true if wrapper is
// on par with the GLFW features
pub fn is_fully_supported() bool {
	mv := module_version()
	gv := glfw_version()
	return mv.is_equal(gv)
}