module GLFW
  # fun init = glfwInit : Int32
  @[AlwaysInline]
  def self.init : Bool
    LibGLFW.init == LibGLFW::TRUE ? true : false
  end

  # fun terminate = glfwTerminate : Void
  @[AlwaysInline]
  def self.terminate : Nil
    LibGLFW.terminate
  end

  # fun get_version = glfwGetVersion(major : Int32*, minor : Int32*, rev : Int32*) : Void
  @[AlwaysInline]
  def self.get_version : {major: Int32, minor: Int32, rev: Int32}
    LibGLFW.get_version(out major, out minor, out rev)
    {major: major, minor: minor, rev: rev}
  end

  # fun get_version_string = glfwGetVersionString : UInt8*
  @[AlwaysInline]
  def self.get_version_string : String
    String.new(LibGLFW.get_version_string)
  end

  # fun set_error_callback = glfwSetErrorCallback(cbfun : ErrorFun) : ErrorFun
  @@error_callback : Proc(Error, String, Void)? = nil
  @[AlwaysInline]
  def self.set_error_callback(&block : Error, String -> Void) : Proc(Error, String, Void)?
    @@error_callback = block
    LibGLFW.set_error_callback ->(error : Int32, description : UInt8*) do
      if cb = @@error_callback
        cb.call(Error.new(error), String.new(description))
      end
    end
    @@error_callback
  end
end