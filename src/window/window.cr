# todo: get rid of class methods for Window?
# todo: I think I should handle errors with exceptions

# todo: every method should be inlined and I should avoid to_unsafe implicit call
# todo: every method which doesn't return anything interesing should have Nil return value

# todo: right now it's impossible to remove currently set callback, because
# user have to pass a block, instead of a proc, however someone can pass an empty block, is this enough?

module GLFW
  struct Window
    getter ptr : LibGLFW::Window*

    def initialize(@ptr)
    end

    def to_unsafe : LibGLFW::Window*
      @ptr
    end
  end

  # fun default_window_hints = glfwDefaultWindowHints : Void
  @[AlwaysInline]
  def self.default_window_hints : Nil
    LibGLFW.default_window_hints
  end

  # fun window_hint = glfwWindowHint(hint : Int32, value : Int32) : Void
  @[AlwaysInline]
  def self.window_hint(hint : Hint, value : Bool) : Nil
    LibGLFW.window_hint(hint, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_focused(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Focused.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_resizable(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Resizable.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_visible(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Visible.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_decorated(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Decorated.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_auto_iconify(value : Bool) : Nil
    LibGLFW.window_hint(Hint::AutoIconify.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_floating(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Floating.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_maximized(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Maximized.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_red_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::RedBits.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_green_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::GreenBits.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_blue_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::BlueBits.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_alpha_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::AlphaBits.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_depth_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::DepthBits.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_stencil_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::StencilBits.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_accum_red_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::AccumRedBits.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_accum_green_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::AccumGreenBits.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_accum_blue_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::AccumBlueBits.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_accum_alpha_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::AccumAlphaBits.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_aux_buffers(value : Int32) : Nil
    LibGLFW.window_hint(Hint::AuxBuffers.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_stereo(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Stereo.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_samples(value : Int32) : Nil
    LibGLFW.window_hint(Hint::Samples.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_srgb_capable(value : Bool) : Nil
    LibGLFW.window_hint(Hint::SrgbCapable.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_refresh_rate(value : Int32) : Nil
    LibGLFW.window_hint(Hint::RefreshRate.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_double_buffer(value : Bool) : Nil
    LibGLFW.window_hint(Hint::DoubleBuffer.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_client_api(value : ClientApi) : Nil
    LibGLFW.window_hint(Hint::ClientApi.value, value.value)
  end

  @[AlwaysInline]
  def self.window_hint_context_version_major(value : Int32) : Nil
    LibGLFW.window_hint(Hint::ContextVersionMajor.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_context_version_minor(value : Int32) : Nil
    LibGLFW.window_hint(Hint::ContextVersionMinor.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_context_robustness(value : ContextRobustness) : Nil
    LibGLFW.window_hint(Hint::ContextRobustness.value, value.value)
  end

  @[AlwaysInline]
  def self.window_hint_open_gl_forward_compat(value : Bool) : Nil
    LibGLFW.window_hint(Hint::OpenGLForwardCompat.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_open_gl_debug_context(value : Bool) : Nil
    LibGLFW.window_hint(Hint::OpenGLDebugContext.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_open_gl_profile(value : OpenGLProfile) : Nil
    LibGLFW.window_hint(Hint::OpenGLProfile.value, value.value)
  end

  @[AlwaysInline]
  def self.window_hint_context_release_behavior(value : ContextReleaseBehavior) : Nil
    LibGLFW.window_hint(Hint::ContextReleaseBehavior.value, value.value)
  end

  @[AlwaysInline]
  def self.window_hint_context_no_error(value : Bool) : Nil
    LibGLFW.window_hint(Hint::ContextNoError.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_context_creation_api(value : ContextCreationApi) : Nil
    LibGLFW.window_hint(Hint::ContextCreationApi.value, value.value)
  end

  # fun create_window = glfwCreateWindow(width : Int32, height : Int32, title : UInt8*, monitor : Monitor*, share : Window*) : Window*
  @[AlwaysInline]
  def self.create_window(width : Int32, height : Int32, title : String, monitor : Monitor? = nil, share : Window? = nil) : Window?
    ptr = LibGLFW.create_window(width, height, title, monitor, share)
    if ptr.null?
      nil
    else
      Window.new(ptr)
    end
  end

  # fun destroy_window = glfwDestroyWindow(window : Window*) : Void
  @[AlwaysInline]
  def self.destroy_window(window : Window) : Nil
    LibGLFW.destroy_window(window.ptr)
  end

  # fun window_should_close = glfwWindowShouldClose(window : Window*) : Int32
  @[AlwaysInline]
  def self.window_should_close(window : Window) : Bool
    LibGLFW.window_should_close(window.ptr) == LibGLFW::TRUE ? true : false
  end

  # fun set_window_should_close = glfwSetWindowShouldClose(window : Window*, value : Int32) : Void
  @[AlwaysInline]
  def self.set_window_should_close(window : Window, value : Bool) : Nil
    LibGLFW.set_window_should_close(window.ptr, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # fun set_window_title = glfwSetWindowTitle(window : Window*, title : UInt8*) : Void
  @[AlwaysInline]
  def self.set_window_title(window : Window, title : String) : Nil
    LibGLFW.set_window_title(window.ptr, title)
  end

  # fun set_window_icon = glfwSetWindowIcon(window : Window*, count : Int32, images : Image*) : Void
  @[AlwaysInline]
  def self.set_window_icon(window : Window, image : Image?) : Nil
    if image
      LibGLFW.set_window_icon(window.ptr, 1, image.to_unsafe)
    else
      LibGLFW.set_window_icon(window.ptr, 0, nil)
    end
  end

  # fun get_window_pos = glfwGetWindowPos(window : Window*, xpos : Int32*, ypos : Int32*) : Void
  @[AlwaysInline]
  def self.get_window_pos(window : Window) : {x: Int32, y: Int32}
    LibGLFW.get_window_pos(window.ptr, out xpos, out ypos)
    {x: xpos, y: ypos}
  end

  # fun set_window_pos = glfwSetWindowPos(window : Window*, xpos : Int32, ypos : Int32) : Void
  @[AlwaysInline]
  def self.set_window_pos(window : Window, position : {x: Int32, y: Int32}) : Nil
    LibGLFW.set_window_pos(window.ptr, position[:x], position[:y])
  end

  # fun get_window_size = glfwGetWindowSize(window : Window*, width : Int32*, height : Int32*) : Void
  @[AlwaysInline]
  def self.get_window_size(window : Window) : {width: Int32, height: Int32}
    LibGLFW.get_window_size(window.ptr, out w, out h)
    {width: w, height: h}
  end

  # fun set_window_size_limits = glfwSetWindowSizeLimits(window : Window*, min_width : Int32, min_height : Int32, max_width : Int32, max_height : Int32) : Void
  @[AlwaysInline]
  def self.set_window_size_limits(window : Window, min_width : Int32, min_height : Int32, max_width : Int32, max_height : Int32) : Nil
    LibGLFW.set_window_size_limits(window.ptr, min_width, min_height, max_width, max_height)
  end

  # fun set_window_aspect_ratio = glfwSetWindowAspectRatio(window : Window*, numer : Int32, denom : Int32) : Void
  @[AlwaysInline]
  def self.set_window_aspect_ratio(window : Window, numerator : Int32, denominator : Int32) : Nil
    LibGLFW.set_window_aspect_ratio(window.ptr, numerator, denominator)
  end

  # fun set_window_size = glfwSetWindowSize(window : Window*, width : Int32, height : Int32) : Void
  @[AlwaysInline]
  def self.set_window_size(window : Window, width : Int32, height : Int32) : Nil
    LibGLFW.set_window_size(window.ptr, width, height)
  end

  # fun get_framebuffer_size = glfwGetFramebufferSize(window : Window*, width : Int32*, height : Int32*) : Void
  @[AlwaysInline]
  def self.get_framebuffer_size(window : Window) : {width: Int32, height: Int32}
    LibGLFW.get_framebuffer_size(window.ptr, out w, out h)
    {width: w, height: h}
  end

  # fun get_window_frame_size = glfwGetWindowFrameSize(window : Window*, left : Int32*, top : Int32*, right : Int32*, bottom : Int32*) : Void
  @[AlwaysInline]
  def self.get_window_frame_size(window : Window) : {left: Int32, top: Int32, right: Int32, bottom: Int32}
    LibGLFW.get_window_frame_size(window.ptr, out l, out t, out r, out b)
    {left: l, top: t, right: r, bottom: b}
  end

  # fun iconify_window = glfwIconifyWindow(window : Window*) : Void
  @[AlwaysInline]
  def self.iconify_window(window : Window) : Nil
    LibGLFW.iconify_window(window.ptr)
  end

  # fun restore_window = glfwRestoreWindow(window : Window*) : Void
  @[AlwaysInline]
  def self.restore_window(window : Window) : Nil
    LibGLFW.restore_window(window.ptr)
  end

  # fun maximize_window = glfwMaximizeWindow(window : Window*) : Void
  @[AlwaysInline]
  def self.maximize_window(window : Window) : Nil
    LibGLFW.maximize_window(window.ptr)
  end

  # fun show_window = glfwShowWindow(window : Window*) : Void
  @[AlwaysInline]
  def self.show_window(window : Window) : Nil
    LibGLFW.show_window(window.ptr)
  end

  # fun hide_window = glfwHideWindow(window : Window*) : Void
  @[AlwaysInline]
  def self.hide_window(window : Window) : Nil
    LibGLFW.hide_window(window.ptr)
  end

  # fun focus_window = glfwFocusWindow(window : Window*) : Void
  @[AlwaysInline]
  def self.focus_window(window : Window) : Nil
    LibGLFW.focus_window(window.ptr)
  end

  # fun get_window_monitor = glfwGetWindowMonitor(window : Window*) : Monitor*
  @[AlwaysInline]
  def self.get_window_monitor(window : Window) : Monitor?
    ptr = LibGLFW.get_window_monitor(window.ptr)
    if ptr.null?
      nil
    else
      Monitor.new(ptr)
    end
  end

  # fun set_window_monitor = glfwSetWindowMonitor(window : Window*, monitor : Monitor*, xpos : Int32, ypos : Int32, width : Int32, height : Int32, refresh_rate : Int32) : Void
  @[AlwaysInline]
  def self.set_window_monitor(window : Window, monitor : Monitor?, xpos : Int32, ypos : Int32, width : Int32, height : Int32, refresh_rate : Int32?) : Nil
    LibGLFW.set_window_monitor(window.ptr, monitor, xpos, ypos, width, height, refresh_rate ? refresh_rate : LibGLFW::DONT_CARE)
  end

  # fun get_window_attrib = glfwGetWindowAttrib(window : Window*, attrib : Int32) : Int32
  @[AlwaysInline]
  def self.get_window_focused(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Focused) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_iconified(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Iconified) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_resizable(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Resizable) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_visible(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Visible) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_decorated(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Decorated) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_floating(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Floating) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_maximized(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Maximized) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_client_api(window : Window) : ClientApi
    ClientApi.new(LibGLFW.get_window_attrib(window.ptr, Attribute::ClientApi))
  end

  @[AlwaysInline]
  def self.get_window_context_version_major(window : Window) : Int32
    LibGLFW.get_window_attrib(window.ptr, Attribute::ContextVersionMajor)
  end

  @[AlwaysInline]
  def self.get_window_context_version_minor(window : Window) : Int32
    LibGLFW.get_window_attrib(window.ptr, Attribute::ContextVersionMinor)
  end

  @[AlwaysInline]
  def self.get_window_context_revision(window : Window) : Int32
    LibGLFW.get_window_attrib(window.ptr, Attribute::ContextRevision)
  end

  @[AlwaysInline]
  def self.get_window_context_robustness(window : Window) : ContextRobustness
    ContextRobustness.new(LibGLFW.get_window_attrib(window.ptr, Attribute::ContextRobustness))
  end

  @[AlwaysInline]
  def self.get_window_open_gl_forward_compat(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::OpenGLForwardCompat) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_open_gl_debug_context(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::OpenGLDebugContext) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_open_gl_profile(window : Window) : OpenGLProfile
    OpenGLProfile.new(LibGLFW.get_window_attrib(window.ptr, Attribute::OpenGLProfile))
  end

  @[AlwaysInline]
  def self.get_window_context_release_behavior(window : Window) : ContextReleaseBehavior
    ContextReleaseBehavior.new(LibGLFW.get_window_attrib(window.ptr, Attribute::ContextReleaseBehavior))
  end

  @[AlwaysInline]
  def self.get_window_context_no_error(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::ContextNoError) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_context_creation_api(window : Window) : ContextCreationApi
    ContextCreationApi.new(LibGLFW.get_window_attrib(window.ptr, Attribute::ContextCreationApi))
  end

  # fun set_window_user_pointer = glfwSetWindowUserPointer(window : Window*, pointer : Void*) : Void
  @[AlwaysInline]
  def self.set_window_user_pointer(window : Window, pointer : Pointer(Void)) : Nil
    LibGLFW.set_window_user_pointer(window.ptr, pointer)
  end

  # fun get_window_user_pointer = glfwGetWindowUserPointer(window : Window*) : Void*
  @[AlwaysInline]
  def self.get_window_user_pointer(window : Window) : Pointer(Void)
    LibGLFW.get_window_user_pointer(window.ptr)
  end

  # fun set_window_pos_callback = glfwSetWindowPosCallback(window : Window*, cbfun : WindowPosFun) : WindowPosFun
  # type WindowPosFun = Window*, Int32, Int32 -> Void
  @@pos_callback : Proc(Window, Int32, Int32, Void)? = nil
  @[AlwaysInline]
  def self.set_window_pos_callback(window : Window, &block : Window, Int32, Int32 -> Void) : Proc(Window, Int32, Int32, Void)?
    @@pos_callback = block
    LibGLFW.set_window_pos_callback(window.ptr, ->(window : LibGLFW::Window*, x : Int32, y : Int32) do 
      if cb = @@pos_callback
        cb.call(Window.new(window), x, y)
      end
    end)
    @@pos_callback
  end

  # fun set_window_size_callback = glfwSetWindowSizeCallback(window : Window*, cbfun : WindowSizeFun) : WindowSizeFun
  # type WindowSizeFun = Window*, Int32, Int32 -> Void
  @@size_callback : Proc(Window, Int32, Int32, Void)? = nil
  @[AlwaysInline]
  def self.set_window_size_callback(window : Window, &block : Window, Int32, Int32 -> Void) : Proc(Window, Int32, Int32, Void)?
    @@size_callback = block
    LibGLFW.set_window_size_callback(window.ptr, ->(window : LibGLFW::Window*, width : Int32, height : Int32) do
      if cb = @@size_callback
        cb.call(Window.new(window), width, height)
      end
    end)
    @@size_callback
  end

  # fun set_window_close_callback = glfwSetWindowCloseCallback(window : Window*, cbfun : WindowCloseFun) : WindowCloseFun
  # type WindowCloseFun = Window* -> Void
  @@close_callback : Proc(Window, Void)? = nil
  @[AlwaysInline]
  def self.set_window_close_callback(window : Window, &block : Window -> Void) : Proc(Window, Void)?
    @@close_callback = block
    LibGLFW.set_window_close_callback(window.ptr, ->(window : LibGLFW::Window*) do 
      if cb = @@close_callback
        cb.call(Window.new(window))
      end
    end)
    @@close_callback
  end

  # fun set_window_refresh_callback = glfwSetWindowRefreshCallback(window : Window*, cbfun : WindowRefreshFun) : WindowRefreshFun
  # type WindowRefreshFun = Window* -> Void
  @@refresh_callback : Proc(Window, Void)? = nil
  @[AlwaysInline]
  def self.set_window_refresh_callback(window : Window, &block : Window -> Void) : Proc(Window, Void)?
    @@refresh_callback = block
    LibGLFW.set_window_refresh_callback(window.ptr, ->(window : LibGLFW::Window*) do 
      if cb = @@refresh_callback
        cb.call(Window.new(window))
      end
    end)
    @@refresh_callback
  end

  # fun set_window_focus_callback = glfwSetWindowFocusCallback(window : Window*, cbfun : WindowFocusFun) : WindowFocusFun
  # type WindowFocusFun = Window*, Int32 -> Void
  @@focus_callback : Proc(Window, Bool, Void)? = nil
  @[AlwaysInline]
  def self.set_window_focus_callback(window : Window, &block : Window, Bool -> Void) : Proc(Window, Bool, Void)?
    @@focus_callback = block
    LibGLFW.set_window_focus_callback(window.ptr, ->(window : LibGLFW::Window*, focused : Int32) do
      if cb = @@focus_callback
        cb.call(Window.new(window), focused == LibGLFW::TRUE ? true : false)
      end
    end)
    @@focus_callback
  end

  # fun set_window_iconify_callback = glfwSetWindowIconifyCallback(window : Window*, cbfun : WindowIconifyFun) : WindowIconifyFun
  # type WindowIconifyFun = Window*, Int32 -> Void
  @@iconify_callback : Proc(Window, Bool, Void)? = nil
  @[AlwaysInline]
  def self.set_window_iconify_callback(window : Window, &block : Window, Bool -> Void) : Proc(Window, Bool, Void)?
    @@iconify_callback = block
    LibGLFW.set_window_iconify_callback(window.ptr, ->(window : LibGLFW::Window*, iconified : Int32) do
      if cb = @@iconify_callback
        cb.call(Window.new(window), iconified == LibGLFW::TRUE ? true : false)
      end
    end)
    @@iconify_callback
  end

  # fun set_framebuffer_size_callback = glfwSetFramebufferSizeCallback(window : Window*, cbfun : FramebufferSizeFun) : FramebufferSizeFun
  # type FramebufferSizeFun = Window*, Int32, Int32 -> Void
  @@framebuffer_size_callback : Proc(Window, Int32, Int32, Void)? = nil
  @[AlwaysInline]
  def self.set_framebuffer_size_callback(window : Window, &block : Window, Int32, Int32 -> Void) : Proc(Window, Int32, Int32, Void)?
    @@framebuffer_size_callback = block
    LibGLFW.set_framebuffer_size_callback(window.ptr, ->(window : LibGLFW::Window*, width : Int32, height : Int32) do
      if cb = @@framebuffer_size_callback
        cb.call(Window.new(window), width, height)
      end
    end)
    @@framebuffer_size_callback
  end

  # fun poll_events = glfwPollEvents : Void
  @[AlwaysInline]
  def self.poll_events : Nil
    LibGLFW.poll_events
  end

  # fun wait_events = glfwWaitEvents : Void
  @[AlwaysInline]
  def self.wait_events : Nil
    LibGLFW.wait_events
  end

  # fun wait_events_timeout = glfwWaitEventsTimeout(timeout : Float64) : Void
  @[AlwaysInline]
  def self.wait_events_timeout(timeout : Float64) : Nil
    LibGLFW.wait_events_timeout(timeout)
  end

  # fun post_empty_event = glfwPostEmptyEvent : Void
  @[AlwaysInline]
  def self.post_empty_event : Nil
    LibGLFW.post_empty_event
  end

  # fun swap_buffers = glfwSwapBuffers(window : Window*) : Void
  @[AlwaysInline]
  def self.swap_buffers(window : Window) : Nil
    LibGLFW.swap_buffers(window.ptr)
  end
end