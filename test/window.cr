require "../src/light_glfw"
require "./gl"

GLFW.set_error_callback do |error, string|
  puts "Error: `#{error}` description: `#{string}`"
end

if GLFW.init
  GLFW.default_window_hints

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
  GLFW.window_hint_srgb_capable(true)
  GLFW.window_hint_refresh_rate(60)
  GLFW.window_hint_double_buffer(true)

  GLFW.window_hint_client_api(GLFW::ClientApi::OpenGL)
  GLFW.window_hint_context_version_major(3)
  GLFW.window_hint_context_version_minor(2)
  GLFW.window_hint_context_robustness(GLFW::ContextRobustness::None)
  GLFW.window_hint_open_gl_forward_compat(false)
  GLFW.window_hint_open_gl_debug_context(false)
  GLFW.window_hint_open_gl_profile(GLFW::OpenGLProfile::Compat)
  GLFW.window_hint_context_release_behavior(GLFW::ContextReleaseBehavior::Any)
  GLFW.window_hint_context_no_error(false)
  GLFW.window_hint_context_creation_api(GLFW::ContextCreationApi::Native)

  window = GLFW.create_window(640, 480, "GLFW", nil, nil)

  if window
    focused = GLFW.get_window_focused(window)
    iconified = GLFW.get_window_iconified(window)
    resizable = GLFW.get_window_resizable(window)
    visible = GLFW.get_window_visible(window)
    decorated = GLFW.get_window_decorated(window)
    floating = GLFW.get_window_floating(window)
    maximized = GLFW.get_window_maximized(window)
    client_api = GLFW.get_window_client_api(window)
    context_version_major = GLFW.get_window_context_version_major(window)
    context_version_minor = GLFW.get_window_context_version_minor(window)
    context_revision = GLFW.get_window_context_revision(window)
    context_robustness = GLFW.get_window_context_robustness(window)
    open_gl_forward_compat = GLFW.get_window_open_gl_forward_compat(window)
    open_gl_debug_context = GLFW.get_window_open_gl_debug_context(window)
    open_gl_profile = GLFW.get_window_open_gl_profile(window)
    context_release_behavior = GLFW.get_window_context_release_behavior(window)
    context_no_error = GLFW.get_window_context_no_error(window)
    context_creation_api = GLFW.get_window_context_creation_api(window)

    GLFW.set_window_pos_callback(window) do |window, x, y|
      puts "window_pos_callback => x: #{x} y: #{y}"
    end

    GLFW.set_window_size_callback(window) do |window, width, height|
      puts "window_size_callback => width: #{width} height: #{height}"
      GL.viewport(0, 0, width, height)
    end

    GLFW.set_window_close_callback(window) do |window|
      puts "window_close_callback"
    end

    GLFW.set_window_refresh_callback(window) do |window|
      puts "window_refresh_callback"
    end

    GLFW.set_window_focus_callback(window) do |window, focused|
      puts "window_focus_callback => focused: #{focused}"
    end

    GLFW.set_window_iconify_callback(window) do |window, iconified|
      puts "window_iconify_callback => iconified: #{iconified}"
    end

    GLFW.set_framebuffer_size_callback(window) do |window, width, height|
      puts "window_framebuffer_callback => width: #{width} height: #{height}"
    end

    title = "DOOM"
    user_data = Array(Int32).new
    GLFW.set_window_user_pointer(window, Pointer(Void).new(user_data.object_id))

    GLFW.set_key_callback(window) do |window, key, scancode, action, mode|
      if action != GLFW::Action::Press
        next
      end

      case key
      when GLFW::Key::Escape
        GLFW.set_window_should_close(window, true)
      when GLFW::Key::Q
        title = title.reverse
        GLFW.set_window_title(window, title)
      when GLFW::Key::W
        pixels = Pointer(UInt8).malloc(16 * 16 * 4)
        (16 * 16 * 4).times do |i|
          pixels[i] = Random.rand(256).to_u8
        end
        image = GLFW::Image.new(16, 16, pixels)
        GLFW.set_window_icon(window, image)
      when GLFW::Key::E
        puts GLFW.get_window_pos(window)
      when GLFW::Key::R
        GLFW.set_window_pos(window, {x: 500, y: 500})
      when GLFW::Key::T
        puts GLFW.get_window_size(window)
      when GLFW::Key::Y
        GLFW.set_window_size_limits(window, 320, 240, 480, 320)
      when GLFW::Key::U
        GLFW.set_window_aspect_ratio(window, 16, 9)
      when GLFW::Key::A
        GLFW.set_window_size(window, 500, 500)
      when GLFW::Key::S
        puts GLFW.get_framebuffer_size(window)
      when GLFW::Key::D
        puts GLFW.get_window_frame_size(window)
      when GLFW::Key::F
        GLFW.iconify_window(window)
      when GLFW::Key::G
        GLFW.restore_window(window)
      when GLFW::Key::H
        GLFW.maximize_window(window)
      when GLFW::Key::J
        GLFW.show_window(window)
      when GLFW::Key::K
        GLFW.hide_window(window)
      when GLFW::Key::L
        GLFW.focus_window(window)
      when GLFW::Key::Z
        puts GLFW.get_window_monitor(window)
      when GLFW::Key::X
        GLFW.set_window_monitor(window, nil, 0, 0, 800, 600, nil)
      when GLFW::Key::C
        data = GLFW.get_window_user_pointer(window).as(Array(Int32))
        data << Random.rand(256)
        puts data
      when GLFW::Key::V
        GLFW.post_empty_event
      end
    end

    GLFW.get_window_monitor(window)

    GLFW.make_context_current(window)
    while !GLFW.window_should_close(window)
      GLFW.wait_events

      GL.clear(GL::COLOR_BUFFER_BIT)
      GL.color3d(1.0, 0.0, 0.0)

      GL.begin_ GL::QUADS
        GL.vertex2d(+0.5, +0.5)
        GL.vertex2d(+0.5, -0.5)
        GL.vertex2d(-0.5, -0.5)
        GL.vertex2d(-0.5, +0.5)
      GL.end_

      GLFW.swap_buffers(window)
    end
  
    GLFW.destroy_window(window)
  end

  GLFW.terminate
end