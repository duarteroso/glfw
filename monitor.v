module vglfw

// Forward declaration of GLFWmonitor methods
fn C.glfwGetMonitorPos(monitor &C.GLFWmonitor, x_pos, y_pos &int)

fn C.glfwGetMonitorWorkarea(monitor &C.GLFWmonitor, x_pos, y_pos, width, height &int)

fn C.glfwGetMonitorPhysicalSize(monitor &C.GLFWmonitor, widthMM, heightMM &int)

fn C.glfwGetMonitorContentScale(monitor &C.GLFWmonitor, x_scale, y_scale &f32)

fn C.glfwGetMonitorName(monitor &C.GLFWmonitor) charptr

fn C.glfwSetMonitorUserPointer(monitor &C.GLFWmonitor, pointer voidptr)

fn C.glfwGetMonitorUserPointer(monitor &C.GLFWmonitor) voidptr

fn C.glfwGetVideoModes(monitor &C.GLFWmonitor, count &int) &C.GLFWvidmode

fn C.glfwGetVideoMode(monitor &C.GLFWmonitor) &C.GLFWvidmode

fn C.glfwSetGamma(monitor &C.GLFWmonitor, gamma f32)

fn C.glfwGetGammaRamp(monitor &C.GLFWmonitor) &C.GLFWgammaramp

fn C.glfwSetGammaRamp(monitor &C.GLFWmonitor, ramp &C.GLFWgammaramp)

// Wrapper around GLFWmonitor
pub struct Monitor {
mut:
	data &C.GLFWmonitor = &C.GLFWmonitor(0)
}

// Create monitor from raw pointer
pub fn create_monitor(data voidptr) &Monitor {
	return &Monitor{
		data: &C.GLFWmonitor(data)
	}
}

// Set monitor data
pub fn (mut m Monitor) set_data(data voidptr) {
	m.data = &C.GLFWmonitor(data)
}

// Get monitor position
pub fn (m &Monitor) get_pos() Position {
	pos := Position{}
	C.glfwGetMonitorPos(m.data, &pos.x, &pos.y)
	return pos
}

// Get monitor workarea
pub fn (m &Monitor) get_workarea() (Position, Size) {
	pos := Position{}
	size := Size{}
	C.glfwGetMonitorWorkarea(m.data, &pos.x, &pos.y, &size.width, &size.height)
	return pos, size
}

// Get monitor physical size
pub fn (m &Monitor) get_physical_size() Size {
	size := Size{}
	C.glfwGetMonitorPhysicalSize(m.data, &size.width, &size.height)
	return size
}

// Get monitor content scale
pub fn (m &Monitor) get_content_scale() Scale {
	scale := Scale{}
	C.glfwGetMonitorContentScale(m.data, &scale.x, &scale.y)
	return scale
}

// Get monitor name
pub fn (m &Monitor) get_name() string {
	return tos3(C.glfwGetMonitorName(m.data))
}

// Set monitor user pointer
pub fn (m &Monitor) set_user_pointer(pointer voidptr) {
	C.glfwSetMonitorUserPointer(m.data, pointer)
}

// Get monitor user pointer
pub fn (m &Monitor) get_user_pointer() voidptr {
	return C.glfwGetMonitorUserPointer(m.data)
}

// Get video modes
pub fn (m &Monitor) get_video_modes() []VideoMode {
	count := 0
	c_modes := C.glfwGetVideoModes(m.data, &count)
	mut v_modes := []VideoMode{len: count}
	for idx := 0; idx < count; idx++ {
		v_modes[idx] = create_vidmode(&c_modes[idx])
	}
	return v_modes
}

// Get current video mode
pub fn (m &Monitor) get_current_video_mode() VideoMode {
	vidmode := C.glfwGetVideoMode(m.data)
	return create_vidmode(vidmode)
}

// Set monito gamma
pub fn (m &Monitor) set_gamma(gamma f32) {
	C.glfwSetGamma(m.data, gamma)
}

// Get gamma ramp
pub fn (m &Monitor) get_gamma_ramp() &GammaRamp {
	raw_data := C.glfwGetGammaRamp(m.data)
	if raw_data == &C.GLFWgammaramp(0) {
		return &GammaRamp{
			size: 0
		}
	}
	//
	gr := create_gammaramp(raw_data)
	println('monitor ${gr.size}')
	return gr
}

// Set gamma ramp
pub fn (m &Monitor) set_gamma_ramp(gr GammaRamp) {
	C.glfwSetGammaRamp(m.data, gr.get_raw())
}
