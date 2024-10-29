module wrapper

// TODO
/*
// Forward declaration
@[typedef] struct C.VkInstance { }
@[typedef] struct C.VkPhysicalDevice { }
@[typedef] struct C.VkAllocationCallbacks { }
@[typedef] struct C.VkSurfaceKHR { }

type CVkInstance = C.VkInstance
type CVkPhysicalDevice = C.VkPhysicalDevice
type CVkAllocationCallbacks = C.VkAllocationCallbacks
type CVkSurfaceKHR = C.VkSurfaceKHR

fn C.glfwGetInstanceProcAddress(instance C.VkInstance, const_procname &char) FnVkProc
fn C.glfwGetPhysicalDevicePresentationSupport(instance C.VkInstance, device C.VkPhysicalDevice, queuefamily u32) int
fn C.glfwCreateWindowSurface(instance C.VkInstance, window &C.GLFWwindow, allocator &C.VkAllocationCallbacks, surface &VkSurfaceKHR) C.VkResult

// Vulkan Wrapper for VkInstance
pub struct Vulkan{
mut:
	data &C.VkInstance = &C.VkInstance(0)
}

// get_instance_proc_address Get Vulkan instance proc address
pub fn (v &Vulkan) get_instance_proc_address(proc_name string)! FnVkProc {
	adr := C.glfwGetInstanceProcAddress(v.data, proc_name.str)
	check_error()!
	return adr
}

// get_physical_device_presentation_support Get physical device presentation support
pub fn (v &Vulkan) get_physical_device_presentation_support(device C.VkPhysicalDevice, queue_family u32)! int {
	b := C.glfwGetPhysicalDevicePresentationSupport(*v.data, device, queue_family)
	check_error()!
	return b
}

// create_window_surface Create Vulkan wndow surface
pub fn (v &Vulkan) create_window_surface(window &Window, allocator &C.VkAllocationCallbacks, surface &C.VkSurfaceKHR)! C.VkResult {
	r := C.glfwCreateWindowSurface(*v.data, window.data, allocator, surface)
	check_error()!
	return r
}
*/
