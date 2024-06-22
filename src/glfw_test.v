module glfw

type AnonOptionFun = fn () !

fn do_test(cb AnonOptionFun) {
	$if test {
		concrete_test(cb) or { panic(err) }
	} $else {
		dummy_test()
	}
}

fn dummy_test() {
}

fn concrete_test(cb AnonOptionFun) ! {
	initialize() or { panic(err) }
	cb()!
	terminate() or { panic(err) }
}

fn test_basic() {
	test := fn () ! {}
	do_test(test)
}

fn test_version() {
	version := get_version()
	assert version.major != glfw_dont_care
	assert version.minor != glfw_dont_care
	assert version.patch != glfw_dont_care
}
