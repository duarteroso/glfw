module vglfw

import duarteroso.vsemver

// Common
#flag -I @VROOT/include
#flag -DGLFW_INCLUDE_VULKAN=
// Linux
#flag linux -lglfw

// init
fn init() {
}

// load_module Load module
pub fn load_module() {
	ok := initialize()
	assert ok
}

// unload_module Unload module
pub fn unload_module() {
	terminate()
}

// module_version Get module semantic versionin
pub fn module_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: 0
		minor: 2
		patch: 1
		stage: .alpha
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