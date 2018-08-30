require "../../src/light_glfw"
require "../gl"

def error_callback(error : GLFW::Error, description : String)
  puts "Error(#{error}): #{description}"
end

def key_callback(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod)
  return if action != GLFW::Action::Press

  case key
  when GLFW::Key::Escape
    GLFW.set_window_should_close(window, true)
  when GLFW::Key::V
    if mods == GLFW::Mod::Control
      # IDK, but they are passing NULL instead of actual window
      string = GLFW.get_clipboard_string(window)
      if string
        puts "Clipboard contains \"#{string}\""
      else
        puts "Clipboard does not contain a string"
      end
    end
  when GLFW::Key::C
    if mods == GLFW::Mod::Control
      string = "Hello GLFW World!"
      # IDK, but they are passing NULL instead of actual window
      GLFW.set_clipboard_string(window, string)
      puts ("Setting clipboard to \"#{string}\"")
    end
  end
end

GLFW.set_error_callback(&->error_callback(GLFW::Error, String))

if GLFW.init
  window = GLFW.create_window(200, 200, "Clipboard Test", nil, nil)
  if window
    GLFW.make_context_current(window)
    GLFW.swap_interval(1)

    GLFW.set_key_callback(window, &->key_callback(GLFW::Window, GLFW::Key, Int32, GLFW::Action, GLFW::Mod))
    GL.clear_color(0.5, 0.5, 0.5, 0.0)

    while !GLFW.window_should_close(window)
      GL.clear(GL::COLOR_BUFFER_BIT)
      GLFW.swap_buffers(window)
      GLFW.wait_events
    end

    GLFW.destroy_window(window)
  end
  GLFW.terminate
end