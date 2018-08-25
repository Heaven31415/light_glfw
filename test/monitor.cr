require "../glfw"

status = GLFW.init
unless status == true
  raise "Failed to initialize GLFW"
end

monitors = GLFW.get_monitors
puts "#{monitors.size} monitors have been found"

primary = GLFW.get_primary_monitor
puts "Primary monitor: #{primary}"

position = GLFW.get_monitor_pos(primary)
puts "Primary monitor x: #{position[:x]}, y: #{position[:y]}"

physical_size = GLFW.get_monitor_physical_size(primary)
puts "Primary monitor physical size width: #{physical_size[:width]}mm, height: #{physical_size[:height]}mm"

name = GLFW.get_monitor_name(primary)
puts "Primary monitor name: #{name}"

GLFW.set_monitor_callback do |monitor, event|
  case event
  when GLFW::Event::Monitor::Connected
    puts "Monitor #{monitor} has been connected"
  when GLFW::Event::Monitor::Disconnected
    puts "Monitor #{monitor} has been disconnected"
  end
end

video_modes = GLFW.get_video_modes(primary)
puts "Found #{video_modes.size} video modes for #{primary}"
video_modes.each do |video_mode|
  puts "Video mode: #{video_mode}"
end

# I'm unable to find correct gamma value, however it must be greater than zero
# GLFW::Monitor.set_gamma(primary, 0.0f32)

gamma_ramp = GLFW.get_gamma_ramp(primary)
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

GLFW.set_gamma_ramp(primary, gamma_ramp)

GLFW.terminate