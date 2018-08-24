module GLFW
  class VideoMode
    getter ptr : LibGLFW::VideoMode*
    def initialize(@ptr)
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

    def to_s(io : IO)
      io << @ptr.value.width << 'x' << @ptr.value.height << ' ' <<
      "red: " << @ptr.value.red_bits << ' ' << 
      "green: " << @ptr.value.green_bits << ' ' <<
      "blue: " << @ptr.value.blue_bits << ' ' <<
      "refresh_rate: " << @ptr.value.refresh_rate << " Hz"
    end
  end
end