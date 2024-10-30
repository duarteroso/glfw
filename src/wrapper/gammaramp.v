module wrapper

import glfw

// GammaRamp values of a monitor
pub struct GammaRamp {
mut:
	data &glfw.GLFWgammaramp = &glfw.GLFWgammaramp(unsafe { 0 })
}

// create_gammaramp creates a GammaRamp instance
pub fn create_gammaramp(size u32, red []u16, green []u16, blue []u16) &GammaRamp {
	return &GammaRamp{
		data: &glfw.GLFWgammaramp{
			size:  size
			red:   red.data
			green: green.data
			blue:  blue.data
		}
	}
}

// get_raw returns the internal data
fn (gr &GammaRamp) raw() &glfw.GLFWgammaramp {
	return gr.data
}
