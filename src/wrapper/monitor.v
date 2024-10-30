module wrapper

// Monitor wraps the functionality of GLFWmonitor
pub struct Monitor {
mut:
	data &glfw.GLFWmonitor = &glfw.GLFWmonitor(unsafe { 0 })
}

// MonitorDesc describes the basic properties of a Monitor
pub struct MonitorDesc {
pub mut:
	pos          Position
	size         Size
	refresh_rate int
}

// create_monitor creates a Monitor instance from raw data
pub fn create_monitor(data &glfw.GLFWmonitor) &Monitor {
	unsafe {
		return &Monitor{
			data: data
		}
	}
}

// set_data links data to a monitor
pub fn (mut m Monitor) set_data(data &glfw.GLFWmonitor) {
	unsafe {
		m.data = data
	}
}

// get_pos returns the position of the monitor
pub fn (m &Monitor) get_pos() !Position {
	pos := Position{}
	C.glfwGetMonitorPos(m.data, &pos.x, &pos.y)
	check_error()!
	return pos
}

// get_workarea returns the workarea of the monitor
pub fn (m &Monitor) get_workarea() !(Position, Size) {
	pos := Position{}
	size := Size{}
	C.glfwGetMonitorWorkarea(m.data, &pos.x, &pos.y, &size.width, &size.height)
	check_error()!
	return pos, size
}

// get_physical_size returns the physical size of the monitor
pub fn (m &Monitor) get_physical_size() !Size {
	size := Size{}
	C.glfwGetMonitorPhysicalSize(m.data, &size.width, &size.height)
	check_error()!
	return size
}

// get_content_scale returns the content scale of the monitor
pub fn (m &Monitor) get_content_scale() !Scale {
	scale := Scale{}
	C.glfwGetMonitorContentScale(m.data, &scale.x, &scale.y)
	check_error()!
	return scale
}

// get_name returns the name of the monitor
pub fn (m &Monitor) get_name() !string {
	name := C.glfwGetMonitorName(m.data)
	check_error()!
	return unsafe { name.vstring() }
}

// set_user_pointer links user data to the monitor
pub fn (m &Monitor) set_user_pointer(pointer voidptr) ! {
	C.glfwSetMonitorUserPointer(m.data, pointer)
	check_error()!
}

// get_user_pointer returns the linked user data of the monitor
pub fn (m &Monitor) get_user_pointer() !voidptr {
	ptr := C.glfwGetMonitorUserPointer(m.data)
	check_error()!
	return ptr
}

// get_video_modes returns an array of video modes supported by the monitor
pub fn (m &Monitor) get_video_modes() ![]VideoMode {
	count := 0
	c_modes := C.glfwGetVideoModes(m.data, &count)
	check_error()!
	//
	mut v_modes := []VideoMode{len: count}
	for idx := 0; idx < count; idx++ {
		unsafe {
			v_modes[idx] = create_vidmode(&c_modes[idx])
		}
	}
	//
	return v_modes
}

// get_current_video_mode returns the current video mode of the monitor
pub fn (m &Monitor) get_current_video_mode() !VideoMode {
	vidmode := C.glfwGetVideoMode(m.data)
	check_error()!
	return create_vidmode(vidmode)
}

// set_gamma sets the monitor gamma value
pub fn (m &Monitor) set_gamma(gamma f32) ! {
	C.glfwSetGamma(m.data, gamma)
	check_error()!
}

// get_gamma_ramp returns the GamaRamp instance of the monitor
// Returns nil if GammaRamp is missing
pub fn (m &Monitor) get_gamma_ramp() !&GammaRamp {
	raw := C.glfwGetGammaRamp(m.data)
	check_error()!
	//
	if isnil(raw) {
		return &GammaRamp(unsafe { 0 })
	}
	//
	gr := create_gammaramp(raw.size, raw.red(), raw.green(), raw.blue())
	return gr
}

// set_gamma_ramp sets the gamma ramp of the monitor
pub fn (m &Monitor) set_gamma_ramp(gr GammaRamp) ! {
	C.glfwSetGammaRamp(m.data, gr.raw())
	check_error()!
}
