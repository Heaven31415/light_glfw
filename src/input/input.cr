# TODO: change semantics of == for Window and probably even more classes

module GLFW
  # Returns the value of an input option for the specified window.
  @[AlwaysInline]
  def self.get_cursor_input_mode(window : Window) : CursorInputMode
    CursorInputMode.new(LibGLFW.get_input_mode(window.ptr, InputMode::Cursor.value))
  end

  # Returns the value of an input option for the specified window.
  @[AlwaysInline]
  def self.get_sticky_keys(window : Window) : Bool
    LibGLFW.get_input_mode(window.ptr, InputMode::StickyKeys.value) == LibGLFW::TRUE ? true : false
  end

  # Returns the value of an input option for the specified window.
  @[AlwaysInline]
  def self.get_sticky_mouse_buttons(window : Window) : Bool
    LibGLFW.get_input_mode(window.ptr, InputMode::StickyMouseButtons.value) == LibGLFW::TRUE ? true : false
  end

  # Sets an input option for the specified window.
  @[AlwaysInline]
  def self.set_cursor_input_mode(window : Window, value : InputMode::Cursor) : Nil
    LibGLFW.set_input_mode(window.ptr, InputMode::Cursor.value, value.value)
  end

  # Sets an input option for the specified window.
  @[AlwaysInline]
  def self.set_sticky_keys(window : Window, value : Bool) : Nil
    LibGLFW.set_input_mode(window.ptr, InputMode::StickyKeys.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # Sets an input option for the specified window.
  @[AlwaysInline]
  def self.set_sticky_mouse_buttons(window : Window, value : Bool) : Nil
    LibGLFW.set_input_mode(window.ptr, InputMode::StickyMouseButtons.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # Returns the localized name of the specified printable key.
  @[AlwaysInline]
  def self.get_key_name(key : Key, scancode : Int32) : String?
    ptr = LibGLFW.get_key_name(key.value, scancode)
    if ptr.null?
      nil
    else
      String.new(ptr)
    end
  end

  # Returns the last reported state of a keyboard key for the specified window.
  @[AlwaysInline]
  def self.get_key(window : Window, key : Key) : Action
    Action.new(LibGLFW.get_key(window.ptr, key.value))
  end

  # Returns the last reported state of a mouse button for the specified window.
  @[AlwaysInline]
  def self.get_mouse_button(window : Window, button : MouseButton) : Action
    Action.new(LibGLFW.get_mouse_button(window.ptr, button.value))
  end

  # Retrieves the position of the cursor relative to the client area of the window.
  @[AlwaysInline]
  def self.get_cursor_pos(window : Window) : {x: Int32, y: Int32}
    LibGLFW.get_cursor_pos(window.ptr, out xpos, out ypos)
    {x: xpos, y: ypos}
  end

  # Sets the position of the cursor, relative to the client area of the window.
  @[AlwaysInline]
  def self.set_cursor_pos(window : Window, x : Float64, y : Float64) : Nil
    LibGLFW.set_cursor_pos(window.ptr, x, y)
  end

  # Creates a custom cursor.
  @[AlwaysInline]
  def self.create_cursor(image : Image, xhot : Int32, yhot : Int32) : Cursor?
    ptr = LibGLFW.create_cursor(image.ptr, xhot, yhot)
    if ptr.null?
      nil
    else
      Cursor.new(ptr)
    end
  end

  # Creates a cursor with a standard shape.
  @[AlwaysInline]
  def self.create_standard_cursor(shape : CursorShape) : Cursor?
    ptr = LibGLFW.create_standard_cursor(shape.value)
    if ptr.null?
      nil
    else
      Cursor.new(ptr)
    end
  end

  # Destroys a cursor.
  @[AlwaysInline]
  def self.destroy_cursor(cursor : Cursor) : Nil
    LibGLFW.destroy_cursor(cursor.ptr)
  end

  # Sets the cursor for the window.
  @[AlwaysInline]
  def self.set_cursor(window : Window, cursor : Cursor?) : Nil
    if cursor
      LibGLFW.set_cursor(window.ptr, cursor.ptr)
    else
      LibGLFW.set_cursor(window, nil)
    end
  end

  @@key_callback : Proc(Window, Key, Int32, Action, Mod, Void)? = nil
  # Sets the key callback.
  @[AlwaysInline]
  def self.set_key_callback(window : Window, &block : Window, Key, Int32, Action, Mod -> Void) : Proc(Window, Key, Int32, Action, Mod, Void)?
    @@key_callback = block
    LibGLFW.set_key_callback(window.ptr, 
    ->(window : LibGLFW::Window*, key : Int32, scancode : Int32, action : Int32, mods : Int32) do
      if cb = @@key_callback
        cb.call(Window.new(window), Key.new(key), scancode, Action.new(action), Mod.new(mods))
      end
    end)
    @@key_callback
  end

  @@char_callback : Proc(Window, Char, Void)? = nil
  # Sets the Unicode character callback.
  @[AlwaysInline]
  def self.set_char_callback(window : Window, &block : Window, Char -> Void) : Proc(Window, Char, Void)?
    @@char_callback = block
    LibGLFW.set_char_callback(window.ptr, ->(window : LibGLFW::Window*, codepoint : UInt32) do
      if cb = @@char_callback
        cb.call(Window.new(window), codepoint.chr)
      end
    end)
    @@char_callback
  end

  @@char_mods_callback : Proc(Window, Char, Mod, Void)? = nil
  # Sets the Unicode character with modifiers callback.
  @[AlwaysInline]
  def self.set_char_mods_callback(window : Window, &block : Window, Char, Mod -> Void) : Proc(Window, Char, Mod, Void)?
    @@char_mods_callback = block
    LibGLFW.set_char_mods_callback(window.ptr, ->(window : LibGLFW::Window*, codepoint : UInt32, mods : Int32) do
      if cb = @@char_mods_callback
        cb.call(Window.new(window), codepoint.chr, Mod.new(mods))
      end
    end)
    @@char_mods_callback
  end

  @@mouse_button_callback : Proc(Window, MouseButton, Action, Mod, Void)? = nil
  # Sets the mouse button callback.
  @[AlwaysInline]
  def self.set_mouse_button_callback(window : Window, &block : Window, MouseButton, Action, Mod -> Void) : Proc(Window, MouseButton, Action, Mod, Void)?
    @@mouse_button_callback = block
    LibGLFW.set_mouse_button_callback(window.ptr, ->(window : LibGLFW::Window*, button : Int32, action : Int32, mods : Int32) do
      if cb = @@mouse_button_callback
        cb.call(Window.new(window), MouseButton.new(button), Action.new(action), Mod.new(mods))
      end
    end)
    @@mouse_button_callback
  end

  @@cursor_pos_callback : Proc(Window, Float64, Float64, Void)? = nil
  # Sets the cursor position callback.
  @[AlwaysInline]
  def self.set_cursor_pos_callback(window : Window, &block : Window, Float64, Float64 -> Void) : Proc(Window, Float64, Float64, Void)?
    @@cursor_pos_callback = block
    LibGLFW.set_cursor_pos_callback(window.ptr, ->(window : LibGLFW::Window*, xpos : Float64, ypos : Float64) do
      if cb = @@cursor_pos_callback
        cb.call(Window.new(window), xpos, ypos)
      end
    end)
    @@cursor_pos_callback
  end
  
  @@cursor_enter_callback : Proc(Window, Bool, Void)? = nil
  # Sets the cursor enter/exit callback.
  @[AlwaysInline]
  def self.set_cursor_enter_callback(window : Window, &block : Window, Bool -> Void) : Proc(Window, Bool, Void)?
    @@cursor_enter_callback = block
    LibGLFW.set_cursor_enter_callback(window.ptr, ->(window : LibGLFW::Window*, entered : Int32) do
      if cb = @@cursor_enter_callback
        cb.call(Window.new(window), entered == LibGLFW::TRUE ? true : false)
      end
    end)
    @@cursor_enter_callback
  end

  @@scroll_callback : Proc(Window, Float64, Float64, Void)? = nil
  # Sets the scroll callback.
  @[AlwaysInline]
  def self.set_scroll_callback(window : Window, &block : Window, Float64, Float64 -> Void) : Proc(Window, Float64, Float64, Void)?
    @@scroll_callback = block
    LibGLFW.set_scroll_callback(window.ptr, ->(window : LibGLFW::Window*, x_offset : Float64, y_offset : Float64) do
      if cb = @@scroll_callback
        cb.call(Window.new(window), x_offset, y_offset)
      end
    end)
    @@scroll_callback
  end

  @@drop_callback : Proc(Window, Array(String), Void)? = nil
  # Sets the file drop callback.
  @[AlwaysInline]
  def self.set_drop_callback(window : Window, &block : Window, Array(String) -> Void) : Proc(Window, Array(String), Void)?
    @@drop_callback = block
    LibGLFW.set_drop_callback(window, ->(window : LibGLFW::Window*, count : Int32, paths : UInt8**) do
      if cb = @@drop_callback
        new_paths = Array(String).new(count)
        count.times do |i|
          new_paths << String.new(paths[i])
        end
        cb.call(Window.new(window), new_paths)
      end
    end)
    @@drop_callback
  end

  # Returns whether the specified joystick is present.
  @[AlwaysInline]
  def self.joystick_present(joy : Joystick) : Bool
    LibGLFW.joystick_present(joy.value) == GLFW::TRUE ? true : false
  end

  # Returns the values of all axes of the specified joystick.
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

  # Returns the state of all buttons of the specified joystick.
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

  # Returns the name of the specified joystick.
  @[AlwaysInline]
  def self.get_joystick_name(joy : Joystick) : String?
    ptr = LibGLFW.get_joystick_name(joy.value)
    if ptr.null?
      nil
    else
      String.new(ptr)
    end
  end

  @@joystick_callback : Proc(Joystick, Event, Void)? = nil
  # Sets the joystick configuration callback.
  @[AlwaysInline]
  def self.set_joystick_callback(&block : Joystick, Event -> Void) : Proc(Joystick, Event, Void)?
    @@joystick_callback = block
    LibGLFW.set_joystick_callback(->(joystick : Int32, event : Int32) do
      if cb = @@joystick_callback
        cb.call(Joystick.new(joystick), Event.new(event))
      end
    end)
    @@joystick_callback
  end

  # Sets the clipboard to the specified string.
  @[AlwaysInline]
  def self.set_clipboard_string(window : Window, string : String) : Nil
    LibGLFW.set_clipboard_string(window.ptr, string.to_unsafe)
  end

  # Returns the contents of the clipboard as a string.
  @[AlwaysInline]
  def self.get_clipboard_string(window : Window) : String?
    ptr = LibGLFW.get_clipboard_string(window.ptr)
    if ptr.null?
      nil
    else
      String.new(ptr)
    end
  end

  # Returns the value of the GLFW timer.
  @[AlwaysInline]
  def self.get_time : Float64
    LibGLFW.get_time
  end

  # Sets the GLFW timer.
  @[AlwaysInline]
  def self.set_time(time : Float64) : Nil
    LibGLFW.set_time(time)
  end

  # Returns the current value of the raw timer.
  @[AlwaysInline]
  def self.get_timer_value : UInt64
    LibGLFW.get_timer_value
  end

  # Returns the frequency, in Hz, of the raw timer.
  @[AlwaysInline]
  def self.get_timer_frequency : UInt64
    LibGLFW.get_timer_frequency
  end
end