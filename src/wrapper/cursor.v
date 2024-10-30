module wrapper

import glfw

// Cursor wraps the functionality of GLFWcursor
pub struct Cursor {
mut:
	data &glfw.GLFWcursor = &glfw.GLFWcursor(unsafe { 0 })
}

// create_cursor creates a Cursor instance
pub fn create_cursor(data voidptr) &Cursor {
	return &Cursor{
		data: unsafe { &glfw.GLFWcursor(data) }
	}
}

// create_cursor_with_image creates a Cursor instance from an Image
pub fn create_cursor_with_image(image &Image, x int, y int) !&Cursor {
	raw_data := C.glfwCreateCursor(image.data, x, y)
	check_error()!
	return create_cursor(raw_data)
}

// create_standard_cursor creates a standard cursor
pub fn create_standard_cursor(shape int) !&Cursor {
	raw_data := C.glfwCreateStandardCursor(shape)
	check_error()!
	return create_cursor(raw_data)
}

// destroy_cursor destroys the cursor
pub fn (c &Cursor) destroy_cursor() ! {
	C.glfwDestroyCursor(c.data)
	check_error()!
}
