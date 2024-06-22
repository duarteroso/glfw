module glfw

fn test_create_gammaramp() {
	size := 256
	value := u16(65535)
	//
	gamma := &C.GLFWgammaramp{
		red: []u16{len: 256, init: value}.data
		green: []u16{len: 256, init: value}.data
		blue: []u16{len: 256, init: value}.data
		size: u32(size)
	}
	gammaramp := create_gammaramp(gamma)
	//
	assert gammaramp.size == gamma.size
	//
	for index in 0 .. size {
		mut r, g, b := u16(0), u16(0), u16(0)
		C.glfwGetGammaRampRGBBitHelper(gamma, index, &r, &g, &b)
		assert gammaramp.red[index] == r
		assert gammaramp.blue[index] == b
		assert gammaramp.green[index] == g
	}
}

fn test_get_raw() {
	size := 256
	value := u16(65535)
	//
	vgamma := &GammaRamp{
		red: []u16{len: 256, init: value}
		green: []u16{len: 256, init: value}
		blue: []u16{len: 256, init: value}
		size: u32(size)
	}
	cgamma := vgamma.get_raw()
	//
	assert cgamma.size == vgamma.size
	//
	for index in 0 .. size {
		mut r, g, b := u16(0), u16(0), u16(0)
		C.glfwGetGammaRampRGBBitHelper(cgamma, index, &r, &g, &b)
		assert vgamma.red[index] == r
		assert vgamma.blue[index] == b
		assert vgamma.green[index] == g
	}
}
