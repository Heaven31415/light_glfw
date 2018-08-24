require "./glfw.cr"

#############################
# init functions test
#############################

# version = GLFW.get_version
# puts "Major: #{version[:major]}, Minor: #{version[:minor]}, Revision: #{version[:rev]}"

# version_string = GLFW.get_version_string
# puts "Version String: `#{version_string}`"

# GLFW.set_error_callback do |error, description|
#   raise "Error: #{error} => #{description}"
# end

# status = GLFW.init
# unless status == true
#   raise "Failed to initialize GLFW"
# end

# GLFW.terminate

#############################
# monitor functions test
#############################

status = GLFW.init
unless status == true
  raise "Failed to initialize GLFW"
end

monitors = GLFW::Monitor.get_array
puts "#{monitors.size} monitors have been found"

primary = GLFW::Monitor.get_primary
puts "Primary monitor: #{primary}"

position = GLFW::Monitor.get_position(primary)
puts "Primary monitor x: #{position[:x]}, y: #{position[:y]}"

physical_size = GLFW::Monitor.get_physical_size(primary)
puts "Primary monitor physical size width: #{physical_size[:width]}mm, height: #{physical_size[:height]}mm"

name = GLFW::Monitor.get_name(primary)
puts "Primary monitor name: #{name}"

GLFW::Monitor.set_callback do |monitor, event|
  case event
  when GLFW::Event::Monitor::Connected
    puts "Monitor #{monitor} has been connected"
  when GLFW::Event::Monitor::Disconnected
    puts "Monitor #{monitor} has been disconnected"
  end
end

video_modes = GLFW::Monitor.get_video_modes(primary)
puts "Found #{video_modes.size} video modes for #{primary}"
video_modes.each do |video_mode|
  puts "Video mode: #{video_mode}"
end

# I'm unable to find correct gamma value, however
# it must be greater than zero
# GLFW::Monitor.set_gamma(primary, 0.0f32)

gamma_ramp = GLFW::Monitor.get_gamma_ramp(primary)
puts "Gamma Ramp size: #{gamma_ramp.size}"
puts "Gamma Ramp red:"
20.times do |i|
  print "#{gamma_ramp.red[i]} "
  puts if i == 19
end

puts "Gamma Ramp green:"
20.times do |i|
  print "#{gamma_ramp.green[i]} "
  puts if i == 19
end

puts "Gamma Ramp blue:"
20.times do |i|
  print "#{gamma_ramp.blue[i]} "
  puts if i == 19
end

GLFW::Monitor.set_gamma_ramp(primary, gamma_ramp)

GLFW.terminate

#############################
# window functions test
#############################

# require "stumpy_png"

# status = GLFW.init
# unless status == true
#   raise "Failed to initialize GLFW"
# end

# GLFW::Window.set_default_hints
# window = GLFW::Window.create(640, 480, "GLFW", nil, nil)

# canvas = StumpyPNG.read("Icon16x16.png")
# puts "width=#{canvas.width}, height=#{canvas.height}"

# pixels = Pointer(UInt8).malloc(canvas.width * canvas.height * 4)
# (0..canvas.width-1).each do |x|
#   (0..canvas.height-1).each do |y|
#     r, g, b = canvas[x, y].to_rgb8
#     pos = y + canvas.width + x
#     pixels[pos+0] = r
#     pixels[pos+1] = g
#     pixels[pos+2] = b
#     pixels[pos+3] = 255
#   end
# end

# image = GLFW::Image.new(canvas.width, canvas.height, pixels.to_slice(canvas.width * canvas.height * 4))
# GLFW::Window.set_icon(window, image)

# while GLFW::Window.should_close(window) == false
#   LibGLFW.poll_events
#   sleep 0.1
# end

# GLFW.terminate