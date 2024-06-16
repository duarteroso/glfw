module glfw

// GammaRamp values of a monitor
pub struct GammaRamp {
pub mut:
	size  int
	red   []u16
	green []u16
	blue  []u16
}

// create_gammaramp creates a GammaRamp instance
pub fn create_gammaramp(data &C.GLFWgammaramp) &GammaRamp {
	size := u32(0)
	C.glfwGetGammaRampSizeHelper(data, &size)
	//
	gr := &GammaRamp{
		size: int(size)
		red: []u16{len: int(size)}
		green: []u16{len: int(size)}
		blue: []u16{len: int(size)}
	}
	//
	C.glfwGetGammaRampRGBBitsHelper(data, &gr.red.data, &gr.green.data, &gr.blue.data)
	return gr
}

// get_raw returns the internal data
fn (gr &GammaRamp) get_raw() &C.GLFWgammaramp {
	ramp := &C.GLFWgammaramp{}
	C.glfwCreateGammaRampHelper(ramp, gr.size, &gr.red.data, &gr.green.data, &gr.blue.data)
	return ramp
}
