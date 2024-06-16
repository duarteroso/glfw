module glfw

// Forward declaration
@[typedef]
struct C.GLFWwindow {
}

fn C.glfwCreateWindow(width int, height int, const_title &char, monitor &C.GLFWmonitor, share &C.GLFWwindow) &C.GLFWwindow
fn C.glfwDestroyWindow(window &C.GLFWwindow)
fn C.glfwWindowShouldClose(window &C.GLFWwindow) int
fn C.glfwSetWindowShouldClose(window &C.GLFWwindow, value int)
fn C.glfwSetWindowTitle(window &C.GLFWwindow,const_title &char)
fn C.glfwSetWindowIcon(window &C.GLFWwindow, count int, images voidptr)
fn C.glfwGetWindowPos(window &C.GLFWwindow, x_pos &int, y_pos &int)
fn C.glfwSetWindowPos(window &C.GLFWwindow, x_pos int, y_pos int)
fn C.glfwGetWindowSize(window &C.GLFWwindow, width &int, height &int)
fn C.glfwSetWindowSize(window &C.GLFWwindow, width int, height int)
fn C.glfwSetWindowSizeLimits(window &C.GLFWwindow, minwidth int, minheight int, maxwidth int, maxheight int)
fn C.glfwSetWindowAspectRatio(window &C.GLFWwindow, numer int, denom int)
fn C.glfwGetFramebufferSize(window &C.GLFWwindow, width &int, height &int)
fn C.glfwGetWindowFrameSize(window &C.GLFWwindow, left &int, top &int, right &int, bottom &int)
fn C.glfwGetWindowContentScale(window &C.GLFWwindow, x_scale &f32, y_scale &f32)
fn C.glfwGetWindowOpacity(window &C.GLFWwindow) f32
fn C.glfwSetWindowOpacity(window &C.GLFWwindow, opacity f32)
fn C.glfwIconifyWindow(window &C.GLFWwindow)
fn C.glfwRestoreWindow(window &C.GLFWwindow)
fn C.glfwMaximizeWindow(window &C.GLFWwindow)
fn C.glfwShowWindow(window &C.GLFWwindow)
fn C.glfwHideWindow(window &C.GLFWwindow)
fn C.glfwFocusWindow(window &C.GLFWwindow)
fn C.glfwRequestWindowAttention(window &C.GLFWwindow)
fn C.glfwGetWindowMonitor(window &C.GLFWwindow) &C.GLFWmonitor
fn C.glfwSetWindowMonitor(window &C.GLFWwindow, monitor &C.GLFWmonitor, x_pos int, y_pos int, width int, height int, refreshRate int)
fn C.glfwGetWindowAttrib(window &C.GLFWwindow, attrib int) int
fn C.glfwSetWindowAttrib(window &C.GLFWwindow, attrib int, value int)
fn C.glfwSetWindowUserPointer(window &C.GLFWwindow, pointer voidptr)
fn C.glfwGetWindowUserPointer(window &C.GLFWwindow) voidptr
fn C.glfwSetWindowPosCallback(window &C.GLFWwindow, callback FnWindowPos) FnWindowPos
fn C.glfwSetWindowSizeCallback(window &C.GLFWwindow, callback FnWindowSize) FnWindowSize
fn C.glfwSetWindowCloseCallback(window &C.GLFWwindow, callback FnWindowClose) FnWindowClose
fn C.glfwSetWindowRefreshCallback(window &C.GLFWwindow, callback FnWindowRefresh) FnWindowRefresh
fn C.glfwSetWindowFocusCallback(window &C.GLFWwindow, callback FnWindowFocus) FnWindowFocus
fn C.glfwSetWindowIconifyCallback(window &C.GLFWwindow, callback FnWindowIconify) FnWindowIconify
fn C.glfwSetWindowMaximizeCallback(window &C.GLFWwindow, callback FnWindowMaximize) FnWindowMaximize
fn C.glfwSetFramebufferSizeCallback(window &C.GLFWwindow, callback FnFramebufferSize) FnFramebufferSize
fn C.glfwSetWindowContentScaleCallback(window &C.GLFWwindow, callback FnWindowContentScale) FnWindowContentScale
fn C.glfwGetInputMode(window &C.GLFWwindow, mode int) int
fn C.glfwSetInputMode(window &C.GLFWwindow, mode int, value int)
fn C.glfwGetKey(window &C.GLFWwindow, key int) int
fn C.glfwGetMouseButton(window &C.GLFWwindow, button int) int
fn C.glfwGetCursorPos(window &C.GLFWwindow, x_pos &f64, y_pos &f64)
fn C.glfwSetCursorPos(window &C.GLFWwindow, x_pos f64, y_pos f64)
fn C.glfwSetCursor(window &C.GLFWwindow, cursor &C.GLFWcursor)
fn C.glfwSetKeyCallback(window &C.GLFWwindow, callback FnKey) FnKey
fn C.glfwSetCharCallback(window &C.GLFWwindow, callback FnChar) FnChar
fn C.glfwSetCharModsCallback(window &C.GLFWwindow, callback FnCharMods) FnCharMods
fn C.glfwSetMouseButtonCallback(window &C.GLFWwindow, callback FnMouseButton) FnMouseButton
fn C.glfwSetCursorPosCallback(window &C.GLFWwindow, callback FnCursorPos) FnCursorPos
fn C.glfwSetCursorEnterCallback(window &C.GLFWwindow, callback FnCursorEnter) FnCursorEnter
fn C.glfwSetScrollCallback(window &C.GLFWwindow, callback FnScroll) FnScroll
fn C.glfwSetDropCallback(window &C.GLFWwindow, callback FnDrop) FnDrop
fn C.glfwSetClipboardString(window &C.GLFWwindow, const_clipboard &char)
fn C.glfwGetClipboardString(window &C.GLFWwindow) &char
fn C.glfwSwapBuffers(window &C.GLFWwindow)
fn C.glfwMakeContextCurrent(window &C.GLFWwindow)
fn C.glfwGetCurrentContext() &C.GLFWwindow
