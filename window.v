module glfw

// Forward declaration
[typedef]
struct C.GLFWwindow {
}

fn C.glfwCreateWindow(width int, height int, title &char, monitor &C.GLFWmonitor, share &C.GLFWwindow) &C.GLFWwindow

fn C.glfwDestroyWindow(window &C.GLFWwindow)

fn C.glfwWindowShouldClose(window &C.GLFWwindow) int

fn C.glfwSetWindowShouldClose(window &C.GLFWwindow, value int)

fn C.glfwSetWindowTitle(window &C.GLFWwindow, title &char)

fn C.glfwSetWindowIcon(window &C.GLFWwindow, count int, images voidptr)

fn C.glfwGetWindowPos(window &C.GLFWwindow, x_pos &int, y_pos &int)

fn C.glfwSetWindowPos(window &C.GLFWwindow, x_pos int, y_pos int)

fn C.glfwGetWindowSize(window &C.GLFWwindow, width &int, height &int)

fn C.glfwSetWindowSize(window &C.GLFWwindow, width int, height int)

fn C.glfwSetWindowSizeLimits(window &C.GLFWwindow, minwidth int, minheight int, maxwidth int, maxheight int)

fn C.glfwSetWindowAspectRatio(window &C.GLFWwindow, numer int, denom int)

fn C.glfwGetFramebufferSize(window &C.GLFWwindow, width &int, height &int)

fn C.glfwGetWindowFrameSize(window &C.GLFWwindow, left &int, top &int, right &int, bottom &int)

fn C.glfwGetWindowContentScale(window &C.GLFWwindow, x_scale &f32, y_scale &f32)

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

fn C.glfwSetWindowMonitor(window &C.GLFWwindow, monitor &C.GLFWmonitor, x_pos int, y_pos int, width int, height int, refreshRate int)

fn C.glfwGetWindowAttrib(window &C.GLFWwindow, attrib int) int

fn C.glfwSetWindowAttrib(window &C.GLFWwindow, attrib int, value int)

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

fn C.glfwSetInputMode(window &C.GLFWwindow, mode int, value int)

fn C.glfwGetKey(window &C.GLFWwindow, key int) int

fn C.glfwGetMouseButton(window &C.GLFWwindow, button int) int

fn C.glfwGetCursorPos(window &C.GLFWwindow, x_pos &f64, y_pos &f64)

fn C.glfwSetCursorPos(window &C.GLFWwindow, x_pos f64, y_pos f64)

fn C.glfwSetCursor(window &C.GLFWwindow, cursor &C.GLFWcursor)

fn C.glfwSetKeyCallback(window &C.GLFWwindow, callback FnKey) FnKey

fn C.glfwSetCharCallback(window &C.GLFWwindow, callback FnChar) FnChar

fn C.glfwSetCharModsCallback(window &C.GLFWwindow, callback FnCharMods) FnCharMods

fn C.glfwSetMouseButtonCallback(window &C.GLFWwindow, callback FnMouseButton) FnMouseButton

fn C.glfwSetCursorPosCallback(window &C.GLFWwindow, callback FnCursorPos) FnCursorPos

fn C.glfwSetCursorEnterCallback(window &C.GLFWwindow, callback FnCursorEnter) FnCursorEnter

fn C.glfwSetScrollCallback(window &C.GLFWwindow, callback FnScroll) FnScroll

fn C.glfwSetDropCallback(window &C.GLFWwindow, callback FnDrop) FnDrop

fn C.glfwSetClipboardString(window &C.GLFWwindow, clipboard &char)

fn C.glfwGetClipboardString(window &C.GLFWwindow) &char

fn C.glfwSwapBuffers(window &C.GLFWwindow)

fn C.glfwMakeContextCurrent(window &C.GLFWwindow)

fn C.glfwGetCurrentContext() &C.GLFWwindow

// Window wraps the functionality of GLFWwindow
pub struct Window {
mut:
	data &C.GLFWwindow = &C.GLFWwindow(0)
}

// WindowDesc describes the basic properties of a window
pub struct WindowDesc {
pub mut:
	size  Size
	title string
}

// create_window creates a Window from raw data
pub fn create_window(data &C.GLFWwindow) &Window {
	unsafe {
		return &Window{
			data: data
		}
	}
}

