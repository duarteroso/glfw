module vglfw

// Forward declaration
fn C.glfwCreateWindow(width, height int, title charptr, monitor &C.GLFWmonitor, share &C.GLFWwindow) &C.GLFWwindow

fn C.glfwDestroyWindow(window &C.GLFWwindow)

fn C.glfwWindowShouldClose(window &C.GLFWwindow) int

fn C.glfwSetWindowShouldClose(window &C.GLFWwindow, value int)

fn C.glfwSetWindowTitle(window &C.GLFWwindow, title charptr)

fn C.glfwSetWindowIcon(window &C.GLFWwindow, count int, images voidptr)

fn C.glfwGetWindowPos(window &C.GLFWwindow, xpos, y_pos &int)

fn C.glfwSetWindowPos(window &C.GLFWwindow, xpos, ypos int)

fn C.glfwGetWindowSize(window &C.GLFWwindow, width, height &int)

fn C.glfwSetWindowSize(window &C.GLFWwindow, width, height int)

fn C.glfwSetWindowSizeLimits(window &C.GLFWwindow, minwidth, minheight, maxwidth, maxheight int)

fn C.glfwSetWindowAspectRatio(window &C.GLFWwindow, numer, denom int)

fn C.glfwGetFramebufferSize(window &C.GLFWwindow, width, height &int)

fn C.glfwGetWindowFrameSize(window &C.GLFWwindow, left, top, right, bottom &int)

fn C.glfwGetWindowContentScale(window &C.GLFWwindow, x_scale, y_scale &f32)

fn C.glfwGetWindowOpacity(window &C.GLFWwindow) f32

fn C.glfwSetWindowOpacity(window &C.GLFWwindow, opacity f32)

fn C.glfwIconifyWindow(window &C.GLFWwindow)

fn C.glfwRestoreWindow(window &C.GLFWwindow)

fn C.glfwMaximizeWindow(window &C.GLFWwindow)

fn C.glfwShowWindow(window &C.GLFWwindow)

fn C.glfwHideWindow(window &C.GLFWwindow)

fn C.glfwFocusWindow(window &C.GLFWwindow)

fn C.glfwRequestWindowAttention(window &C.GLFWwindow)

fn C.glfwGetWindowMonitor(window &C.GLFWwindow) &C.GLFWmonitor

fn C.glfwSetWindowMonitor(window &C.GLFWwindow, monitor &C.GLFWmonitor, x_pos, y_pos, width, height, refreshRate int)

fn C.glfwGetWindowAttrib(window &C.GLFWwindow, attrib int) int

fn C.glfwSetWindowAttrib(window &C.GLFWwindow, attrib, value int)

fn C.glfwSetWindowUserPointer(window &C.GLFWwindow, pointer voidptr)

fn C.glfwGetWindowUserPointer(window &C.GLFWwindow) voidptr

fn C.glfwSetWindowPosCallback(window &C.GLFWwindow, callback FnWindowPos) FnWindowPos

fn C.glfwSetWindowSizeCallback(window &C.GLFWwindow, callback FnWindowSize) FnWindowSize

fn C.glfwSetWindowCloseCallback(window &C.GLFWwindow, callback FnWindowClose) FnWindowClose

fn C.glfwSetWindowRefreshCallback(window &C.GLFWwindow, callback FnWindowRefresh) FnWindowRefresh

fn C.glfwSetWindowFocusCallback(window &C.GLFWwindow, callback FnWindowFocus) FnWindowFocus

fn C.glfwSetWindowIconifyCallback(window &C.GLFWwindow, callback FnWindowIconify) FnWindowIconify

fn C.glfwSetWindowMaximizeCallback(window &C.GLFWwindow, callback FnWindowMaximize) FnWindowMaximize

fn C.glfwSetFramebufferSizeCallback(window &C.GLFWwindow, callback FnFramebufferSize) FnFramebufferSize

fn C.glfwSetWindowContentScaleCallback(window &C.GLFWwindow, callback FnWindowContentScale) FnWindowContentScale

fn C.glfwGetInputMode(window &C.GLFWwindow, mode int) int

