module wrapper

import glfw

// image wraps the functionality of GLFWimage
pub struct Image {
mut:
	data &glfw.GLFWimage = &glfw.GLFWimage(unsafe { 0 })
}

// create_image creates an Image instance
pub fn create_image(width int, height int, pixels []u8) &Image {
	return &Image{
		data: &glfw.GLFWimage{
			width:  width
			height: height
			pixels: pixels.data
		}
	}
}

pub fn (img &Image) width() int {
	return img.data.width
}

pub fn (img &Image) height() int {
	return img.data.height
}

pub fn (img &Image) pixels() []u8 {
	mut value := []u8{len: img.width() * img.height()}
	for idx in 0 .. img.width() * img.height() {
		unsafe {
			value[idx] = img.data.pixels[idx]
		}
	}
	return value
}
