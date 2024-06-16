module glfw

// Forward declaration
@[typedef]
struct C.GLFWgamepadstate {
}

fn C.glfwJoystickPresent(jid int) int
fn C.glfwJoystickIsGamepad(jid int) int
fn C.glfwGetJoystickAxes(jid int, count &int) voidptr
fn C.glfwGetJoystickButtons(jid int, count &int) &u8
fn C.glfwGetJoystickHats(jid int, count &int) &u8
fn C.glfwGetJoystickName(jid int) &char
fn C.glfwGetJoystickGUID(jid int) &char
fn C.glfwSetJoystickUserPointer(jid int, pointer voidptr)
fn C.glfwGetJoystickUserPointer(jid int) voidptr
fn C.glfwGetGamepadName(jid int) &char
fn C.glfwGetGamepadState(jid int, state &C.GLFWgamepadstate) int
fn C.glfwGetGamepadStateHelper(jid int, buttons &u8, axes voidptr) int
