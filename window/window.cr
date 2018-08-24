module GLFW
  class Window
    getter ptr : LibGLFW::Window*

    def initialize(@ptr)
    end

    def to_unsafe : LibGLFW::Window*
      @ptr
    end

    # fun default_window_hints = glfwDefaultWindowHints : Void
    def self.set_default_hints
      LibGLFW.default_window_hints
    end

    # fun window_hint = glfwWindowHint(hint : Int32, value : Int32) : Void
    # GLFW::Hint => enum
    # GLFW::Value
    def self.set_hint(hint : Int32, value : Int32)
      LibGLFW.window_hint(hint, value)
    end
    # fun create_window = glfwCreateWindow(width : Int32, height : Int32, title : UInt8*, monitor : Monitor*, share : Window*) : Window*
    def self.create(width : Int32, height : Int32, title : String, monitor : Monitor? = nil, share : Window? = nil) : Window
      Window.new(LibGLFW.create_window(width, height, title, monitor, share))
    end

    # fun destroy_window = glfwDestroyWindow(window : Window*) : Void
    def self.destroy(window : Window)
      LibGLFW.destroy_window(window)
    end

    # fun window_should_close = glfwWindowShouldClose(window : Window*) : Int32
    def self.should_close(window : Window) : Bool
      LibGLFW.window_should_close(window) == LibGLFW::TRUE ? true : false
    end

    # fun set_window_should_close = glfwSetWindowShouldClose(window : Window*, value : Int32) : Void
    def self.set_should_close(window : Window, value : Bool)
      LibGLFW.set_window_should_close(window, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
    end

    # fun set_window_title = glfwSetWindowTitle(window : Window*, title : UInt8*) : Void
    def self.set_title(window : Window, title : String) : Void
      LibGLFW.set_window_title(window, title)
    end

    # fun set_window_icon = glfwSetWindowIcon(window : Window*, count : Int32, images : Image*) : Void
    def self.set_default_icon(window : Window) : Void
      LibGLFW.set_window_icon(window, 0, nil)
    end

    def self.set_icon(window : Window, image : Image) : Void
      LibGLFW.set_window_icon(window, 1, image)
    end

    # fun get_window_attrib = glfwGetWindowAttrib(window : Window*, attrib : Int32) : Int32
  end
end