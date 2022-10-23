module glfw

// Forward declaration
[typedef]
struct C.GLFWvidmode {
}

// Helper methods to handle GLFWvidmode
fn C.glfwGetVidModeSize(vidmode &C.GLFWvidmode, width &int, height &int)

fn C.glfwGetVidModeRGBBits(vidmode &C.GLFWvidmode, r &int, g &int, b &int)

fn C.glfwGetVidModeRefreshRate(vidmode &C.GLFWvidmode, rate &int)

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
	C.glfwGetVidModeSize(raw_data, &v.width, &v.height)
	C.glfwGetVidModeRGBBits(raw_data, &v.red_bits, &v.green_bits, &v.blue_bits)
	C.glfwGetVidModeRefreshRate(raw_data, &v.refresh_rate)
	return v
}