// create_window_desc creates a window from a description
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
	raw_data := C.glfwCreateWindow(desc.size.width, desc.size.height, desc.title.str,
		monitor_data, window_data)
	check_error()
	//
	return create_window(raw_data)
}

// destroy_window destroys the Window instance
pub fn (mut w Window) destroy_window() {
	C.glfwDestroyWindow(w.data)
	check_error()
	w.data = &C.GLFWwindow(0)
}

// should_close returns true if window is closing
pub fn (w &Window) should_close() bool {
	v := C.glfwWindowShouldClose(w.data)
	check_error()
	return v == glfw_true
}

// set_should_close sets the window to close
pub fn (w &Window) set_should_close(flag int) {
	C.glfwSetWindowShouldClose(w.data, flag)
	check_error()
}

// set_title sets the window title
pub fn (w &Window) set_title(title string) {
	C.glfwSetWindowTitle(w.data, title.str)
	check_error()
}

// set_icon sets the window icon
pub fn (w &Window) set_icon(images []Image) {
	C.glfwSetWindowIcon(w.data, images.len, images.data)
	check_error()
}

// position gets the window position
pub fn (w &Window) get_position() Position {
	pos := Position{}
	C.glfwGetWindowPos(w.data, &int(pos.x), &int(pos.y))
	check_error()
	return pos
}

// set_position sets the window position
pub fn (w &Window) set_position(x int, y int) {
	C.glfwSetWindowPos(w.data, x, y)
	check_error()
}

// get_size gets the window size
pub fn (w &Window) get_size() Size {
	size := Size{}
	C.glfwGetWindowSize(w.data, &size.width, &size.height)
	check_error()
	return size
}

// set_size sets the window size
pub fn (w &Window) set_size(width int, height int) {
	C.glfwSetWindowSize(w.data, width, height)
	check_error()
}

// set_size_limits Set window size limits
pub fn (w &Window) set_size_limits(min Size, max Size) {
	C.glfwSetWindowSizeLimits(w.data, min.width, min.height, max.width, max.height)
	check_error()
}

// set_aspect_ratio sets the window aspect ratio
pub fn (w &Window) set_aspect_ratio(numerator int, denominator int) {
	C.glfwSetWindowAspectRatio(w.data, numerator, denominator)
	check_error()
}

// get_framebuffer_size gets the window framebuffer size
pub fn (w &Window) get_framebuffer_size() Size {
	size := Size{}
	C.glfwGetFramebufferSize(w.data, &size.width, &size.height)
	check_error()
	return size
}

// get_frame_size gets the window frame size
pub fn (w &Window) get_frame_size() Rect {
	rect := Rect{}
	C.glfwGetWindowFrameSize(w.data, &rect.left, &rect.top, &rect.right, &rect.bottom)
	check_error()
	return rect
}

// get_content_scale gets the window contect scale
pub fn (w &Window) get_content_scale() Scale {
	scale := Scale{}
	C.glfwGetWindowContentScale(w.data, &scale.x, &scale.y)
	check_error()
	return scale
}

// get_opacity gets the window opacity
pub fn (w &Window) get_opacity() f32 {
	o := C.glfwGetWindowOpacity(w.data)
	check_error()
	return o
}

// set_opacity sets the window opacity
pub fn (w &Window) set_opacity(opacity f32) {
	C.glfwSetWindowOpacity(w.data, opacity)
	check_error()
}

// iconify sets the window to iconify (minimize)
pub fn (w &Window) iconify() {
	C.glfwIconifyWindow(w.data)
	check_error()
}

// restore forces the windw to restore
pub fn (w &Window) restore() {
	C.glfwRestoreWindow(w.data)
	check_error()
}

// maximize sets the window to maximize
pub fn (w &Window) maximize() {
	C.glfwMaximizeWindow(w.data)
	check_error()
}

// show forces the window to show
pub fn (w &Window) show() {
	C.glfwShowWindow(w.data)
	check_error()
}

// hide forces the window to hide
pub fn (w &Window) hide() {
	C.glfwHideWindow(w.data)
	check_error()
}

// focus gives focus to the window
pub fn (w &Window) focus() {
	C.glfwFocusWindow(w.data)
	check_error()
}

