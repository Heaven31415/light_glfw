require "../utility"

method = false

def key_callback(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod)
  puts "(key_callback) key: #{key} scancode: #{scancode} action: #{action} mods: #{mods}"
end

def char_callback(window : GLFW::Window, char : Char)
  puts "(char_callback) char: #{char}"
end

def drop_callback(window : GLFW::Window, paths : Array(String))
  puts "(drop_callback) paths: #{paths}"
end

def error_callback(error : GLFW::Error, msg : String)
  puts "(error_callback) error: #{error} msg: #{msg}"
end

def scroll_callback(window : GLFW::Window, dx : Float64, dy : Float64)
  puts "(scroll_callback) dx: #{dx} dy: #{dy}"
end

def monitor_callback(monitor : GLFW::Monitor, event : GLFW::Event)
  puts "(monitor_callback) monitor: #{monitor} event: #{event}"
end

def joystick_callback(joy : GLFW::Joystick, event : GLFW::Event)
  puts "(joystick_callback) joy: #{joy} event: #{event}"
end

def char_mods_callback(window : GLFW::Window, char : Char, mods : GLFW::Mod)
  puts "(char_mods_callback) char: #{char} mods: #{mods}"
end

def cursor_pos_callback(window : GLFW::Window, x : Float64, y : Float64)
  puts "(cursor_pos_callback) x: #{x} y: #{y}"
end

def window_pos_callback(window : GLFW::Window, x : Int32, y : Int32)
  puts "(window_pos_callback) x: #{x} y: #{y}"
end

def window_size_callback(window : GLFW::Window, width : Int32, height : Int32)
  puts "(window_size_callback) width: #{width} height: #{height}"
end

def cursor_enter_callback(window : GLFW::Window, entered : Bool)
  puts "(cursor_enter_callback) entered: #{entered}"
end

def mouse_button_callback(window : GLFW::Window, button : GLFW::MouseButton, action : GLFW::Action, mods : GLFW::Mod)
  puts "(mouse_button_callback) button: #{button} action: #{action} mods: #{mods}"
end

def window_close_callback(window : GLFW::Window)
  puts "(window_close_callback)"
end

def window_focus_callback(window : GLFW::Window, focused : Bool)
  puts "(window_focus_callback) focused: #{focused}"
end

def window_iconify_callback(window : GLFW::Window, iconified : Bool)
  puts "(window_iconify_callback) iconified: #{iconified}"
end

def window_refresh_callback(window : GLFW::Window)
  puts "(window_refresh_callback)"
end

def framebuffer_size_callback(window : GLFW::Window, width : Int32, height : Int32)
  puts "(framebuffer_size_callback) width: #{width} height: #{height}"
end

if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  GLFW.make_context_current(window)

  if method
    GLFW.key_callback(window, key_callback)
    GLFW.char_callback(window, char_callback)
    GLFW.drop_callback(window, drop_callback)
    GLFW.error_callback(error_callback)
    GLFW.scroll_callback(window, scroll_callback)
    GLFW.monitor_callback(monitor_callback)
    GLFW.joystick_callback(joystick_callback)
    GLFW.char_mods_callback(window, char_mods_callback)
    GLFW.cursor_pos_callback(window, cursor_pos_callback)
    GLFW.window_pos_callback(window, window_pos_callback)
    GLFW.window_size_callback(window, window_size_callback)
    GLFW.cursor_enter_callback(window, cursor_enter_callback)
    GLFW.mouse_button_callback(window, mouse_button_callback)
    GLFW.window_close_callback(window, window_close_callback)
    GLFW.window_focus_callback(window, window_focus_callback)
    GLFW.window_iconify_callback(window, window_iconify_callback)
    GLFW.window_refresh_callback(window, window_refresh_callback)
    GLFW.framebuffer_size_callback(window, framebuffer_size_callback)
  else
    GLFW.key_callback(window) do |window, key, scancode, action, mods|
      puts "(key_callback) key: #{key} scancode: #{scancode} action: #{action} mods: #{mods}"
    end

    GLFW.char_callback(window) do |window, char|
      puts "(char_callback) char: #{char}"
    end

    GLFW.drop_callback(window) do |window, paths|
      puts "(drop_callback) paths: #{paths}"
    end

    GLFW.error_callback do |error, msg|
      puts "(error_callback) error: #{error} msg: #{msg}"
    end

    GLFW.scroll_callback(window) do |window, dx, dy|
      puts "(scroll_callback) dx: #{dx} dy: #{dy}"
    end

    GLFW.monitor_callback do |monitor, event|
      puts "(monitor_callback) monitor: #{monitor} event: #{event}"
    end

    GLFW.joystick_callback do |joy, event|
      puts "(joystick_callback) joy: #{joy} event: #{event}"
    end

    GLFW.char_mods_callback(window) do |window, char, mods|
      puts "(char_mods_callback) char: #{char} mods: #{mods}"
    end

    GLFW.cursor_pos_callback(window) do |window, x, y|
      puts "(cursor_pos_callback) x: #{x} y: #{y}"
    end

    GLFW.window_pos_callback(window) do |window, x, y|
      puts "(window_pos_callback) x: #{x} y: #{y}"
    end

    GLFW.window_size_callback(window) do |window, width, height|
      puts "(window_size_callback) width: #{width} height: #{height}"
    end

    GLFW.cursor_enter_callback(window) do |window, entered|
      puts "(cursor_enter_callback) entered: #{entered}"
    end

    GLFW.mouse_button_callback(window) do |window, button, action, mods|
      puts "(mouse_button_callback) button: #{button} action: #{action} mods: #{mods}"
    end

    GLFW.window_close_callback(window) do |window|
      puts "(window_close_callback)"
    end

    GLFW.window_focus_callback(window) do |window, focused|
      puts "(window_focus_callback) focused: #{focused}"
    end

    GLFW.window_iconify_callback(window) do |window, iconified|
      puts "(window_iconify_callback) iconified: #{iconified}"
    end

    GLFW.window_refresh_callback(window) do |window|
      puts "(window_refresh_callback)"
    end

    GLFW.framebuffer_size_callback(window) do |window, width, height|
      puts "(framebuffer_size_callback) width: #{width} height: #{height}"
    end
  end

  while !GLFW.window_should_close(window)
    GLFW.poll_events
    GLFW.swap_buffers(window)
  end

  GLFW.terminate
end