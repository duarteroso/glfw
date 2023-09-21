module vglfw

import semver
import v.vmod

// manifest of module
pub fn manifest() !vmod.Manifest {
	return vmod.decode(@VMOD_FILE) or { err }
}

// glfw_version return the GLFW semantic version
pub fn glfw_version() semver.Version {
	return semver.Version{
		major: glfw_version_major
		minor: glfw_version_minor
		patch: glfw_version_revision
	}
}
