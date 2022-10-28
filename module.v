module glfw

import duarteroso.semver
import v.vmod

$if !linux {
	$compile_error("Only Linux is currently supported")
}

// manifest of module
pub fn manifest() !vmod.Manifest {
	return vmod.decode(@VMOD_FILE) or { err }
}

// glfw_version return the GLFW semantic version
pub fn glfw_version() semver.SemVer {
	return semver.SemVer{
		major: glfw_version_major
		minor: glfw_version_minor
		patch: glfw_version_revision
	}
}
