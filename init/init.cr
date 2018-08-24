module GLFW
  def self.init : Bool
    LibGLFW.init == LibGLFW::TRUE ? true : false
  end

  def self.terminate
    LibGLFW.terminate
  end

  def self.get_version : {major: Int32, minor: Int32, rev: Int32}
    LibGLFW.get_version(out major, out minor, out rev)
    {major: major, minor: minor, rev: rev}
  end

  def self.get_version_string : String
    String.new(LibGLFW.get_version_string)
  end

  @@error_callback : Proc(Error, String, Void)? = nil
  def self.set_error_callback(&block : Error, String -> Void)
    @@error_callback = block

    LibGLFW.set_error_callback ->(error : Int32, description : UInt8*) do
      if cb = @@error_callback
        cb.call(Error.new(error), String.new(description))
      end
    end
  end
end