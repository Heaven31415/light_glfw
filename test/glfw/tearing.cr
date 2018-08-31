#========================================================================
# Vsync enabling test
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
# This test renders a high contrast, horizontally moving bar, allowing for
# visual verification of whether the set swap interval is indeed obeyed
#
#========================================================================

require "option_parser"
require "../../src/light_glfw"
require "../gl"

EXIT_SUCCESS = 0
EXIT_FAILURE = 1

swap_tear = false
swap_interval = 0
frame_rate = 0.0

usage = ->(code : Int32) do
  puts "Usage: tearing [-h] [-f]"
  puts "Options:"
  puts "  -f create full screen window"
  puts "  -h show this help"
  exit(code)
end

update_window_title = ->(window : GLFW::Window) do
  title = String.build do |str|
    str << "Tearing detector (interval " << swap_interval
    if swap_tear && swap_interval < 0
      str << " (swap tear)"
    end
    str << ',' << ' ' << frame_rate << " Hz"
  end

  GLFW.set_window_title(window, title)
end

set_swap_interval = ->(window : GLFW::Window, interval : Int32) do
  swap_interval = interval
  GLFW.swap_interval(swap_interval)
  update_window_title.call(window)
end

error_callback = ->(error : GLFW::Error, description : String) do
  puts "Error(#{error}): #{description}"
end

framebuffer_size_callback = ->(window : GLFW::Window, width : Int32, height : Int32) do
  GL.viewport(0, 0, width, height)
end

key_callback = ->(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod) do
  return if action != GLFW::Action::Press

  case key
  when GLFW::Key::Up
    if swap_interval + 1 > swap_interval
      set_swap_interval.call(window, swap_interval + 1)
    end
  when GLFW::Key::Down
    if swap_tear != 0
      if swap_interval - 1 < swap_interval
        set_swap_interval.call(window, swap_interval - 1)
      end
    else
      if swap_interval - 1 >= 0
        set_swap_interval.call(window, swap_interval - 1)
      end
    end
  when GLFW::Key::Escape
    GLFW.set_window_should_close(window, true)
  end
end

frame_count = 0u32
last_time, current_time = 0.0, 0.0
fullscreen = false
monitor = nil

OptionParser.parse! do |parser|
  parser.invalid_option { usage.call(EXIT_FAILURE) }
  parser.on("-h", "Show this help") { usage.call(EXIT_SUCCESS) }
  parser.on("-f", "Create full screen window") { fullscreen = true }
end

GLFW.set_error_callback(&error_callback)

unless GLFW.init
  exit(EXIT_FAILURE)
else
  if fullscreen
    monitor = GLFW.get_primary_monitor
    mode = GLFW.get_video_mode(monitor)

    GLFW.window_hint_red_bits(mode.red_bits)
    GLFW.window_hint_green_bits(mode.green_bits)
    GLFW.window_hint_blue_bits(mode.blue_bits)
    GLFW.window_hint_refresh_rate(mode.refresh_rate)

    width = mode.width
    height = mode.height
  else
    width = 640
    height = 480
  end

  window = GLFW.create_window(width, height, "", monitor, nil)
  unless window
    GLFW.terminate
    exit(EXIT_FAILURE)
  else
    GLFW.make_context_current(window)
    set_swap_interval.call(window, 0)

    last_time = GLFW.get_time
    frame_rate = 0.0
    swap_tear = GLFW.extension_supported("WGL_EXT_swap_control_tear") || 
                GLFW.extension_supported("GLX_EXT_swap_control_tear")

    GLFW.set_framebuffer_size_callback(window, &framebuffer_size_callback)
    GLFW.set_key_callback(window, &key_callback)

    GL.matrix_mode(GL::PROJECTION)
    GL.ortho(-1.0, 1.0, -1.0, 1.0, 1.0, -1.0)
    GL.matrix_mode(GL::MODELVIEW)

    while !GLFW.window_should_close(window)
      GL.clear(GL::COLOR_BUFFER_BIT)
      pos = Math.cos(GLFW.get_time.to_f32 * 4f32) * 0.75f32
      GL.rectf(pos - 0.25f32, -1f32, pos + 0.25f32, 1f32)

      GLFW.swap_buffers(window)
      GLFW.poll_events

      frame_count += 1

      current_time = GLFW.get_time
      if current_time - last_time > 1.0
        frame_rate = frame_count / (current_time - last_time)
        frame_count = 0
        last_time = current_time
        update_window_title.call(window)
      end
    end

    GLFW.terminate
    exit(EXIT_SUCCESS)
  end
end