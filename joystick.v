module vglfw

// C headers
#include <GLFW/glfw3.h>
#include "gamepadstate.h"

// Forward declaration
[typedef] struct C.GLFWgamepadstate { }

fn C.glfwJoystickPresent(jid int) int

fn C.glfwJoystickIsGamepad(jid int) int

fn C.glfwGetJoystickAxes(jid int, count &int) voidptr

fn C.glfwGetJoystickButtons(jid int, count &int) byteptr

fn C.glfwGetJoystickHats(jid int, count &int) byteptr

fn C.glfwGetJoystickName(jid int) charptr

fn C.glfwGetJoystickGUID(jid int) charptr

fn C.glfwSetJoystickUserPointer(jid int, pointer voidptr)

fn C.glfwGetJoystickUserPointer(jid int) voidptr

fn C.glfwGetGamepadName(jid int) charptr

fn C.glfwGetGamepadState(jid int, state &C.GLFWgamepadstate) int

fn C.vglfwGetGamepadState(jid int, buttons byteptr, axes voidptr) int

// Wrapper for the joystick ID
pub struct Joystick {
pub:
	id int
}

// create_joystick Create instance of Joystick
pub fn create_joystick(id int) Joystick {
	return Joystick{
		id: id
	}
}

// is_present Is joystick present
pub fn (j &Joystick) is_present() int {
	f := C.glfwJoystickPresent(j.id)
	check_error()
	return f
}

// is_gamepad Is joystick a gamepad
pub fn (j &Joystick) is_gamepad() int {
	b := C.glfwJoystickIsGamepad(j.id)
	check_error()
	return b
}

// get_axes Get joystick axes
pub fn (j &Joystick) get_axes() []f64 {
	count := 0
	data := C.glfwGetJoystickAxes(j.id, &count)
	check_error()
	//
	axes := []f64{len: count}
	unsafe { C.memcpy(axes.data, data, count) }
	return axes
}

// get_buttons Get joystick buttons
pub fn (j &Joystick) get_buttons() []byte {
	count := 0
	data := C.glfwGetJoystickButtons(j.id, &count)
	check_error()
	//
	btns := []byte{len: count}
	unsafe { C.memcpy(btns.data, voidptr(data), count) }
	return btns
}

// get_hats Get joystick hats
pub fn (j &Joystick) get_hats() []byte {
	count := 0
	data := C.glfwGetJoystickHats(j.id, &count)
	check_error()
	//
	hats := []byte{len: count}
	unsafe { C.memcpy(hats.data, voidptr(data), count) }
	return hats
}

// get_name Get joystick name
pub fn (j &Joystick) get_name() string {
	n := C.glfwGetJoystickName(j.id)
	check_error()
	return tos3(n)
}

// get_uuid Get joystic GUID
pub fn (j &Joystick) get_uuid() string {
	guid := C.glfwGetJoystickGUID(j.id)
	check_error()
	return tos3(guid)
}

// set_user_pointer Set joystick user pointer
pub fn (j &Joystick) set_user_pointer(pointer voidptr) {
	C.glfwSetJoystickUserPointer(j.id, pointer)
	check_error()
}

// get_user_pointer Get joystick user pointer
pub fn (j &Joystick) get_user_pointer() voidptr {
	ptr := C.glfwGetJoystickUserPointer(j.id)
	check_error()
	return ptr
}

// get_gamepad_name Get gamepad name
pub fn (j &Joystick) get_gamepad_name() string {
	n := C.glfwGetGamepadName(j.id)
	check_error()
	return tos3(n)
}

// get_gamepad_state Get gamepad state
pub fn (j &Joystick) get_gamepad_state(buttons [15]byte, axes [6]f64) bool {
	ok := C.vglfwGetGamepadState(j.id, &buttons, &axes)
	check_error()
	return ok == glfw_true
}
