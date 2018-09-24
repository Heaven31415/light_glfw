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
    ptr.null? ? nil : String.new(ptr)
  end

  # Returns the last reported state of a keyboard key for the specified window.
  #
  # This function returns the last state reported for the specified key to the
  # specified window. The returned state is one of `GLFW::Action::Press` or
  # `GLFW::Action::Release`. The higher-level action `GLFW::Action::Repeat` is
  # only reported to the key callback.
  #
  # If the `GLFW::InputMode::StickyKeys` input mode is enabled, this function returns
  # `GLFW::Action::Press` the first time you call it for a key that was pressed, even if
  # that key has already been released.
  #
  # The key functions deal with physical keys, with key tokens
  # named after their use on the standard US keyboard layout. 
  # If you want to input text, use the Unicode character callback instead.
  #
  # The modifier key bit masks are not key tokens and cannot be
  # used with this function.
  #
  # `Parameters:`
  #
  # *`window`* The desired window.
  #
  # *`key`* The desired keyboard key. `GLFW::Key::Unknown` is
  # not a valid key for this function.
  #
  # Returns one of `GLFW::Action::Press` or `GLFW::Action::Release`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::InvalidEnum`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 1.0.
  @[AlwaysInline]
  def self.get_key(window : Window, key : Key) : Action
    Action.new(LibGLFW.get_key(window.ptr, key.value))
  end

  # Returns the last reported state of a mouse button for the specified window.
  #
  # This function returns the last state reported for the specified mouse button
  # to the specified window. The returned state is one of `GLFW::Action::Press` 
  # or `GLFW::Action::Release`.
  #
  # If the `GLFW::InputMode::StickyMouseButtons` is enabled, this function 
  # returns `GLFW::Action::Press` the first time you call it for a mouse button 
  # that was pressed, even if that mouse button has already been released.
  #
  # `Parameters:`
  #
  # *`window`* The desired window.
  #
  # *`button`* The desired mouse button.
  #
  # Returns one of `GLFW::Action::Press` or `GLFW::Action::Release`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::InvalidEnum`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 1.0.
  @[AlwaysInline]
  def self.get_mouse_button(window : Window, button : MouseButton) : Action
    Action.new(LibGLFW.get_mouse_button(window.ptr, button.value))
  end

  # Retrieves the position of the cursor relative to the client area of the window.
  #
  # This function returns the position of the cursor, in screen coordinates,
  # relative to the upper-left corner of the client area of the specified
  # window.
  #
  # If the cursor is disabled (with `GLFW::CursorInputMode::Disabled`) then 
  # the cursor position is unbounded and limited only by the minimum and maximum 
  # values of a `Float64`.
  #
  # If an error occurs, x and y position will be set to zero.
  #
  # `Parameters:`
  #
  # *`window`* The desired window.
  #
  # Returns NamedTuple with keys: `x : Float64`, `y : Float64`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.get_cursor_pos(window : Window) : {x: Float64, y: Float64}
    LibGLFW.get_cursor_pos(window.ptr, out xpos, out ypos)
    {x: xpos, y: ypos}
  end

  # Sets the position of the cursor, relative to the client area of the window.
  #
  # This function sets the position, in screen coordinates, of the cursor
  # relative to the upper-left corner of the client area of the specified
  # window. The window must have input focus. If the window does not have
  # input focus when this function is called, it fails silently.
  #
  # If the cursor mode is `GLFW::CursorInputMode::Disabled` then the cursor 
  # position is unconstrained and limited only by the minimum and maximum 
  # values of a `Float64`.
  #
  # `Parameters:`
  #
  # *`window`* The desired window.
  #
  # *`xpos`* The desired x-coordinate, relative to the left edge of the
  #  client area.
  #
  # *`ypos`* The desired y-coordinate, relative to the top edge of the
  #  client area.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.set_cursor_pos(window : Window, x : Float64, y : Float64) : Nil
    LibGLFW.set_cursor_pos(window.ptr, x, y)
  end

  # Creates a custom cursor.
  #
  # Creates a new custom cursor image that can be set for a window with
  # `GLFW.set_cursor`. The cursor can be destroyed with `GLFW.destroy_cursor`.
  # Any remaining cursors are destroyed by `GLFW.terminate`.
  #
  # The pixels are 32-bit, little-endian, non-premultiplied RGBA, i.e. eight
  # bits per channel. They are arranged canonically as packed sequential rows,
  # starting from the top-left corner.
  #
  # The cursor hotspot is specified in pixels, relative to the upper-left corner
  # of the cursor image. Like all other coordinate systems in GLFW, the X-axis
  # points to the right and the Y-axis points down.
  #
  # `Parameters:`
  #
  # *`image`* The desired cursor image.
  #
  # *`xhot`* The desired x-coordinate, in pixels, of the cursor hotspot.
  #
  # *`yhot`* The desired y-coordinate, in pixels, of the cursor hotspot.
  #
  # Returns the handle of the created cursor, or `nil` if an
  # error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must not be called from a callback.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.1.
  # ```
  # cursor = <<-CURSOR
  # .......@.......
  # ......@.@......
  # .....@...@.....
  # ....@.....@....
  # ...@.......@...
  # ..@.........@..
  # .@...........@.
  # @.............@
  # @@@@@@@@@@@@@@@
  # CURSOR
  # .delete('\n')
  #
  # width, height = 15, 9
  # pixels = Pointer(UInt8).malloc(width * height * 4)
  #
  # (height * width).times do |index|
  #   pixels[4 * index + 0] = (cursor[index] == '@' ? 255u8 : 0u8)
  #   pixels[4 * index + 1] = (cursor[index] == '@' ? 255u8 : 0u8)
  #   pixels[4 * index + 2] = (cursor[index] == '@' ? 255u8 : 0u8)
  #   pixels[4 * index + 3] = (cursor[index] == '@' ? 255u8 : 0u8)
  # end
  #
  # image = GLFW::Image.new(width, height, pixels)
  #
  # if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  #   GLFW.make_context_current(window)
  #
  #   if cursor = GLFW.create_cursor(image, 7, 0)
  #     GLFW.set_cursor(window, cursor)
  #   end
  #
  #   while !GLFW.window_should_close(window)
  #     GLFW.poll_events
  #     GLFW.swap_buffers(window)
  #   end
  #
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.create_cursor(image : Image, xhot : Int32, yhot : Int32) : Cursor?
    ptr = LibGLFW.create_cursor(image.to_unsafe, xhot, yhot)
    ptr.null? ? nil : Cursor.new(ptr)
  end

  # Creates a cursor with a standard shape.
  #
  # Returns a cursor with a standard shape, that can be set for
  # a window with `GLFW.set_cursor`.
  #
  # `Parameters:`
  #
  # *`shape`* One of the standard shapes.
  #
  # Returns a new cursor ready to use or `nil` if an
  # error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`, `GLFW::Error::InvalidEnum`
  # and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must not be called from a callback.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.1.
  @[AlwaysInline]
  def self.create_standard_cursor(shape : CursorShape) : Cursor?
    ptr = LibGLFW.create_standard_cursor(shape.value)
    ptr.null? ? nil : Cursor.new(ptr)
  end

  # Destroys a cursor.
  #
  # This function destroys a cursor previously created with `GLFW.create_cursor`. 
  # Any remaining cursors will be destroyed by `GLFW.terminate`.
  #
  # `Parameters:`
  #
  # *`cursor`* The cursor object to destroy.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must not be called from a callback.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.1.
  @[AlwaysInline]
  def self.destroy_cursor(cursor : Cursor) : Nil
    LibGLFW.destroy_cursor(cursor.ptr)
  end

  # Sets the cursor for the window.
  #
  # This function sets the cursor image to be used when the cursor is over the
  # client area of the specified window. The set cursor will only be visible
  # when the cursor mode of the window is `GLFW::CursorInputMode::Normal`.
  #
  # On some platforms, the set cursor may not be visible unless the window also
  # has input focus.
  #
  # `Parameters:`
  #
  # *`window`* The window to set the cursor for.
  #
  # *`cursor`* The cursor to set, or `nil` to switch back to the default
  # arrow cursor.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.1.
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
  # layout. If you want to input text, use the `GLFW.set_char_callback` instead.
  #
  # When a window loses input focus, it will generate synthetic key release
  # events for all pressed keys. You can tell these events from user-generated
  # events by the fact that the synthetic ones are generated after the focus
  # loss event has been processed, i.e. after the callback set by
  # `GLFW.set_window_focus_callback` has been called.
  #
  # The scancode of a key is specific to that platform or sometimes even to that
  # machine. Scancodes are intended to allow users to bind keys that don't have
  # a GLFW key token. Such keys have `key` set to `GLFW::Key::Unknown`, their
  # state is not saved and so it cannot be queried with `GLFW.get_key`.
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
        cb.call(window.unsafe_as(Window), Key.new(key), scancode, Action.new(action), Mod.new(mods))
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
  # using `GLFW.set_key_callback` is not. Characters do not map 1:1
  # to physical keys, as a key may produce zero, one or more characters. If you
  # want to know whether a specific physical key was pressed or released, use
  # the key callback instead.
  #
  # The character callback behaves as system text input normally does and will
  # not be called if modifier keys are held down that would prevent normal text
  # input on that platform, for example a Super (Command) key on OS X or Alt key
  # on Windows. There is a character with modifiers callback which you can set
  # using `GLFW.set_char_mods_callback` that receives these events.
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
        cb.call(window.unsafe_as(Window), codepoint.chr)
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
        cb.call(window.unsafe_as(Window), codepoint.chr, Mod.new(mods))
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
        cb.call(window.unsafe_as(Window), MouseButton.new(button), Action.new(action), Mod.new(mods))
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
        cb.call(window.unsafe_as(Window), xpos, ypos)
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
        cb.call(window.unsafe_as(Window), entered == LibGLFW::TRUE ? true : false)
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
        cb.call(window.unsafe_as(Window), x_offset, y_offset)
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
        cb.call(window.unsafe_as(Window), new_paths)
      end
    end)

    old_callback
  end

  # Returns whether the specified joystick is present.
  #
  # This function returns whether the specified joystick is present.
  #
  # `Parameters:`
  #
  # *`joy`* The joystick to query.
  #
  # Returns `true` if the joystick is present, or `false` otherwise.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`, `GLFW::Error::InvalidEnum`
  # and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.joystick_present(joy : Joystick) : Bool
    LibGLFW.joystick_present(joy.value) == LibGLFW::TRUE ? true : false
  end

  # Returns the values of all axes of the specified joystick.
  #
  # This function returns the values of all axes of the specified joystick.
  # Each element in the array is a value between -1.0 and 1.0.
  #
  # Querying a joystick slot with no device present is not an error, but will
  # cause this function to return `nil`. Call `GLFW.joystick_present` to
  # check device presence.
  #
  # `Parameters:`
  #
  #  *`joy`* The joystick to query.
  #
  #  Returns an array of axis values, or `nil` if the joystick is not present or
  #  an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`, `GLFW::Error::InvalidEnum`
  # and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
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
  #
  # This function returns the state of all buttons of the specified joystick.
  # Each element in the array is either `GLFW::Action::Press` or `GLFW::Action::Release`.
  #
  # Querying a joystick slot with no device present is not an error, but will
  # cause this function to return `nil`. Call `GLFW.joystick_present` to
  # check device presence.
  #
  # `Parameters:`
  #
  #  *`joy`* The joystick to query.
  #
  # Returns an array of button states, or `nil` if the joystick is not present
  # or an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`, `GLFW::Error::InvalidEnum`
  # and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 2.2.
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
  #
  # This function returns the name, encoded as UTF-8, of the specified joystick.
  #
  # Querying a joystick slot with no device present is not an error, but will
  # cause this function to return `nil`. Call `GLFW.joystick_present` to
  # check device presence.
  #
  # `Parameters:`
  #
  # *`joy`* The joystick to query.
  #
  # Returns the UTF-8 encoded name of the joystick, or `nil` if the joystick
  # is not present or an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`, `GLFW::Error::InvalidEnum`
  # and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.get_joystick_name(joy : Joystick) : String?
    ptr = LibGLFW.get_joystick_name(joy.value)
    ptr.null? ? nil : String.new(ptr)
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
  #
  # This function sets the system clipboard to the specified, UTF-8 encoded
  # string.
  #
  # `Parameters:`
  # 
  # *`window`* The window that will own the clipboard contents.
  #
  # *`string`* A UTF-8 encoded string.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.set_clipboard_string(window : Window, string : String) : Nil
    LibGLFW.set_clipboard_string(window.ptr, string.to_unsafe)
  end

  # Returns the contents of the clipboard as a string.
  #
  # This function returns the contents of the system clipboard, if it contains
  # or is convertible to a UTF-8 encoded string. If the clipboard is empty or
  # if its contents cannot be converted, `nil` is returned and a
  # `GLFW::Error::FormatUnavailable` error is generated.
  #
  # `Parameters:`
  #
  # *`window`* The window that will request the clipboard contents.
  # Returns the contents of the clipboard as a UTF-8 encoded string, or `nil`
  # if an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.get_clipboard_string(window : Window) : String?
    ptr = LibGLFW.get_clipboard_string(window.ptr)
    ptr.null? ? nil : String.new(ptr)
  end

  # Returns the value of the GLFW timer.
  #
  # This function returns the value of the GLFW timer. Unless the timer has
  # been set using `GLFW.set_time`, the timer measures time elapsed since GLFW
  # was initialized.
  #
  # The resolution of the timer is system dependent, but is usually on the order
  # of a few micro- or nanoseconds. It uses the highest-resolution monotonic
  # time source on each supported platform.
  #
  # Returns the current value, in seconds, or zero if an
  # error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # NOTE: This function may be called from any thread. Reading and
  # writing of the internal timer offset is not atomic, so it needs to be
  # externally synchronized with calls to `GLFW.set_time`.
  #
  # NOTE: Added in version 1.0.
  @[AlwaysInline]
  def self.get_time : Float64
    LibGLFW.get_time
  end

  # Sets the GLFW timer.
  #
  # This function sets the value of the GLFW timer. It then continues to count
  # up from that value. The value must be a positive finite number less than
  # or equal to 18446744073.0, which is approximately 584.5 years.
  #
  # `Parameters:`
  #
  # *`time`* The new value, in seconds.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::InvalidValue`.
  #
  # NOTE: This function may be called from any thread. Reading and
  # writing of the internal timer offset is not atomic, so it needs to be
  # externally synchronized with calls to `GLFW.get_time`.
  #
  # NOTE: Added in version 2.2.
  @[AlwaysInline]
  def self.set_time(time : Float64) : Nil
    LibGLFW.set_time(time)
  end

  # Returns the current value of the raw timer.
  #
  # This function returns the current value of the raw timer, measured in
  # `1 / frequency` seconds. To get the frequency, call
  # `GLFW.get_timer_frequency`.
  #
  # Returns the value of the timer, or zero if an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # NOTE: This function may be called from any thread.
  #
  # NOTE: Added in version 3.2.
  @[AlwaysInline]
  def self.get_timer_value : UInt64
    LibGLFW.get_timer_value
  end

  # Returns the frequency, in Hz, of the raw timer.
  #
  # This function returns the frequency, in Hz, of the raw timer.
  #
  # Returns the frequency of the timer, in Hz, or zero if an
  # error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # NOTE: This function may be called from any thread.
  #
  # NOTE: Added in version 3.2.
  @[AlwaysInline]
  def self.get_timer_frequency : UInt64
    LibGLFW.get_timer_frequency
  end
end