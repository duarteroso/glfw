module glfw

// Forward declaration
@[typedef]
struct C.GLFWimage {
	width  int
	height int
	pixels &u8
}
