#========================================================================
# Monitor information tool
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
# This test prints monitor and video mode information or verifies video
# modes
#
#========================================================================

require "../utility"

enum Mode
  List
  Test
end

def usage(code : Int32)
  puts "Usage: monitors [-t]"
  puts "       monitors -h"
  exit(code)
end

def format_mode(mode : GLFW::VideoMode) : String
  String.build do |str|
    str << mode.width << " x " << mode.height << " x "
    str << mode.red_bits + mode.green_bits + mode.blue_bits << ' '
    str << '(' << mode.red_bits << ' ' << mode.green_bits << ' ' << mode.blue_bits << ')'
    str << ' ' << mode.refresh_rate << " Hz"  
  end
end

def error_callback(error : GLFW::Error, description : String)
  puts "Error(#{error}): #{description}"
end

def framebuffer_size_callback(window : GLFW::Window, width : Int32, height : Int32)
  puts "Framebuffer resized to #{width}x#{height}"
  GL.viewport(0, 0, width, height)
end

def key_callback(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod)
  if key == GLFW::Key::Escape
    GLFW.set_window_should_close(window, true)
  end
end

def list_modes(monitor : GLFW::Monitor)
  if (mode = GLFW.get_video_mode(monitor)) && (modes = GLFW.get_video_modes(monitor))
    pos = GLFW.get_monitor_pos(monitor)
    size = GLFW.get_monitor_physical_size(monitor)

    puts "Name: #{GLFW.get_monitor_name(monitor)} (#{GLFW.get_primary_monitor == monitor ? "primary" : "secondary"})"
    puts "Current mode: #{format_mode(mode)}"
    puts "Virtual position: #{pos[:x]} #{pos[:y]}"
    puts "Physical size: #{size[:width]} x #{size[:height]} mm (#{mode.width * 25.4f32 / size[:width]} dpi)"

    puts "Modes:"
    modes.each_with_index do |m, i|
      print "#{i}: #{format_mode(m)}"
      if m.ptr.value == mode.ptr.value
        print " (current mode)"
      end
      puts
    end
  end
end

def test_modes(monitor : GLFW::Monitor)
  if video_modes = GLFW.get_video_modes(monitor)
    video_modes.each_with_index do |mode, i|
      GLFW.window_hint_red_bits(mode.red_bits)
      GLFW.window_hint_green_bits(mode.green_bits)
      GLFW.window_hint_blue_bits(mode.blue_bits)
      GLFW.window_hint_refresh_rate(mode.refresh_rate)

      monitor_name = GLFW.get_monitor_name(monitor)
      puts "Testing mode #{i} on monitor #{monitor_name}: #{format_mode(mode)}"

      primary_monitor = GLFW.get_primary_monitor
      window = GLFW.create_window(mode.width, mode.height, "Video Mode Test", primary_monitor, nil)

      unless window
        puts "Failed to enter mode #{i}: #{format_mode(mode)}"
        next
      else
        GLFW.set_framebuffer_size_callback(window, framebuffer_size_callback)
        GLFW.set_key_callback(window, key_callback)

        GLFW.make_context_current(window)
        GLFW.swap_interval(1)

        GLFW.set_time(0.0)

        while GLFW.get_time < 5.0
          GL.clear(GL::COLOR_BUFFER_BIT)
          GLFW.swap_buffers(window)
          GLFW.poll_events

          if GLFW.window_should_close(window)
            puts "User terminated program"
            
            GLFW.terminate
            exit(EXIT_SUCCESS)
          end
        end

        GL.get_integerv(GL::RED_BITS, out red_bits)
        GL.get_integerv(GL::GREEN_BITS, out green_bits)
        GL.get_integerv(GL::BLUE_BITS, out blue_bits)

        size = GLFW.get_window_size(window)

        if red_bits != mode.red_bits || green_bits != mode.green_bits || blue_bits != mode.blue_bits
          puts "*** Color bit mismatch (#{red_bits} #{green_bits} #{blue_bits}) instead of (#{mode.red_bits} #{mode.green_bits} #{mode.blue_bits})"
        end

        if size[:width] != mode.width || size[:height] != mode.height
          puts "*** Size mismatch: #{size[:width]}x#{size[:height]} instead of #{mode.width}x#{mode.height}"
        end

        puts "Closing window"
        GLFW.destroy_window(window)
        GLFW.poll_events
      end
    end
  end
end

mode = Mode::List

OptionParser.parse! do |parser|
  parser.invalid_option { usage(EXIT_FAILURE) }
  parser.on("-h", "Show this help") { usage(EXIT_SUCCESS) }
  parser.on("-t", "Test video modes") { mode = Mode::Test }
end

GLFW.set_error_callback(error_callback)

unless GLFW.init
  exit(EXIT_FAILURE)
else
  if monitors = GLFW.get_monitors
    monitors.each do |monitor|
      if mode == Mode::List
        list_modes(monitor)
      else
        test_modes(monitor)
      end
    end
  end

  GLFW.terminate
  exit(EXIT_SUCCESS)
end