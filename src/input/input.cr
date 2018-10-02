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
  def self.set_cursor_input_mode(window : Window, value : CursorInputMode) : Nil
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
    ptr.null? ? nil : ptr.unsafe_as(Cursor)
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
    ptr.null? ? nil : ptr.unsafe_as(Cursor)
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

  @@key_callbacks = Hash(UInt64, Proc(Window, Key, Int32, Action, Mod, Nil)).new
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
  # USING_METHOD = true
  # USING_MACRO = true
  #
  # def key_callback(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod)
  #   puts "key: #{key} action: #{action} mods: #{mods}"
  # end
  #
  # if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  #   GLFW.make_context_current(window)
  #
  #   if USING_METHOD
  #     if USING_MACRO
  #       # macro with the same name allows you to avoid writing boilerplate code, 
  #       # but compiler errors will be more difficult to understand.
  #       GLFW.set_key_callback(window, key_callback)
  #     else
  #       GLFW.set_key_callback(window, &->key_callback(GLFW::Window, GLFW::Key, Int32, GLFW::Action, GLFW::Mod))
  #     end
  #   else
  #     GLFW.set_key_callback(window) do |window, key, scancode, action, mods|
  #       puts "key: #{key} action: #{action} mods: #{mods}"
  #     end
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
  def self.set_key_callback(window : Window, &block : Window, Key, Int32, Action, Mod -> Nil) : Proc(Window, Key, Int32, Action, Mod, Nil)?
    hash = window.hash
    old_callback = @@key_callbacks[hash]?
    @@key_callbacks[hash] = block

    LibGLFW.set_key_callback(window.ptr, 
    ->(window : LibGLFW::Window*, key : Int32, scancode : Int32, action : Int32, mods : Int32) do
      if cb = @@key_callbacks[window.hash]
        cb.call(window.unsafe_as(Window), Key.new(key), scancode, Action.new(action), Mod.new(mods))
      end
    end)

    old_callback
  end

  @@char_callbacks = Hash(UInt64, Proc(Window, Char, Nil)).new
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
  # USING_METHOD = true
  # USING_MACRO = true
  #
  # def char_callback(window : GLFW::Window, char : Char)
  #   puts "char: #{char}"
  # end
  #
  # if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  #   GLFW.make_context_current(window)
  #
  #   if USING_METHOD
  #     if USING_MACRO
  #       # macro with the same name allows you to avoid writing boilerplate code, 
  #       # but compiler errors will be more difficult to understand.
  #       GLFW.set_char_callback(window, char_callback)
  #     else
  #       GLFW.set_char_callback(window, &->char_callback(GLFW::Window, Char))
  #     end
  #   else
  #     GLFW.set_char_callback(window) do |window, char|
  #       puts "char: #{char}"
  #     end
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
  def self.set_char_callback(window : Window, &block : Window, Char -> Nil) : Proc(Window, Char, Nil)?
    hash = window.hash
    old_callback = @@char_callbacks[hash]?
    @@char_callbacks[hash] = block

    LibGLFW.set_char_callback(window.ptr, ->(window : LibGLFW::Window*, codepoint : UInt32) do
      if cb = @@char_callbacks[window.hash]?
        cb.call(window.unsafe_as(Window), codepoint.chr)
      end
    end)

    old_callback
  end

  @@char_mods_callbacks = Hash(UInt64, Proc(Window, Char, Mod, Nil)).new
  # Sets the Unicode character with modifiers callback.
  #
  # This function sets the character with modifiers callback of the specified
  # window, which is called when a Unicode character is input regardless of what
  # modifier keys are used.
  #
  # The character with modifiers callback is intended for implementing custom
  # Unicode character input. For regular Unicode text input, use the
  # `GLFW.set_char_callback`. Like the character
  # callback, the character with modifiers callback deals with characters and is
  # keyboard layout dependent. Characters do not map 1:1 to physical keys, as
  # a key may produce zero, one or more characters. If you want to know whether
  # a specific physical key was pressed or released, use the
  # `GLFW.set_key_callback` instead.
  #
  # `Parameters:`
  #
  # *`window`* The window whose callback to set.
  #
  # *`block`* The new char mods callback.
  #
  # Returns the previously set callback, or `nil` if no callback was set.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.1.
  # ```
  # USING_METHOD = true
  # USING_MACRO = true
  #
  # def char_mods_callback(window : GLFW::Window, char : Char, mods : GLFW::Mod)
  #   puts "char: #{char} mods: #{mods}"
  # end
  #
  # if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  #   GLFW.make_context_current(window)
  #
  #   if USING_METHOD
  #     if USING_MACRO
  #       # macro with the same name allows you to avoid writing boilerplate code, 
  #       # but compiler errors will be more difficult to understand.
  #       GLFW.set_char_mods_callback(window, char_mods_callback)
  #     else
  #       GLFW.set_char_mods_callback(window, &->char_mods_callback(GLFW::Window, Char, GLFW::Mod))
  #     end
  #   else
  #     GLFW.set_char_mods_callback(window) do |window, char, mods|
  #       puts "char: #{char} mods: #{mods}"
  #     end
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
  def self.set_char_mods_callback(window : Window, &block : Window, Char, Mod -> Nil) : Proc(Window, Char, Mod, Nil)?
    hash = window.hash
    old_callback = @@char_mods_callbacks[hash]?
    @@char_mods_callbacks[hash] = block

    LibGLFW.set_char_mods_callback(window.ptr, ->(window : LibGLFW::Window*, codepoint : UInt32, mods : Int32) do
      if cb = @@char_mods_callbacks[window.hash]?
        cb.call(window.unsafe_as(Window), codepoint.chr, Mod.new(mods))
      end
    end)

    old_callback
  end

  @@mouse_button_callbacks = Hash(UInt64, Proc(Window, MouseButton, Action, Mod, Nil)).new
  # Sets the mouse button callback.
  #
  # This function sets the mouse button callback of the specified window, which
  # is called when a mouse button is pressed or released.
  #
  # When a window loses input focus, it will generate synthetic mouse button
  # release events for all pressed mouse buttons. You can tell these events
  # from user-generated events by the fact that the synthetic ones are generated
  # after the focus loss event has been processed, i.e. after the callback set by
  # `GLFW.set_window_focus_callback` has been called.
  #
  # `Parameters:`
  #
  # *`window`* The window whose callback to set.
  #
  # *`block`* The new mouse button callback.
  #
  # Returns the previously set callback, or `nil` if no callback was set.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 1.0.
  # ```
  # USING_METHOD = true
  # USING_MACRO = true
  # 
  # def mouse_button_callback(window : GLFW::Window, button : GLFW::MouseButton, action : GLFW::Action, mods : GLFW::Mod)
  #   puts "button: #{button} action: #{action} mods: #{mods}"
  # end
  #
  # if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  #   GLFW.make_context_current(window)
  #
  #   if USING_METHOD
  #     if USING_MACRO
  #       # macro with the same name allows you to avoid writing boilerplate code, 
  #       # but compiler errors will be more difficult to understand.
  #       GLFW.set_mouse_button_callback(window, mouse_button_callback)
  #     else
  #       GLFW.set_mouse_button_callback(window, &->mouse_button_callback(GLFW::Window, GLFW::MouseButton, GLFW::Action, GLFW::Mod))
  #     end
  #   else
  #     GLFW.set_mouse_button_callback(window) do |window, button, action, mods|
  #       puts "button: #{button} action: #{action} mods: #{mods}"
  #     end
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
  def self.set_mouse_button_callback(window : Window, &block : Window, MouseButton, Action, Mod -> Nil) : Proc(Window, MouseButton, Action, Mod, Nil)?
    hash = window.hash
    old_callback = @@mouse_button_callbacks[hash]?
    @@mouse_button_callbacks[hash] = block

    LibGLFW.set_mouse_button_callback(window.ptr, ->(window : LibGLFW::Window*, button : Int32, action : Int32, mods : Int32) do
      if cb = @@mouse_button_callbacks[window.hash]?
        cb.call(window.unsafe_as(Window), MouseButton.new(button), Action.new(action), Mod.new(mods))
      end
    end)

    old_callback
  end

  @@cursor_pos_callbacks = Hash(UInt64, Proc(Window, Float64, Float64, Nil)).new
  # Sets the cursor position callback.
  #
  # This function sets the cursor position callback of the specified window,
  # which is called when the cursor is moved. The callback is provided with the
  # position, in screen coordinates, relative to the upper-left corner of the
  # client area of the window.
  #
  # `Parameters:`
  #
  # *`window`* The window whose callback to set.
  #
  # *`block`* The new cursor pos callback.
  #
  # Returns the previously set callback, or `nil` if no callback was set.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # USING_METHOD = true
  # USING_MACRO = true
  #
  # def cursor_pos_callback(window : GLFW::Window, x : Float64, y : Float64)
  #   puts "x: #{x} y: #{y}"
  # end
  #
  # if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  #   GLFW.make_context_current(window)
  #
  #   if USING_METHOD
  #     if USING_MACRO
  #       # macro with the same name allows you to avoid writing boilerplate code, 
  #       # but compiler errors will be more difficult to understand.
  #       GLFW.set_cursor_pos_callback(window, cursor_pos_callback)
  #     else
  #       GLFW.set_cursor_pos_callback(window, &->cursor_pos_callback(GLFW::Window, Float64, Float64))
  #     end
  #   else
  #     GLFW.set_cursor_pos_callback(window) do |window, x, y|
  #       puts "x: #{x} y: #{y}"
  #     end
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
  def self.set_cursor_pos_callback(window : Window, &block : Window, Float64, Float64 -> Nil) : Proc(Window, Float64, Float64, Nil)?
    hash = window.hash
    old_callback = @@cursor_pos_callbacks[hash]?
    @@cursor_pos_callbacks[hash] = block

    LibGLFW.set_cursor_pos_callback(window.ptr, ->(window : LibGLFW::Window*, xpos : Float64, ypos : Float64) do
      if cb = @@cursor_pos_callbacks[window.hash]?
        cb.call(window.unsafe_as(Window), xpos, ypos)
      end
    end)

    old_callback
  end
  
  @@cursor_enter_callbacks = Hash(UInt64, Proc(Window, Bool, Nil)).new
  # Sets the cursor enter/exit callback.
  #
  # This function sets the cursor boundary crossing callback of the specified
  # window, which is called when the cursor enters or leaves the client area of
  # the window.
  #
  # `Parameters:`
  #
  # *`window`* The window whose callback to set.
  #
  # *`block`* The new cursor enter callback.
  #
  # Returns the previously set callback, or `nil` if no callback was set.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # USING_METHOD = true
  # USING_MACRO = true
  #
  # def cursor_enter_callback(window : GLFW::Window, entered : Bool)
  #   puts "entered: #{entered}"
  # end
  #
  # if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  #   GLFW.make_context_current(window)
  #
  #   if USING_METHOD
  #     if USING_MACRO
  #       # macro with the same name allows you to avoid writing boilerplate code, 
  #       # but compiler errors will be more difficult to understand.
  #       GLFW.set_cursor_enter_callback(window, cursor_enter_callback)
  #     else
  #       GLFW.set_cursor_enter_callback(window, &->cursor_enter_callback(GLFW::Window, Bool))
  #     end
  #   else
  #     GLFW.set_cursor_enter_callback(window) do |window, entered|
  #       puts "entered: #{entered}"
  #     end
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
  def self.set_cursor_enter_callback(window : Window, &block : Window, Bool -> Nil) : Proc(Window, Bool, Nil)?
    hash = window.hash
    old_callback = @@cursor_enter_callbacks[hash]?
    @@cursor_enter_callbacks[hash] = block

    LibGLFW.set_cursor_enter_callback(window.ptr, ->(window : LibGLFW::Window*, entered : Int32) do
      if cb = @@cursor_enter_callbacks[window.hash]?
        cb.call(window.unsafe_as(Window), entered == LibGLFW::TRUE ? true : false)
      end
    end)

    old_callback
  end

  @@scroll_callbacks = Hash(UInt64, Proc(Window, Float64, Float64, Nil)).new
  # Sets the scroll callback.
  #
  # This function sets the scroll callback of the specified window, which is
  # called when a scrolling device is used, such as a mouse wheel or scrolling
  # area of a touchpad.
  #
  # The scroll callback receives all scrolling input, like that from a mouse
  # wheel or a touchpad scrolling area.
  #
  # `Parameters:`
  #
  # *`window`* The window whose callback to set.
  #
  # *`block`* The new scroll callback.
  #
  # Returns the previously set callback, or `nil` if no callback was set.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # USING_METHOD = true
  # USING_MACRO = true
  #
  # def scroll_callback(window : GLFW::Window, dx : Float64, dy : Float64)
  #   puts "dx: #{dx} dy: #{dy}"
  # end
  #
  # if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  #   GLFW.make_context_current(window)
  #
  #   if USING_METHOD
  #     if USING_MACRO
  #       # macro with the same name allows you to avoid writing boilerplate code, 
  #       # but compiler errors will be more difficult to understand.
  #       GLFW.set_scroll_callback(window, scroll_callback)
  #     else
  #       GLFW.set_scroll_callback(window, &->scroll_callback(GLFW::Window, Float64, Float64))
  #     end
  #   else
  #     GLFW.set_scroll_callback(window) do |window, dx, dy|
  #       puts "dx: #{dx} dy: #{dy}"
  #     end
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
  def self.set_scroll_callback(window : Window, &block : Window, Float64, Float64 -> Nil) : Proc(Window, Float64, Float64, Nil)?
    hash = window.hash
    old_callback = @@scroll_callbacks[hash]?
    @@scroll_callbacks[hash] = block

    LibGLFW.set_scroll_callback(window.ptr, ->(window : LibGLFW::Window*, dx : Float64, dy : Float64) do
      if cb = @@scroll_callbacks[window.hash]?
        cb.call(window.unsafe_as(Window), dx, dy)
      end
    end)

    old_callback
  end

  @@drop_callbacks = Hash(UInt64, Proc(Window, Array(String), Nil)).new
  # Sets the file drop callback.
  #
  # This function sets the file drop callback of the specified window, which is
  # called when one or more dragged files are dropped on the window.
  #
  # `Parameters:`
  #
  # *`window`* The window whose callback to set.
  #
  # *`block`* The new drop callback.
  #
  # Returns the previously set callback, or `nil` if no callback was set.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.1.
  # ```
  # USING_METHOD = true
  # USING_MACRO = true
  #
  # def drop_callback(window : GLFW::Window, paths : Array(String))
  #   puts "paths: #{paths}"
  # end
  #
  # if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  #   GLFW.make_context_current(window)
  #
  #   if USING_METHOD
  #     if USING_MACRO
  #       # macro with the same name allows you to avoid writing boilerplate code, 
  #       # but compiler errors will be more difficult to understand.
  #       GLFW.set_drop_callback(window, drop_callback)
  #     else
  #       GLFW.set_drop_callback(window, &->drop_callback(GLFW::Window, Array(String)))
  #     end
  #   else
  #     GLFW.set_drop_callback(window) do |window, paths|
  #       puts "paths: #{paths}"
  #     end
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
  def self.set_drop_callback(window : Window, &block : Window, Array(String) -> Nil) : Proc(Window, Array(String), Nil)?
    hash = window.hash
    old_callback = @@drop_callbacks[hash]?
    @@drop_callbacks[hash] = block

    LibGLFW.set_drop_callback(window, ->(window : LibGLFW::Window*, count : Int32, paths : UInt8**) do
      if cb = @@drop_callbacks[window.hash]?
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
  # *`joy`* The joystick to query.
  #
  # Returns an array of axis values, or `nil` if the joystick is not present or
  # an error occurred.
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

  @@joystick_callback : Proc(Joystick, Event, Nil)? = nil
  # Sets the joystick configuration callback.
  #
  # This function sets the joystick configuration callback.
  # This is called when a joystick is connected to or
  # disconnected from the system.
  #
  # `Parameters:`
  #
  # *`block`* The new joystick callback.
  #
  # Returns the previously set callback, or `nil` if no callback was set or the
  # library had not been initialized.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.2.
  # ```
  # USING_METHOD = true
  # USING_MACRO = true
  #
  # def joystick_callback(joy : GLFW::Joystick, event : GLFW::Event)
  #   puts "joy: #{joy} event: #{event}"
  # end
  #
  # if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  #   GLFW.make_context_current(window)
  #
  #   if USING_METHOD
  #     if USING_MACRO
  #       # macro with the same name allows you to avoid writing boilerplate code, 
  #       # but compiler errors will be more difficult to understand.
  #       GLFW.set_joystick_callback(joystick_callback)
  #     else
  #       GLFW.set_joystick_callback(&->joystick_callback(GLFW::Joystick, GLFW::Event))
  #     end
  #   else
  #     GLFW.set_joystick_callback do |joy, event|
  #       puts "joy: #{joy} event: #{event}"
  #     end
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
  def self.set_joystick_callback(&block : Joystick, Event -> Nil) : Proc(Joystick, Event, Nil)?
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