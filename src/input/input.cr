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
  #
  # This function sets the key callback of the specified window, which is called
  # when a key is pressed, repeated or released.
  #
  # The key functions deal with physical keys, with layout independent
  # key tokens named after their values in the standard US keyboard
  # layout. If you want to input text, use the `#set_char_callback` instead.
  #
  # When a window loses input focus, it will generate synthetic key release
  # events for all pressed keys. You can tell these events from user-generated
  # events by the fact that the synthetic ones are generated after the focus
  # loss event has been processed, i.e. after the callback set by
  # `#set_window_focus_callback` has been called.
  #
  # The scancode of a key is specific to that platform or sometimes even to that
  # machine. Scancodes are intended to allow users to bind keys that don't have
  # a GLFW key token. Such keys have `key` set to `GLFW::Key::Unknown`, their
  # state is not saved and so it cannot be queried with `#get_key`.
  #
  # Sometimes GLFW needs to generate synthetic key events, in which case the
  # scancode may be zero.
  #
  # `Parameters:`
  #
  # *`window`* The window whose callback to set.
  #
  # *`block`* The new key callback.
  #
  # Returns the previously set callback, or `nil` if no callback was set.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 1.0.
  # ```
  # # set callback with block
  # GLFW.set_key_callback(window) do |window, key, scancode, action, mods|
  #   if action.press?
  #     case key
  #     when .up?
  #       puts "Going up!"
  #     when .down?
  #       puts "Going down!"
  #     when .left?
  #       puts "Going left!"
  #     when .right?
  #       puts "Going right!"
  #     end
  #   end
  # end
  #
  # # set callback with method
  # def key_callback(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod)
  #   case action
  #   when .press?
  #     puts "#{key} is pressed"
  #   when .release?
  #     puts "#{key} is released"
  #   when .repeat?
  #     puts "#{key} is repeated"
  #   end
  # end
  #
  # GLFW.set_key_callback(window, &->key_callback(GLFW::Window, GLFW::Key, Int32, GLFW::Action, GLFW::Mod))
  # ```
  @[AlwaysInline]
  def self.set_key_callback(window : Window, &block : Window, Key, Int32, Action, Mod -> Void) : Proc(Window, Key, Int32, Action, Mod, Void)?
    old_callback = @@key_callback
    @@key_callback = block

    LibGLFW.set_key_callback(window.ptr, 
    ->(window : LibGLFW::Window*, key : Int32, scancode : Int32, action : Int32, mods : Int32) do
      if cb = @@key_callback
        cb.call(Window.new(window), Key.new(key), scancode, Action.new(action), Mod.new(mods))
      end
    end)

    old_callback
  end

  @@char_callback : Proc(Window, Char, Void)? = nil
  # Sets the Unicode character callback.
  #
  # This function sets the character callback of the specified window, which is
  # called when a Unicode character is input.
  #
  # The character callback is intended for Unicode text input. As it deals with
  # characters, it is keyboard layout dependent, whereas the key callback set
  # using `#set_key_callback` is not. Characters do not map 1:1
  # to physical keys, as a key may produce zero, one or more characters. If you
  # want to know whether a specific physical key was pressed or released, use
  # the key callback instead.
  #
  # The character callback behaves as system text input normally does and will
  # not be called if modifier keys are held down that would prevent normal text
  # input on that platform, for example a Super (Command) key on OS X or Alt key
  # on Windows. There is a character with modifiers callback which you can set
  # using `#set_char_mods_callback` that receives these events.
  #
  # `Parameters:`
  #
  # *`window`* The window whose callback to set.
  #
  # *`block`* The new char callback.
  #
  # Returns the previously set callback, or `nil` if no callback was set.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 2.4.
  # ```
  # # set callback with block
  # GLFW.set_char_callback(window) do |window, char|
  #   print char
  # end
  #
  # # set callback with method
  # def char_callback(window : GLFW::Window, char : Char)
  #   print char
  # end
  #
  # GLFW.set_char_callback(window, &->char_callback(GLFW::Window, Char))
  # ```
  @[AlwaysInline]
  def self.set_char_callback(window : Window, &block : Window, Char -> Void) : Proc(Window, Char, Void)?
    old_callback = @@char_callback
    @@char_callback = block

    LibGLFW.set_char_callback(window.ptr, ->(window : LibGLFW::Window*, codepoint : UInt32) do
      if cb = @@char_callback
        cb.call(Window.new(window), codepoint.chr)
      end
    end)

    old_callback
  end

  @@char_mods_callback : Proc(Window, Char, Mod, Void)? = nil
  # Sets the Unicode character with modifiers callback.
  @[AlwaysInline]
  def self.set_char_mods_callback(window : Window, &block : Window, Char, Mod -> Void) : Proc(Window, Char, Mod, Void)?
    old_callback = @@char_mods_callback
    @@char_mods_callback = block

    LibGLFW.set_char_mods_callback(window.ptr, ->(window : LibGLFW::Window*, codepoint : UInt32, mods : Int32) do
      if cb = @@char_mods_callback
        cb.call(Window.new(window), codepoint.chr, Mod.new(mods))
      end
    end)

    old_callback
  end

  @@mouse_button_callback : Proc(Window, MouseButton, Action, Mod, Void)? = nil
  # Sets the mouse button callback.
  @[AlwaysInline]
  def self.set_mouse_button_callback(window : Window, &block : Window, MouseButton, Action, Mod -> Void) : Proc(Window, MouseButton, Action, Mod, Void)?
    old_callback = @@mouse_button_callback
    @@mouse_button_callback = block

    LibGLFW.set_mouse_button_callback(window.ptr, ->(window : LibGLFW::Window*, button : Int32, action : Int32, mods : Int32) do
      if cb = @@mouse_button_callback
        cb.call(Window.new(window), MouseButton.new(button), Action.new(action), Mod.new(mods))
      end
    end)

    old_callback
  end

  @@cursor_pos_callback : Proc(Window, Float64, Float64, Void)? = nil
  # Sets the cursor position callback.
  @[AlwaysInline]
  def self.set_cursor_pos_callback(window : Window, &block : Window, Float64, Float64 -> Void) : Proc(Window, Float64, Float64, Void)?
    old_callback = @@cursor_pos_callback
    @@cursor_pos_callback = block

    LibGLFW.set_cursor_pos_callback(window.ptr, ->(window : LibGLFW::Window*, xpos : Float64, ypos : Float64) do
      if cb = @@cursor_pos_callback
        cb.call(Window.new(window), xpos, ypos)
      end
    end)

    old_callback
  end
  
  @@cursor_enter_callback : Proc(Window, Bool, Void)? = nil
  # Sets the cursor enter/exit callback.
  @[AlwaysInline]
  def self.set_cursor_enter_callback(window : Window, &block : Window, Bool -> Void) : Proc(Window, Bool, Void)?
    old_callback = @@cursor_enter_callback
    @@cursor_enter_callback = block

    LibGLFW.set_cursor_enter_callback(window.ptr, ->(window : LibGLFW::Window*, entered : Int32) do
      if cb = @@cursor_enter_callback
        cb.call(Window.new(window), entered == LibGLFW::TRUE ? true : false)
      end
    end)

    old_callback
  end

  @@scroll_callback : Proc(Window, Float64, Float64, Void)? = nil
  # Sets the scroll callback.
  @[AlwaysInline]
  def self.set_scroll_callback(window : Window, &block : Window, Float64, Float64 -> Void) : Proc(Window, Float64, Float64, Void)?
    old_callback = @@scroll_callback
    @@scroll_callback = block

    LibGLFW.set_scroll_callback(window.ptr, ->(window : LibGLFW::Window*, x_offset : Float64, y_offset : Float64) do
      if cb = @@scroll_callback
        cb.call(Window.new(window), x_offset, y_offset)
      end
    end)

    old_callback
  end

  @@drop_callback : Proc(Window, Array(String), Void)? = nil
  # Sets the file drop callback.
  @[AlwaysInline]
  def self.set_drop_callback(window : Window, &block : Window, Array(String) -> Void) : Proc(Window, Array(String), Void)?
    old_callback = @@drop_callback
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

    old_callback
  end

  # Returns whether the specified joystick is present.
  @[AlwaysInline]
  def self.joystick_present(joy : Joystick) : Bool
    LibGLFW.joystick_present(joy.value) == LibGLFW::TRUE ? true : false
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
    old_callback = @@joystick_callback
    @@joystick_callback = block

    LibGLFW.set_joystick_callback(->(joystick : Int32, event : Int32) do
      if cb = @@joystick_callback
        cb.call(Joystick.new(joystick), Event.new(event))
      end
    end)

    old_callback
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