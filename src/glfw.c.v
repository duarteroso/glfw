module glfw

// *************************************************************************
// * GLFW API tokens
// *************************************************************************

pub const glfw_version_major = 3
pub const glfw_version_minor = 4
pub const glfw_version_revision = 0

pub const glfw_true = 1
pub const glfw_false = 0

pub const glfw_release = 0
pub const glfw_press = 1 << 0
pub const glfw_repeat = 1 << 1

pub const glfw_hat_centered = 0
pub const glfw_hat_up = 1 << 0
pub const glfw_hat_right = 1 << 1
pub const glfw_hat_down = 1 << 2
pub const glfw_hat_left = 1 << 3
pub const glfw_hat_right_up = (glfw_hat_right | glfw_hat_up)
pub const glfw_hat_right_down = (glfw_hat_right | glfw_hat_down)
pub const glfw_hat_left_up = (glfw_hat_left | glfw_hat_up)
pub const glfw_hat_left_down = (glfw_hat_left | glfw_hat_down)

pub const glfw_key_unknown = -1

pub const glfw_key_space = 32
pub const glfw_key_apostrophe = 39
pub const glfw_key_comma = 44
pub const glfw_key_minus = 45
pub const glfw_key_period = 46
pub const glfw_key_slash = 47
pub const glfw_key_0 = 48
pub const glfw_key_1 = 49
pub const glfw_key_2 = 50
pub const glfw_key_3 = 51
pub const glfw_key_4 = 52
pub const glfw_key_5 = 53
pub const glfw_key_6 = 54
pub const glfw_key_7 = 55
pub const glfw_key_8 = 56
pub const glfw_key_9 = 57
pub const glfw_key_semicolon = 59
pub const glfw_key_equal = 61
pub const glfw_key_a = 65
pub const glfw_key_b = 66
pub const glfw_key_c = 67
pub const glfw_key_d = 68
pub const glfw_key_e = 69
pub const glfw_key_f = 70
pub const glfw_key_g = 71
pub const glfw_key_h = 72
pub const glfw_key_i = 73
pub const glfw_key_j = 74
pub const glfw_key_k = 75
pub const glfw_key_l = 76
pub const glfw_key_m = 77
pub const glfw_key_n = 78
pub const glfw_key_o = 79
pub const glfw_key_p = 80
pub const glfw_key_q = 81
pub const glfw_key_r = 82
pub const glfw_key_s = 83
pub const glfw_key_t = 84
pub const glfw_key_u = 85
pub const glfw_key_v = 86
pub const glfw_key_w = 87
pub const glfw_key_x = 88
pub const glfw_key_y = 89
pub const glfw_key_z = 90
pub const glfw_key_left_bracket = 91
pub const glfw_key_backslash = 92
pub const glfw_key_right_bracket = 93
pub const glfw_key_grave_accent = 96
pub const glfw_key_world_1 = 161
pub const glfw_key_world_2 = 162

