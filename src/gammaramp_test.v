module glfw

fn test_create_gammaramp() {
	size := u32(256)
	value := u16(65535)
	color := []u16{len: int(size), init: value}
	gamma := create_gammaramp(size, color, color, color)
	//
	assert gamma.raw().size == size
}

fn test_raw() {
	size := u32(256)
	value := u16(65535)
	color := []u16{len: int(size), init: value}
	vgamma := create_gammaramp(size, color, color, color)
	cgamma := vgamma.raw()
	//
	assert size == cgamma.size
	//
	for index in 0 .. size {
		assert value == cgamma.red[index]
		assert value == cgamma.green[index]
		assert value == cgamma.blue[index]
	}
}
