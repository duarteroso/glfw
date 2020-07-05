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
	c := C.glfwInit()
	check_error()
	return c
}

// Terminate GLFW
pub fn terminate() {
	C.glfwTerminate()
	check_error()
}

// Initialize hint
pub fn init_hint(hint, value int) {
	C.glfwInitHint(hint, value)
	check_error()
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
	return Error{
		code: c
		msg: if c == glfw_no_error {
			''
		}
		else {
			tos3(m)
		}
	}
}

pub fn check_error() {
	err := get_error()
	if err.code != glfw_no_error {
		panic(err.str())
	}
} 

// Set error callback
pub fn set_error_callback(cb FnError) FnError {
	return C.glfwSetErrorCallback(cb)
}

// Get monitors
pub fn get_monitors() []Monitor {
	count := 0
	c_monitors := C.glfwGetMonitors(&count)
	check_error()
	//
	mut v_monitors := []Monitor{len: count}
	for idx := 0; idx < count; idx++ {
		v_monitors[idx].data = c_monitors[idx]
	}
	return v_monitors
}

// Get primary monitor
pub fn get_primary_monitor() Monitor {
	c_monitor := C.glfwGetPrimaryMonitor()
	check_error()
	//
	v_monitor := Monitor{
		data: c_monitor
	}
	//
	return v_monitor
}

// Set monitor callback
pub fn set_monitor_callback(cb FnMonitor) FnMonitor {
	prev := C.glfwSetMonitorCallback(cb)
	check_error()
	return prev
}

// Default window hints
pub fn default_window_hints() {
	C.glfwDefaultWindowHints()
	check_error()
}

// Set window hint
pub fn window_hint(hint, value int) {
	C.glfwWindowHint(hint, value)
	check_error()
}

// Set window hint
pub fn window_hint_string(hint int, value string) {
	C.glfwWindowHintString(hint, value.str)
	check_error()
}

// Poll events
pub fn poll_events() {
	C.glfwPollEvents()
	check_error()
}

// Wait events
pub fn wait_events() {
	C.glfwWaitEvents()
	check_error()
}

// Set time out for waiting events
pub fn set_wait_events_timeout(timeout f64) {
	C.glfwWaitEventsTimeout(timeout)
	check_error()
}

// Post empty event
pub fn post_empty_event() {
	C.glfwPostEmptyEvent()
	check_error()
}

// Is raw mouse motion supported
pub fn is_raw_mouse_motion_supported() int {
	v := C.glfwRawMouseMotionSupported()
	check_error()
	return v
}

// Get key name
pub fn get_key_name(key, scan_code int) string {
	n := C.glfwGetKeyName(key, scan_code)
	check_error()
	return tos3(n)
}

// Get key scan code
pub fn get_key_scan_code(key int) int {
	c := C.glfwGetKeyScancode(key)
	check_error()
	return c
}

// Get time
pub fn get_time() f64 {
	t := C.glfwGetTime()
	check_error()
	return t
}

// Set time
pub fn set_time(time f64) {
	C.glfwSetTime(time)
	check_error()
}

// Get timer value
pub fn get_timer_value() u64 {
	v := C.glfwGetTimerValue()
	check_error()
	return v
}

// Get timer frequency
pub fn get_timer_frequency() u64 {
	f := C.glfwGetTimerFrequency()
	check_error()
	return f
}

// Get current context
pub fn get_current_context() &Window {
	raw_data := C.glfwGetCurrentContext()
	check_error()
	return create_window(raw_data)
}

// Swap interval
pub fn swap_interval(interval int) {
	C.glfwSwapInterval(interval)
	check_error()
}

// Is extension supported
pub fn is_extension_supported(extension string) int {
	b := C.glfwExtensionSupported(extension.str)
	check_error()
	return b
}

// Get proc adress
pub fn get_proc_address(proc_name string) FnGLProc {
	adr := C.glfwGetProcAddress(proc_name.str)
	check_error()
	return adr
}

// Is Vulkan supported
pub fn is_vulkan_supported() int {
	b := C.glfwVulkanSupported()
	check_error()
	return b
}

// Get required instance extensions
pub fn get_required_instance_extensions() []string {
	count := u32(0)
	data := C.glfwGetRequiredInstanceExtensions(&count)
	check_error()
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
	prev := C.glfwSetJoystickCallback(cb)
	check_error()
	return prev
}

// Update gamepad mappings
pub fn update_gamepad_mapping(mappings string) int {
	b := C.glfwUpdateGamepadMappings(mappings.str)
	check_error()
	return b
}