pub const glfw_key_escape = 256
pub const glfw_key_enter = 257
pub const glfw_key_tab = 258
pub const glfw_key_backspace = 259
pub const glfw_key_insert = 260
pub const glfw_key_delete = 261
pub const glfw_key_right = 262
pub const glfw_key_left = 263
pub const glfw_key_down = 264
pub const glfw_key_up = 265
pub const glfw_key_page_up = 266
pub const glfw_key_page_down = 267
pub const glfw_key_home = 268
pub const glfw_key_end = 269
pub const glfw_key_caps_lock = 280
pub const glfw_key_scroll_lock = 281
pub const glfw_key_num_lock = 282
pub const glfw_key_print_screen = 283
pub const glfw_key_pause = 284
pub const glfw_key_f1 = 290
pub const glfw_key_f2 = 291
pub const glfw_key_f3 = 292
pub const glfw_key_f4 = 293
pub const glfw_key_f5 = 294
pub const glfw_key_f6 = 295
pub const glfw_key_f7 = 296
pub const glfw_key_f8 = 297
pub const glfw_key_f9 = 298
pub const glfw_key_f10 = 299
pub const glfw_key_f11 = 300
pub const glfw_key_f12 = 301
pub const glfw_key_f13 = 302
pub const glfw_key_f14 = 303
pub const glfw_key_f15 = 304
pub const glfw_key_f16 = 305
pub const glfw_key_f17 = 306
pub const glfw_key_f18 = 307
pub const glfw_key_f19 = 308
pub const glfw_key_f20 = 309
pub const glfw_key_f21 = 310
pub const glfw_key_f22 = 311
pub const glfw_key_f23 = 312
pub const glfw_key_f24 = 313
pub const glfw_key_f25 = 314
pub const glfw_key_kp_0 = 320
pub const glfw_key_kp_1 = 321
pub const glfw_key_kp_2 = 322
pub const glfw_key_kp_3 = 323
pub const glfw_key_kp_4 = 324
pub const glfw_key_kp_5 = 325
pub const glfw_key_kp_6 = 326
pub const glfw_key_kp_7 = 327
pub const glfw_key_kp_8 = 328
pub const glfw_key_kp_9 = 329
pub const glfw_key_kp_decimal = 330
pub const glfw_key_kp_divide = 331
pub const glfw_key_kp_multiply = 332
pub const glfw_key_kp_subtract = 333
pub const glfw_key_kp_add = 334
pub const glfw_key_kp_enter = 335
pub const glfw_key_kp_equal = 336
pub const glfw_key_left_shift = 340
pub const glfw_key_left_control = 341
pub const glfw_key_left_alt = 342
pub const glfw_key_left_super = 343
pub const glfw_key_right_shift = 344
pub const glfw_key_right_control = 345
pub const glfw_key_right_alt = 346
pub const glfw_key_right_super = 347
pub const glfw_key_menu = 348

pub const glfw_key_last = glfw_key_menu

pub const glfw_mod_shift = 1 << 0
pub const glfw_mod_control = 1 << 1
pub const glfw_mod_alt = 1 << 2
pub const glfw_mod_super = 1 << 3
pub const glfw_mod_caps_lock = 1 << 4
pub const glfw_mod_num_lock = 1 << 5

pub const glfw_mouse_button_1 = 0
pub const glfw_mouse_button_2 = 1
pub const glfw_mouse_button_3 = 2
pub const glfw_mouse_button_4 = 3
pub const glfw_mouse_button_5 = 4
pub const glfw_mouse_button_6 = 5
pub const glfw_mouse_button_7 = 6
pub const glfw_mouse_button_8 = 7
pub const glfw_mouse_button_last = glfw_mouse_button_8
pub const glfw_mouse_button_left = glfw_mouse_button_1
pub const glfw_mouse_button_right = glfw_mouse_button_2
pub const glfw_mouse_button_middle = glfw_mouse_button_3

pub const glfw_joystick_1 = 0
pub const glfw_joystick_2 = 1
pub const glfw_joystick_3 = 2
pub const glfw_joystick_4 = 3
pub const glfw_joystick_5 = 4
pub const glfw_joystick_6 = 5
pub const glfw_joystick_7 = 6
pub const glfw_joystick_8 = 7
pub const glfw_joystick_9 = 8
pub const glfw_joystick_10 = 9
pub const glfw_joystick_11 = 10
pub const glfw_joystick_12 = 11
pub const glfw_joystick_13 = 12
pub const glfw_joystick_14 = 13
pub const glfw_joystick_15 = 14
pub const glfw_joystick_16 = 15
pub const glfw_joystick_last = glfw_joystick_16

