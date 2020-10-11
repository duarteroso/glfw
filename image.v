module vglfw

// Forward declaration
[typedef] struct C.GLFWimage { }

fn C.vglfwCreateImage(width, height int, pixels charptr) voidptr

// image wraps the functionality of GLFWimage 
pub struct Image {
mut:
	data &C.GLFWimage = &C.GLFWimage(0)
}

// create_image creates an Image instance
pub fn create_image(width, height int, pixels []byte) &Image {
	raw_data := C.vglfwCreateImage(width, height, pixels.str().str)
	return &Image{
		data: &C.GLFWimage(raw_data)
	}
}
