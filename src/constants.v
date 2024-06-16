module glfw

// GLFW defines
pub const glfw_version_major = 3
pub const glfw_version_minor = 3
pub const glfw_version_revision = 8
//
pub const glfw_true = 1
pub const glfw_false = 0
// Key actions
pub const glfw_release = 0
pub const glfw_press = 1 << 0
pub const glfw_repeat = 1 << 1

// Joystick hat states
// Hat states
pub const glfw_hat_centered = 0
pub const glfw_hat_up = 1 << 0
pub const glfw_hat_right = 1 << 1
pub const glfw_hat_down = 1 << 2
pub const glfw_hat_left = 1 << 3
pub const glfw_hat_right_up = (glfw_hat_right | glfw_hat_up)
pub const glfw_hat_right_down = (glfw_hat_right | glfw_hat_down)
pub const glfw_hat_left_up = (glfw_hat_left | glfw_hat_up)
pub const glfw_hat_left_down = (glfw_hat_left | glfw_hat_down)

// Keyboard key codes
// The unknown key
pub const glfw_key_unknown = -1
// Printable keys
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
// Function keys
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

// Keyboard modifier keys
pub const glfw_mod_shift = 1 << 0
pub const glfw_mod_control = 1 << 1
pub const glfw_mod_alt = 1 << 2
pub const glfw_mod_super = 1 << 3
pub const glfw_mod_caps_lock = 1 << 4
pub const glfw_mod_num_lock = 1 << 5

// Mouse buttons
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

// Joystick enumeration
//
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

// Gamepad buttons
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

// Gamepad axis
pub const glfw_gamepad_axis_left_x = 0
pub const glfw_gamepad_axis_left_y = 1
pub const glfw_gamepad_axis_right_x = 2
pub const glfw_gamepad_axis_right_y = 3
pub const glfw_gamepad_axis_left_trigger = 4
pub const glfw_gamepad_axis_right_trigger = 5
pub const glfw_gamepad_axis_last = glfw_gamepad_axis_right_trigger

// Error codes
pub const glfw_no_error = 0
pub const glfw_not_initialized = 0x00010001
pub const glfw_no_current_context = 0x00010002
pub const glfw_invalid_enum = 0x00010003
pub const glfw_out_of_memory = 0x00010005
pub const glfw_api_unavailable = 0x00010006
pub const glfw_version_unavailable = 0x00010007
pub const glfw_platform_error = 0x00010008
pub const glfw_format_unavailable = 0x00010009
pub const glfw_no_window_context = 0x0001000A

// Window hints & attributes
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
//
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
//
pub const glfw_client_api = 0x00022001
pub const glfw_context_version_major = 0x00022002
pub const glfw_context_version_minor = 0x00022003
pub const glfw_context_revision = 0x00022004
pub const glfw_context_robustness = 0x00022005
pub const glfw_opengl_forward_compat = 0x00022006
pub const glfw_opengl_debug_context = 0x00022007
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
//
pub const glfw_no_api = 0
pub const glfw_opengl_api = 0x00030001
pub const glfw_opengl_es_api = 0x00030002
//
pub const glfw_no_robustness = 0
pub const glfw_no_reset_notification = 0x00031001
pub const glfw_lose_context_on_reset = 0x00031002
//
pub const glfw_opengl_any_profile = 0
pub const glfw_opengl_core_profile = 0x00032001
pub const glfw_opengl_compat_profile = 0x00032002
// Window input modes
pub const glfw_cursor = 0x00033001
pub const glfw_sticky_keys = 0x00033002
pub const glfw_sticky_mouse_buttons = 0x00033003
pub const glfw_lock_key_mods = 0x00033004
pub const glfw_raw_mouse_motion = 0x00033005
//
pub const glfw_cursor_normal = 0x00034001
pub const glfw_cursor_hidden = 0x00034002
pub const glfw_cursor_disable = 0x00034003
//
pub const glfw_any_release_behavior = 0
pub const glfw_release_behavior_flush = 0x00035001
pub const glfw_release_behavior_none = 0x00035002
//
pub const glfw_native_context_api = 0x00036001
pub const glfw_egl_context_api = 0x00036002
pub const glfw_osmesa_context_api = 0x00036003
// Standar cursor shapes
pub const glfw_arrow_cursor = 0x00036001
pub const glfw_ibeam_cursor = 0x00036002
pub const glfw_crosshair_cursor = 0x00036003
pub const glfw_hand_cursor = 0x00036004
pub const glfw_hresize_cursor = 0x00036005
pub const glfw_vresize_cursor = 0x00036006
//
pub const glfw_connected = 0x00040001
pub const glfw_disconnected = 0x00040002
// Init
pub const glfw_joystick_hat_buttons = 0x00050001
pub const glfw_cocoa_chdir_resources = 0x00051001
pub const glfw_cocoa_menubar = 0x00051002
//
pub const glfw_dont_care = -1
