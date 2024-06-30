module glfw

// Forward declaration
@[typedef]
struct C.GLFWgammaramp {
	red   &u16
	green &u16
	blue  &u16
	size  u32
}

pub fn (gamma &C.GLFWgammaramp) size() u32 {
	return gamma.size
}

pub fn (gamma &C.GLFWgammaramp) red() []u16 {
	mut red := []u16{len: int(gamma.size), init: u16(0)}
	//
	for idx in 0 .. int(gamma.size) {
		unsafe {
			red[idx] = gamma.red[idx]
		}
	}
	//
	return red
}

pub fn (gamma &C.GLFWgammaramp) green() []u16 {
	mut green := []u16{len: int(gamma.size), init: u16(0)}
	//
	for idx in 0 .. int(gamma.size) {
		unsafe {
			green[idx] = gamma.green[idx]
		}
	}
	//
	return green
}

pub fn (gamma &C.GLFWgammaramp) blue() []u16 {
	mut blue := []u16{len: int(gamma.size), init: u16(0)}
	//
	for idx in 0 .. int(gamma.size) {
		unsafe {
			blue[idx] = gamma.blue[idx]
		}
	}
	//
	return blue
}
