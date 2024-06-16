module glfw

// Forward declaration
@[typedef]
struct C.GLFWcursor {
}

fn C.glfwCreateCursor(image &C.GLFWimage, x_hot int, y_hot int) &C.GLFWcursor
fn C.glfwCreateStandardCursor(shape int) &C.GLFWcursor
fn C.glfwDestroyCursor(cursor &C.GLFWcursor)
