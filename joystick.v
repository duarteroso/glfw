module vglfw

// Forward declaration
fn C.glfwJoystickPresent(jid int) int

fn C.glfwJoystickIsGamepad(jid int) int

fn C.glfwGetJoystickAxes(jid int, count &int) voidptr

fn C.glfwGetJoystickButtons(jid int, count &int) byteptr

fn C.glfwGetJoystickHats(jid int, count &int) byteptr

fn C.glfwGetJoystickName(jid int) charptr

fn C.glfwGetJoystickGUID(jid int) charptr

fn C.glfwSetJoystickUserPointer(jid int, pointer voidptr)

fn C.glfwGetJoystickUserPointer(jid int) voidptr

// Wrapper for the joystick ID
pub struct Joystick {
pub:
	id int
}

// Create instance
pub fn create_joystick(id int) Joystick {
	return Joystick{
		id: id
	}
}

// Is joystick present
pub fn (j &Joystick) is_present() int {
	return C.glfwJoystickPresent(j.id)
}

// Is joystick a gamepad
pub fn (j &Joystick) is_gamepad() int {
	return C.glfwJoystickIsGamepad(j.id)
}

// Get joystick axes
pub fn (j &Joystick) get_axes() []f64 {
	count := 0
	data := C.glfwGetJoystickAxes(j.id, &count)
	axes := []f64{len: count}
	C.memcpy(axes.data, data, count)
	return axes
}

// Get joystick buttons
pub fn (j &Joystick) get_buttons() []byte {
	count := 0
	data := C.glfwGetJoystickButtons(j.id, &count)
	btns := []byte{len: count}
	C.memcpy(btns.data, voidptr(data), count)
	return btns
}

// Get joystick hats
pub fn (j &Joystick) get_hats() []byte {
	count := 0
	data := C.glfwGetJoystickHats(j.id, &count)
	hats := []byte{len: count}
	C.memcpy(hats.data, voidptr(data), count)
	return hats
}

// Get joystick name
pub fn (j &Joystick) get_name() string {
	return tos3(C.glfwGetJoystickName(j.id))
}

// Get joystic GUID
pub fn (j &Joystick) get_uuid() string {
	return tos3(C.glfwGetJoystickGUID(j.id))
}

// Set joystick user pointer
pub fn (j &Joystick) set_user_pointer(pointer voidptr) {
	C.glfwSetJoystickUserPointer(j.id, pointer)
}

// Get joystick user pointer
pub fn (j &Joystick) get_user_pointer() voidptr {
	return C.glfwGetJoystickUserPointer(j.id)
}
