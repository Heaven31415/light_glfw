require "./utility"

GLFW.set_error_callback do |error, string|
  puts "Error: `#{error}` description: `#{string}`"
end

if GLFW.init
  monitors = GLFW.get_monitors
  puts "monitors: #{monitors}"

  primary_monitor = GLFW.get_primary_monitor

  if primary_monitor
    puts "primary_monitor: #{primary_monitor}"

    position = GLFW.get_monitor_pos(primary_monitor)
    puts "primary_monitor x: #{position[:x]} y: #{position[:y]}"

    physical_size = GLFW.get_monitor_physical_size(primary_monitor)
    puts "primary_monitor width: #{physical_size[:width]}mm height: #{physical_size[:height]}mm"

    name = GLFW.get_monitor_name(primary_monitor)
    puts "primary_monitor name: #{name}"

    GLFW.set_monitor_callback do |monitor, event|
      case event
      when GLFW::Event::Connected
        puts "monitor #{monitor} has been connected"
      when GLFW::Event::Disconnected
        puts "monitor #{monitor} has been disconnected"
      end
    end

    video_modes = GLFW.get_video_modes(primary_monitor)
    if video_modes
      video_modes.each { |video_mode| puts "video_mode: #{video_mode}" }
    end

    video_mode = GLFW.get_video_mode(primary_monitor)
    puts "video_mode: #{video_mode}"

    # NOTE: Right now this won't work on X11 because I'm using GLFW 3.2.1 999f355
    # and bug with glfwSetGamma was fixed with: 
    # https://github.com/glfw/glfw/commit/66b16f1fc1cfb1ee68ccbbc09e56646e3ab1e6fe
    # GLFW.set_gamma(primary_monitor, 1.0f32)

    gamma_ramp = GLFW.get_gamma_ramp(primary_monitor)
    if gamma_ramp
      puts "gamma_ramp size: #{gamma_ramp.size}"

      puts "gamma_ramp red:"
      20.times do |i|
        print "#{gamma_ramp.red[i]} "
        puts if i == 19
      end

      puts "gamma_ramp green:"
      20.times do |i|
        print "#{gamma_ramp.green[i]} "
        puts if i == 19
      end

      puts "gamma_ramp blue:"
      20.times do |i|
        print "#{gamma_ramp.blue[i]} "
        puts if i == 19
      end

      GLFW.set_gamma_ramp(primary_monitor, gamma_ramp)
    end
  end

  GLFW.terminate
end