pub const glfw_gamepad_button_a = 0
pub const glfw_gamepad_button_b = 1
pub const glfw_gamepad_button_x = 2
pub const glfw_gamepad_button_y = 3
pub const glfw_gamepad_button_left_bumper = 4
pub const glfw_gamepad_button_right_bumper = 5
pub const glfw_gamepad_button_back = 6
pub const glfw_gamepad_button_start = 7
pub const glfw_gamepad_button_guide = 8
pub const glfw_gamepad_button_left_thumb = 9
pub const glfw_gamepad_button_right_thumb = 10
pub const glfw_gamepad_button_dpad_up = 11
pub const glfw_gamepad_button_dpad_right = 12
pub const glfw_gamepad_button_dpad_down = 13
pub const glfw_gamepad_button_dpad_left = 14
pub const glfw_gamepad_button_last = glfw_gamepad_button_dpad_left

pub const glfw_gamepad_button_cross = glfw_gamepad_button_a
pub const glfw_gamepad_button_circle = glfw_gamepad_button_b
pub const glfw_gamepad_button_square = glfw_gamepad_button_x
pub const glfw_gamepad_button_triangle = glfw_gamepad_button_y

pub const glfw_gamepad_axis_left_x = 0
pub const glfw_gamepad_axis_left_y = 1
pub const glfw_gamepad_axis_right_x = 2
pub const glfw_gamepad_axis_right_y = 3
pub const glfw_gamepad_axis_left_trigger = 4
pub const glfw_gamepad_axis_right_trigger = 5
pub const glfw_gamepad_axis_last = glfw_gamepad_axis_right_trigger

pub const glfw_no_error = 0
pub const glfw_not_initialized = 0x00010001
pub const glfw_no_current_context = 0x00010002
pub const glfw_invalid_enum = 0x00010003
pub const glfw_invalid_value = 0x00010004
pub const glfw_out_of_memory = 0x00010005
pub const glfw_api_unavailable = 0x00010006
pub const glfw_version_unavailable = 0x00010007
pub const glfw_platform_error = 0x00010008
pub const glfw_format_unavailable = 0x00010009
pub const glfw_no_window_context = 0x0001000A
pub const glfw_cursor_unavailable = 0x0001000B
pub const glfw_feature_unavailable = 0x0001000C
pub const glfw_feature_unimplemented = 0x0001000D
pub const glfw_platform_unavailable = 0x0001000E

pub const glfw_focused = 0x00020001
pub const glfw_iconified = 0x00020002
pub const glfw_resizable = 0x00020003
pub const glfw_visible = 0x00020004
pub const glfw_decorated = 0x00020005
pub const glfw_auto_iconify = 0x00020006
pub const glfw_floating = 0x00020007
pub const glfw_maximized = 0x00020008
pub const glfw_center_cursor = 0x00020009
pub const glfw_transparent_framebuffer = 0x0002000A
pub const glfw_hovered = 0x0002000B
pub const glfw_focus_on_show = 0x0002000C
pub const glfw_mouse_passthrough = 0x0002000D
pub const glfw_position_x = 0x0002000E
pub const glfw_position_y = 0x0002000F

pub const glfw_red_bits = 0x00021001
pub const glfw_green_bits = 0x00021002
pub const glfw_blue_bits = 0x00021003
pub const glfw_alpha_bits = 0x00021004
pub const glfw_depth_bits = 0x00021005
pub const glfw_stencil_bits = 0x00021006
pub const glfw_accum_red_bits = 0x00021007
pub const glfw_accum_green_bits = 0x00021008
pub const glfw_accum_blue_bits = 0x00021009
pub const glfw_accum_alpha_bits = 0x0002100A
pub const glfw_aux_buffers = 0x0002100B
pub const glfw_stereo = 0x0002100C
pub const glfw_samples = 0x0002100D
pub const glfw_srgb_capable = 0x0002100E
pub const glfw_refresh_rate = 0x0002100F
pub const glfw_doublebuffer = 0x00021010

