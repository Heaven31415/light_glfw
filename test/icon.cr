require "../glfw"
require "./gl"

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

if GLFW.init
  window = GLFW.create_window(200, 200, "Window Icon", nil, nil)
  if window

    GLFW.make_context_current(window)
    set_icon(window, icon, cur_icon_color, icon_colors)

    GLFW.set_key_callback(window) do |window, key, scancode, action, mode|
      next if action != GLFW::Action::Press

      case key
      when GLFW::Key::Escape
        GLFW.set_window_should_close(window, true)
      when GLFW::Key::Space
        cur_icon_color = (cur_icon_color + 1) % 5
        set_icon(window, icon, cur_icon_color, icon_colors)
      when GLFW::Key::X
        GLFW.set_window_icon(window, nil)
      end
    end

    while GLFW.window_should_close(window) == false
      GL.clear(GL::COLOR_BUFFER_BIT)
      GLFW.swap_buffers(window)
      GLFW.wait_events
    end

    GLFW.destroy_window(window)
  else
    puts "Failed to open GLFW window"
  end

  GLFW.terminate
else
  puts "Failed to initialize GLFW"
  exit(1)
end