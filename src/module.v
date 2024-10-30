module glfw

import semver

// glfw_version return the GLFW semantic version
pub fn glfw_version() semver.Version {
	return semver.build(glfw_version_major, glfw_version_minor, glfw_version_revision)
}
