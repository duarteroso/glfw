module glfw

fn C.glfwInit() int
fn C.glfwTerminate()
fn C.glfwInitHint(hint int, value int)
fn C.glfwGetVersion(major &int, minor &int, rev &int)
fn C.glfwGetVersionString() &char
fn C.glfwGetError(description &&char) int
fn C.glfwSetErrorCallback(callback FnError) FnError
fn C.glfwGetMonitors(count &int) &voidptr
fn C.glfwGetPrimaryMonitor() &C.GLFWmonitor
fn C.glfwSetMonitorCallback(callback FnMonitor) FnMonitor
fn C.glfwDefaultWindowHints()
fn C.glfwWindowHint(hint int, value int)
fn C.glfwWindowHintString(hint int, value &char)
fn C.glfwPollEvents()
fn C.glfwWaitEvents()
fn C.glfwWaitEventsTimeout(timeout f64)
fn C.glfwPostEmptyEvent()
fn C.glfwRawMouseMotionSupported() int
fn C.glfwGetKeyName(key int, scan_code int) &char
fn C.glfwGetKeyScancode(key int) int
fn C.glfwGetTime() f64
fn C.glfwSetTime(time f64)
fn C.glfwGetTimerValue() u64
fn C.glfwGetTimerFrequency() u64
fn C.glfwSwapInterval(interval int)
fn C.glfwExtensionSupported(extension &char) int
fn C.glfwGetProcAddress(procname &char) FnGLProc
fn C.glfwVulkanSupported() int
fn C.glfwGetRequiredInstanceExtensions(count &u32) &&char
fn C.glfwSetJoystickCallback(callback FnJoystick) FnJoystick
fn C.glfwUpdateGamepadMappings(mappings &char) int
