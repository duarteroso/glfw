module glfw

// Forward declaration
[typedef]
struct C.GLFWimage {
}

fn C.glfwCreateImageHelper(img &C.GLFWimage, width int, height int, pixels &u8) voidptr

// image wraps the functionality of GLFWimage
pub struct Image {
mut:
	data &C.GLFWimage = &C.GLFWimage(0)
}

// create_image creates an Image instance
pub fn create_image(width int, height int, pixels []u8) &Image {
	img := &C.GLFWimage{}
	C.glfwCreateImageHelper(img, width, height, &pixels)
	return &Image{
		data: img
	}
}
