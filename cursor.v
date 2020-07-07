module vglfw

// Forward declaration
fn C.glfwCreateCursor(image &C.GLFWimage, x_hot, y_hot int) &C.GLFWcursor

fn C.glfwCreateStandardCursor(shape int) &C.GLFWcursor

fn C.glfwDestroyCursor(cursor &C.GLFWcursor)

// Wrapper around GLFWcursor
pub struct Cursor {
mut:
	data &C.GLFWcursor = &C.GLFWcursor(0)
}

// create_cursor Create Cursor instance
pub fn create_cursor(data voidptr) &Cursor {
	return &Cursor{
		data: &C.GLFWcursor(data)
	}
}

// create_cursor_with_image Create Cursor instance from an Image
pub fn create_cursor_with_image(image &Image, x, y int) &Cursor {
	raw_data := C.glfwCreateCursor(image.data, x, y)
	check_error()
	return create_cursor(raw_data)
}

// create_standard_cursor Create standard cursor
pub fn create_standard_cursor(shape int) &Cursor {
	raw_data := C.glfwCreateStandardCursor(shape)
	check_error()
	return create_cursor(raw_data)
}

// destroy_cursor Destroy cursor
pub fn (c &Cursor) destroy_cursor() {
	C.glfwDestroyCursor(c.data)
	check_error()
}
