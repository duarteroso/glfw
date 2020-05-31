module vglfw

// Structures
// struct C.GLFWmonitor
// struct C.GLFWwindow
// struct C.GLFWcursor
// struct C.GLFWvidmode
// struct C.GLFWgammaramp
// struct C.GLFWimage
// struct C.GLFWgamepadstate
//
// Vulkan (TODO: v bidings of vulkan)
// struct C.VkInstance
// struct C.VkPhysicalDevice
// struct C.VkAllocationCallbacks
// struct C.VkSurfaceKHR
//
// Function pointers
type FnGLProc = fn ()

type FnVkProc = fn ()

type FnError = fn (code int, err charptr)

type FnWindowPos = fn (window voidptr, x_pos, y_pos int)

type FnWindowSize = fn (window voidptr, width, height int)

type FnWindowClose = fn (window voidptr)

type FnWindowRefresh = fn (window voidptr)

type FnWindowFocus = fn (window voidptr, focus int)

type FnWindowIconify = fn (window voidptr, iconified int)

type FnWindowMaximize = fn (window voidptr, maximized int)

type FnFramebufferSize = fn (window voidptr, width, height int)

type FnWindowContentScale = fn (window voidptr, x_scale, y_scale f32)

type FnMouseButton = fn (window voidptr, button, action, bit_field int)

type FnCursorPos = fn (window voidptr, x_pos, y_pos f64)

type FnCursorEnter = fn (window voidptr, entered int)

type FnScroll = fn (window voidptr, x_offset, y_offset f64)

type FnKey = fn (window voidptr, key_id, scan_code, action, bit_filed int)

type FnChar = fn (window voidptr, unicode u32)

type FnCharMods = fn (window voidptr, unicode u32, bit_field int)

type FnDrop = fn (window voidptr, path_count int, paths &charptr)

type FnMonitor = fn (monitor voidptr, event int)

type FnJoystick = fn (joystick_id, event int)
