module vglfw

import duarteroso.vsemver

// C headers
#include <GLFW/glfw3.h>

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

// initialize Initialize GLFW
fn initialize() bool {
	ok := C.glfwInit()
	check_error()
	return ok == glfw_true
}

// terminate Terminate GLFW
fn terminate() {
	C.glfwTerminate()
	check_error()
}

// init_hint Initialize hint
pub fn init_hint(hint, value int) {
	C.glfwInitHint(hint, value)
	check_error()
}

// get_version Get GLFW version
pub fn get_version(major, minor, rev &int) {
	C.glfwGetVersion(major, minor, rev)
}

// get_semantic_version Get GLFW semantic version
pub fn get_semantic_version() vsemver.SemVer {
	v := vsemver.SemVer{}
	get_version(v.major, v.minor, v.patch)
	return v
}

// get_version_string Get GLFW version string
pub fn get_version_string() string {
	return tos3(C.glfwGetVersionString())
}

// get_error Get GLFW error
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

// check_error Check and panics when errors
pub fn check_error() {
	err := get_error()
	if err.code != glfw_no_error {
		panic(err.str())
	}
} 

// set_error_callback Set error callback
pub fn set_error_callback(cb FnError) FnError {
	return C.glfwSetErrorCallback(cb)
}

// get_monitors Get monitors
pub fn get_monitors() []&Monitor {
	count := 0
	c_monitors := C.glfwGetMonitors(&count)
	check_error()
	//
	mut v_monitors := []&Monitor{len: count}
	for idx := 0; idx < count; idx++ {
		unsafe { v_monitors[idx].data = c_monitors[idx] }
	}
	return v_monitors
}

// get_primary_monitor Get primary monitor
pub fn get_primary_monitor() &Monitor {
	raw_data := C.glfwGetPrimaryMonitor()
	check_error()
	//
	v_monitor := &Monitor{
		data: raw_data
	}
	//
	return v_monitor
}

// set_monitor_callback Set monitor callback
pub fn set_monitor_callback(cb FnMonitor) FnMonitor {
	prev := C.glfwSetMonitorCallback(cb)
	check_error()
	return prev
}

// default_window_hints Default window hints
pub fn default_window_hints() {
	C.glfwDefaultWindowHints()
	check_error()
}

// window_hint Set window hint
pub fn window_hint(hint, value int) {
	C.glfwWindowHint(hint, value)
	check_error()
}

// window_hint_string Set window hint
pub fn window_hint_string(hint int, value string) {
	C.glfwWindowHintString(hint, value.str)
	check_error()
}

// poll_events Poll events
pub fn poll_events() {
	C.glfwPollEvents()
	check_error()
}

// wait_events Wait events
pub fn wait_events() {
	C.glfwWaitEvents()
	check_error()
}

// set_wait_events_timeout Set time out for waiting events
pub fn set_wait_events_timeout(timeout f64) {
	C.glfwWaitEventsTimeout(timeout)
	check_error()
}

// post_empty_event Post empty event
pub fn post_empty_event() {
	C.glfwPostEmptyEvent()
	check_error()
}

// is_raw_mouse_motion_supported Is raw mouse motion supported
pub fn is_raw_mouse_motion_supported() bool {
	ok := C.glfwRawMouseMotionSupported()
	check_error()
	return ok == glfw_true
}

// get_key_name Get key name
pub fn get_key_name(key, scan_code int) string {
	n := C.glfwGetKeyName(key, scan_code)
	check_error()
	return tos3(n)
}

// get_key_scan_code Get key scan code
pub fn get_key_scan_code(key int) int {
	c := C.glfwGetKeyScancode(key)
	check_error()
	return c
}

// get_time Get time
pub fn get_time() f64 {
	t := C.glfwGetTime()
	check_error()
	return t
}

// set_time Set time
pub fn set_time(time f64) {
	C.glfwSetTime(time)
	check_error()
}

// get_timer_value Get timer value
pub fn get_timer_value() u64 {
	v := C.glfwGetTimerValue()
	check_error()
	return v
}

// get_timer_frequency Get timer frequency
pub fn get_timer_frequency() u64 {
	f := C.glfwGetTimerFrequency()
	check_error()
	return f
}

// get_current_context Get current context
pub fn get_current_context() &Window {
	raw_data := C.glfwGetCurrentContext()
	check_error()
	return create_window(raw_data)
}

// swap_interval Swap interval
pub fn swap_interval(interval int) {
	C.glfwSwapInterval(interval)
	check_error()
}

// is_extension_supported Is extension supported
pub fn is_extension_supported(extension string) bool {
	ok := C.glfwExtensionSupported(extension.str)
	check_error()
	return ok == glfw_true
}

// get_proc_address Get proc adress
pub fn get_proc_address(proc_name string) FnGLProc {
	adr := C.glfwGetProcAddress(proc_name.str)
	check_error()
	return adr
}

// is_vulkan_supported Is Vulkan supported
pub fn is_vulkan_supported() bool {
	ok := C.glfwVulkanSupported()
	check_error()
	return ok == glfw_true
}

// get_required_instance_extensions Get required instance extensions
pub fn get_required_instance_extensions() []string {
	count := u32(0)
	data := C.glfwGetRequiredInstanceExtensions(&count)
	check_error()
	//
	mut exts := []string{len: int(count)}
	for i := 0; i < count; i++ {
		unsafe { exts[i] = tos3(data[i]) }
	}
	//
	return exts
}

// set_callback Set joystick callback
pub fn (j &Joystick) set_callback(cb FnJoystick) FnJoystick {
	prev := C.glfwSetJoystickCallback(cb)
	check_error()
	return prev
}

// update_gamepad_mapping Update gamepad mappings
pub fn update_gamepad_mapping(mappings string) bool {
	ok := C.glfwUpdateGamepadMappings(mappings.str)
	check_error()
	return ok == glfw_true
}
