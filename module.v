module vglfw

import duarteroso.semver

// module_version returns the module semantic version
pub fn module_version() semver.SemVer {
	return semver.SemVer{
		major: 0
		minor: 2
		patch: 2
		stage: .alpha
	}
}

// glfw_version return the GLFW semantic version
pub fn glfw_version() semver.SemVer {
	return semver.SemVer{
		major: glfw_version_major
		minor: glfw_version_minor
		patch: glfw_version_revision
	}
}