// request_attention makes the window request the user attention
pub fn (w &Window) request_attention() {
	C.glfwRequestWindowAttention(w.data)
	check_error()
}

// get_monitor gets the Monitor linked to the window.
// Returns nil if no Monitor was linked
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

// set_monitor link a Monitor to the window
pub fn (w &Window) set_monitor(monitor &Monitor, desc MonitorDesc) {
	mut monitor_data := &C.GLFWmonitor(0)
	if !isnil(monitor) {
		monitor_data = monitor.data
	}
	//
	C.glfwSetWindowMonitor(w.data, monitor_data, desc.pos.x, desc.pos.y, desc.size.width,
		desc.size.height, desc.refresh_rate)
	check_error()
}

// get_attribute retrieves an attribute of the window
pub fn (w &Window) get_attribute(attrib int) int {
	a := C.glfwGetWindowAttrib(w.data, attrib)
	check_error()
	return a
}

// set_attribute writes an attribute of the window
pub fn (w &Window) set_attribute(attrib int, value int) {
	C.glfwSetWindowAttrib(w.data, attrib, value)
	check_error()
}

// set_user_pointer links user data to the window
pub fn (w &Window) set_user_pointer(pointer voidptr) {
	C.glfwSetWindowUserPointer(w.data, pointer)
	check_error()
}

// get_user_pointer returns the linked user data of the window
pub fn (w &Window) get_user_pointer() voidptr {
	ptr := C.glfwGetWindowUserPointer(w.data)
	check_error()
	return ptr
}

// set_user_pointer links user data to a window
pub fn set_user_pointer(data &C.GLFWwindow, pointer voidptr) {
	C.glfwSetWindowUserPointer(data, pointer)
	check_error()
}

// get_user_pointer returns the linked user data of a window
pub fn get_user_pointer(data &C.GLFWwindow) voidptr {
	ptr := C.glfwGetWindowUserPointer(data)
	check_error()
	return ptr
}

// set_position_callback sets the window position changed callback
pub fn (w &Window) set_position_callback(cb FnWindowPos) FnWindowPos {
	prev := C.glfwSetWindowPosCallback(w.data, cb)
	check_error()
	return prev
}

// get_size_callback sets the window size changed callback
pub fn (w &Window) set_size_callback(cb FnWindowSize) FnWindowSize {
	prev := C.glfwSetWindowSizeCallback(w.data, cb)
	check_error()
	return prev
}

// set_close_callback sets the window closed callback
pub fn (w &Window) set_close_callback(cb FnWindowClose) FnWindowClose {
	prev := C.glfwSetWindowCloseCallback(w.data, cb)
	check_error()
	return prev
}

// set_refresh_callback sets the window refresh callback
pub fn (w &Window) set_refresh_callback(cb FnWindowRefresh) FnWindowRefresh {
	prev := C.glfwSetWindowRefreshCallback(w.data, cb)
	check_error()
	return prev
}

// set_focus_callback sets the window focus callback
pub fn (w &Window) set_focus_callback(cb FnWindowFocus) FnWindowFocus {
	prev := C.glfwSetWindowFocusCallback(w.data, cb)
	check_error()
	return prev
}

// set_iconify_callback sets the window iconify callback
pub fn (w &Window) set_iconify_callback(cb FnWindowIconify) FnWindowIconify {
	prev := C.glfwSetWindowIconifyCallback(w.data, cb)
	check_error()
	return prev
}

// set_maximize_callback sets the window maximize callback
pub fn (w &Window) set_maximize_callback(cb FnWindowMaximize) FnWindowMaximize {
	prev := C.glfwSetWindowMaximizeCallback(w.data, cb)
	check_error()
	return prev
}

// set_framebuffer_size_callback sets the framebuffer size changed callback
pub fn (w &Window) set_framebuffer_size_callback(cb FnFramebufferSize) FnFramebufferSize {
	prev := C.glfwSetFramebufferSizeCallback(w.data, cb)
	check_error()
	return prev
}

// set_content_scale_callback sets the window content scale callback
pub fn (w &Window) set_content_scale_callback(cb FnWindowContentScale) FnWindowContentScale {
	prev := C.glfwSetWindowContentScaleCallback(w.data, cb)
	check_error()
	return prev
}

