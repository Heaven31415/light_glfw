#========================================================================
# Window re-opener (open/close stress test)
# Copyright (c) Camilla Berglund <elmindreda@glfw.org>
# Converted to Crystal by Heaven31415 <heaven31415@gmail.com>
#
# This software is provided 'as-is', without any express or implied
# warranty. In no event will the authors be held liable for any damages
# arising from the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely, subject to the following restrictions:
#
# 1. The origin of this software must not be misrepresented; you must not
#    claim that you wrote the original software. If you use this software
#    in a product, an acknowledgment in the product documentation would
#    be appreciated but is not required.
#
# 2. Altered source versions must be plainly marked as such, and must not
#    be misrepresented as being the original software.
#
# 3. This notice may not be removed or altered from any source
#    distribution.
#
#========================================================================
#
# This test came about as the result of bug #1262773
#
# It closes and re-opens the GLFW window every five seconds, alternating
# between windowed and full screen mode
#
# It also times and logs opening and closing actions and attempts to separate
# user initiated window closing from its own
#
#========================================================================

require "../../src/light_glfw"
require "../gl"

EXIT_SUCCESS = 0
EXIT_FAILURE = 1

def error_callback(error : GLFW::Error, description : String)
  puts "Error(#{error}): #{description}"
end

def framebuffer_size_callback(window : GLFW::Window, width : Int32, height : Int32)
  GL.viewport(0, 0, width, height)
end

def window_close_callback(window : GLFW::Window)
  puts "Close callback triggered"
end

def key_callback(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod)
  return if action != GLFW::Action::Press

  case key
  when GLFW::Key::Q, GLFW::Key::Escape
    GLFW.set_window_should_close(window, true)
  end
end

def open_window(width : Int32, height : Int32, monitor : GLFW::Monitor?) : GLFW::Window?
  base = GLFW.get_time
  window = GLFW.create_window(width, height, "Window Re-opener", monitor)
  unless window
    nil
  else
    GLFW.make_context_current(window)
    GLFW.swap_interval(1)

    GLFW.set_framebuffer_size_callback(window, &->framebuffer_size_callback(GLFW::Window, Int32, Int32))
    GLFW.set_window_close_callback(window, &->window_close_callback(GLFW::Window))
    GLFW.set_key_callback(window, &->key_callback(GLFW::Window, GLFW::Key, Int32, GLFW::Action, GLFW::Mod))

    time = GLFW.get_time - base
    if monitor
      name = GLFW.get_monitor_name(monitor)
      puts "Opening full screen window on monitor #{name} took #{time.round(3)} seconds"
    else
      puts "Opening regular window took #{time.round(3)} second"
    end

    window
  end
end

def close_window(window : GLFW::Window)
  base = GLFW.get_time
  GLFW.destroy_window(window)
  time = GLFW.get_time - base
  puts "Closing window took #{time.round(3)} seconds"
end

GLFW.set_error_callback(&->error_callback(GLFW::Error, String))

count = 0
width, height = 0, 0

unless GLFW.init
  exit(EXIT_FAILURE)
else
  while true
    monitor = nil

    if count % 2 == 0
      monitors = GLFW.get_monitors
      unless monitors
        exit(EXIT_FAILURE)
      else
        monitor = monitors.sample(1)[0]
      end
    end

    if monitor && (mode = GLFW.get_video_mode(monitor))
      width = mode.width
      height = mode.height
    else
      width = 640
      height = 480
    end

    window = open_window(width, height, monitor)
    unless window
      GLFW.terminate
      exit(EXIT_FAILURE)
    else
      GL.matrix_mode(GL::PROJECTION)
      GL.ortho(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0)
      GL.matrix_mode(GL::MODELVIEW)

      GLFW.set_time(0.0)
      while GLFW.get_time < 5.0
        GL.clear(GL::COLOR_BUFFER_BIT)

        GL.push_matrix
        GL.rotatef(GLFW.get_time.to_f32 * 100f32, 0f32, 0f32, 1f32)
        GL.rectf(-0.5f32, -0.5f32, 1f32, 1f32)
        GL.pop_matrix

        GLFW.swap_buffers(window)
        GLFW.poll_events

        if GLFW.window_should_close(window)
          close_window(window)
          puts "User closed window"

          GLFW.terminate
          exit(EXIT_SUCCESS)
        end
      end

      puts "Closing window"
      close_window(window)
      count += 1
    end
  end

  GLFW.terminate
end