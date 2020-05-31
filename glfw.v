module vglfw

import duarteroso.vsemver

// Forward declaration
fn C.glfwInit() int

fn C.glfwTerminate()

fn C.glfwInitHint(hint, value int)

fn C.glfwGetVersion(major, minor, rev &int)

fn C.glfwGetVersionString() charptr

fn C.glfwGetError(description &charptr) int

fn C.glfwSetErrorCallback(callback FnError) FnError

fn C.glfwGetMonitors(count &int) &voidptr

fn C.glfwGetPrimaryMonitor() &C.GLFWmonitor

fn C.glfwSetMonitorCallback(callback FnMonitor) FnMonitor

fn C.glfwDefaultWindowHints()

fn C.glfwWindowHint(hint, value int)

fn C.glfwWindowHintString(hint int, value charptr)

fn C.glfwPollEvents()

fn C.glfwWaitEvents()

fn C.glfwWaitEventsTimeout(timeout f64)

fn C.glfwPostEmptyEvent()

fn C.glfwRawMouseMotionSupported() int

fn C.glfwGetKeyName(key, scan_code int) charptr

fn C.glfwGetKeyScancode(key int) int

fn C.glfwGetTime() f64

fn C.glfwSetTime(time f64)

fn C.glfwGetTimerValue() u64

fn C.glfwGetTimerFrequency() u64

fn C.glfwGetCurrentContext() &C.GLFWwindow

fn C.glfwSwapInterval(interval int)

fn C.glfwExtensionSupported(extension charptr) int

fn C.glfwGetProcAddress(procname charptr) FnGLProc

fn C.glfwVulkanSupported() int

fn C.glfwGetRequiredInstanceExtensions(count &u32) &charptr

fn C.glfwSetJoystickCallback(FnJoystick callback) FnJoystick

fn C.glfwUpdateGamepadMappings(mappings charptr) int

// Initialize GLFW
pub fn initialize() int {
	return C.glfwInit()
}

// Terminate GLFW
pub fn terminate() {
	C.glfwTerminate()
}

// Initialize hint
pub fn init_hint(hint, value int) {
	C.glfwInitHint(hint, value)
}

// Get GLFW version
pub fn get_version(major, minor, rev &int) {
	C.glfwGetVersion(major, minor, rev)
}

// Get GLFW semantic version
pub fn get_semantic_version() vsemver.SemVer {
	v := vsemver.SemVer{}
	get_version(v.major, v.minor, v.patch)
	return v
}

// Get GLFW version string
pub fn get_version_string() string {
	return tos3(C.glfwGetVersionString())
}

// Get GLFW error
pub fn get_error() Error {
	mut m := charptr(''.str)
	c := C.glfwGetError(&m)
	//
	mut error := Error{
		code: c
		msg: 'no error'
	}
	//
	if error.code != glfw_no_error {
		error.msg = tos3(m)
	}
	//
	return error
}

// Set error callback
pub fn set_error_callback(cb FnError) FnError {
	return C.glfwSetErrorCallback(cb)
}

// Get monitors
pub fn get_monitors() []Monitor {
	count := 0
	c_monitors := C.glfwGetMonitors(&count)
	mut v_monitors := []Monitor{len: count}
	for idx := 0; idx < count; idx++ {
		v_monitors[idx].data = c_monitors[idx]
	}
	return v_monitors
}

// Get primary monitor
pub fn get_primary_monitor() Monitor {
	c_monitor := C.glfwGetPrimaryMonitor()
	v_monitor := Monitor{
		data: c_monitor
	}
	return v_monitor
}

// Set monitor callback
pub fn set_monitor_callback(cb FnMonitor) FnMonitor {
	return C.glfwSetMonitorCallback(cb)
}

// Default window hints
pub fn default_window_hints() {
	C.glfwDefaultWindowHints()
}

// Set window hint
pub fn window_hint(hint, value int) {
	C.glfwWindowHint(hint, value)
}

// Set window hint
pub fn window_hint_string(hint int, value string) {
	C.glfwWindowHintString(hint, value.str)
}

// Poll events
pub fn poll_events() {
	C.glfwPollEvents()
}

// Wait events
pub fn wait_events() {
	C.glfwWaitEvents()
}

// Set time out for waiting events
pub fn set_wait_events_timeout(timeout f64) {
	C.glfwWaitEventsTimeout(timeout)
}

// Post empty event
pub fn post_empty_event() {
	C.glfwPostEmptyEvent()
}

// Is raw mouse motion supported
pub fn is_raw_mouse_motion_supported() int {
	return C.glfwRawMouseMotionSupported()
}

// Get key name
pub fn get_key_name(key, scan_code int) string {
	return tos3(C.glfwGetKeyName(key, scan_code))
}

// Get key scan code
pub fn get_key_scan_code(key int) int {
	return C.glfwGetKeyScancode(key)
}

// Get time
pub fn get_time() f64 {
	return C.glfwGetTime()
}

// Set time
pub fn set_time(time f64) {
	C.glfwSetTime(time)
}

// Get timer value
pub fn get_timer_value() u64 {
	return C.glfwGetTimerValue()
}

// Get timer frequency
pub fn get_timer_frequency() u64 {
	return C.glfwGetTimerFrequency()
}

// Get current context
pub fn get_current_context() &Window {
	raw_data := C.glfwGetCurrentContext()
	return create_window(raw_data)
}

// Swap interval
pub fn swap_interval(interval int) {
	C.glfwSwapInterval(interval)
}

// Is extension supported
pub fn is_extension_supported(extension string) int {
	return C.glfwExtensionSupported(extension.str)
}

// Get proc adress
pub fn get_proc_address(proc_name string) FnGLProc {
	return C.glfwGetProcAddress(proc_name.str)
}

// Is Vulkan supported
pub fn is_vulkan_supported() int {
	return C.glfwVulkanSupported()
}

// Get required instance extensions
pub fn get_required_instance_extensions() []string {
	count := u32(0)
	data := C.glfwGetRequiredInstanceExtensions(&count)
	//
	mut exts := []string{len: int(count)}
	for i := 0; i < count; i++ {
		exts[i] = tos3(data[i])
	}
	//
	return exts
}

// Set joystick callback
pub fn (j &Joystick) set_callback(cb FnJoystick) FnJoystick {
	return C.glfwSetJoystickCallback(cb)
}

// Update gamepad mappings
pub fn update_gamepad_mapping(mappings string) int {
	return C.glfwUpdateGamepadMappings(mappings.str)
}
