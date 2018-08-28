module GLFW
  struct Cursor
    getter ptr : LibGLFW::Cursor*

    def initialize(@ptr)
    end

    def to_unsafe : LibGLFW::Cursor*
      @ptr
    end
  end
end