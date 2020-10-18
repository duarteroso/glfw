module vglfw

// Position
pub struct Position {
pub mut:
	x int
	y int
}

// Scale
pub struct Scale {
pub mut:
	x f32
	y f32
}

// Size
pub struct Size {
pub mut:
	width  int
	height int
}

// Rect represents the dimensions of a Window
pub struct Rect {
pub mut:
	left   int
	top    int
	right  int
	bottom int
}

// Error includes a code and a message
pub struct Error {
pub mut:
	code int
	msg  string
}

// code_str returns the error code as string
pub fn (err &Error) code_str() string {
	return match err.code {
		glfw_no_error { 'GLFW_NO_ERROR' }
		glfw_not_initialized { 'GLFW_NOT_INITIALIZED' }
		glfw_no_current_context { 'GLFW_NO_CURRENT_CONTEXT' }
		glfw_invalid_enum { 'GLFW_INVALID_ENUM' }
		glfw_out_of_memory { 'GLFW_OUT_OF_MEMORY' }
		glfw_api_unavailable { 'GLFW_API_UNAVAILABLE' }
		glfw_version_unavailable { 'GLFW_VERION_UNAVAILABLE' }
		glfw_platform_error { 'GLFW_PLATFORM_ERROR' }
		glfw_format_unavailable { 'GLFW_FORMAT_UNAVAILABLE' }
		glfw_no_window_context { 'GLFW_NO_WINDOW_CONTEXT' }
		else { 'UNHANDLED_ERROR' }
	}
}

// str converts the error to a string
pub fn (err &Error) str() string {
	return '$err.code_str() - $err.msg'
}
