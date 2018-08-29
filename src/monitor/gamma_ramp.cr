module GLFW
  struct GammaRamp
    getter ptr : LibGLFW::GammaRamp*

    def initialize(@ptr)
    end

    def to_unsafe : LibGLFW::GammaRamp*
      @ptr
    end

    def red : Slice(UInt16)
      Slice(UInt16).new(@ptr.value.red, @ptr.value.size)
    end

    def green : Slice(UInt16)
      Slice(UInt16).new(@ptr.value.green, @ptr.value.size)
    end

    def blue : Slice(UInt16)
      Slice(UInt16).new(@ptr.value.blue, @ptr.value.size)
    end

    def size : UInt32
      @ptr.value.size
    end
  end
end