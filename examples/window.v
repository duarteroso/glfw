module main

import glfw

fn main() {
	// Initialize the library
	if C.glfwInit() == glfw.glfw_false {
		exit(-1)
	}

	// Create a windowed mode window and its OpenGL context
	window := C.glfwCreateWindow(640, 480, 'Hello World'.str, unsafe { nil }, unsafe { nil })
	if isnil(window) {
		C.glfwTerminate()
		exit(-1)
	}

	// Make the window's context current
	C.glfwMakeContextCurrent(window)

	// Loop until the user closes the window
	for C.glfwWindowShouldClose(window) == glfw.glfw_false {
		// Render here

		// Swap front and back buffers
		C.glfwSwapBuffers(window)

		// Poll for and process events
		C.glfwPollEvents()
	}

	C.glfwTerminate()
}
