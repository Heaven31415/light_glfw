#========================================================================
# Gamma correction test program
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
# This program is used to test the gamma correction functionality for
# both full screen and windowed mode windows
#
#========================================================================

require "../utility"

STEP_SIZE = 0.1f32
gamma_value = 1.0f32

usage = ->(code : Int32) do
  puts "Usage: gamma [-h] [-f]"
  puts "Options:"
  puts "  -f create full screen window"
  puts "  -h show this help"
  exit(code)
end

set_gamma = ->(window : GLFW::Window, value : Float32) do
  monitor = GLFW.get_window_monitor(window)
  if !monitor
    if monitor = GLFW.get_primary_monitor
      puts "Gamma: #{value}"
      GLFW.set_gamma(monitor, value)
    end
  end
end

error_callback = ->(error : GLFW::Error, description : String) do
  puts "Error(#{error}): #{description}"
end

key_callback = ->(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod) do
  return if action != GLFW::Action::Press

  case key
  when GLFW::Key::Escape
    GLFW.set_window_should_close(window, true)
  when GLFW::Key::PadAdd, GLFW::Key::Up, GLFW::Key::Q
    set_gamma.call(window, gamma_value + STEP_SIZE)
  when GLFW::Key::PadSubtract, GLFW::Key::Down, GLFW::Key::W
    if gamma_value - STEP_SIZE > 0f32
      set_gamma.call(window, gamma_value - STEP_SIZE)
    end
  end
end

framebuffer_size_callback = ->(window : GLFW::Window, width : Int32, height : Int32) do
  GL.viewport(0, 0, width, height)
end

GLFW.set_error_callback(&error_callback)

unless GLFW.init
  exit(EXIT_FAILURE)
else
  monitor = nil

  OptionParser.parse! do |parser|
    parser.invalid_option { usage.call(EXIT_FAILURE) }
    parser.on("-h", "Show this help") { usage.call(EXIT_SUCCESS) }
    parser.on("-f", "Create full screen window") { monitor = GLFW.get_primary_monitor }
  end

  if monitor && (mode = GLFW.get_video_mode(monitor.as(GLFW::Monitor)))
    GLFW.window_hint_refresh_rate(mode.refresh_rate)
    GLFW.window_hint_red_bits(mode.red_bits)
    GLFW.window_hint_green_bits(mode.green_bits)
    GLFW.window_hint_blue_bits(mode.blue_bits)

    width = mode.width
    height = mode.height
  else
    width = 200
    height = 200
  end

  window = GLFW.create_window(width, height, "Gamma Test", monitor)
  unless window
    GLFW.terminate
    exit(EXIT_SUCCESS)
  end

  set_gamma.call(window, 1f32)

  GLFW.make_context_current(window)
  GLFW.swap_interval(1)

  GLFW.set_key_callback(window, &key_callback)
  GLFW.set_framebuffer_size_callback(window, &framebuffer_size_callback)

  GL.matrix_mode(GL::PROJECTION)
  GL.ortho(-1.0, 1.0, -1.0, 1.0, 1.0, -1.0)
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