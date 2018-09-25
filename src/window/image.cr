module GLFW
  struct Image
    getter width  : Int32
    getter height : Int32
    getter pixels : Pointer(UInt8)

    def initialize(@width, @height, @pixels)
    end

    def to_unsafe : LibGLFW::Image*
      image = Pointer(LibGLFW::Image).malloc
      image.value.width = @width
      image.value.height = @height
      image.value.pixels = @pixels
      image
    end
  end
end