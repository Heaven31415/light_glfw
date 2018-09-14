#========================================================================
# Event wait timeout test
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
# This test is intended to verify that waiting for events with timeout works
#
#========================================================================

require "../utility"

def error_callback(error : GLFW::Error, description : String)
  puts "Error(#{error}): #{description}"
end

def key_callback(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod)
  if key == GLFW::Key::Escape && action == GLFW::Action::Press
    GLFW.set_window_should_close(window, true)
  end
end

GLFW.set_error_callback(&->error_callback(GLFW::Error, String))

unless GLFW.init
  exit(EXIT_FAILURE)
else
  # TODO: Those last two arguments are almost always nil, perhaps
  # they should have been nil by default?
  window = GLFW.create_window(640, 480, "Event Wait Timeout Test", nil, nil)
  unless window
    GLFW.terminate
    exit(EXIT_FAILURE)
  else
    random = Random.new
    GLFW.make_context_current(window)
    GLFW.set_key_callback(window, &->key_callback(GLFW::Window, GLFW::Key, Int32, GLFW::Action, GLFW::Mod))

    while !GLFW.window_should_close(window)
      r = random.rand(0f32..1f32)
      g = random.rand(0f32..1f32)
      b = random.rand(0f32..1f32)
      l = Math.sqrt(r * r + g * g + b * b)

      size = GLFW.get_framebuffer_size(window)

      GL.viewport(0, 0, size[:width], size[:height])
      GL.clear_color(r / l, g / l, b / l, 1f32)
      GL.clear(GL::COLOR_BUFFER_BIT)
      GLFW.swap_buffers(window)

      GLFW.wait_events_timeout(1.0)
    end

    GLFW.destroy_window(window)
    GLFW.terminate
    exit(EXIT_SUCCESS)
  end
end