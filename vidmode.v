module vglfw

// Forward declaration 
[typedef] struct C.GLFWvidmode { }

// Helper methods to handle GLFWvidmode
fn C.vglfwGetVidModeSize(vidmode &C.GLFWvidmode, width, height &int)

fn C.vglfwGetVidModeRGBBits(vidmode &C.GLFWvidmode, r, g, b &int)

fn C.vglfwGetVidModeRefreshRate(vidmode &C.GLFWvidmode, rate &int)

// VideoMode represents the video mode of a monitor
pub struct VideoMode {
pub:
	width        int
	height       int
	red_bits     int
	green_bits   int
	blue_bits    int
	refresh_rate int
}

// create_vidmode creates a VideoMode instance
pub fn create_vidmode(data voidptr) VideoMode {
	raw_data := &C.GLFWvidmode(data)
	v := VideoMode{}
	C.vglfwGetVidModeSize(raw_data, &v.width, &v.height)
	C.vglfwGetVidModeRGBBits(raw_data, &v.red_bits, &v.green_bits, &v.blue_bits)
	C.vglfwGetVidModeRefreshRate(raw_data, &v.refresh_rate)
	return v
}