fn C.glfwSetInputMode(window &C.GLFWwindow, mode, value int)

fn C.glfwGetKey(window &C.GLFWwindow, key int) int

fn C.glfwGetMouseButton(window &C.GLFWwindow, button int) int

fn C.glfwGetCursorPos(window &C.GLFWwindow, x_pos, y_pos &f64)

fn C.glfwSetCursorPos(window &C.GLFWwindow, x_pos, y_pos f64)

fn C.glfwSetCursor(window &C.GLFWwindow, cursor &C.GLFWcursor)

fn C.glfwSetKeyCallback(window &C.GLFWwindow, callback FnKey) FnKey

fn C.glfwSetCharCallback(window &C.GLFWwindow, callback FnChar) FnChar

fn C.glfwSetCharModsCallback(window &C.GLFWwindow, callback FnCharMods) FnCharMods

fn C.glfwSetMouseButtonCallback(window &C.GLFWwindow, callback FnMouseButton) FnMouseButton

fn C.glfwSetCursorPosCallback(window &C.GLFWwindow, callback FnCursorPos) FnCursorPos

fn C.glfwSetCursorEnterCallback(window &C.GLFWwindow, callback FnCursorEnter) FnCursorEnter

fn C.glfwSetScrollCallback(window &C.GLFWwindow, callback FnScroll) FnScroll

fn C.glfwSetDropCallback(window &C.GLFWwindow, callback FnDrop) FnDrop

fn C.glfwSetClipboardString(window &C.GLFWwindow, clipboard charptr)

fn C.glfwGetClipboardString(window &C.GLFWwindow) charptr

fn C.glfwSwapBuffers(window &C.GLFWwindow)

fn C.glfwMakeContextCurrent(window &C.GLFWwindow)

// Wrapper around GLFWwindow
pub struct Window {
mut:
	data &C.GLFWwindow = &C.GLFWwindow(0)
}

// Window creation descriptor
pub struct WindowDesc {
pub mut:
	size  Size
	title string
}

// Window definition
pub struct WindowDef {
pub mut:
	pos          Position
	size         Size
	refresh_rate int
}

// Create window from raw data
pub fn create_window(data voidptr) &Window {
	return &Window{
		data: &C.GLFWwindow(data)
	}
}

// Create window from description
pub fn create_window_desc(desc WindowDesc, monitor &Monitor, share &Window) &Window {
	mut monitor_data := &C.GLFWmonitor(0)
	// Has monitor data
	if monitor != &Monitor(0) {
		monitor_data = monitor.data
	}
	mut window_data := &C.GLFWwindow(0)
	// Has shared window
	if share != &Window(0) {
		window_data = share.data
	}
	//
	raw_data := C.glfwCreateWindow(desc.size.width, desc.size.height, desc.title.str, monitor_data,
		window_data)
	return create_window(raw_data)
}

// Destroy Window
pub fn (w &Window) destroy_window() {
	C.glfwDestroyWindow(w.data)
}

// Get window close flag
pub fn (w &Window) should_close() int {
	return C.glfwWindowShouldClose(w.data)
}

// Set window close flag
pub fn (w &Window) set_should_close(flag int) {
	C.glfwSetWindowShouldClose(w.data, flag)
}

// Set window title
pub fn (w &Window) set_title(title string) {
	C.glfwSetWindowTitle(w.data, title.str)
}

// Set window icon
pub fn (w &Window) set_icon(images []Image) {
	C.glfwSetWindowIcon(w.data, images.len, images.data)
}

// Get window position
pub fn (w &Window) get_position() Position {
	pos := Position{}
	C.glfwGetWindowPos(w.data, &pos.x, &pos.y)
	return pos
}

// Set window positin
pub fn (w &Window) set_position(x, y int) {
	C.glfwSetWindowPos(w.data, x, y)
}

// Get window size
pub fn (w &Window) get_size() Size {
	size := Size{}
	C.glfwGetWindowSize(w.data, &size.width, &size.height)
	return size
}

// Set window size
pub fn (w &Window) set_size(width, height int) {
	C.glfwSetWindowSize(w.data, width, height)
}

