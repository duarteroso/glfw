module glfw

// Forward declaration
@[typedef]
struct C.GLFWimage {
}

fn C.glfwCreateImageHelper(img &C.GLFWimage, width int, height int, pixels &u8) voidptr
