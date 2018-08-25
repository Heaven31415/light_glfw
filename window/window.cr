# todo: get rid of class methods for Window?
# todo: I think I should handle errors with exceptions

# todo: every method should be inlined and I should avoid to_unsafe implicit call
# todo: every method which doesn't return anything interesing should have Nil return value

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

  # fun window_hint = glfwWindowHint(hint : Int32, value : Int32) : Void
  @[AlwaysInline]
  def self.window_hint(hint : Hint, value : Int32) : Nil
    LibGLFW.window_hint(hint, value)
  end

  # fun window_hint = glfwWindowHint(hint : Int32, value : Int32) : Void
  @[AlwaysInline]
  def self.window_hint(hint : Hint, value : ClientApi) : Nil
    LibGLFW.window_hint(hint, value.value)
  end

  # fun window_hint = glfwWindowHint(hint : Int32, value : Int32) : Void
  @[AlwaysInline]
  def self.window_hint(hint : Hint, value : ContextRobustness) : Nil
    LibGLFW.window_hint(hint, value.value)
  end

  # fun window_hint = glfwWindowHint(hint : Int32, value : Int32) : Void
  @[AlwaysInline]
  def self.window_hint(hint : Hint, value : OpenGLProfile) : Nil
    LibGLFW.window_hint(hint, value.value)
  end

  # fun window_hint = glfwWindowHint(hint : Int32, value : Int32) : Void
  @[AlwaysInline]
  def self.window_hint(hint : Hint, value : ContextReleaseBehavior) : Nil
    LibGLFW.window_hint(hint, value.value)
  end

  # fun window_hint = glfwWindowHint(hint : Int32, value : Int32) : Void
  @[AlwaysInline]
  def self.window_hint(hint : Hint, value : ContextCreation) : Nil
    LibGLFW.window_hint(hint, value.value)
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
  def self.set_window_icon(window : Window, images : Array(Image)?) : Nil
    if images
      LibGLFW.set_window_icon(window.ptr, images.size, images.to_unsafe)
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