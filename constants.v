module vglfw

// GLFW defines
pub const (
	glfw_version_major    = 3
	glfw_version_minor    = 3
	glfw_version_revision = 8
	//
	glfw_true             = 1
	glfw_false            = 0
	// Key actions
	glfw_release          = 0
	glfw_press            = 1 << 0
	glfw_repeat           = 1 << 1
)

// Joystick hat states
pub const (
	// Hat states
	glfw_hat_centered   = 0
	glfw_hat_up         = 1 << 0
	glfw_hat_right      = 1 << 1
	glfw_hat_down       = 1 << 2
	glfw_hat_left       = 1 << 3
	glfw_hat_right_up   = (glfw_hat_right | glfw_hat_up)
	glfw_hat_right_down = (glfw_hat_right | glfw_hat_down)
	glfw_hat_left_up    = (glfw_hat_left | glfw_hat_up)
	glfw_hat_left_down  = (glfw_hat_left | glfw_hat_down)
)

// Keyboard key codes
pub const (
	// The unknown key
	glfw_key_unknown       = -1
	// Printable keys
	glfw_key_space         = 32
	glfw_key_apostrophe    = 39
	glfw_key_comma         = 44
	glfw_key_minus         = 45
	glfw_key_period        = 46
	glfw_key_slash         = 47
	glfw_key_0             = 48
	glfw_key_1             = 49
	glfw_key_2             = 50
	glfw_key_3             = 51
	glfw_key_4             = 52
	glfw_key_5             = 53
	glfw_key_6             = 54
	glfw_key_7             = 55
	glfw_key_8             = 56
	glfw_key_9             = 57
	glfw_key_semicolon     = 59
	glfw_key_equal         = 61
	glfw_key_a             = 65
	glfw_key_b             = 66
	glfw_key_c             = 67
	glfw_key_d             = 68
	glfw_key_e             = 69
	glfw_key_f             = 70
	glfw_key_g             = 71
	glfw_key_h             = 72
	glfw_key_i             = 73
	glfw_key_j             = 74
	glfw_key_k             = 75
	glfw_key_l             = 76
	glfw_key_m             = 77
	glfw_key_n             = 78
	glfw_key_o             = 79
	glfw_key_p             = 80
	glfw_key_q             = 81
	glfw_key_r             = 82
	glfw_key_s             = 83
	glfw_key_t             = 84
	glfw_key_u             = 85
	glfw_key_v             = 86
	glfw_key_w             = 87
	glfw_key_x             = 88
	glfw_key_y             = 89
	glfw_key_z             = 90
	glfw_key_left_bracket  = 91
	glfw_key_backslash     = 92
	glfw_key_right_bracket = 93
	glfw_key_grave_accent  = 96
	glfw_key_world_1       = 161
	glfw_key_world_2       = 162
	// Function keys
	glfw_key_escape        = 256
	glfw_key_enter         = 257
	glfw_key_tab           = 258
	glfw_key_backspace     = 259
	glfw_key_insert        = 260
	glfw_key_delete        = 261
	glfw_key_right         = 262
	glfw_key_left          = 263
	glfw_key_down          = 264
	glfw_key_up            = 265
	glfw_key_page_up       = 266
	glfw_key_page_down     = 267
	glfw_key_home          = 268
	glfw_key_end           = 269
	glfw_key_caps_lock     = 280
	glfw_key_scroll_lock   = 281
	glfw_key_num_lock      = 282
	glfw_key_print_screen  = 283
	glfw_key_pause         = 284
	glfw_key_f1            = 290
	glfw_key_f2            = 291
	glfw_key_f3            = 292
	glfw_key_f4            = 293
	glfw_key_f5            = 294
	glfw_key_f6            = 295
	glfw_key_f7            = 296
	glfw_key_f8            = 297
	glfw_key_f9            = 298
	glfw_key_f10           = 299
	glfw_key_f11           = 300
	glfw_key_f12           = 301
	glfw_key_f13           = 302
	glfw_key_f14           = 303
	glfw_key_f15           = 304
	glfw_key_f16           = 305
	glfw_key_f17           = 306
	glfw_key_f18           = 307
	glfw_key_f19           = 308
	glfw_key_f20           = 309
	glfw_key_f21           = 310
	glfw_key_f22           = 311
	glfw_key_f23           = 312
	glfw_key_f24           = 313
	glfw_key_f25           = 314
	glfw_key_kp_0          = 320
	glfw_key_kp_1          = 321
	glfw_key_kp_2          = 322
	glfw_key_kp_3          = 323
	glfw_key_kp_4          = 324
	glfw_key_kp_5          = 325
	glfw_key_kp_6          = 326
	glfw_key_kp_7          = 327
	glfw_key_kp_8          = 328
	glfw_key_kp_9          = 329
	glfw_key_kp_decimal    = 330
	glfw_key_kp_divide     = 331
	glfw_key_kp_multiply   = 332
	glfw_key_kp_subtract   = 333
	glfw_key_kp_add        = 334
	glfw_key_kp_enter      = 335
	glfw_key_kp_equal      = 336
	glfw_key_left_shift    = 340
	glfw_key_left_control  = 341
	glfw_key_left_alt      = 342
	glfw_key_left_super    = 343
	glfw_key_right_shift   = 344
	glfw_key_right_control = 345
	glfw_key_right_alt     = 346
	glfw_key_right_super   = 347
	glfw_key_menu          = 348
	glfw_key_last          = glfw_key_menu
)

