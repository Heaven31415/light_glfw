#========================================================================
# Window icon test program
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
# This program is used to test the icon feature.
#
#========================================================================

require "../../src/light_glfw"
require "../gl"

EXIT_SUCCESS = 0
EXIT_FAILURE = 1

icon = <<-ICON
................
................
...0000..0......
...0.....0......
...0.00..0......
...0..0..0......
...0000..0000...
................
................
...000..0...0...
...0....0...0...
...000..0.0.0...
...0....0.0.0...
...0....00000...
................
................
ICON
.delete('\n')

icon_colors = 
[
  [   0u8,   0u8,   0u8, 255u8 ], # black
  [ 255u8,   0u8,   0u8, 255u8 ], # red
  [   0u8, 255u8,   0u8, 255u8 ], # green
  [   0u8,   0u8, 255u8, 255u8 ], # blue
  [ 255u8, 255u8, 255u8, 255u8 ]  # white
]

cur_icon_color = 0

def set_icon(window : GLFW::Window, icon : String, icon_color : Int32, icon_colors : Array(Array(UInt8)))
  width = 16
  height = 16
  pixels = Pointer(UInt8).malloc(width * height * 4)

  height.times do |y|
    width.times do |x|
      index = y * width + x

      if icon[index] == '0'
        pixels[4 * index + 0] = icon_colors[icon_color][0]
        pixels[4 * index + 1] = icon_colors[icon_color][1]
        pixels[4 * index + 2] = icon_colors[icon_color][2]
        pixels[4 * index + 3] = icon_colors[icon_color][3]
      else
        pixels[4 * index + 0] = 0u8
        pixels[4 * index + 1] = 0u8
        pixels[4 * index + 2] = 0u8
        pixels[4 * index + 3] = 0u8
      end
    end
  end

  image = GLFW::Image.new(width, height, pixels)
  GLFW.set_window_icon(window, image)
end

unless GLFW.init
  puts "Failed to initialize GLFW"
  exit(EXIT_FAILURE)
else
  window = GLFW.create_window(200, 200, "Window Icon", nil, nil)
  unless window
    GLFW.terminate
    puts "Failed to open GLFW window"
    exit(EXIT_FAILURE)
  else
    GLFW.make_context_current(window)

    GLFW.set_key_callback(window) do |window, key, scancode, action, mode|
      next if action != GLFW::Action::Press

      case key
      when GLFW::Key::Escape
        GLFW.set_window_should_close(window, true)
      when GLFW::Key::Space
        cur_icon_color = (cur_icon_color + 1) % 5
        set_icon(window, icon, cur_icon_color, icon_colors)
      when GLFW::Key::X
        # TODO: I thought it would set icon to default one, however it does nothing,
        # even in case of original test from GLFW. I should report it.
        GLFW.set_window_icon(window, nil)
      end
    end
    
    set_icon(window, icon, cur_icon_color, icon_colors)

    while GLFW.window_should_close(window) == false
      GL.clear(GL::COLOR_BUFFER_BIT)
      GLFW.swap_buffers(window)
      GLFW.wait_events
    end

    GLFW.destroy_window(window)
    GLFW.terminate
    exit(EXIT_SUCCESS)
  end
end