module GLFW
  struct VideoMode
    getter ptr : LibGLFW::VideoMode*

    private def initialize(@ptr)
    end

    private def dup
    end

    def width : Int32
      @ptr.value.width
    end

    def height : Int32
      @ptr.value.height
    end

    def red_bits : Int32
      @ptr.value.red_bits
    end

    def green_bits : Int32
      @ptr.value.green_bits
    end

    def blue_bits : Int32
      @ptr.value.blue_bits
    end

    def refresh_rate : Int32
      @ptr.value.refresh_rate
    end

    def to_unsafe : LibGLFW::VideoMode*
      @ptr
    end

    def to_s(io : IO)
      width = @ptr.value.width
      height = @ptr.value.height
      bpp = @ptr.value.red_bits + @ptr.value.green_bits + @ptr.value.blue_bits

      io << width << 'x' << height << " bpp: " << bpp
    end

    def inspect(io : IO)
      width = @ptr.value.width
      height = @ptr.value.height
      red_bits = @ptr.value.red_bits
      green_bits = @ptr.value.green_bits
      blue_bits = @ptr.value.blue_bits
      refresh_rate = @ptr.value.refresh_rate

      io << width << 'x' << height << " {red_bits: " << red_bits << 
      " green_bits: " << blue_bits << " blue_bits: " << blue_bits <<
      "} refresh_rate: " << refresh_rate << "Hz"
    end
  end
end