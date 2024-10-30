module wrapper

import glfw

// Err includes a error code and an error message
pub struct Err {
pub mut:
	code int
	msg  string
}

// create_error creates an error with code and message.
fn create_error(code int, msg string) Err {
	return Err{
		code: code
		msg:  msg
	}
}

// check_error will throw an error if there is any unhandled GLFW error
// Should be call after each GLFW method that can produce an error.
pub fn check_error() ! {
	mut m := &char(0)
	code := C.glfwGetError(&m)
	if code == glfw.glfw_no_error {
		return
	}
	//
	msg := unsafe { cstring_to_vstring(m) }
	err := create_error(code, msg)
	return error(err.str())
}

// code_str returns the error code as string
pub fn (err &Err) code_str() string {
	return match err.code {
		glfw.glfw_no_error { 'GLFW_NO_ERROR' }
		glfw.glfw_not_initialized { 'GLFW_NOT_INITIALIZED' }
		glfw.glfw_no_current_context { 'GLFW_NO_CURRENT_CONTEXT' }
		glfw.glfw_invalid_enum { 'GLFW_INVALID_ENUM' }
		glfw.glfw_out_of_memory { 'GLFW_OUT_OF_MEMORY' }
		glfw.glfw_api_unavailable { 'GLFW_API_UNAVAILABLE' }
		glfw.glfw_version_unavailable { 'GLFW_VERION_UNAVAILABLE' }
		glfw.glfw_platform_error { 'GLFW_PLATFORM_ERROR' }
		glfw.glfw_format_unavailable { 'GLFW_FORMAT_UNAVAILABLE' }
		glfw.glfw_no_window_context { 'GLFW_NO_WINDOW_CONTEXT' }
		else { 'UNHANDLED_ERROR' }
	}
}

// str converts the error to a string
pub fn (err &Err) str() string {
	return '${err.code_str()} - ${err.msg}'
}
