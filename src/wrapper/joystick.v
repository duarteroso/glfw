module wrapper

import glfw

// Joystick represents a joystick by ID
pub struct Joystick {
pub:
	id int
}

// create_joystick creates a Joystick instance
pub fn create_joystick(id int) Joystick {
	return Joystick{
		id: id
	}
}

// is_present returns true if the joystick present
pub fn (j &Joystick) is_present() !int {
	f := C.glfwJoystickPresent(j.id)
	check_error()!
	return f
}

// is_gamepad returns true if the joystick is a gamepad
pub fn (j &Joystick) is_gamepad() !int {
	b := C.glfwJoystickIsGamepad(j.id)
	check_error()!
	return b
}

// get_axes returns the joystick axes values
pub fn (j &Joystick) get_axes() ![]f64 {
	count := 0
	data := C.glfwGetJoystickAxes(j.id, &count)
	check_error()!
	//
	axes := []f64{len: count}
	unsafe { C.memcpy(axes.data, data, count) }
	return axes
}

// get_buttons returns the joystick buttons values
pub fn (j &Joystick) get_buttons() ![]u8 {
	count := 0
	data := C.glfwGetJoystickButtons(j.id, &count)
	check_error()!
	//
	btns := []u8{len: count}
	unsafe { C.memcpy(btns.data, voidptr(data), count) }
	return btns
}

// get_hats returns the joystick hat values
pub fn (j &Joystick) get_hats() ![]u8 {
	count := 0
	data := C.glfwGetJoystickHats(j.id, &count)
	check_error()!
	//
	hats := []u8{len: count}
	unsafe { C.memcpy(hats.data, voidptr(data), count) }
	return hats
}

// get_name returns the joystick name
pub fn (j &Joystick) get_name() !string {
	n := C.glfwGetJoystickName(j.id)
	check_error()!
	return unsafe { n.vstring() }
}

// get_uuid returns the joystick GUID
pub fn (j &Joystick) get_uuid() !string {
	guid := C.glfwGetJoystickGUID(j.id)
	check_error()!
	return unsafe { guid.vstring() }
}

// set_user_pointer links user data to the joystick
pub fn (j &Joystick) set_user_pointer(pointer voidptr) ! {
	C.glfwSetJoystickUserPointer(j.id, pointer)
	check_error()!
}

// get_user_pointer returns the linked data of the joystick
pub fn (j &Joystick) get_user_pointer() !voidptr {
	ptr := C.glfwGetJoystickUserPointer(j.id)
	check_error()!
	return ptr
}

// get_gamepad_name returns the gamepad name
pub fn (j &Joystick) get_gamepad_name() !string {
	n := C.glfwGetGamepadName(j.id)
	check_error()!
	return unsafe { cstring_to_vstring(n) }
}

// get_gamepad_state returns the gamepad state
pub fn (j &Joystick) get_gamepad_state(buttons [15]u8, axes [6]f32) !bool {
	mut state := glfw.GLFWgamepadstate{}
	ok := C.glfwGetGamepadState(j.id, &state)
	check_error()!
	//
	buttons = state.buttons.clone()
	axes = state.axes.clone()
	//
	return ok == glfw.glfw_true
}
