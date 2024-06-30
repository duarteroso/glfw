module glfw

// GammaRamp values of a monitor
pub struct GammaRamp {
mut:
	data &C.GLFWgammaramp = &C.GLFWgammaramp(unsafe { 0 })
}

// create_gammaramp creates a GammaRamp instance
pub fn create_gammaramp(size u32, red []u16, green []u16, blue []u16) &GammaRamp {
	return &GammaRamp{
		data: &C.GLFWgammaramp{
			size: size
			red: red.data
			green: green.data
			blue: blue.data
		}
	}
}

// get_raw returns the internal data
fn (gr &GammaRamp) raw() &C.GLFWgammaramp {
	return gr.data
}
