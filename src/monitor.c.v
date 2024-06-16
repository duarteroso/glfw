module glfw

// Forward declaration
@[typedef]
struct C.GLFWmonitor {
}

fn C.glfwGetMonitorPos(monitor &C.GLFWmonitor, x_pos &int, y_pos &int)
fn C.glfwGetMonitorWorkarea(monitor &C.GLFWmonitor, x_pos &int, y_pos &int, width &int, height &int)
fn C.glfwGetMonitorPhysicalSize(monitor &C.GLFWmonitor, widthMM &int, heightMM &int)
fn C.glfwGetMonitorContentScale(monitor &C.GLFWmonitor, x_scale &f32, y_scale &f32)
fn C.glfwGetMonitorName(monitor &C.GLFWmonitor) &char
fn C.glfwSetMonitorUserPointer(monitor &C.GLFWmonitor, pointer voidptr)
fn C.glfwGetMonitorUserPointer(monitor &C.GLFWmonitor) voidptr
fn C.glfwGetVideoModes(monitor &C.GLFWmonitor, count &int) &C.GLFWvidmode
fn C.glfwGetVideoMode(monitor &C.GLFWmonitor) &C.GLFWvidmode
fn C.glfwSetGamma(monitor &C.GLFWmonitor, gamma f32)
fn C.glfwGetGammaRamp(monitor &C.GLFWmonitor) &C.GLFWgammaramp
fn C.glfwSetGammaRamp(monitor &C.GLFWmonitor, ramp &C.GLFWgammaramp)
