module GLFW
  # fun make_context_current = glfwMakeContextCurrent(window : Window*) : Void
  @[AlwaysInline]
  def self.make_context_current(window : Window?) : Nil
    LibGLFW.make_context_current(window)
  end

  # fun get_current_context = glfwGetCurrentContext : Window*
  @[AlwaysInline]
  def self.get_current_context : Window?
    ptr = LibGLFW.get_current_context
    if ptr.null?
      nil
    else
      Window.new(ptr)
    end
  end

  # fun swap_interval = glfwSwapInterval(interval : Int32) : Void
  @[AlwaysInline]
  def self.swap_interval(interval : Int32) : Nil
    LibGLFW.swap_interval(interval)
  end

  # fun extension_supported = glfwExtensionSupported(extension : UInt8*) : Int32
  @[AlwaysInline]
  def self.extension_supported(extension : String) : Bool
    LibGLFW.extension_supported(extension.to_unsafe) == LibGLFW::TRUE ? true : false
  end

  # fun get_proc_address = glfwGetProcAddress(procname : UInt8*) : GlProc
  @[AlwaysInline]
  def self.get_proc_address(procname : String) : LibGLFW::GlProc
    LibGLFW.get_proc_address(procname.to_unsafe)
  end
end