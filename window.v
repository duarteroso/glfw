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
	if !isnil(monitor) {
		monitor_data = monitor.data
	}
	mut window_data := &C.GLFWwindow(0)
	// Has shared window
	if !isnil(share) {
		window_data = share.data
	}
	//
	raw_data := C.glfwCreateWindow(desc.size.width, desc.size.height, desc.title.str, monitor_data, window_data)
	check_error()
	//
	return create_window(raw_data)
}

// Destroy Window
pub fn (w &Window) destroy_window() {
	C.glfwDestroyWindow(w.data)
	check_error()
}

// Get window close flag
pub fn (w &Window) should_close() bool {
	v := C.glfwWindowShouldClose(w.data)
	check_error()
	return v == glfw_true
}

// Set window close flag
pub fn (w &Window) set_should_close(flag int) {
	C.glfwSetWindowShouldClose(w.data, flag)
	check_error()
}

// Set window title
pub fn (w &Window) set_title(title string) {
	C.glfwSetWindowTitle(w.data, title.str)
	check_error()
}

// Set window icon
pub fn (w &Window) set_icon(images []Image) {
	C.glfwSetWindowIcon(w.data, images.len, images.data)
	check_error()
}

// Get window position
pub fn (w &Window) get_position() Position {
	pos := Position{}
	C.glfwGetWindowPos(w.data, &pos.x, &pos.y)
	check_error()
	return pos
}

// Set window positin
pub fn (w &Window) set_position(x, y int) {
	C.glfwSetWindowPos(w.data, x, y)
	check_error()
}

// Get window size
pub fn (w &Window) get_size() Size {
	size := Size{}
	C.glfwGetWindowSize(w.data, &size.width, &size.height)
	check_error()
	return size
}

// Set window size
pub fn (w &Window) set_size(width, height int) {
	C.glfwSetWindowSize(w.data, width, height)
	check_error()
}

// Set window size limits
pub fn (w &Window) set_size_limits(min, max Size) {
	C.glfwSetWindowSizeLimits(w.data, min.width, min.height, max.width, max.height)
	check_error()
}

// Set window aspect ratio
pub fn (w &Window) set_aspect_ratio(numerator, denominator int) {
	C.glfwSetWindowAspectRatio(w.data, numerator, denominator)
	check_error()
}

// Get framebuffer size
pub fn (w &Window) get_framebuffer_size() Size {
	size := Size{}
	C.glfwGetFramebufferSize(w.data, &size.width, &size.height)
	check_error()
	return size
}

// Get window frame size
pub fn (w &Window) get_frame_size() Rect {
	rect := Rect{}
	C.glfwGetWindowFrameSize(w.data, &rect.left, &rect.top, &rect.right, &rect.bottom)
	check_error()
	return rect
}

// Get window contect scale
pub fn (w &Window) get_content_scale() Scale {
	scale := Scale{}
	C.glfwGetWindowContentScale(w.data, &scale.x, &scale.y)
	check_error()
	return scale
}

// Get window opacity
pub fn (w &Window) get_opacity() f32 {
	o := C.glfwGetWindowOpacity(w.data)
	check_error()
	return o
}

// Set window opacity
pub fn (w &Window) set_opacity(opacity f32) {
	C.glfwSetWindowOpacity(w.data, opacity)
	check_error()
}

// Iconify window
pub fn (w &Window) iconify() {
	C.glfwIconifyWindow(w.data)
	check_error()
}

// Restore window
pub fn (w &Window) restore() {
	C.glfwRestoreWindow(w)
	check_error()
}

// Maximize window
pub fn (w &Window) maximize() {
	C.glfwMaximizeWindow(w.data)
	check_error()
}

// Show window
pub fn (w &Window) show() {
	C.glfwShowWindow(w.data)
	check_error()
}

// Hide window
pub fn (w &Window) hide() {
	C.glfwHideWindow(w.data)
	check_error()
}

// Focus window
pub fn (w &Window) focus() {
	C.glfwFocusWindow(w.data)
	check_error()
}

// Request window attention
pub fn (w &Window) request_attention() {
	C.glfwRequestWindowAttention(w.data)
	check_error()
}

// Get window monitor
pub fn (w &Window) get_monitor() &Monitor {
	raw_data := C.glfwGetWindowMonitor(w.data)
	check_error()
	//
	if isnil(raw_data) {
		return &Monitor(0)
	}
	//
	return create_monitor(raw_data)
}

// Set window monitor
pub fn (w &Window) set_monitor(monitor &Monitor, desc MonitorDesc) {
	mut monitor_data := voidptr(0)
	if !isnil(monitor) {
		monitor_data = monitor.data
	}
	//
	C.glfwSetWindowMonitor(w.data, monitor_data, desc.pos.x, desc.pos.y, desc.size.width, desc.size.height,
		desc.refresh_rate)
	check_error()
}

// Get window attribute
pub fn (w &Window) get_attribute(attrib int) int {
	a := C.glfwGetWindowAttrib(w.data, attrib)
	check_error()
	return a
}

// Set window attribute
pub fn (w &Window) set_attribute(attrib, value int) {
	C.glfwSetWindowAttrib(w.data, attrib, value)
	check_error()
}

// Set window user pointer
pub fn (w &Window) set_user_pointer(pointer voidptr) {
	C.glfwSetWindowUserPointer(w.data, pointer)
	check_error()
}

// Get window user point
pub fn (w &Window) get_user_pointer(pointer voidptr) voidptr {
	ptr := C.glfwGetWindowUserPointer(w.data)
	check_error()
	return ptr
}

// Set window position callback
pub fn (w &Window) set_position_callback(cb FnWindowPos) FnWindowPos {
	prev := C.glfwSetWindowPosCallback(w.data, cb)
	check_error()
	return prev
}