pub const glfw_client_api = 0x00022001
pub const glfw_context_version_major = 0x00022002
pub const glfw_context_version_minor = 0x00022003
pub const glfw_context_revision = 0x00022004
pub const glfw_context_robustness = 0x00022005
pub const glfw_opengl_forward_compat = 0x00022006
pub const glfw_context_debug = 0x00022007
pub const glfw_opengl_debug_context = glfw_context_debug
pub const glfw_opengl_profile = 0x00022008
pub const glfw_context_release_behavior = 0x00022009
pub const glfw_context_no_error = 0x0002200A
pub const glfw_context_creation_api = 0x0002200B
pub const glfw_scale_to_monitor = 0x0002200C
pub const glfw_cocoa_retina_framebuffer = 0x00023001
pub const glfw_cocoa_frame_name = 0x00023002
pub const glfw_cocoa_graphics_switching = 0x00023003
pub const glfw_x11_class_name = 0x00024001
pub const glfw_x11_instance_name = 0x00024002
pub const glfw_win32_keyboard_menu = 0x00025001
pub const glfw_win32_showdefault = 0x00025002
pub const glfw_wayland_app_id = 0x00026001

pub const glfw_no_api = 0
pub const glfw_opengl_api = 0x00030001
pub const glfw_opengl_es_api = 0x00030002

pub const glfw_no_robustness = 0
pub const glfw_no_reset_notification = 0x00031001
pub const glfw_lose_context_on_reset = 0x00031002

pub const glfw_opengl_any_profile = 0
pub const glfw_opengl_core_profile = 0x00032001
pub const glfw_opengl_compat_profile = 0x00032002

pub const glfw_cursor = 0x00033001
pub const glfw_sticky_keys = 0x00033002
pub const glfw_sticky_mouse_buttons = 0x00033003
pub const glfw_lock_key_mods = 0x00033004
pub const glfw_raw_mouse_motion = 0x00033005

pub const glfw_cursor_normal = 0x00034001
pub const glfw_cursor_hidden = 0x00034002
pub const glfw_cursor_disable = 0x00034003
pub const glfw_cursor_captured = 0x00034004

pub const glfw_any_release_behavior = 0
pub const glfw_release_behavior_flush = 0x00035001
pub const glfw_release_behavior_none = 0x00035002

pub const glfw_native_context_api = 0x00036001
pub const glfw_egl_context_api = 0x00036002
pub const glfw_osmesa_context_api = 0x00036003

pub const glfw_angle_platform_type_none = 0x00037001
pub const glfw_angle_platform_type_opengl = 0x00037002
pub const glfw_angle_platform_type_opengles = 0x00037003
pub const glfw_angle_platform_type_d3d9 = 0x00037004
pub const glfw_angle_platform_type_d3d11 = 0x00037005
pub const glfw_angle_platform_type_vulkan = 0x00037007
pub const glfw_angle_platform_type_metal = 0x00037008

pub const glfw_wayland_prefer_libdecor = 0x00038001
pub const glfw_wayland_disable_libdecor = 0x00038002

pub const glfw_anyposition = u32(0x80000000)

pub const glfw_arrow_cursor = 0x00036001
pub const glfw_ibeam_cursor = 0x00036002
pub const glfw_crosshair_cursor = 0x00036003
pub const glfw_pointing_hand_cursor = 0x00036004
pub const glfw_resize_ew_cursor = 0x00036005
pub const glfw_resize_ns_cursor = 0x00036006
pub const glfw_resize_nwse_cursor = 0x00036007
pub const glfw_resize_nesw_cursor = 0x00036008
pub const glfw_resize_all_cursor = 0x00036009
pub const glfw_not_allowed_cursor = 0x0003600A
pub const glfw_hresize_cursor = glfw_resize_ew_cursor
pub const glfw_vresize_cursor = glfw_resize_ns_cursor
pub const glfw_hand_cursor = glfw_pointing_hand_cursor

pub const glfw_connected = 0x00040001
pub const glfw_disconnected = 0x00040002

