module vglfw

// Forward declaration
[typedef]
struct C.GLFWimage {
}

fn C.vglfwCreateImage(img &C.GLFWimage, width int, height int, pixels charptr) voidptr

// image wraps the functionality of GLFWimage
pub struct Image {
mut:
	data &C.GLFWimage = &C.GLFWimage(0)
}

// create_image creates an Image instance
pub fn create_image(width int, height int, pixels []byte) &Image {
	img := &C.GLFWimage(0)
	C.vglfwCreateImage(img, width, height, pixels.str().str)
	return &Image{
		data: img
	}
}
