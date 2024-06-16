module glfw

// Forward declaration
@[typedef]
struct C.GLFWgammaramp {
}

fn C.glfwGetGammaRampSizeHelper(gr &C.GLFWgammaramp, size &u32)
fn C.glfwGetGammaRampRGBBitsHelper(gr &C.GLFWgammaramp, r &u16, g &u16, b &u16)
fn C.glfwGetGammaRampRGBBitHelper(gr &C.GLFWgammaramp, r &u16, g &u16, b &u16)
fn C.glfwCreateGammaRampHelper(gr &C.GLFWgammaramp, size u32, r &u16, g &u16, b &u16) &C.GLFWgammaramp