pub const glfw_joystick_hat_buttons = 0x00050001
pub const glfw_angle_platform_type = 0x00050002
pub const glfw_platform = 0x00050003
pub const glfw_cocoa_chdir_resources = 0x00051001
pub const glfw_cocoa_menubar = 0x00051002
pub const glfw_x11_xcb_vulkan_surface = 0x00052001
pub const glfw_wayland_libdecor = 0x00053001

pub const glfw_any_platform = 0x00060000
pub const glfw_platform_win32 = 0x00060001
pub const glfw_platform_cocoa = 0x00060002
pub const glfw_platform_wayland = 0x00060003
pub const glfw_platform_x11 = 0x00060004
pub const glfw_platform_null = 0x00060005

pub const glfw_dont_care = -1

// *************************************************************************
// * GLFW API types
// *************************************************************************

type GLFWglproc = fn ()

type GLFWvkproc = fn ()

@[typedef]
struct C.GLFWmonitor {
}

pub type GLFWmonitor = C.GLFWmonitor

@[typedef]
struct C.GLFWwindow {
}

pub type GLFWwindow = C.GLFWwindow

@[typedef]
struct C.GLFWcursor {
}

pub type GLFWcursor = C.GLFWcursor

pub type GLFWallocatefun = fn (size u64, user voidptr)

pub type GLFWreallocatefun = fn (block voidptr, size u64, user voidptr)

pub type GLFWdeallocatefun = fn (block voidptr, user voidptr)

pub type GLFWerrorfun = fn (error_code int, const_description &char)

pub type GLFWwindowposfun = fn (window &GLFWwindow, xpos int, ypos int)

pub type GLFWwindowsizefun = fn (window &GLFWwindow, width int, height int)

pub type GLFWwindowclosefun = fn (window &GLFWwindow)

pub type GLFWwindowrefreshfun = fn (window &GLFWwindow)

pub type GLFWwindowfocusfun = fn (window &GLFWwindow, focus int)

pub type GLFWwindowiconifyfun = fn (window &GLFWwindow, iconified int)

pub type GLFWwindowmaximizefun = fn (window &GLFWwindow, maximized int)

pub type GLFWframebuffersizefun = fn (window &GLFWwindow, width int, height int)

pub type GLFWwindowcontentscalefun = fn (window &GLFWwindow, xscale f32, yscale f32)

pub type GLFWmousebuttonfun = fn (window &GLFWwindow, button int, action int, mods int)

pub type GLFWcursorposfun = fn (window &GLFWwindow, xpos f64, ypos f64)

pub type GLFWcursorenterfun = fn (window &GLFWwindow, entered int)

pub type GLFWscrollfun = fn (window &GLFWwindow, xoffset f64, yoffset f64)

pub type GLFWkeyfun = fn (window &GLFWwindow, key int, scancode int, action int, mods int)

pub type GLFWcharfun = fn (window &GLFWwindow, codepoint u32)

pub type GLFWcharmodsfun = fn (window &GLFWwindow, codepoint u32, mods int)

pub type GLFWdropfun = fn (window &GLFWwindow, path_count int, const_paths &&char)

pub type GLFWmonitorfun = fn (monitor &GLFWmonitor, event int)

pub type GLFWjoystickfun = fn (jid int, event int)

@[typedef]
struct C.GLFWvidmode {
pub mut:
	width       int
	height      int
	redBits     int
	greenBits   int
	blueBits    int
	refreshRate int
}

pub type GLFWvidmode = C.GLFWvidmode

@[typedef]
struct C.GLFWgammaramp {
pub mut:
	red   &u16
	green &u16
	blue  &u16
	size  u32
}

pub type GLFWgammaramp = C.GLFWgammaramp

@[typedef]
struct C.GLFWimage {
pub mut:
	width  int
	height int
	pixels &u8
}

pub type GLFWimage = C.GLFWimage

