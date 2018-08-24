module GLFW
  class Image
    getter width : Int32
    getter height : Int32
    getter pixels : Slice(UInt8)

    def initialize(@width, @height, @pixels)
    end

    def to_unsafe : LibGLFW::Image*
      image_ptr = Pointer(LibGLFW::Image).malloc
      image = image_ptr.value
      image.width = @width
      image.height = @height
      image.pixels = @pixels.to_unsafe
      image_ptr
    end

    def width : Int32
      @ptr.value.width
    end

    def height : Int32
      @ptr.value.height
    end

    def pixels : Slice(UInt8)
      Slice(UInt8).new(@ptr.value.pixels, @ptr.value.width * @ptr.value.height)
    end
  end
end