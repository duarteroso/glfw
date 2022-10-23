module glfw

// Forward declaration
[typedef]
struct C.GLFWgammaramp {
}

fn C.glfwGetGammaRampSize(gr &C.GLFWgammaramp, size &u32)

fn C.glfwGetGammaRampRGBBits(gr &C.GLFWgammaramp, r &u16, g &u16, b &u16)

fn C.glfwGetGammaRampRGBBit(gr &C.GLFWgammaramp, r &u16, g &u16, b &u16)

fn C.glfwCreateGammaRamp(gr &C.GLFWgammaramp, size u32, r &u16, g &u16, b &u16) &C.GLFWgammaramp

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
	C.glfwGetGammaRampSize(data, &size)
	//
	gr := &GammaRamp{
		size: int(size)
		red: []u16{len: int(size)}
		green: []u16{len: int(size)}
		blue: []u16{len: int(size)}
	}
	//
	C.glfwGetGammaRampRGBBits(data, &gr.red.data, &gr.green.data, &gr.blue.data)
	return gr
}

// get_raw returns the internal data
fn (gr &GammaRamp) get_raw() &C.GLFWgammaramp {
	ramp := &C.GLFWgammaramp{}
	C.glfwCreateGammaRamp(ramp, gr.size, &gr.red.data, &gr.green.data, &gr.blue.data)
	return ramp
}
