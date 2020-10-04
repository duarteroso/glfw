module vglfw

// C headers
#include "image.h"

// Forward declaration
[typedef] struct C.GLFWimage { }

fn C.vglfwCreateImage(width, height int, pixels charptr) voidptr

// Wrapper around GLFWimage
pub struct Image {
mut:
	data &C.GLFWimage = &C.GLFWimage(0)
}

// create_image Create instance of Image
pub fn create_image(width, height int, pixels []byte) &Image {
	raw_data := C.vglfwCreateImage(width, height, pixels.str().str)
	return &Image{
		data: &C.GLFWimage(raw_data)
	}
}
