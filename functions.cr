# functions definitions

require "./constants.cr"
require "./typedefs.cr"

@[Link("glfw")]
lib LibGLFW
  # init
  fun init = glfwInit : Int32
  fun terminate = glfwTerminate : Void
  fun get_version = glfwGetVersion(major : Int32*, minor : Int32*, rev : Int32*) : Void
  fun get_version_string = glfwGetVersionString : UInt8*
  fun set_error_callback = glfwSetErrorCallback(cbfun : ErrorFun) : ErrorFun
  # monitor
  fun get_monitors = glfwGetMonitors(count : Int32*) : Monitor**
  fun get_primary_monitor = glfwGetPrimaryMonitor : Monitor*
  fun get_monitor_pos = glfwGetMonitorPos(monitor : Monitor*, xpos : Int32*, ypos : Int32*) : Void
  fun get_monitor_physical_size = glfwGetMonitorPhysicalSize(monitor : Monitor*, width : Int32*, height : Int32*) : Void
  fun get_monitor_name = glfwGetMonitorName(monitor : Monitor*) : UInt8*
  fun set_monitor_callback = glfwSetMonitorCallback(cbfun : MonitorFun) : MonitorFun
  fun get_video_modes = glfwGetVideoModes(monitor : Monitor*, count : Int32*) : VideoMode*
  fun get_video_mode = glfwGetVideoMode(monitor : Monitor*) : VideoMode*
  fun set_gamma = glfwSetGamma(monitor : Monitor*, gamma : Float32) : Void
  fun get_gamma_ramp = glfwGetGammaRamp(monitor : Monitor*) : GammaRamp*
  fun set_gamma_ramp = glfwSetGammaRamp(monitor : Monitor*, ramp : GammaRamp*) : Void
  # window
  fun default_window_hints = glfwDefaultWindowHints : Void
  fun window_hint = glfwWindowHint(hint : Int32, value : Int32) : Void
  fun create_window = glfwCreateWindow(width : Int32, height : Int32, title : UInt8*, monitor : Monitor*, share : Window*) : Window*
  fun destroy_window = glfwDestroyWindow(window : Window*) : Void
  fun window_should_close = glfwWindowShouldClose(window : Window*) : Int32
  fun set_window_should_close = glfwSetWindowShouldClose(window : Window*, value : Int32) : Void
  fun set_window_title = glfwSetWindowTitle(window : Window*, title : UInt8*) : Void
  fun set_window_icon = glfwSetWindowIcon(window : Window*, count : Int32, images : Image*) : Void
  fun get_window_pos = glfwGetWindowPos(window : Window*, xpos : Int32*, ypos : Int32*) : Void
  fun set_window_pos = glfwSetWindowPos(window : Window*, xpos : Int32, ypos : Int32) : Void
  fun get_window_size = glfwGetWindowSize(window : Window*, width : Int32*, height : Int32*) : Void
  fun set_window_size_limits = glfwSetWindowSizeLimits(window : Window*, min_width : Int32, min_height : Int32, max_width : Int32, max_height : Int32) : Void
  fun set_window_aspect_ratio = glfwSetWindowAspectRatio(window : Window*, numer : Int32, denom : Int32) : Void
  fun set_window_size = glfwSetWindowSize(window : Window*, width : Int32, height : Int32) : Void
  fun get_framebuffer_size = glfwGetFramebufferSize(window : Window*, width : Int32*, height : Int32*) : Void
  fun get_window_frame_size = glfwGetWindowFrameSize(window : Window*, left : Int32*, top : Int32*, right : Int32*, bottom : Int32*) : Void
  fun iconify_window = glfwIconifyWindow(window : Window*) : Void
  fun restore_window = glfwRestoreWindow(window : Window*) : Void
  fun maximize_window = glfwMaximizeWindow(window : Window*) : Void
  fun show_window = glfwShowWindow(window : Window*) : Void
  fun hide_window = glfwHideWindow(window : Window*) : Void
  fun focus_window = glfwFocusWindow(window : Window*) : Void
  fun get_window_monitor = glfwGetWindowMonitor(window : Window*) : Monitor*
  fun set_window_monitor = glfwSetWindowMonitor(window : Window*, monitor : Monitor*, xpos : Int32, ypos : Int32, width : Int32, height : Int32, refresh_rate : Int32) : Void
  fun get_window_attrib = glfwGetWindowAttrib(window : Window*, attrib : Int32) : Int32
  fun set_window_user_pointer = glfwSetWindowUserPointer(window : Window*, pointer : Void*) : Void
  fun get_window_user_pointer = glfwGetWindowUserPointer(window : Window*) : Void*
  fun set_window_pos_callback = glfwSetWindowPosCallback(window : Window*, cbfun : WindowPosFun) : WindowPosFun
  fun set_window_size_callback = glfwSetWindowSizeCallback(window : Window*, cbfun : WindowSizeFun) : WindowSizeFun
  fun set_window_close_callback = glfwSetWindowCloseCallback(window : Window*, cbfun : WindowCloseFun) : WindowCloseFun
  fun set_window_refresh_callback = glfwSetWindowRefreshCallback(window : Window*, cbfun : WindowRefreshFun) : WindowRefreshFun
  fun set_window_focus_callback = glfwSetWindowFocusCallback(window : Window*, cbfun : WindowFocusFun) : WindowFocusFun
  fun set_window_iconify_callback = glfwSetWindowIconifyCallback(window : Window*, cbfun : WindowIconifyFun) : WindowIconifyFun
  fun set_framebuffer_size_callback = glfwSetFramebufferSizeCallback(window : Window*, cbfun : FramebufferSizeFun) : FramebufferSizeFun
  fun poll_events = glfwPollEvents : Void
  fun wait_events = glfwWaitEvents : Void
  fun wait_events_timeout = glfwWaitEventsTimeout(timeout : Float64) : Void
  fun post_empty_event = glfwPostEmptyEvent : Void
  fun swap_buffers = glfwSwapBuffers(window : Window*) : Void
  # input
  fun get_input_mode = glfwGetInputMode(window : Window*, mode : Int32) : Int32
  fun set_input_mode = glfwSetInputMode(window : Window*, mode : Int32, value : Int32) : Void
  fun get_key_name = glfwGetKeyName(key : Int32, scancode : Int32) : UInt8*
  fun get_key = glfwGetKey(window : Window*, key : Int32) : Int32 
  fun get_mouse_button = glfwGetMouseButton(window : Window*, button : Int32) : Int32
  fun get_cursor_pos = glfwGetCursorPos(window : Window*, xpos : Float64*, ypos : Float64*) : Void
  fun set_cursor_pos = glfwSetCursorPos(window : Window*, xpos : Float64, ypos : Float64) : Void
  fun create_cursor = glfwCreateCursor(image : Image*, xhot : Int32, yhot : Int32) : Cursor*
  fun create_standard_cursor = glfwCreateStandardCursor(shape : Int32) : Cursor*
  fun destroy_cursor = glfwDestroyCursor(cursor : Cursor*) : Void
  fun set_cursor = glfwSetCursor(window : Window*, cursor : Cursor*) : Void
  fun set_key_callback = glfwSetKeyCallback(window : Window*, cbfun : KeyFun) : KeyFun
  fun set_char_callback = glfwSetCharCallback(window : Window*, cbfun : CharFun) : CharFun
  fun set_char_mods_callback = glfwSetCharModsCallback(window : Window*, cbfun : CharModsFun) : CharModsFun
  fun set_mouse_button_callback = glfwSetMouseButtonCallback(window : Window*, cbfun : MouseButtonFun) : MouseButtonFun
  fun set_cursor_pos_callback = glfwSetCursorPosCallback(window : Window*, cbfun : CursorPosFun) : CursorPosFun
  fun set_cursor_enter_callback = glfwSetCursorEnterCallback(window : Window*, cbfun : CursorEnterFun) : CursorEnterFun
  fun set_scroll_callback = glfwSetScrollCallback(window : Window*, cbfun : ScrollFun) : ScrollFun
  fun set_drop_callback = glfwSetDropCallback(window : Window*, cbfun : DropFun) : DropFun
  fun joystick_present = glfwJoystickPresent(joy : Int32) : Int32
  fun get_joystick_axes = glfwGetJoystickAxes(joy : Int32, count : Int32*) : Float32*
  fun get_joystick_buttons = glfwGetJoystickButtons(joy : Int32, count : Int32*) : UInt8*
  fun get_joystick_name = glfwGetJoystickName(joy : Int32) : UInt8*
  fun set_joystick_callback = glfwSetJoystickCallback(cbfun : JoystickFun) : JoystickFun
  fun set_clipboard_string = glfwSetClipboardString(window : Window*, string : UInt8*) : Void
  fun get_clipboard_string = glfwGetClipboardString(window : Window*) : UInt8*
  fun get_time = glfwGetTime : Float64
  fun set_time = glfwSetTime(time : Float64) : Void
  fun get_timer_value = glfwGetTimerValue : UInt64
  fun get_timer_frequency = glfwGetTimerFrequency : UInt64
  # context
  fun make_context_current = glfwMakeContextCurrent(window : Window*) : Void
  fun get_current_context = glfwGetCurrentContext : Window*
  fun swap_interval = glfwSwapInterval(interval : Int32) : Void
  fun extension_supported = glfwExtensionSupported(extension : UInt8*) : Int32
  fun get_proc_address = glfwGetProcAddress(procname : UInt8*) : GlProc
  # vulkan
  fun vulkan_supported = glfwVulkanSupported : Int32
  fun get_required_instance_extensions = glfwGetRequiredInstanceExtensions(count : UInt32) : UInt8**
  # GLFWvkproc glfwGetInstanceProcAddress(VkInstance instance, const char* procname)
  # int glfwGetPhysicalDevicePresentationSupport(VkInstance instance, VkPhysicalDevice device, uint32_t queuefamily)
  # VkResult glfwCreateWindowSurface(VkInstance instance, GLFWwindow* window, const VkAllocationCallbacks* allocator, VkSurfaceKHR* surface)
end