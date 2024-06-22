module glfw

// Forward declaration
@[typedef]
struct C.GLFWgammaramp {
	red   &u16
	green &u16
	blue  &u16
	size  u32
}

fn C.glfwGetGammaRampRGBBitsHelper(gr &C.GLFWgammaramp, r &u16, g &u16, b &u16)
fn C.glfwGetGammaRampRGBBitHelper(gr &C.GLFWgammaramp, index int, r &u16, g &u16, b &u16)
