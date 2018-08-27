require "../glfw"
require "./gl"
# require "stumpy_png"

GLFW.set_error_callback do |error, string|
  puts "Error: #{error}, String: #{string}"
end

if GLFW.init() == true
  GLFW.window_hint_focused(true)
  GLFW.window_hint_resizable(true)
  GLFW.window_hint_visible(true)
  GLFW.window_hint_decorated(true)
  GLFW.window_hint_auto_iconify(false)
  GLFW.window_hint_floating(false)
  GLFW.window_hint_maximized(false)

  GLFW.window_hint_red_bits(8)
  GLFW.window_hint_green_bits(8)
  GLFW.window_hint_blue_bits(8)
  GLFW.window_hint_alpha_bits(8)
  GLFW.window_hint_depth_bits(0)
  GLFW.window_hint_stencil_bits(0)
  GLFW.window_hint_accum_red_bits(8)
  GLFW.window_hint_accum_green_bits(8)
  GLFW.window_hint_accum_blue_bits(8)
  GLFW.window_hint_accum_alpha_bits(8)
  GLFW.window_hint_aux_buffers(0)
  GLFW.window_hint_stereo(false)
  GLFW.window_hint_samples(0)
  GLFW.window_hint_refresh_rate(60)
  GLFW.window_hint_double_buffer(true)

  GLFW.window_hint_client_api(GLFW::ClientApi::OpenGL)
  GLFW.window_hint_context_version_major(4)
  GLFW.window_hint_context_version_minor(6)
  GLFW.window_hint_context_robustness(GLFW::ContextRobustness::None)
  GLFW.window_hint_open_gl_forward_compat(false)
  GLFW.window_hint_open_gl_debug_context(true)
  GLFW.window_hint_open_gl_profile(GLFW::OpenGLProfile::Compat)
  GLFW.window_hint_context_release_behavior(GLFW::ContextReleaseBehavior::Any)
  GLFW.window_hint_context_no_error(false)
  GLFW.window_hint_context_creation_api(GLFW::ContextCreationApi::Native)

  window = GLFW.create_window(640, 480, "GLFW", nil, nil)

  if window
    # Window Attributes: 
    puts "focused: #{GLFW.get_window_focused(window)}"
    puts "iconified: #{GLFW.get_window_iconified(window)}"
    puts "resizable: #{GLFW.get_window_resizable(window)}"
    puts "visible: #{GLFW.get_window_visible(window)}"
    puts "decorated: #{GLFW.get_window_decorated(window)}"
    puts "floating: #{GLFW.get_window_floating(window)}"
    puts "maximized: #{GLFW.get_window_maximized(window)}"
    puts "client_api: #{GLFW.get_window_client_api(window)}"
    puts "context_version_major: #{GLFW.get_window_context_version_major(window)}"
    puts "context_version_minor: #{GLFW.get_window_context_version_minor(window)}"
    puts "context_revision: #{GLFW.get_window_context_revision(window)}"
    puts "context_robustness: #{GLFW.get_window_context_robustness(window)}"
    puts "open_gl_forward_compat: #{GLFW.get_window_open_gl_forward_compat(window)}"
    puts "open_gl_debug_context: #{GLFW.get_window_open_gl_debug_context(window)}"
    puts "open_gl_profile: #{GLFW.get_window_open_gl_profile(window)}"
    puts "open_gl_context_release_behavior: #{GLFW.get_window_context_release_behavior(window)}"
    puts "open_gl_context_no_error: #{GLFW.get_window_context_no_error(window)}"
    puts "open_gl_context_creation_api: #{GLFW.get_window_context_creation_api(window)}"

    data = [1, 2, 3]
    GLFW.set_window_user_pointer(window, Pointer(Void).new(data.object_id))
    GLFW.set_window_pos_callback(window) do |window, x, y|
      data = GLFW.get_window_user_pointer(window).as(Array(Int32))
      puts data
    end

    # GLFW.set_window_size_callback(window) do |window, width, height|
    #   GL.viewport(0, 0, width, height)
    # end

    # GLFW.set_window_close_callback(window) do
    #   puts "Please don't go!"
    # end

    # GLFW.set_window_refresh_callback(window) do
    #   puts "Strange... I'm refreshing myself!"
    # end

    # GLFW.set_framebuffer_size_callback(window) do |window, width, height|
    #   puts "width: #{width} height: #{height}"
    # end

    # GLFW.set_window_iconify_callback(window) do |window, iconified|
    #   if iconified
    #     puts "I'm iconified!"
    #   else
    #     puts "I'm not iconified!"
    #   end
    # end

    # GLFW.set_window_focus_callback(window) do |window, focused|
    #   if focused
    #     puts "I'm focused! I like it!"
    #   else
    #     puts "Nobody is looking at me! I hate it!"
    #   end
    # end

    GLFW.set_key_callback(window) do |window, key, scancode, action, mode|
      if action != GLFW::Action::Press
        next
      end

      case key
      when GLFW::Key::W
        GLFW.set_window_pos_callback(window) {}
      when GLFW::Key::Escape
        # GLFW.set_window_should_close(window, true)
      end
    end

    GLFW.get_window_monitor(window)

    GLFW.make_context_current(window)
    while !GLFW.window_should_close(window)
      GLFW.poll_events

      GL.clear(GL::COLOR_BUFFER_BIT)

      GL.color3d(1.0, 0.0, 0.0)

      GL.begin_ GL::QUADS
        GL.vertex2d(+0.5, +0.5)
        GL.vertex2d(+0.5, -0.5)
        GL.vertex2d(-0.5, -0.5)
        GL.vertex2d(-0.5, +0.5)
      GL.end_

      GLFW.swap_buffers(window)

      sleep 0.1
    end
  
    GLFW.destroy_window(window)
  end

  GLFW.terminate()
