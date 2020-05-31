module vglfw

/*
TODO

// Forward declaration
fn C.glfwGetInstanceProcAddress(instance C.VkInstance, procname charptr) FnVkProc
fn C.glfwGetPhysicalDevicePresentationSupport(instance C.VkInstance, device C.VkPhysicalDevice, queuefamily u32) int
fn C.glfwCreateWindowSurface(instance C.VkInstance, window &C.GLFWwindow, allocator &C.VkAllocationCallbacks, surface &VkSurfaceKHR) C.VkResult

// Wrapper for VkInstance
pub struct Vulkan{
mut:
	data &C.VkInstance = &C.VkInstance(0)
}

// Get Vulkan instance proc address
pub fn (v &Vulkan) get_instance_proc_address(proc_name string) FnVkProc {
	return C.glfwGetInstanceProcAddress(v.data, proc_name.str)
}

// Get physical device presentation support
pub fn (v &Vulkan) get_physical_device_presentation_support(device C.VkPhysicalDevice, queue_family u32) int {
	return C.glfwGetPhysicalDevicePresentationSupport(*v.data, device, queue_family)
}

// Create Vulkan wndow surface
pub fn (v &Vulkan) create_window_surface(window &Window, allocator &C.VkAllocationCallbacks, surface &C.VkSurfaceKHR) C.VkResult {
	return C.glfwCreateWindowSurface(*v.data, window.data, allocator, surface)
}
*/
