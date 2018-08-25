require "../glfw"
require "stumpy_png"

status = GLFW.init
unless status == true
  raise "Failed to initialize GLFW"
end

GLFW.default_window_hints
# GLFW.window_hint() TODO: fill me
window = GLFW.create_window(640, 480, "GLFW", nil, nil)
GLFW.set_window_title(window, "GLFW (set_window_title worked!)")

puts GLFW.get_window_pos(window)
GLFW.set_window_pos(window, {x: 500, y: 500})

# GLFW.set_window_size_limits(window, 200, 200, 400, 400)
# GLFW.set_window_aspect_ratio(window, 10, 10)
# GLFW.set_window_size(window, 100, 100)
puts "framebuffer_size: #{GLFW.get_framebuffer_size(window)}"
puts "size: #{GLFW.get_window_size(window)}"
puts "frame_size: #{GLFW.get_window_frame_size(window)}"

GLFW.set_key_callback(window) do |window, key, scancode, action, mode|
  # puts "#{window}: key: #{key} scancode: #{scancode} action: #{action} mode: #{mode}"
  case action
  when GLFW::Action::Press
    case key
    when GLFW::Key::Q
      GLFW.iconify_window(window)
    when GLFW::Key::W
        GLFW.restore_window(window)
    when GLFW::Key::E
        GLFW.set_window_should_close(window, true)
    when GLFW::Key::A
      GLFW.show_window(window)
    when GLFW::Key::S
      GLFW.hide_window(window)
    when GLFW::Key::Z
      GLFW.maximize_window(window)
    when GLFW::Key::X
      GLFW.focus_window(window)
    end
  end
end

canvas = StumpyPNG.read("Icon16x16.png")
puts "width=#{canvas.width}, height=#{canvas.height}"

pixels = Pointer(UInt8).malloc(canvas.width * canvas.height * 4)
(0..canvas.height-1).each do |y|
  (0..canvas.width-1).each do |x|
    r, g, b = canvas[x, y].to_rgb8
    pos = y * canvas.width + x
    pixels[pos+0] = r
    pixels[pos+1] = g
    pixels[pos+2] = b
    pixels[pos+3] = 255
  end
end

image = GLFW::Image.new(canvas.width, canvas.height, pixels.to_slice(canvas.width * canvas.height * 4))
GLFW.set_window_icon(window, image)

while GLFW.window_should_close(window) == false
  LibGLFW.poll_events
  sleep 0.1
  #puts GLFW::Window.get_size(window)
end

GLFW.destroy_window(window)
GLFW.terminate