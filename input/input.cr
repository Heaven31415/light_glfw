# TODO: change semantics of == for Window and probably even more classes

module GLFW
  # fun get_input_mode = glfwGetInputMode(window : Window*, mode : Int32) : Int32
  @[AlwaysInline]
  def self.get_cursor_input_mode(window : Window) : CursorInputMode
    CursorInputMode.new(LibGLFW.get_input_mode(window.ptr, InputMode::Cursor.value))
  end

  # fun get_input_mode = glfwGetInputMode(window : Window*, mode : Int32) : Int32
  @[AlwaysInline]
  def self.get_sticky_keys(window : Window) : Bool
    LibGLFW.get_input_mode(window.ptr, InputMode::StickyKeys.value) == LibGLFW::TRUE ? true : false
  end

  # fun get_input_mode = glfwGetInputMode(window : Window*, mode : Int32) : Int32
  @[AlwaysInline]
  def self.get_sticky_mouse_buttons(window : Window) : Bool
    LibGLFW.get_input_mode(window.ptr, InputMode::StickyMouseButtons.value) == LibGLFW::TRUE ? true : false
  end

  # fun set_input_mode = glfwSetInputMode(window : Window*, mode : Int32, value : Int32) : Void
  @[AlwaysInline]
  def self.set_cursor_input_mode(window : Window, value : InputMode::Cursor) : Nil
    LibGLFW.set_input_mode(window.ptr, InputMode::Cursor.value, value.value)
  end

  # fun set_input_mode = glfwSetInputMode(window : Window*, mode : Int32, value : Int32) : Void
  @[AlwaysInline]
  def self.set_sticky_keys(window : Window, value : Bool) : Nil
    LibGLFW.set_input_mode(window.ptr, InputMode::StickyKeys.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # fun set_input_mode = glfwSetInputMode(window : Window*, mode : Int32, value : Int32) : Void
  @[AlwaysInline]
  def self.set_sticky_mouse_buttons(window : Window, value : Bool) : Nil
    LibGLFW.set_input_mode(window.ptr, InputMode::StickyMouseButtons.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # fun get_key_name = glfwGetKeyName(key : Int32, scancode : Int32) : UInt8*
  @[AlwaysInline]
  def self.get_key_name(key : Key, scancode : Int32) : String?
    ptr = LibGLFW.get_key_name(key.value, scancode)
    if ptr.null?
      nil
    else
      String.new(ptr)
    end
  end

  # fun set_key_callback = glfwSetKeyCallback(window : Window*, cbfun : KeyFun) : KeyFun
  @@key_callback : Proc(Window, Key, Int32, Action, Mod, Void)? = nil
  @[AlwaysInline]
  def self.set_key_callback(window : Window, &block : Window, Key, Int32, Action, Mod -> Void)
    @@key_callback = block
    LibGLFW.set_key_callback(window, 
    ->(window : LibGLFW::Window*, key : Int32, scancode : Int32, action : Int32, mods : Int32) do
      if cb = @@key_callback
        cb.call(Window.new(window), Key.new(key), scancode, Action.new(action), Mod.new(mods))
      end
    end)
  end
end