require "../glfw"

if GLFW.init() == true
  window = GLFW.create_window(640, 480, "GLFW", nil, nil)

  if window
    pp GLFW.get_current_context

    GLFW.make_context_current(nil)
    GLFW.make_context_current(window)

    pp GLFW.get_current_context

    GLFW.swap_interval(1)

    pp GLFW.extension_supported("hi")
    pp GLFW.get_proc_address("glfwInit") # no fucking idea what is going on here

    while !GLFW.window_should_close(window)
      GLFW.poll_events
      sleep 0.1
    end
  
    GLFW.destroy_window(window)
  end

  GLFW.terminate()
end