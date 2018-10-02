#========================================================================
# UTF-8 window title test
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
# This test sets a UTF-8 window title
#
#=======================================================================#

require "../utility"

def error_callback(error : GLFW::Error, description : String)
  puts "Error(#{error}): #{description}"
end

def framebuffer_size_callback(window : GLFW::Window, width : Int32, height : Int32)
  GL.viewport(0, 0, width, height)
end

GLFW.set_error_callback(error_callback)

unless GLFW.init
  exit(EXIT_FAILURE)
else
  window = GLFW.create_window(400, 400, "English 日本語 русский язык 官話", nil, nil)
  unless window
    GLFW.terminate
    exit(EXIT_FAILURE)
  else
    GLFW.make_context_current(window)
    GLFW.swap_interval(1)

    GLFW.set_framebuffer_size_callback(window, framebuffer_size_callback)

    while !GLFW.window_should_close(window)
      GL.clear(GL::COLOR_BUFFER_BIT)
      GLFW.swap_buffers(window)
      GLFW.wait_events
    end

    GLFW.terminate
    exit(EXIT_SUCCESS)
  end
end