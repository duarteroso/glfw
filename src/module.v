module glfw

import semver
import v.vmod

// manifest of module
pub fn manifest() !vmod.Manifest {
	return vmod.decode(@VMOD_FILE) or { err }
}

// glfw_version return the GLFW semantic version
pub fn glfw_version() semver.Version {
	return semver.build(glfw_version_major, glfw_version_minor, glfw_version_revision)
}
