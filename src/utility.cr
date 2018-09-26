module GLFW
  # :nodoc:
  macro key_callback(window, function)
    GLFW.set_key_callback({{window.id}}, &->{{function.id}}(GLFW::Window, GLFW::Key, Int32, GLFW::Action, GLFW::Mod))
  end

  # :nodoc:
  macro key_callback(window, &block)
    GLFW.set_key_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro char_callback(window, function)
    GLFW.set_char_callback({{window.id}}, &->{{function.id}}(GLFW::Window, Char))
  end

  # :nodoc:
  macro char_callback(window, &block)
    GLFW.set_char_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro drop_callback(window, function)
    GLFW.set_drop_callback({{window.id}}, &->{{function.id}}(GLFW::Window, Array(String)))
  end

  # :nodoc:
  macro drop_callback(window, &block)
    GLFW.set_drop_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro error_callback(function)
    GLFW.set_error_callback(&->{{function.id}}(GLFW::Error, String))
  end

  # :nodoc:
  macro error_callback(&block)
    GLFW.set_error_callback {{block.id}}
  end

  # :nodoc:
  macro scroll_callback(window, function)
    GLFW.set_scroll_callback({{window.id}}, &->{{function.id}}(GLFW::Window, Float64, Float64))
  end

  # :nodoc:
  macro scroll_callback(window, &block)
    GLFW.set_scroll_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro monitor_callback(function)
    GLFW.set_monitor_callback(&->{{function.id}}(GLFW::Monitor, GLFW::Event))
  end

  # :nodoc:
  macro monitor_callback(&block)
    GLFW.set_monitor_callback {{block.id}}
  end

  # :nodoc:
  macro joystick_callback(function)
    GLFW.set_joystick_callback(&->{{function.id}}(GLFW::Joystick, GLFW::Event))
  end

  # :nodoc:
  macro joystick_callback(&block)
    GLFW.set_joystick_callback {{block.id}}
  end

  # :nodoc:
  macro char_mods_callback(window, function)
    GLFW.set_char_mods_callback({{window.id}}, &->{{function.id}}(GLFW::Window, Char, GLFW::Mod))
  end

  # :nodoc:
  macro char_mods_callback(window, &block)
    GLFW.set_char_mods_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro cursor_pos_callback(window, function)
    GLFW.set_cursor_pos_callback({{window.id}}, &->{{function.id}}(GLFW::Window, Float64, Float64))
  end

  # :nodoc:
  macro cursor_pos_callback(window, &block)
    GLFW.set_cursor_pos_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro window_pos_callback(window, function)
    GLFW.set_window_pos_callback({{window.id}}, &->{{function.id}}(GLFW::Window, Int32, Int32))
  end

  # :nodoc:
  macro window_pos_callback(window, &block)
    GLFW.set_window_pos_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro window_size_callback(window, function)
    GLFW.set_window_size_callback({{window.id}}, &->{{function.id}}(GLFW::Window, Int32, Int32))
  end

  # :nodoc:
  macro window_size_callback(window, &block)
    GLFW.set_window_size_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro cursor_enter_callback(window, function)
    GLFW.set_cursor_enter_callback({{window.id}}, &->{{function.id}}(GLFW::Window, Bool))
  end

  # :nodoc:
  macro cursor_enter_callback(window, &block)
    GLFW.set_cursor_enter_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro mouse_button_callback(window, function)
    GLFW.set_mouse_button_callback({{window.id}}, &->{{function.id}}(GLFW::Window, GLFW::MouseButton, GLFW::Action, GLFW::Mod))
  end

  # :nodoc:
  macro mouse_button_callback(window, &block)
    GLFW.set_mouse_button_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro window_close_callback(window, function)
    GLFW.set_window_close_callback({{window.id}}, &->{{function.id}}(GLFW::Window))
  end

  # :nodoc:
  macro window_close_callback(window, &block)
    GLFW.set_window_close_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro window_focus_callback(window, function)
    GLFW.set_window_focus_callback({{window.id}}, &->{{function.id}}(GLFW::Window, Bool))
  end

  # :nodoc:
  macro window_focus_callback(window, &block)
    GLFW.set_window_focus_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro window_iconify_callback(window, function)
    GLFW.set_window_iconify_callback({{window.id}}, &->{{function.id}}(GLFW::Window, Bool))
  end

  # :nodoc:
  macro window_iconify_callback(window, &block)
    GLFW.set_window_iconify_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro window_refresh_callback(window, function)
    GLFW.set_window_refresh_callback({{window.id}}, &->{{function.id}}(GLFW::Window))
  end

  # :nodoc:
  macro window_refresh_callback(window, &block)
    GLFW.set_window_refresh_callback({{window.id}}) {{block.id}}
  end

  # :nodoc:
  macro framebuffer_size_callback(window, function)
    GLFW.set_framebuffer_size_callback({{window.id}}, &->{{function.id}}(GLFW::Window, Int32, Int32))
  end

  # :nodoc:
  macro framebuffer_size_callback(window, &block)
    GLFW.set_framebuffer_size_callback({{window.id}}) {{block.id}}
  end
end