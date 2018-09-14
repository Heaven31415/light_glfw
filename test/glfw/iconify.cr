#========================================================================
# Iconify/restore test program
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
# This program is used to test the iconify/restore functionality for
# both full screen and windowed mode windows
#
#========================================================================

require "option_parser"
require "../../src/light_glfw"
require "../gl"

windowed_xpos, windowed_ypos, windowed_width, windowed_height = 0, 0, 0, 0

usage = -> do
  puts "Usage: iconify [-h] [-f [-a] [-n]]"
  puts "Options:"
  puts "  -a create windows for all monitors"
  puts "  -f create full screen window(s)"
  puts "  -h show this help"
end

error_callback = ->(error : GLFW::Error, description : String) do
  puts "Error(#{error}): #{description}"
end

key_callback = ->(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod) do
  puts "#{GLFW.get_time} Key #{action}"

  return if action != GLFW::Action::Press

  case key
  when GLFW::Key::I
    GLFW.iconify_window(window)
  when GLFW::Key::M
    GLFW.maximize_window(window)
  when GLFW::Key::R
    GLFW.restore_window(window)
  when GLFW::Key::Escape
    GLFW.set_window_should_close(window, true)
  when GLFW::Key::A
    # GLFW.set_window_auto_iconify(window, !GLFW.get_window_auto_iconify(window))
  when GLFW::Key::B
    GLFW.set_window_resizable(window, !GLFW.get_window_resizable(window))
  when GLFW::Key::D
    GLFW.set_window_decorated(window, !GLFW.get_window_decorated(window))
  when GLFW::Key::F
    GLFW.set_window_floating(window, GLFW.get_window_floating(window))
  when GLFW::Key::F11, GLFW::Key::Enter
    return if mods != GLFW::Mod::Alt

    if GLFW.get_window_monitor(window)
      GLFW.set_window_monitor(window, nil, windowed_xpos, windowed_ypos, windowed_width, windowed_height, 0)
    else
      monitor = GLFW.get_primary_monitor
      if monitor
        mode = GLFW.get_video_mode(monitor)

        # This part could have been shorter if I returned
        # Tuples instead of NamedTuples
        pos = GLFW.get_window_pos(window)
        size = GLFW.get_window_size(window)
        windowed_xpos, windowed_ypos = pos[:x], pos[:y]
        windowed_width, windowed_height = size[:width], size[:height]

        GLFW.set_window_monitor(window, monitor, 0, 0, mode.width, mode.height, mode.refresh_rate)
      end
    end
  end
end