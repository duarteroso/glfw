module vglfw

// Forward declaration
fn C.vglfwCreateImage(width, height int, pixels charptr) voidptr

// Wrapper around GLFWimage
pub struct Image {
mut:
	data &C.GLFWimage = &C.GLFWimage(0)
}

pub fn create_image(width, height int, pixels []byte) &Image {
	raw_data := C.vglfwCreateImage(width, height, string(pixels).str)
	return &Image{
		data: &C.GLFWimage(raw_data)
	}
}