// Set window size limits
pub fn (w &Window) set_size_limits(min, max Size) {
	C.glfwSetWindowSizeLimits(w.data, min.width, min.height, max.width, max.height)
}

// Set window aspect ratio
pub fn (w &Window) set_aspect_ratio(numerator, denominator int) {
	C.glfwSetWindowAspectRatio(w.data, numerator, denominator)
}

// Get framebuffer size
pub fn (w &Window) get_framebuffer_size() Size {
	size := Size{}
	C.glfwGetFramebufferSize(w.data, &size.width, &size.height)
	return size
}

// Get window frame size
pub fn (w &Window) get_frame_size() Rect {
	rect := Rect{}
	C.glfwGetWindowFrameSize(w.data, &rect.left, &rect.top, &rect.right, &rect.bottom)
	return rect
}

// Get window contect scale
pub fn (w &Window) get_content_scale() Scale {
	scale := Scale{}
	C.glfwGetWindowContentScale(w.data, &scale.x, &scale.y)
	return scale
}

// Get window opacity
pub fn (w &Window) get_opacity() f32 {
	return C.glfwGetWindowOpacity(w.data)
}

// Set window opacity
pub fn (w &Window) set_opacity(opacity f32) {
	C.glfwSetWindowOpacity(w.data, opacity)
}

// Iconify window
pub fn (w &Window) iconify() {
	C.glfwIconifyWindow(w.data)
}

// Restore window
pub fn (w &Window) restore() {
	C.glfwRestoreWindow(w)
}

// Maximize window
pub fn (w &Window) maximize() {
	C.glfwMaximizeWindow(w.data)
}

// Show window
pub fn (w &Window) show() {
	C.glfwShowWindow(w.data)
}

// Hide window
pub fn (w &Window) hide() {
	C.glfwHideWindow(w.data)
}

// Focus window
pub fn (w &Window) focus() {
	C.glfwFocusWindow(w.data)
}

// Request window attention
pub fn (w &Window) request_attention() {
	C.glfwRequestWindowAttention(w.data)
}

// Get window monitor
pub fn (w &Window) get_monitor() &Monitor {
	raw_data := C.glfwGetWindowMonitor(w.data)
	// No monitor assign to it
	if raw_data == &C.GLFWmonitor(0) {
		return &Monitor(0)
	}
	//
	return create_monitor(raw_data)
}

// Set window monitor
pub fn (w &Window) set_monitor(monitor &Monitor, def WindowDef) {
	mut monitor_data := voidptr(0)
	//
	if monitor != &Monitor(0) {
		monitor_data = monitor.data
	}
	//
	C.glfwSetWindowMonitor(w.data, monitor_data, def.pos.x, def.pos.y, def.size.width, def.size.height,
		def.refresh_rate)
}

// Get window attribute
pub fn (w &Window) get_attribute(attrib int) int {
	return C.glfwGetWindowAttrib(w.data, attrib)
}

// Set window attribute
pub fn (w &Window) set_attribute(attrib, value int) {
	C.glfwSetWindowAttrib(w.data, attrib, value)
}

// Set window user pointer
pub fn (w &Window) set_user_pointer(pointer voidptr) {
	C.glfwSetWindowUserPointer(w.data, pointer)
}

// Get window user point
pub fn (w &Window) get_user_pointer(pointer voidptr) voidptr {
	return C.glfwGetWindowUserPointer(w.data)
}

// Set window position callback
pub fn (w &Window) set_position_callback(cb FnWindowPos) FnWindowPos {
	return C.glfwSetWindowPosCallback(w.data, cb)
}

// Set window size callback
pub fn (w &Window) set_size_callback(cb FnWindowSize) FnWindowSize {
	return C.glfwSetWindowSizeCallback(w, cb)
}

// Set window close callback
pub fn (w &Window) set_close_callback(cb FnWindowClose) FnWindowClose {
	return C.glfwSetWindowCloseCallback(w.data, cb)
}

// Set window refresh callback
pub fn (w &Window) set_refresh_callback(cb FnWindowRefresh) FnWindowRefresh {
	return C.glfwSetWindowRefreshCallback(w.data, cb)
}

