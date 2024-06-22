module glfw

// GammaRamp values of a monitor
pub struct GammaRamp {
pub mut:
	size  u32
	red   []u16
	green []u16
	blue  []u16
}

// create_gammaramp creates a GammaRamp instance
pub fn create_gammaramp(data &C.GLFWgammaramp) &GammaRamp {
	gr := &GammaRamp{
		size: data.size
		red: []u16{len: int(data.size)}
		green: []u16{len: int(data.size)}
		blue: []u16{len: int(data.size)}
	}
	//
	C.glfwGetGammaRampRGBBitsHelper(data, &gr.red.data, &gr.green.data, &gr.blue.data)
	return gr
}

// get_raw returns the internal data
fn (gr &GammaRamp) get_raw() &C.GLFWgammaramp {
	ramp := &C.GLFWgammaramp{
		red: gr.red.data
		green: gr.green.data
		blue: gr.blue.data
		size: gr.size
	}
	return ramp
}
