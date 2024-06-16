module glfw

// image wraps the functionality of GLFWimage
pub struct Image {
mut:
	data &C.GLFWimage = &C.GLFWimage(unsafe { 0 })
}

// create_image creates an Image instance
pub fn create_image(width int, height int, pixels []u8) &Image {
	img := &C.GLFWimage{}
	C.glfwCreateImageHelper(img, width, height, &pixels)
	return &Image{
		data: img
	}
}
