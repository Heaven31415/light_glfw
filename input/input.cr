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

  # fun joystick_present = glfwJoystickPresent(joy : Int32) : Int32
  def self.joystick_present(joy : Joystick) : Bool
    LibGLFW.joystick_present(joy.value) == GLFW::TRUE ? true : false
  end

  # fun get_joystick_axes = glfwGetJoystickAxes(joy : Int32, count : Int32*) : Float32*
  @[AlwaysInline]
  def self.get_joystick_axes(joy : Joystick) : Array(Float32)?
    ptr = LibGLFW.get_joystick_axes(joy.value, out count)
    if ptr.null?
      nil
    else
      axes = Array(Float32).new(count)
      count.times do |i|
        axes << ptr[i]
      end
      axes
    end
  end

  # fun get_joystick_buttons = glfwGetJoystickButtons(joy : Int32, count : Int32*) : UInt8*
  @[AlwaysInline]
  def self.get_joystick_buttons(joy : Joystick) : Array(Action)?
    ptr = LibGLFW.get_joystick_buttons(joy.value, out count)
    if ptr.null?
      nil
    else
      buttons = Array(Action).new(count)
      count.times do |i|
        buttons << Action.new(ptr[i])
      end
      buttons
    end
  end

  # fun get_joystick_name = glfwGetJoystickName(joy : Int32) : UInt8*
  @[AlwaysInline]
  def self.get_joystick_name(joy : Joystick) : String?
    ptr = LibGLFW.get_joystick_name(joy.value)
    if ptr.null?
      nil
    else
      String.new(ptr)
    end
  end

  # fun set_clipboard_string = glfwSetClipboardString(window : Window*, string : UInt8*) : Void
  @[AlwaysInline]
  def self.set_clipboard_string(window : Window, string : String) : Nil
    LibGLFW.set_clipboard_string(window.ptr, string.to_unsafe)
  end

  # fun get_clipboard_string = glfwGetClipboardString(window : Window*) : UInt8*
  @[AlwaysInline]
  def self.get_clipboard_string(window : Window) : String?
    ptr = LibGLFW.get_clipboard_string(window.ptr)
    if ptr.null?
      nil
    else
      String.new(ptr)
    end
  end

  # fun get_time = glfwGetTime : Float64
  @[AlwaysInline]
  def self.get_time : Float64
    LibGLFW.get_time
  end

  # fun set_time = glfwSetTime(time : Float64) : Void
  @[AlwaysInline]
  def self.set_time(time : Float64) : Nil
    LibGLFW.set_time(time)
  end

  # fun get_timer_value = glfwGetTimerValue : UInt64
  @[AlwaysInline]
  def self.get_timer_value : UInt64
    LibGLFW.get_timer_value
  end

  # fun get_timer_frequency = glfwGetTimerFrequency : UInt64
  @[AlwaysInline]
  def self.get_timer_frequency : UInt64
    LibGLFW.get_timer_frequency
  end
end