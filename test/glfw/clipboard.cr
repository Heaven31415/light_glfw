#========================================================================
# Clipboard test program
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
# This program is used to test the clipboard functionality.
#
#========================================================================

require "option_parser"
require "../../src/light_glfw"
require "../gl"

EXIT_SUCCESS = 0
EXIT_FAILURE = 1

{% if flag?(:darwin) %}
  MODIFIER = GLFW::Mod::Super
{% else %}
  MODIFIER = GLFW::Mod::Control
{% end %}

def usage(code : Int32)
  puts "Usage: clipboard [-h]"
  exit(code)
end

def error_callback(error : GLFW::Error, description : String)
  puts "Error(#{error}): #{description}"
end

def key_callback(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod)
  return if action != GLFW::Action::Press

  case key
  when GLFW::Key::Escape
    GLFW.set_window_should_close(window, true)
  when GLFW::Key::V
    if mods == MODIFIER
      string = GLFW.get_clipboard_string(window)
      if string
        puts "Clipboard contains \"#{string}\""
      else
        puts "Clipboard does not contain a string"
      end
    end
  when GLFW::Key::C
    if mods == MODIFIER
      string = "Hello GLFW World!"
      GLFW.set_clipboard_string(window, string)
      puts ("Setting clipboard to \"#{string}\"")
    end
  end
end

def framebuffer_size_callback(window : GLFW::Window, width : Int32, height : Int32)
  GL.viewport(0, 0, width, height)
end

OptionParser.parse! do |parser|
  parser.invalid_option { usage(EXIT_FAILURE) }
  parser.on("-h", "Show this help") { usage(EXIT_SUCCESS) }
end

GLFW.set_error_callback(&->error_callback(GLFW::Error, String))

unless GLFW.init
  puts "Failed to initialize GLFW"
  exit(EXIT_FAILURE)
else
  window = GLFW.create_window(200, 200, "Clipboard Test", nil, nil)
  unless window
    GLFW.terminate
    puts "Failed to open GLFW window"
    exit(EXIT_FAILURE)
  else
    GLFW.make_context_current(window)
    GLFW.swap_interval(1)

    GLFW.set_key_callback(window, &->key_callback(GLFW::Window, GLFW::Key, Int32, GLFW::Action, GLFW::Mod))
    GLFW.set_framebuffer_size_callback(window, &->framebuffer_size_callback(GLFW::Window, Int32, Int32))

    GL.matrix_mode(GL::PROJECTION)
    GL.ortho(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0)
    GL.matrix_mode(GL::MODELVIEW)

    GL.clear_color(0.5f32, 0.5f32, 0.5f32, 0f32)

    while !GLFW.window_should_close(window)
      GL.clear(GL::COLOR_BUFFER_BIT)
      GL.color3f(0.8f32, 0.2f32, 0.4f32)
      GL.rectf(-0.5f32, -0.5f32, 0.5f32, 0.5f32)
      GLFW.swap_buffers(window)
      GLFW.wait_events
    end

    GLFW.terminate
    exit(EXIT_SUCCESS)
  end
end