// Keyboard modifier keys
pub const (
	glfw_mod_shift     = 1 << 0
	glfw_mod_control   = 1 << 1
	glfw_mod_alt       = 1 << 2
	glfw_mod_super     = 1 << 3
	glfw_mod_caps_lock = 1 << 4
	glfw_mod_num_lock  = 1 << 5
)

// Mouse buttons
pub const (
	glfw_mouse_button_1      = 0
	glfw_mouse_button_2      = 1
	glfw_mouse_button_3      = 2
	glfw_mouse_button_4      = 3
	glfw_mouse_button_5      = 4
	glfw_mouse_button_6      = 5
	glfw_mouse_button_7      = 6
	glfw_mouse_button_8      = 7
	glfw_mouse_button_last   = glfw_mouse_button_8
	glfw_mouse_button_left   = glfw_mouse_button_1
	glfw_mouse_button_right  = glfw_mouse_button_2
	glfw_mouse_button_middle = glfw_mouse_button_3
)

// Joystick enumeration
pub const (
	//
	glfw_joystick_1    = 0
	glfw_joystick_2    = 1
	glfw_joystick_3    = 2
	glfw_joystick_4    = 3
	glfw_joystick_5    = 4
	glfw_joystick_6    = 5
	glfw_joystick_7    = 6
	glfw_joystick_8    = 7
	glfw_joystick_9    = 8
	glfw_joystick_10   = 9
	glfw_joystick_11   = 10
	glfw_joystick_12   = 11
	glfw_joystick_13   = 12
	glfw_joystick_14   = 13
	glfw_joystick_15   = 14
	glfw_joystick_16   = 15
	glfw_joystick_last = glfw_joystick_16
)

// Gamepad buttons
pub const (
	glfw_gamepad_button_a            = 0
	glfw_gamepad_button_b            = 1
	glfw_gamepad_button_x            = 2
	glfw_gamepad_button_y            = 3
	glfw_gamepad_button_left_bumper  = 4
	glfw_gamepad_button_right_bumper = 5
	glfw_gamepad_button_back         = 6
	glfw_gamepad_button_start        = 7
	glfw_gamepad_button_guide        = 8
	glfw_gamepad_button_left_thumb   = 9
	glfw_gamepad_button_right_thumb  = 10
	glfw_gamepad_button_dpad_up      = 11
	glfw_gamepad_button_dpad_right   = 12
	glfw_gamepad_button_dpad_down    = 13
	glfw_gamepad_button_dpad_left    = 14
	glfw_gamepad_button_last         = glfw_gamepad_button_dpad_left
	glfw_gamepad_button_cross        = glfw_gamepad_button_a
	glfw_gamepad_button_circle       = glfw_gamepad_button_b
	glfw_gamepad_button_square       = glfw_gamepad_button_x
	glfw_gamepad_button_triangle     = glfw_gamepad_button_y
)

// Gamepad axis
pub const (
	glfw_gamepad_axis_left_x        = 0
	glfw_gamepad_axis_left_y        = 1
	glfw_gamepad_axis_right_x       = 2
	glfw_gamepad_axis_right_y       = 3
	glfw_gamepad_axis_left_trigger  = 4
	glfw_gamepad_axis_right_trigger = 5
	glfw_gamepad_axis_last          = glfw_gamepad_axis_right_trigger
)

