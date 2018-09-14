#========================================================================
# Simple multi-window test
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
# This test creates four windows and clears each in a different color
#
#========================================================================

require "../utility"

titles = ["Red", "Green", "Blue", "Yellow"]

struct Color
  property r : Float32
  property g : Float32
  property b : Float32

  def initialize(@r, @g, @b)
  end
end

colors = [
  Color.new(0.95f32, 0.32f32, 0.11f32),
  Color.new(0.50f32, 0.80f32, 0.16f32),
  Color.new(0.00f32, 0.68f32, 0.94f32),
  Color.new(0.98f32, 0.74f32, 0.04f32)
]

def usage(code : Int32)
  puts "Usage: windows [-h] [-b]"
  puts "Options:"
  puts "  -b create decorated windows"
  puts "  -h show this help"
  exit(code)
end

def error_callback(error : GLFW::Error, description : String)
  puts "Error(#{error}): #{description}"
end

# TODO: Perhaps it should have been called GLFW::Mods instead of GLFW::Mod
def key_callback(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod)
  return if action != GLFW::Action::Press

  case key
  when GLFW::Key::Space
    pos = GLFW.get_window_pos(window)
    GLFW.set_window_pos(window, pos)
  when GLFW::Key::Escape
    GLFW.set_window_should_close(window, true)
  end
end

decorated = false
running = true

OptionParser.parse! do |parser|
  parser.invalid_option { usage(EXIT_FAILURE) }
  parser.missing_option { usage(EXIT_FAILURE ) } # TODO: figure out why it doesn't work
  parser.on("-h", "Show this help") { usage(EXIT_SUCCESS) }
  parser.on("-b", "Create decorated windows") { decorated = true }
end

GLFW.set_error_callback(&->error_callback(GLFW::Error, String))

unless GLFW.init # TODO: Add convenience method which will call GLFW.terminate automatically
  exit(EXIT_FAILURE)
else
  GLFW.window_hint_decorated(decorated)
  GLFW.window_hint_visible(false)

  windows = Array(GLFW::Window).new

  4.times do |i|
    window = GLFW.create_window(200, 200, titles[i], nil, nil)

    unless window
      GLFW.terminate
      exit(EXIT_FAILURE)
    else
      # TODO: Passing actual methods to callbacks is really cumbersome...
      GLFW.set_key_callback(window, &->key_callback(GLFW::Window, GLFW::Key, Int32, GLFW::Action, GLFW::Mod))
      GLFW.make_context_current(window)
      GL.clear_color(colors[i].r, colors[i].g, colors[i].b, 1f32)

      frame_size = GLFW.get_window_frame_size(window)
      x = 100 + (i & 1) * (200 + frame_size[:left] + frame_size[:right])
      y = 100 + (i >> 1) * (200 + frame_size[:top] + frame_size[:bottom])
      # TODO: set_window_pos and similar should probably have more than one overloads
      GLFW.set_window_pos(window, {x: x, y: y})

      windows << window
    end
  end

  windows.each { |w| GLFW.show_window(w) }

  while running
    windows.each do |window|
      GLFW.make_context_current(window)
      GL.clear(GL::COLOR_BUFFER_BIT)
      GLFW.swap_buffers(window)

      if GLFW.window_should_close(window)
        running = false
      end
    end

    GLFW.wait_events
  end

  GLFW.terminate
  exit(EXIT_SUCCESS)
end