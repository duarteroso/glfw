module wrapper

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
	raw_data := unsafe { &C.GLFWvidmode(data) }
	v := VideoMode{}
	C.glfwGetVidModeSizeHelper(raw_data, &v.width, &v.height)
	C.glfwGetVidModeRGBBitsHelper(raw_data, &v.red_bits, &v.green_bits, &v.blue_bits)
	C.glfwGetVidModeRefreshRateHelper(raw_data, &v.refresh_rate)
	return v
}
