module glfw

// Forward declaration
@[typedef]
struct C.GLFWvidmode {
}

fn C.glfwGetVidModeSizeHelper(vidmode &C.GLFWvidmode, width &int, height &int)
fn C.glfwGetVidModeRGBBitsHelper(vidmode &C.GLFWvidmode, r &int, g &int, b &int)
fn C.glfwGetVidModeRefreshRateHelper(vidmode &C.GLFWvidmode, rate &int)
