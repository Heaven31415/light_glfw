require "../glfw"
require "./gl"
# require "stumpy_png"

GLFW.set_error_callback do |error, string|
  puts "Error: #{error}, String: #{string}"
end

if GLFW.init() == true
  window = GLFW.create_window(640, 480, "GLFW", nil, nil)

  if window
    GLFW.set_key_callback(window) do |window, key, scancode, action, mode|
      if action != GLFW::Action::Press
        next
      end

      case key
      when GLFW::Key::W
        GLFW.set_window_pos_callback(window) {}
      when GLFW::Key::Escape
        # GLFW.set_window_should_close(window, true)
      end
    end

    GLFW.make_context_current(window)
    while !GLFW.window_should_close(window)
      GLFW.poll_events

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

  GLFW.terminate()
end