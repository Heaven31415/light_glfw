module GLFW
  struct Cursor
    getter ptr : LibGLFW::Cursor*

    private def initialize(@ptr)
    end

    private def dup
    end

    def to_unsafe : LibGLFW::Cursor*
      @ptr
    end
  end
end