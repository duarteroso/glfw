module vglfw

fn test_basic() {
	test := fn () ! {}
	do_test(test)
}

fn test_version() {
	major, minor, rev := get_version()
	assert major != 0
	assert minor != 0
	assert rev != 0
}

fn test_semantic_version() {
	semver := get_semantic_version()
	assert semver.major != 0
	assert semver.minor != 0
	assert rev != 0
}