// Set window focus callback
pub fn (w &Window) set_focus_callback(cb FnWindowFocus) FnWindowFocus {
	return C.glfwSetWindowFocusCallback(w.data, cb)
}

// Set window iconify callback
pub fn (w &Window) set_iconify_callback(cb FnWindowIconify) FnWindowIconify {
	return C.glfwSetWindowIconifyCallback(w.data, cb)
}

// Set window maximize callback
pub fn (w &Window) set_maximize_callback(cb FnWindowMaximize) FnWindowMaximize {
	return C.glfwSetWindowMaximizeCallback(w.data, cb)
}

// Set framebuffer size callback
pub fn (w &Window) set_framebuffer_size_callback(cb FnFramebufferSize) FnFramebufferSize {
	return C.glfwSetFramebufferSizeCallback(w.data, cb)
}

// Set window content scale callback
pub fn (w &Window) set_content_scale_callback(cb FnWindowContentScale) FnWindowContentScale {
	return C.glfwSetWindowContentScaleCallback(w.data, cb)
}

// Get imput mode
pub fn (w &Window) get_input_mode(mode int) int {
	return C.glfwGetInputMode(w.data, mode)
}

// Set input mode
pub fn (w &Window) set_input_mode(mode, value int) {
	C.glfwSetInputMode(w.data, mode, value)
}

// Get key
pub fn (w &Window) get_key(key int) int {
	return C.glfwGetKey(w.data, key)
}

// Get mouse button
pub fn (w &Window) get_mouse_button(button int) int {
	return C.glfwGetMouseButton(w.data, button)
}

// Get mouse cursor position
pub fn (w &Window) get_cursor_position() Position {
	pos := Position{}
	C.glfwGetCursorPos(w.data, &pos.x, &pos.y)
	return pos
}

// Set cursor position
pub fn (w &Window) set_cursor_position(x, y f64) {
	C.glfwSetCursorPos(w.data, x, y)
}

// Set cursor
pub fn (w &Window) set_cursor(cursor &Cursor) {
	C.glfwSetCursor(w.data, cursor.data)
}

// Set key callback
pub fn (w &Window) set_key_callback(cb FnKey) FnKey {
	return C.glfwSetKeyCallback(w.data, cb)
}

// Set char callback
pub fn (w &Window) set_char_callback(cb FnChar) FnChar {
	return C.glfwSetCharCallback(w.data, cb)
}

// Set char mods callback
pub fn (w &Window) set_char_mods_callback(cb FnCharMods) FnCharMods {
	return C.glfwSetCharModsCallback(w.data, cb)
}

// Set mouse button callback
pub fn (w &Window) set_mouse_button_callback(cb FnMouseButton) FnMouseButton {
	return C.glfwSetMouseButtonCallback(w.data, cb)
}

// Set cursor position callback
pub fn (w &Window) set_cursor_position_callback(cb FnCursorPos) FnCursorPos {
	return C.glfwSetCursorPosCallback(w.data, cb)
}

// Set cursor enter callback
pub fn (w &Window) set_cursor_enter_callback(cb FnCursorEnter) FnCursorEnter {
	return C.glfwSetCursorEnterCallback(w.data, cb)
}

// Set scroll callback
pub fn (w &Window) set_scroll_callback(cb FnScroll) FnScroll {
	return C.glfwSetScrollCallback(w.data, cb)
}

// Set drop callback
pub fn (w &Window) set_drop_callback(cb FnDrop) FnDrop {
	return C.glfwSetDropCallback(w.data, cb)
}

// Set clipboard string
pub fn (w &Window) set_clipboard_string(clipboard string) {
	C.glfwSetClipboardString(w.data, clipboard.str)
}

// Get clipboard string
pub fn (w &Window) get_clipboard_string() string {
	return tos3(C.glfwGetClipboardString(w.data))
}

// Swap buffers
pub fn (w &Window) swap_buffers() {
	C.glfwSwapBuffers(w.data)
}

// Make context current
pub fn (w &Window) make_context_current() {
	C.glfwMakeContextCurrent(w.data)
}