@[typedef]
struct C.GLFWgamepadstate {
pub mut:
	buttons [15]u8
	axes    [6]f32
}

pub type GLFWgamepadstate = C.GLFWgamepadstate

@[typedef]
struct C.GLFWallocator {
pub mut:
	allocate   GLFWallocatefun
	reallocate GLFWreallocatefun
	deallocate GLFWdeallocatefun
	user       voidptr
}

pub type GLFWallocator = C.GLFWallocator

// *************************************************************************
// * GLFW API functions
// *************************************************************************

pub fn C.glfwInit() int

pub fn C.glfwTerminate()

pub fn C.glfwInitHint(hint int, value int)

pub fn C.glfwInitAllocator(const_allocator &GLFWallocator)

// $if vk_version_1_0 ? {
// 	pub fn C.glfwInitVulkanLoader(loader PFN_vkGetInstanceProcAddr)
// }

pub fn C.glfwGetVersion(major &int, minor &int, rev &int)

pub fn C.glfwGetVersionString() &char

pub fn C.glfwGetError(const_description &&char) int

pub fn C.glfwSetErrorCallback(callback GLFWerrorfun) GLFWerrorfun

pub fn C.glfwGetPlatform() int

pub fn C.glfwPlatformSupported(platform int) int

pub fn C.glfwGetMonitors(count &int) &&GLFWmonitor

pub fn C.glfwGetPrimaryMonitor() &GLFWmonitor

pub fn C.glfwGetMonitorPos(monitor &GLFWmonitor, xpos &int, ypos &int)

pub fn C.glfwGetMonitorWorkarea(monitor &GLFWmonitor, xpos &int, ypos &int, width &int, height &int)

pub fn C.glfwGetMonitorPhysicalSize(monitor &GLFWmonitor, widthMM &int, heightMM &int)

pub fn C.glfwGetMonitorContentScale(monitor &GLFWmonitor, xscale &f32, yscale &f32)

pub fn C.glfwGetMonitorName(monitor &GLFWmonitor) &char

pub fn C.glfwSetMonitorUserPointer(monitor &GLFWmonitor, pointer voidptr)

pub fn C.glfwGetMonitorUserPointer(monitor &GLFWmonitor) voidptr

pub fn C.glfwSetMonitorCallback(callback GLFWmonitorfun) GLFWmonitorfun

pub fn C.glfwGetVideoModes(monitor &GLFWmonitor, count &int) &GLFWvidmode

pub fn C.glfwGetVideoMode(monitor &GLFWmonitor) &GLFWvidmode

pub fn C.glfwSetGamma(monitor &GLFWmonitor, gamma f32)

pub fn C.glfwGetGammaRamp(monitor &GLFWmonitor) &GLFWgammaramp

pub fn C.glfwSetGammaRamp(monitor &GLFWmonitor, ramp &GLFWgammaramp)

pub fn C.glfwDefaultWindowHints()

pub fn C.glfwWindowHint(hint int, value int)

pub fn C.glfwWindowHintString(hint int, const_value &char)

pub fn C.glfwCreateWindow(width int, height int, const_title &char, monitor &GLFWmonitor, share &GLFWwindow) &GLFWwindow

pub fn C.glfwDestroyWindow(window &GLFWwindow)

pub fn C.glfwWindowShouldClose(window &GLFWwindow) int

pub fn C.glfwSetWindowShouldClose(window &GLFWwindow, value int)

pub fn C.glfwGetWindowTitle(window &GLFWwindow) &char

pub fn C.glfwSetWindowTitle(window &GLFWwindow, const_title &char)

pub fn C.glfwSetWindowIcon(window &GLFWwindow, count int, images voidptr)

pub fn C.glfwGetWindowPos(window &GLFWwindow, xpos &int, ypos &int)

pub fn C.glfwSetWindowPos(window &GLFWwindow, xpos int, ypos int)

