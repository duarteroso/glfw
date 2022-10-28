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
