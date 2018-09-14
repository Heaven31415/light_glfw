require "./utility"

GLFW.set_error_callback do |error, string|
  puts "Error: #{error}, String: #{string}"
end

if GLFW.init
  window = GLFW.create_window(640, 480, "GLFW", nil, nil)

  if window
    cursor = GLFW.create_standard_cursor(GLFW::CursorShape::Crosshair)
    if cursor
      GLFW.set_cursor(window, cursor)
    end

    GLFW.set_joystick_callback do |joystick, event|
      puts "joystick: #{joystick}, event: #{event}"
    end

    GLFW.set_drop_callback(window) do |window, paths|
      puts "Dropped files: #{paths}"
    end

    GLFW.set_char_callback(window) do |window, char|
      puts "char: '#{char}'"
    end

    # GLFW.set_char_mods_callback(window) do |window, char, mods|
    #   puts "char: #{char} mods: #{mods}"
    # end

    GLFW.set_mouse_button_callback(window) do |window, button, action, mods|
      puts "button: #{button} action: #{action} mods: #{mods}"
    end

    GLFW.set_cursor_pos_callback(window) do |window, xpos, ypos|
      puts "Cursor coordinates: {#{xpos},#{ypos}}"
    end

    GLFW.set_cursor_enter_callback(window) do |window, entered|
      if entered
        puts "Cursor entered"
      else 
        puts "Cursor left"
      end
    end

    GLFW.set_scroll_callback(window) do |window, x_offset, y_offset|
      puts "x_offset: #{x_offset} y_offset: #{y_offset}"
    end

    GLFW.set_key_callback(window) do |window, key, scancode, action, mode|
      if action != GLFW::Action::Press
        next
      end

      case key
      when GLFW::Key::W
        GLFW.set_cursor(window, nil)
      when GLFW::Key::Escape
        # GLFW.set_window_should_close(window, true)
      end
    end

    GLFW.make_context_current(window)
    while !GLFW.window_should_close(window)
      GLFW.poll_events

      GLFW.get_mouse_button(window, GLFW::MouseButton::Left)
      GLFW.get_key(window, GLFW::Key::Enter)

      GL.clear(GL::COLOR_BUFFER_BIT)

      GL.color3d(1.0, 0.0, 0.0)

      GL.begin_ GL::QUADS
        GL.vertex2d(+0.5, +0.5)
        GL.vertex2d(+0.5, -0.5)
        GL.vertex2d(-0.5, -0.5)
        GL.vertex2d(-0.5, +0.5)
      GL.end_

      GLFW.swap_buffers(window)

      sleep 0.1
    end
  
    GLFW.destroy_window(window)
  end

  GLFW.terminate
end