pub fn C.glfwGetWindowSize(window &GLFWwindow, width &int, height &int)

pub fn C.glfwSetWindowSizeLimits(window &GLFWwindow, minwidth int, minheight int, maxwidth int, maxheight int)

pub fn C.glfwSetWindowAspectRatio(window &GLFWwindow, numer int, denom int)

pub fn C.glfwSetWindowSize(window &GLFWwindow, width int, height int)

pub fn C.glfwGetFramebufferSize(window &GLFWwindow, width &int, height &int)

pub fn C.glfwGetWindowFrameSize(window &GLFWwindow, left &int, top &int, right &int, bottom &int)

pub fn C.glfwGetWindowContentScale(window &GLFWwindow, x_scale &f32, y_scale &f32)

pub fn C.glfwGetWindowOpacity(window &GLFWwindow) f32

pub fn C.glfwSetWindowOpacity(window &GLFWwindow, opacity f32)

pub fn C.glfwIconifyWindow(window &GLFWwindow)

pub fn C.glfwRestoreWindow(window &GLFWwindow)

pub fn C.glfwMaximizeWindow(window &GLFWwindow)

pub fn C.glfwShowWindow(window &GLFWwindow)

pub fn C.glfwHideWindow(window &GLFWwindow)

pub fn C.glfwFocusWindow(window &GLFWwindow)

pub fn C.glfwRequestWindowAttention(window &GLFWwindow)

pub fn C.glfwGetWindowMonitor(window &GLFWwindow) &GLFWmonitor

pub fn C.glfwSetWindowMonitor(window &GLFWwindow, monitor &GLFWmonitor, xpos int, ypos int, width int, height int, refreshRate int)

pub fn C.glfwGetWindowAttrib(window &GLFWwindow, attrib int) int

pub fn C.glfwSetWindowAttrib(window &GLFWwindow, attrib int, value int)

pub fn C.glfwSetWindowUserPointer(window &GLFWwindow, pointer voidptr)

pub fn C.glfwGetWindowUserPointer(window &GLFWwindow) voidptr

pub fn C.glfwSetWindowPosCallback(window &GLFWwindow, callback GLFWwindowposfun) GLFWwindowposfun

pub fn C.glfwSetWindowSizeCallback(window &GLFWwindow, callback GLFWwindowsizefun) GLFWwindowsizefun

pub fn C.glfwSetWindowCloseCallback(window &GLFWwindow, callback GLFWwindowclosefun) GLFWwindowclosefun

pub fn C.glfwSetWindowRefreshCallback(window &GLFWwindow, callback GLFWwindowrefreshfun) GLFWwindowrefreshfun

pub fn C.glfwSetWindowFocusCallback(window &GLFWwindow, callback GLFWwindowfocusfun) GLFWwindowfocusfun

pub fn C.glfwSetWindowIconifyCallback(window &GLFWwindow, callback GLFWwindowiconifyfun) GLFWwindowiconifyfun

pub fn C.glfwSetWindowMaximizeCallback(window &GLFWwindow, callback GLFWwindowmaximizefun) GLFWwindowmaximizefun

pub fn C.glfwSetFramebufferSizeCallback(window &GLFWwindow, callback GLFWframebuffersizefun) GLFWframebuffersizefun

pub fn C.glfwSetWindowContentScaleCallback(window &GLFWwindow, callback GLFWwindowcontentscalefun) GLFWwindowcontentscalefun

pub fn C.glfwPollEvents()

pub fn C.glfwWaitEvents()

pub fn C.glfwWaitEventsTimeout(timeout f64)

pub fn C.glfwPostEmptyEvent()

pub fn C.glfwGetInputMode(window &GLFWwindow, mode int) int

pub fn C.glfwSetInputMode(window &GLFWwindow, mode int, value int)

pub fn C.glfwRawMouseMotionSupported() int

pub fn C.glfwGetKeyName(key int, scan_code int) &char

