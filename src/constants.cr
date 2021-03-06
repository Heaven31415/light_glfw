lib LibGLFW
  VERSION_MAJOR = begin
    get_version(out major, nil, nil)
    major
  end

  VERSION_MINOR = begin
    get_version(nil, out minor, nil)
    minor
  end

  VERSION_REVISION = begin
    get_version(nil, nil, out rev)
    rev
  end

  # Corresponds to Bool
  TRUE                                 = 1
  FALSE                                = 0

  # Corresponds to GLFW::Action enum
  RELEASE                              = 0
  PRESS                                = 1
  REPEAT                               = 2

  # Corresponds to GLFW::Key enum
  KEY_UNKNOWN                          = -1
  KEY_SPACE                            = 32
  KEY_APOSTROPHE                       = 39
  KEY_COMMA                            = 44
  KEY_MINUS                            = 45
  KEY_PERIOD                           = 46
  KEY_SLASH                            = 47
  KEY_0                                = 48
  KEY_1                                = 49
  KEY_2                                = 50
  KEY_3                                = 51
  KEY_4                                = 52
  KEY_5                                = 53
  KEY_6                                = 54
  KEY_7                                = 55
  KEY_8                                = 56
  KEY_9                                = 57
  KEY_SEMICOLON                        = 59
  KEY_EQUAL                            = 61
  KEY_A                                = 65
  KEY_B                                = 66
  KEY_C                                = 67
  KEY_D                                = 68
  KEY_E                                = 69
  KEY_F                                = 70
  KEY_G                                = 71
  KEY_H                                = 72
  KEY_I                                = 73
  KEY_J                                = 74
  KEY_K                                = 75
  KEY_L                                = 76
  KEY_M                                = 77
  KEY_N                                = 78
  KEY_O                                = 79
  KEY_P                                = 80
  KEY_Q                                = 81
  KEY_R                                = 82
  KEY_S                                = 83
  KEY_T                                = 84
  KEY_U                                = 85
  KEY_V                                = 86
  KEY_W                                = 87
  KEY_X                                = 88
  KEY_Y                                = 89
  KEY_Z                                = 90
  KEY_LEFT_BRACKET                     = 91
  KEY_BACKSLASH                        = 92
  KEY_RIGHT_BRACKET                    = 93
  KEY_GRAVE_ACCENT                     = 96
  KEY_WORLD_1                          = 161
  KEY_WORLD_2                          = 162
  KEY_ESCAPE                           = 256
  KEY_ENTER                            = 257
  KEY_TAB                              = 258
  KEY_BACKSPACE                        = 259
  KEY_INSERT                           = 260
  KEY_DELETE                           = 261
  KEY_RIGHT                            = 262
  KEY_LEFT                             = 263
  KEY_DOWN                             = 264
  KEY_UP                               = 265
  KEY_PAGE_UP                          = 266
  KEY_PAGE_DOWN                        = 267
  KEY_HOME                             = 268
  KEY_END                              = 269
  KEY_CAPS_LOCK                        = 280
  KEY_SCROLL_LOCK                      = 281
  KEY_NUM_LOCK                         = 282
  KEY_PRINT_SCREEN                     = 283
  KEY_PAUSE                            = 284
  KEY_F1                               = 290
  KEY_F2                               = 291
  KEY_F3                               = 292
  KEY_F4                               = 293
  KEY_F5                               = 294
  KEY_F6                               = 295
  KEY_F7                               = 296
  KEY_F8                               = 297
  KEY_F9                               = 298
  KEY_F10                              = 299
  KEY_F11                              = 300
  KEY_F12                              = 301
  KEY_F13                              = 302
  KEY_F14                              = 303
  KEY_F15                              = 304
  KEY_F16                              = 305
  KEY_F17                              = 306
  KEY_F18                              = 307
  KEY_F19                              = 308
  KEY_F20                              = 309
  KEY_F21                              = 310
  KEY_F22                              = 311
  KEY_F23                              = 312
  KEY_F24                              = 313
  KEY_F25                              = 314
  KEY_KP_0                             = 320
  KEY_KP_1                             = 321
  KEY_KP_2                             = 322
  KEY_KP_3                             = 323
  KEY_KP_4                             = 324
  KEY_KP_5                             = 325
  KEY_KP_6                             = 326
  KEY_KP_7                             = 327
  KEY_KP_8                             = 328
  KEY_KP_9                             = 329
  KEY_KP_DECIMAL                       = 330
  KEY_KP_DIVIDE                        = 331
  KEY_KP_MULTIPLY                      = 332
  KEY_KP_SUBTRACT                      = 333
  KEY_KP_ADD                           = 334
  KEY_KP_ENTER                         = 335
  KEY_KP_EQUAL                         = 336
  KEY_LEFT_SHIFT                       = 340
  KEY_LEFT_CONTROL                     = 341
  KEY_LEFT_ALT                         = 342
  KEY_LEFT_SUPER                       = 343
  KEY_RIGHT_SHIFT                      = 344
  KEY_RIGHT_CONTROL                    = 345
  KEY_RIGHT_ALT                        = 346
  KEY_RIGHT_SUPER                      = 347
  KEY_MENU                             = 348
  KEY_LAST                             = KEY_MENU

  # Corresponds to GLFW::Mod enum
  MOD_SHIFT                            = 0x0001
  MOD_CONTROL                          = 0x0002
  MOD_ALT                              = 0x0004
  MOD_SUPER                            = 0x0008

  # Corresponds to GLFW::MouseButton enum
  MOUSE_BUTTON_1                       = 0
  MOUSE_BUTTON_2                       = 1
  MOUSE_BUTTON_3                       = 2
  MOUSE_BUTTON_4                       = 3
  MOUSE_BUTTON_5                       = 4
  MOUSE_BUTTON_6                       = 5
  MOUSE_BUTTON_7                       = 6
  MOUSE_BUTTON_8                       = 7
  MOUSE_BUTTON_LAST                    = MOUSE_BUTTON_8
  MOUSE_BUTTON_LEFT                    = MOUSE_BUTTON_1
  MOUSE_BUTTON_RIGHT                   = MOUSE_BUTTON_2
  MOUSE_BUTTON_MIDDLE                  = MOUSE_BUTTON_3

  # Corresponds to GLFW::Joystick enum
  JOYSTICK_1                           = 0
  JOYSTICK_2                           = 1
  JOYSTICK_3                           = 2
  JOYSTICK_4                           = 3
  JOYSTICK_5                           = 4
  JOYSTICK_6                           = 5
  JOYSTICK_7                           = 6
  JOYSTICK_8                           = 7
  JOYSTICK_9                           = 8
  JOYSTICK_10                          = 9
  JOYSTICK_11                          = 10
  JOYSTICK_12                          = 11
  JOYSTICK_13                          = 12
  JOYSTICK_14                          = 13
  JOYSTICK_15                          = 14
  JOYSTICK_16                          = 15
  JOYSTICK_LAST                        = JOYSTICK_16

  # Corresponds to GLFW::Error enum
  NOT_INITIALIZED                      = 0x00010001
  NO_CURRENT_CONTEXT                   = 0x00010002
  INVALID_ENUM                         = 0x00010003
  INVALID_VALUE                        = 0x00010004
  OUT_OF_MEMORY                        = 0x00010005
  API_UNAVAILABLE                      = 0x00010006
  VERSION_UNAVAILABLE                  = 0x00010007
  PLATFORM_ERROR                       = 0x00010008
  FORMAT_UNAVAILABLE                   = 0x00010009
  NO_WINDOW_CONTEXT                    = 0x0001000A

  FOCUSED                              = 0x00020001 # hint : Bool
  ICONIFIED                            = 0x00020002 # hint : Bool
  RESIZABLE                            = 0x00020003 # hint : Bool
  VISIBLE                              = 0x00020004 # hint : Bool
  DECORATED                            = 0x00020005 # hint : Bool
  AUTO_ICONIFY                         = 0x00020006 # hint : Bool
  FLOATING                             = 0x00020007 # hint : Bool
  MAXIMIZED                            = 0x00020008 # hint : Bool

  RED_BITS                             = 0x00021001 # hint : Int32
  GREEN_BITS                           = 0x00021002 # hint : Int32
  BLUE_BITS                            = 0x00021003 # hint : Int32
  ALPHA_BITS                           = 0x00021004 # hint : Int32
  DEPTH_BITS                           = 0x00021005 # hint : Int32
  STENCIL_BITS                         = 0x00021006 # hint : Int32
  ACCUM_RED_BITS                       = 0x00021007 # hint : Int32
  ACCUM_GREEN_BITS                     = 0x00021008 # hint : Int32
  ACCUM_BLUE_BITS                      = 0x00021009 # hint : Int32
  ACCUM_ALPHA_BITS                     = 0x0002100A # hint : Int32
  AUX_BUFFERS                          = 0x0002100B # hint : Int32
  STEREO                               = 0x0002100C # hint : Bool (hard constraint)
  SAMPLES                              = 0x0002100D # hint : Int32
  SRGB_CAPABLE                         = 0x0002100E # hint : Bool
  REFRESH_RATE                         = 0x0002100F # hint : Int32
  DOUBLEBUFFER                         = 0x00021010 # hint : Bool (hard constraint)

  CLIENT_API                           = 0x00022001 # hint : GLFW::ClientApi (hard constraint)
  CONTEXT_VERSION_MAJOR                = 0x00022002 # hint : Int32
  CONTEXT_VERSION_MINOR                = 0x00022003 # hint : Int32
  CONTEXT_REVISION                     = 0x00022004 # hint : Int32
  CONTEXT_ROBUSTNESS                   = 0x00022005 # hint : GLFW::ContextRobustness
  OPENGL_FORWARD_COMPAT                = 0x00022006 # hint : Bool (hard constraint)
  OPENGL_DEBUG_CONTEXT                 = 0x00022007 # hint : Bool
  OPENGL_PROFILE                       = 0x00022008 # hint : GLFW::OpenGLProfile (hard constraint)
  CONTEXT_RELEASE_BEHAVIOR             = 0x00022009 # hint : GLFW::ContextReleaseBehavior
  CONTEXT_NO_ERROR                     = 0x0002200A # hint : Bool
  CONTEXT_CREATION_API                 = 0x0002200B # hint : GLFW::ContextCreation (hard constraint)

  # Corresponds to GLFW::ClientApi enum
  NO_API                               =          0
  OPENGL_API                           = 0x00030001
  OPENGL_ES_API                        = 0x00030002

  # Corresponds to GLFW::ContextRobustness
  NO_ROBUSTNESS                        =          0
  NO_RESET_NOTIFICATION                = 0x00031001
  LOSE_CONTEXT_ON_RESET                = 0x00031002

  # Corresponds to GLFW::OpenGLProfile enum
  OPENGL_ANY_PROFILE                   =          0
  OPENGL_CORE_PROFILE                  = 0x00032001
  OPENGL_COMPAT_PROFILE                = 0x00032002

  # Corresponds to GLFW::InputMode enum
  CURSOR                               = 0x00033001
  STICKY_KEYS                          = 0x00033002
  STICKY_MOUSE_BUTTONS                 = 0x00033003

  # Corresponds to GLFW::CursorInputMode enum
  CURSOR_NORMAL                        = 0x00034001
  CURSOR_HIDDEN                        = 0x00034002
  CURSOR_DISABLED                      = 0x00034003

  # Corresponds to GLFW::ContextReleaseBehavior enum
  ANY_RELEASE_BEHAVIOR                 =          0
  RELEASE_BEHAVIOR_FLUSH               = 0x00035001
  RELEASE_BEHAVIOR_NONE                = 0x00035002

  # Corresponds to GLFW::ContextCreation enum
  NATIVE_CONTEXT_API                   = 0x00036001
  EGL_CONTEXT_API                      = 0x00036002

  # Corresponds to GLFW::CursorShape enum
  ARROW_CURSOR                         = 0x00036001
  IBEAM_CURSOR                         = 0x00036002
  CROSSHAIR_CURSOR                     = 0x00036003
  HAND_CURSOR                          = 0x00036004
  HRESIZE_CURSOR                       = 0x00036005
  VRESIZE_CURSOR                       = 0x00036006

  # Corresponds to GLFW::Event::Monitor enum
  CONNECTED                            = 0x00040001
  DISCONNECTED                         = 0x00040002

  # Corresponds to Nil
  DONT_CARE                            = -1

  VK_SUCCESS                           =  0
  VK_NOT_READY                         =  1
  VK_TIMEOUT                           =  2
  VK_EVENT_SET                         =  3
  VK_EVENT_RESET                       =  4
  VK_INCOMPLETE                        =  5
  VK_ERROR_OUT_OF_HOST_MEMORY          = -1
  VK_ERROR_OUT_OF_DEVICE_MEMORY        = -2
  VK_ERROR_INITIALIZATION_FAILED       = -3
  VK_ERROR_DEVICE_LOST                 = -4
  VK_ERROR_MEMORY_MAP_FAILED           = -5
  VK_ERROR_LAYER_NOT_PRESENT           = -6
  VK_ERROR_EXTENSION_NOT_PRESENT       = -7
  VK_ERROR_FEATURE_NOT_PRESENT         = -8
  VK_ERROR_INCOMPATIBLE_DRIVER         = -9
  VK_ERROR_TOO_MANY_OBJECTS            = -10
  VK_ERROR_FORMAT_NOT_SUPPORTED        = -11
  VK_ERROR_FRAGMENTED_POOL             = -12
  VK_ERROR_OUT_OF_POOL_MEMORY          = -1000069000
  VK_ERROR_INVALID_EXTERNAL_HANDLE     = -1000072003
  VK_ERROR_SURFACE_LOST_KHR            = -1000000000
  VK_ERROR_NATIVE_WINDOW_IN_USE_KHR    = -1000000001
  VK_SUBOPTIMAL_KHR                    =  1000001003
  VK_ERROR_OUT_OF_DATE_KHR             = -1000001004
  VK_ERROR_INCOMPATIBLE_DISPLAY_KHR    = -1000003001
  VK_ERROR_VALIDATION_FAILED_EXT       = -1000011001
  VK_ERROR_INVALID_SHADER_NV           = -1000012000
  VK_ERROR_NOT_PERMITTED_EXT           = -1000174001
  VK_ERROR_OUT_OF_POOL_MEMORY_KHR      =  VK_ERROR_OUT_OF_POOL_MEMORY
  VK_ERROR_INVALID_EXTERNAL_HANDLE_KHR =  VK_ERROR_INVALID_EXTERNAL_HANDLE
  VK_RESULT_BEGIN_RANGE                =  VK_ERROR_FRAGMENTED_POOL
  VK_RESULT_END_RANGE                  =  VK_INCOMPLETE
  VK_RESULT_RANGE_SIZE                 =  VK_INCOMPLETE - VK_ERROR_FRAGMENTED_POOL + 1
  VK_RESULT_MAX_ENUM                   =  0x7FFFFFFF
end

