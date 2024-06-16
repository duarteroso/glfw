module glfw

// Position
pub struct Position {
pub mut:
	x int
	y int
}

pub struct CursorPosition {
pub mut:
	x f64
	y f64
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

// Function pointers
type FnGLProc = fn ()
type FnVkProc = fn ()
type FnError = fn (code int, err &char)
type FnWindowPos = fn (window &C.GLFWwindow, x_pos int, y_pos int)
type FnWindowSize = fn (window &C.GLFWwindow, width int, height int)
type FnWindowClose = fn (window &C.GLFWwindow)
type FnWindowRefresh = fn (window &C.GLFWwindow)
type FnWindowFocus = fn (window &C.GLFWwindow, focus int)
type FnWindowIconify = fn (window &C.GLFWwindow, iconified int)
type FnWindowMaximize = fn (window &C.GLFWwindow, maximized int)
type FnFramebufferSize = fn (window &C.GLFWwindow, width int, height int)
type FnWindowContentScale = fn (window &C.GLFWwindow, x_scale f32, y_scale f32)
type FnMouseButton = fn (window &C.GLFWwindow, button int, action int, bit_field int)
type FnCursorPos = fn (window &C.GLFWwindow, x_pos f64, y_pos f64)
type FnCursorEnter = fn (window &C.GLFWwindow, entered int)
type FnScroll = fn (window &C.GLFWwindow, x_offset f64, y_offset f64)
type FnKey = fn (window &C.GLFWwindow, key_id int, scan_code int, action int, bit_filed int)
type FnChar = fn (window &C.GLFWwindow, unicode u32)
type FnCharMods = fn (window &C.GLFWwindow, unicode u32, bit_field int)
type FnDrop = fn (window &C.GLFWwindow, path_count int, paths &&char)
type FnMonitor = fn (monitor &C.GLFWmonitor, event int)
type FnJoystick = fn (joystick_id int, event int)