pub fn C.glfwGetKeyScancode(key int) int

pub fn C.glfwGetKey(window &GLFWwindow, key int) int

pub fn C.glfwGetMouseButton(window &GLFWwindow, button int) int

pub fn C.glfwGetCursorPos(window &GLFWwindow, xpos &f64, ypos &f64)

pub fn C.glfwSetCursorPos(window &GLFWwindow, xpos f64, ypos f64)

pub fn C.glfwCreateCursor(image &GLFWimage, xhot int, yhot int) &GLFWcursor

pub fn C.glfwCreateStandardCursor(shape int) &GLFWcursor

pub fn C.glfwDestroyCursor(cursor &GLFWcursor)

pub fn C.glfwSetCursor(window &GLFWwindow, cursor &GLFWcursor)

pub fn C.glfwSetKeyCallback(window &GLFWwindow, callback GLFWkeyfun) GLFWkeyfun

pub fn C.glfwSetCharCallback(window &GLFWwindow, callback GLFWcharfun) GLFWcharfun

pub fn C.glfwSetCharModsCallback(window &GLFWwindow, callback GLFWcharmodsfun) GLFWcharmodsfun

pub fn C.glfwSetMouseButtonCallback(window &GLFWwindow, callback GLFWmousebuttonfun) GLFWmousebuttonfun

pub fn C.glfwSetCursorPosCallback(window &GLFWwindow, callback GLFWcursorposfun) GLFWcursorposfun

pub fn C.glfwSetCursorEnterCallback(window &GLFWwindow, callback GLFWcursorenterfun) GLFWcursorenterfun

pub fn C.glfwSetScrollCallback(window &GLFWwindow, callback GLFWscrollfun) GLFWscrollfun

pub fn C.glfwSetDropCallback(window &GLFWwindow, callback GLFWdropfun) GLFWdropfun

pub fn C.glfwJoystickPresent(jid int) int

pub fn C.glfwGetJoystickAxes(jid int, count &int) voidptr

pub fn C.glfwGetJoystickButtons(jid int, count &int) &u8

pub fn C.glfwGetJoystickHats(jid int, count &int) &u8

pub fn C.glfwGetJoystickName(jid int) &char

pub fn C.glfwGetJoystickGUID(jid int) &char

pub fn C.glfwSetJoystickUserPointer(jid int, pointer voidptr)

pub fn C.glfwGetJoystickUserPointer(jid int) voidptr

pub fn C.glfwJoystickIsGamepad(jid int) int

pub fn C.glfwSetJoystickCallback(callback GLFWjoystickfun) GLFWjoystickfun

pub fn C.glfwUpdateGamepadMappings(const_string &char) int

pub fn C.glfwGetGamepadName(jid int) &char

pub fn C.glfwGetGamepadState(jid int, state &GLFWgamepadstate) int

pub fn C.glfwSetClipboardString(window &GLFWwindow, const_clipboard &char)

pub fn C.glfwGetClipboardString(window &GLFWwindow) &char

pub fn C.glfwGetTime() f64

pub fn C.glfwSetTime(time f64)

pub fn C.glfwGetTimerValue() u64

pub fn C.glfwGetTimerFrequency() u64

pub fn C.glfwMakeContextCurrent(window &GLFWwindow)

pub fn C.glfwGetCurrentContext() &GLFWwindow

pub fn C.glfwSwapBuffers(window &GLFWwindow)

pub fn C.glfwSwapInterval(interval int)

pub fn C.glfwExtensionSupported(const_extension &char) int

pub fn C.glfwGetProcAddress(const_procname &char) GLFWglproc

pub fn C.glfwVulkanSupported() int

pub fn C.glfwGetRequiredInstanceExtensions(count &u32) &&char

// $if vk_version_1_0 ? {
// 	pub fn C.glfwGetInstanceProcAddress(instance VkInstance, const_procname &char)
// }