// get_input_mode return the window imput mode
pub fn (w &Window) get_input_mode(mode int) int {
	prev := C.glfwGetInputMode(w.data, mode)
	check_error()
	return prev
}

// set_input_mode sets the window input mode
pub fn (w &Window) set_input_mode(mode int, value int) {
	C.glfwSetInputMode(w.data, mode, value)
	check_error()
}

// get_key returns the state of a key
pub fn (w &Window) get_key(key int) int {
	k := C.glfwGetKey(w.data, key)
	check_error()
	return k
}

// get_mouse_button returns the state of a mouse button
pub fn (w &Window) get_mouse_button(button int) int {
	s := C.glfwGetMouseButton(w.data, button)
	check_error()
	return s
}

// get_cursor_position returns the current position of the mouse cursor
pub fn (w &Window) get_cursor_position() Position {
	pos := Position{}
	C.glfwGetCursorPos(w.data, &pos.x, &pos.y)
	check_error()
	return pos
}

// set_cursor_position places the cursor at the specified position
pub fn (w &Window) set_cursor_position(x f64, y f64) {
	C.glfwSetCursorPos(w.data, x, y)
	check_error()
}

// set_cursor sets cursor
pub fn (w &Window) set_cursor(cursor &Cursor) {
	C.glfwSetCursor(w.data, cursor.data)
	check_error()
}

// set_key_callback sets the window key callback
pub fn (w &Window) set_key_callback(cb FnKey) FnKey {
	prev := C.glfwSetKeyCallback(w.data, cb)
	check_error()
	return prev
}

// set_char_callback sets the widnow char (Unicode) callback
pub fn (w &Window) set_char_callback(cb FnChar) FnChar {
	prev := C.glfwSetCharCallback(w.data, cb)
	check_error()
	return prev
}

// set_char_mods_callback sets the window char mods callback
pub fn (w &Window) set_char_mods_callback(cb FnCharMods) FnCharMods {
	prev := C.glfwSetCharModsCallback(w.data, cb)
	check_error()
	return prev
}

// set_mouse_button_callback sets the mouse button callback
pub fn (w &Window) set_mouse_button_callback(cb FnMouseButton) FnMouseButton {
	prev := C.glfwSetMouseButtonCallback(w.data, cb)
	check_error()
	return prev
}

// set_cursor_position_callback sets the cursor position callback
pub fn (w &Window) set_cursor_position_callback(cb FnCursorPos) FnCursorPos {
	prev := C.glfwSetCursorPosCallback(w.data, cb)
	check_error()
	return prev
}

// set_cursor_enter_callback sets the cursor enter callback
pub fn (w &Window) set_cursor_enter_callback(cb FnCursorEnter) FnCursorEnter {
	prev := C.glfwSetCursorEnterCallback(w.data, cb)
	check_error()
	return prev
}

// set_scroll_callback sets the scroll callback
pub fn (w &Window) set_scroll_callback(cb FnScroll) FnScroll {
	prev := C.glfwSetScrollCallback(w.data, cb)
	check_error()
	return prev
}

// set_drop_callback sets the drop callback
pub fn (w &Window) set_drop_callback(cb FnDrop) FnDrop {
	prev := C.glfwSetDropCallback(w.data, cb)
	check_error()
	return prev
}

// set_clipboard_string sets the clipboard string
pub fn (w &Window) set_clipboard_string(clipboard string) {
	C.glfwSetClipboardString(w.data, clipboard.str)
	check_error()
}

// set_clipboard_string returns the clipboard string
pub fn (w &Window) get_clipboard_string() string {
	s := C.glfwGetClipboardString(w.data)
	check_error()
	return unsafe { s.vstring() }
}

// swap_buffers swaps the front and back buffers
pub fn (w &Window) swap_buffers() {
	C.glfwSwapBuffers(w.data)
	check_error()
}

// make_context_current makes the window's context current
pub fn (w &Window) make_context_current() {
	C.glfwMakeContextCurrent(w.data)
	check_error()
}

// get_current_context returns the current context
pub fn get_current_context() &Window {
	raw_data := C.glfwGetCurrentContext()
	check_error()
	return create_window(raw_data)
}
