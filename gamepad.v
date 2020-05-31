module vglfw

// Forward declaration
fn C.glfwGetGamepadName(jid int) charptr

fn C.glfwGetGamepadState(jid int, state &C.GLFWgamepadstate) int

fn C.vglfwGetGamepadState(jid int, buttons byteptr, axes voidptr) int

// Wrapper for a joystick that is a gamepad
pub struct Gamepad {
pub:
	id      int
	buttons [15]byte
	axes    [6]f32
}

// Create instance
pub fn create_gamepad(joystick Joystick) &Gamepad {
	assert (joystick.is_gamepad() == glfw_true)
	return &Gamepad{
		id: joystick.id
	}
}

// Get gamepad name
pub fn (g &Gamepad) get_name() string {
	return tos3(C.glfwGetGamepadName(g.id))
}

// Get gamepad state
pub fn (g &Gamepad) get_state() int {
	ok := C.vglfwGetGamepadState(g.id, &g.buttons, &g.axes)
	return ok
}
