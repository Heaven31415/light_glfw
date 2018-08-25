# todo: get rid of class methods for Window?

module GLFW
  struct Window
    getter ptr : LibGLFW::Window*

    def initialize(@ptr)
    end

    def to_unsafe : LibGLFW::Window*
      @ptr
    end
  end

  def self.default_window_hints
    LibGLFW.default_window_hints
  end

  # fun window_hint = glfwWindowHint(hint : Int32, value : Int32) : Void
  # GLFW::Hint => enum
  # GLFW::Value
  def self.window_hint(hint : Int32, value : Int32)
    LibGLFW.window_hint(hint, value)
  end

  def self.create_window(width : Int32, height : Int32, title : String, monitor : Monitor? = nil, share : Window? = nil) : Window
    Window.new(LibGLFW.create_window(width, height, title, monitor, share))
  end

  def self.destroy_window(window : Window)
    LibGLFW.destroy_window(window)
  end

  def self.window_should_close(window : Window) : Bool
    LibGLFW.window_should_close(window) == LibGLFW::TRUE ? true : false
  end

  def self.set_window_should_close(window : Window, value : Bool)
    LibGLFW.set_window_should_close(window, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  def self.set_window_title(window : Window, title : String) : Void
    LibGLFW.set_window_title(window, title)
  end

  # fun set_window_icon = glfwSetWindowIcon(window : Window*, count : Int32, images : Image*) : Void
  def self.set_window_default_icon(window : Window) : Void
    LibGLFW.set_window_icon(window, 0, nil)
  end

  def self.set_window_icon(window : Window, image : Image) : Void
    LibGLFW.set_window_icon(window, 1, image)
  end

  # fun get_window_pos = glfwGetWindowPos(window : Window*, xpos : Int32*, ypos : Int32*) : Void
  def self.get_window_pos(window : Window) : {x: Int32, y: Int32}
    LibGLFW.get_window_pos(window, out xpos, out ypos)
    {x: xpos, y: ypos}
  end

  # fun set_window_pos = glfwSetWindowPos(window : Window*, xpos : Int32, ypos : Int32) : Void
  def self.set_window_pos(window : Window, position : {x: Int32, y: Int32})
    LibGLFW.set_window_pos(window, position[:x], position[:y])
  end

  # fun get_window_size = glfwGetWindowSize(window : Window*, width : Int32*, height : Int32*) : Void
  def self.get_window_size(window : Window) : {width: Int32, height: Int32}
    LibGLFW.get_window_size(window, out w, out h)
    {width: w, height: h}
  end

  # fun set_window_size_limits = glfwSetWindowSizeLimits(window : Window*, min_width : Int32, min_height : Int32, max_width : Int32, max_height : Int32) : Void
  def self.set_window_size_limits(window : Window, min_width : Int32, min_height : Int32, max_width : Int32, max_height : Int32)
    LibGLFW.set_window_size_limits(window, min_width, min_height, max_width, max_height)
  end

  # fun set_window_aspect_ratio = glfwSetWindowAspectRatio(window : Window*, numer : Int32, denom : Int32) : Void
  def self.set_window_aspect_ratio(window : Window, numerator : Int32, denominator : Int32)
    LibGLFW.set_window_aspect_ratio(window, numerator, denominator)
  end

  # fun set_window_size = glfwSetWindowSize(window : Window*, width : Int32, height : Int32) : Void
  def self.set_window_size(window : Window, width : Int32, height : Int32)
    LibGLFW.set_window_size(window, width, height)
  end

  # fun get_framebuffer_size = glfwGetFramebufferSize(window : Window*, width : Int32*, height : Int32*) : Void
  def self.get_framebuffer_size(window : Window) : {width: Int32, height: Int32}
    LibGLFW.get_framebuffer_size(window, out w, out h)
    {width: w, height: h}
  end

  # fun get_window_frame_size = glfwGetWindowFrameSize(window : Window*, left : Int32*, top : Int32*, right : Int32*, bottom : Int32*) : Void
  def self.get_window_frame_size(window : Window) : {left: Int32, top: Int32, right: Int32, bottom: Int32}
    LibGLFW.get_window_frame_size(window, out l, out t, out r, out b)
    {left: l, top: t, right: r, bottom: b}
  end

  # fun iconify_window = glfwIconifyWindow(window : Window*) : Void
  def self.iconify_window(window : Window)
    LibGLFW.iconify_window(window)
  end

  # fun restore_window = glfwRestoreWindow(window : Window*) : Void
  def self.restore_window(window : Window)
    LibGLFW.restore_window(window)
  end

  # fun maximize_window = glfwMaximizeWindow(window : Window*) : Void
  def self.maximize_window(window : Window)
    LibGLFW.maximize_window(window)
  end

  # fun show_window = glfwShowWindow(window : Window*) : Void
  def self.show_window(window : Window)
    LibGLFW.show_window(window)
  end

  # fun hide_window = glfwHideWindow(window : Window*) : Void
  def self.hide_window(window : Window)
    LibGLFW.hide_window(window)
  end

  # fun focus_window = glfwFocusWindow(window : Window*) : Void
  def self.focus_window(window : Window)
    LibGLFW.focus_window(window)
  end
end