// Error codes
pub const (
	glfw_no_error            = 0
	glfw_not_initialized     = 0x00010001
	glfw_no_current_context  = 0x00010002
	glfw_invalid_enum        = 0x00010003
	glfw_out_of_memory       = 0x00010005
	glfw_api_unavailable     = 0x00010006
	glfw_version_unavailable = 0x00010007
	glfw_platform_error      = 0x00010008
	glfw_format_unavailable  = 0x00010009
	glfw_no_window_context   = 0x0001000A
)

// Window hints & attributes
pub const (
	glfw_focused                  = 0x00020001
	glfw_iconified                = 0x00020002
	glfw_resizable                = 0x00020003
	glfw_visible                  = 0x00020004
	glfw_decorated                = 0x00020005
	glfw_auto_iconify             = 0x00020006
	glfw_floating                 = 0x00020007
	glfw_maximized                = 0x00020008
	glfw_center_cursor            = 0x00020009
	glfw_transparent_framebuffer  = 0x0002000A
	glfw_hovered                  = 0x0002000B
	glfw_focus_on_show            = 0x0002000C
	//
	glfw_red_bits                 = 0x00021001
	glfw_green_bits               = 0x00021002
	glfw_blue_bits                = 0x00021003
	glfw_alpha_bits               = 0x00021004
	glfw_depth_bits               = 0x00021005
	glfw_stencil_bits             = 0x00021006
	glfw_accum_red_bits           = 0x00021007
	glfw_accum_green_bits         = 0x00021008
	glfw_accum_blue_bits          = 0x00021009
	glfw_accum_alpha_bits         = 0x0002100A
	glfw_aux_buffers              = 0x0002100B
	glfw_stereo                   = 0x0002100C
	glfw_samples                  = 0x0002100D
	glfw_srgb_capable             = 0x0002100E
	glfw_refresh_rate             = 0x0002100F
	glfw_doublebuffer             = 0x00021010
	//
	glfw_client_api               = 0x00022001
	glfw_context_version_major    = 0x00022002
	glfw_context_version_minor    = 0x00022003
	glfw_context_revision         = 0x00022004
	glfw_context_robustness       = 0x00022005
	glfw_opengl_forward_compat    = 0x00022006
	glfw_opengl_debug_context     = 0x00022007
	glfw_opengl_profile           = 0x00022008
	glfw_context_release_behavior = 0x00022009
	glfw_context_no_error         = 0x0002200A
	glfw_context_creation_api     = 0x0002200B
	glfw_scale_to_monitor         = 0x0002200C
	glfw_cocoa_retina_framebuffer = 0x00023001
	glfw_cocoa_frame_name         = 0x00023002
	glfw_cocoa_graphics_switching = 0x00023003
	glfw_x11_class_name           = 0x00024001
	glfw_x11_instance_name        = 0x00024002
	//
	glfw_no_api                   = 0
	glfw_opengl_api               = 0x00030001
	glfw_opengl_es_api            = 0x00030002
	//
	glfw_no_robustness            = 0
	glfw_no_reset_notification    = 0x00031001
	glfw_lose_context_on_reset    = 0x00031002
	//
	glfw_opengl_any_profile       = 0
	glfw_opengl_core_profile      = 0x00032001
	glfw_opengl_compat_profile    = 0x00032002
	// Window input modes
	glfw_cursor                   = 0x00033001
	glfw_sticky_keys              = 0x00033002
	glfw_sticky_mouse_buttons     = 0x00033003
	glfw_lock_key_mods            = 0x00033004
	glfw_raw_mouse_motion         = 0x00033005
	//
	glfw_cursor_normal            = 0x00034001
	glfw_cursor_hidden            = 0x00034002
	glfw_cursor_disable           = 0x00034003
	//
	glfw_any_release_behavior     = 0
	glfw_release_behavior_flush   = 0x00035001
	glfw_release_behavior_none    = 0x00035002
	//
	glfw_native_context_api       = 0x00036001
	glfw_egl_context_api          = 0x00036002
	glfw_osmesa_context_api       = 0x00036003
	// Standar cursor shapes
	glfw_arrow_cursor             = 0x00036001
	glfw_ibeam_cursor             = 0x00036002
	glfw_crosshair_cursor         = 0x00036003
	glfw_hand_cursor              = 0x00036004
	glfw_hresize_cursor           = 0x00036005
	glfw_vresize_cursor           = 0x00036006
	//
	glfw_connected                = 0x00040001
	glfw_disconnected             = 0x00040002
	// Init
	glfw_joystick_hat_buttons     = 0x00050001
	glfw_cocoa_chdir_resources    = 0x00051001
	glfw_cocoa_menubar            = 0x00051002
	//
	glfw_dont_care                = -1
)