// Set window size callback
pub fn (w &Window) set_size_callback(cb FnWindowSize) FnWindowSize {
	prev := C.glfwSetWindowSizeCallback(w, cb)
	check_error()
	return prev
}

// Set window close callback
pub fn (w &Window) set_close_callback(cb FnWindowClose) FnWindowClose {
	prev := C.glfwSetWindowCloseCallback(w.data, cb)
	check_error()
	return prev
}

// Set window refresh callback
pub fn (w &Window) set_refresh_callback(cb FnWindowRefresh) FnWindowRefresh {
	prev := C.glfwSetWindowRefreshCallback(w.data, cb)
	check_error()
	return prev
}

// Set window focus callback
pub fn (w &Window) set_focus_callback(cb FnWindowFocus) FnWindowFocus {
	prev := C.glfwSetWindowFocusCallback(w.data, cb)
	check_error()
	return prev
}

// Set window iconify callback
pub fn (w &Window) set_iconify_callback(cb FnWindowIconify) FnWindowIconify {
	prev := C.glfwSetWindowIconifyCallback(w.data, cb)
	check_error()
	return prev
}

// Set window maximize callback
pub fn (w &Window) set_maximize_callback(cb FnWindowMaximize) FnWindowMaximize {
	prev := C.glfwSetWindowMaximizeCallback(w.data, cb)
	check_error()
	return prev
}

// Set framebuffer size callback
pub fn (w &Window) set_framebuffer_size_callback(cb FnFramebufferSize) FnFramebufferSize {
	prev := C.glfwSetFramebufferSizeCallback(w.data, cb)
	check_error()
	return prev
}

// Set window content scale callback
pub fn (w &Window) set_content_scale_callback(cb FnWindowContentScale) FnWindowContentScale {
	prev := C.glfwSetWindowContentScaleCallback(w.data, cb)
	check_error()
	return prev
}

// Get imput mode
pub fn (w &Window) get_input_mode(mode int) int {
	prev := C.glfwGetInputMode(w.data, mode)
	check_error()
	return prev
}

// Set input mode
pub fn (w &Window) set_input_mode(mode, value int) {
	C.glfwSetInputMode(w.data, mode, value)
	check_error()
}

// Get key
pub fn (w &Window) get_key(key int) int {
	k := C.glfwGetKey(w.data, key)
	check_error()
	return k
}

pub fn (w &Window) is_key_pressed(key int) bool {
	return w.get_key(key) == glfw_press
}

pub fn (w &Window) is_key_released(key int) bool {
	return w.get_key(key) == glfw_release
}

// Get mouse button
pub fn (w &Window) get_mouse_button(button int) int {
	s := C.glfwGetMouseButton(w.data, button)
	check_error()
	return s
}

// Get mouse cursor position
pub fn (w &Window) get_cursor_position() Position {
	pos := Position{}
	C.glfwGetCursorPos(w.data, &pos.x, &pos.y)
	check_error()
	return pos
}

// Set cursor position
pub fn (w &Window) set_cursor_position(x, y f64) {
	C.glfwSetCursorPos(w.data, x, y)
	check_error()
}

// Set cursor
pub fn (w &Window) set_cursor(cursor &Cursor) {
	C.glfwSetCursor(w.data, cursor.data)
	check_error()
}

// Set key callback
pub fn (w &Window) set_key_callback(cb FnKey) FnKey {
	prev := C.glfwSetKeyCallback(w.data, cb)
	check_error()
	return prev
}

// Set char callback
pub fn (w &Window) set_char_callback(cb FnChar) FnChar {
	prev := C.glfwSetCharCallback(w.data, cb)
	check_error()
	return prev
}

// Set char mods callback
pub fn (w &Window) set_char_mods_callback(cb FnCharMods) FnCharMods {
	prev := C.glfwSetCharModsCallback(w.data, cb)
	check_error()
	return prev
}

// Set mouse button callback
pub fn (w &Window) set_mouse_button_callback(cb FnMouseButton) FnMouseButton {
	prev := C.glfwSetMouseButtonCallback(w.data, cb)
	check_error()
	return prev
}

// Set cursor position callback
pub fn (w &Window) set_cursor_position_callback(cb FnCursorPos) FnCursorPos {
	prev := C.glfwSetCursorPosCallback(w.data, cb)
	check_error()
	return prev
}

// Set cursor enter callback
pub fn (w &Window) set_cursor_enter_callback(cb FnCursorEnter) FnCursorEnter {
	prev := C.glfwSetCursorEnterCallback(w.data, cb)
	check_error()
	return prev
}

// Set scroll callback
pub fn (w &Window) set_scroll_callback(cb FnScroll) FnScroll {
	prev := C.glfwSetScrollCallback(w.data, cb)
	check_error()
	return prev
}

// Set drop callback
pub fn (w &Window) set_drop_callback(cb FnDrop) FnDrop {
	prev := C.glfwSetDropCallback(w.data, cb)
	check_error()
	return prev
}

// Set clipboard string
pub fn (w &Window) set_clipboard_string(clipboard string) {
	C.glfwSetClipboardString(w.data, clipboard.str)
	check_error()
}

// Get clipboard string
pub fn (w &Window) get_clipboard_string() string {
	c := tos3(C.glfwGetClipboardString(w.data))
	check_error()
	return c
}

// Swap buffers
pub fn (w &Window) swap_buffers() {
	C.glfwSwapBuffers(w.data)
	check_error()
}

// Make context current
pub fn (w &Window) make_context_current() {
	C.glfwMakeContextCurrent(w.data)
	check_error()
}
