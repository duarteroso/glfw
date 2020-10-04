module vglfw

// C headers
#include "gammaramp.h"

// Forward declaration
[typedef] struct C.GLFWgammaramp { }

fn C.vglfwGetGammaRampSize(gr &C.GLFWgammaramp, size &u32)

fn C.vglfwGetGammaRampRGBBits(gr &C.GLFWgammaramp, r, g, b &u16)

fn C.vglfwGetGammaRampRGBBit(gr &C.GLFWgammaramp, r, g, b &u16)

fn C.vglfwCreateGammaRamp(size u32, r, g, b &u16) &C.GLFWgammaramp

// Gamma ramp of monitor
pub struct GammaRamp {
pub mut:
	size  int
	red   []u16
	green []u16
	blue  []u16
}

// create_gammaramp Create GammaRamp instance
pub fn create_gammaramp(data voidptr) &GammaRamp {
	raw_data := &C.GLFWgammaramp(data)
	//
	size := u32(0)
	C.vglfwGetGammaRampSize(raw_data, &size)
	//
	gr := &GammaRamp{
		size: int(size)
		red: []u16{len: int(size)}
		green: []u16{len: int(size)}
		blue: []u16{len: int(size)}
	}
	//
	C.vglfwGetGammaRampRGBBits(raw_data, &gr.red.data, &gr.green.data, &gr.blue.data)
	return gr
}

// get_raw Convert to GLFWgammaramp
fn (gr &GammaRamp) get_raw() &C.GLFWgammaramp {
	return C.vglfwCreateGammaRamp(gr.size, &gr.red, &gr.green, &gr.blue)
}