end


# status = GLFW.init
# unless status == true
#   raise "Failed to initialize GLFW"
# end

# GLFW.default_window_hints
# # GLFW.window_hint() TODO: fill me
# window = GLFW.create_window(640, 480, "GLFW", nil, nil)
# GLFW.set_window_title(window, "GLFW (set_window_title worked!)")

# puts GLFW.get_window_pos(window)
# GLFW.set_window_pos(window, {x: 500, y: 500})

# # GLFW.set_window_size_limits(window, 200, 200, 400, 400)
# # GLFW.set_window_aspect_ratio(window, 10, 10)
# # GLFW.set_window_size(window, 100, 100)
# puts "framebuffer_size: #{GLFW.get_framebuffer_size(window)}"
# puts "size: #{GLFW.get_window_size(window)}"
# puts "frame_size: #{GLFW.get_window_frame_size(window)}"

# GLFW.set_key_callback(window) do |window, key, scancode, action, mode|
#   # puts "#{window}: key: #{key} scancode: #{scancode} action: #{action} mode: #{mode}"
#   case action
#   when GLFW::Action::Press
#     case key
#     when GLFW::Key::Q
#       GLFW.iconify_window(window)
#     when GLFW::Key::W
#         GLFW.restore_window(window)
#     when GLFW::Key::E
#         GLFW.set_window_should_close(window, true)
#     when GLFW::Key::A
#       GLFW.show_window(window)
#     when GLFW::Key::S
#       GLFW.hide_window(window)
#     when GLFW::Key::Z
#       GLFW.maximize_window(window)
#     when GLFW::Key::X
#       GLFW.focus_window(window)
#     end
#   end
# end

# canvas = StumpyPNG.read("Icon16x16.png")
# puts "width=#{canvas.width}, height=#{canvas.height}"

# pixels = Pointer(UInt8).malloc(canvas.width * canvas.height * 4)
# (0..canvas.height-1).each do |y|
#   (0..canvas.width-1).each do |x|
#     r, g, b = canvas[x, y].to_rgb8
#     pos = y * canvas.width + x
#     pixels[pos+0] = r
#     pixels[pos+1] = g
#     pixels[pos+2] = b
#     pixels[pos+3] = 255
#   end
# end

# image = GLFW::Image.new(canvas.width, canvas.height, pixels.to_slice(canvas.width * canvas.height * 4))
# GLFW.set_window_icon(window, image)

# while GLFW.window_should_close(window) == false
#   LibGLFW.poll_events
#   sleep 0.1
#   #puts GLFW::Window.get_size(window)
# end

# GLFW.destroy_window(window)
# GLFW.terminate