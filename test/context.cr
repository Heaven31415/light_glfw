#========================================================================
# Context functions test
# Copyright (c) Heaven31415 <Heaven31415gmail.com>
#========================================================================
# make_context_current
# get_current_context
# swap_interval
# extension_supported
# get_proc_address
#========================================================================

require "./utility"

unless GLFW.init
  exit(EXIT_FAILURE)
else
  window = GLFW.create_window(640, 480, "GLFW")
  unless window
    GLFW.terminate
    exit(EXIT_FAILURE)
  else
    pp GLFW.get_current_context

    GLFW.make_context_current(nil)
    GLFW.make_context_current(window)

    pp GLFW.get_current_context

    GLFW.swap_interval(1)

    if GLFW.extension_supported("GLX_EXT_swap_control_tear")
      puts "`GLX_EXT_swap_control_tear` is supported"
    else
      puts "`GLX_EXT_swap_control_tear` is not supported"
    end

    gl_draw_buffers = GLFW.get_proc_address("")
    puts gl_draw_buffers

    # pp GLFW.extension_supported("hi")
    # pp GLFW.get_proc_address("glfwInit") # no fucking idea what is going on here

    while !GLFW.window_should_close(window)
      GLFW.poll_events
      sleep 0.1
    end
  
    GLFW.destroy_window(window)

    GLFW.terminate
  end
end