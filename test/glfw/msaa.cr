#========================================================================
# Multisample anti-aliasing test
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
# This test renders two high contrast, slowly rotating quads, one aliased
# and one (hopefully) anti-aliased, thus allowing for visual verification
# of whether MSAA is indeed enabled
#
#========================================================================

require "../utility"

module Test
  def self.error_callback(error : GLFW::Error, description : String)
    puts "Error: #{description}"
  end

  def self.framebuffer_size_callback(window : GLFW::Window, width : Int32, height : Int32)
    GL.viewport(0, 0, width, height)
  end

  def self.key_callback(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod)
    return if action != GLFW::Action::Press

    if key == GLFW::Key::Space
      GLFW.set_time(0.0)
    end
  end

  def self.usage(code : Int32)
    puts "Usage: msaa [-h] [-s SAMPLES]"
    exit(code)
  end

  def self.main : Nil
    samples = 4
    OptionParser.parse! do |parser|
      parser.on("-h", "Show this help") { usage(EXIT_SUCCESS) }
      parser.on("-s SAMPLES", "Specify number of samples") { |s| samples = s.to_i32 }
      parser.invalid_option { usage(EXIT_FAILURE) }
    end

    GLFW.set_error_callback(error_callback)

    unless GLFW.init
      exit(EXIT_FAILURE)
    else
      if samples != 0
        puts "Requesting MSAA with #{samples} samples"
      else
        puts "Requesting that MSAA won't be available"
      end

      GLFW.window_hint_samples(samples)
      GLFW.window_hint_visible(false)

      unless window = GLFW.create_window(800, 400, "Aliasing Detector")
        GLFW.terminate
        exit(EXIT_FAILURE)
      else
        GLFW.set_key_callback(window, key_callback)
        GLFW.set_framebuffer_size_callback(window, framebuffer_size_callback)

        GLFW.make_context_current(window)
        GLFW.swap_interval(1)

        unless GLFW.extension_supported("GL_ARB_multisample")
          puts "Multisampling is not supported!"

          GLFW.terminate
          exit(EXIT_FAILURE)
        end

        GLFW.show_window(window)

        GL.get_integerv(GL::SAMPLES, pointerof(samples))
        if samples != 0
          puts "Context reports MSAA is available with #{samples} samples"
        else
          puts "Context reports MSAA is unavailable"
        end

        GL.matrix_mode(GL::PROJECTION)
        GL.ortho(0.0, 1.0, 0.0, 0.5, 0.0, 1.0)
        GL.matrix_mode(GL::MODELVIEW)

        until GLFW.window_should_close(window)
          time = GLFW.get_time.to_f32

          GL.clear(GL::COLOR_BUFFER_BIT)

          GL.load_identity
          GL.translatef(0.25f32, 0.25f32, 0f32)
          GL.rotatef(time, 0f32, 0f32, 1f32)

          GL.disable(GL::MULTISAMPLE_ARB)
          GL.rectf(-0.15f32, -0.15f32, 0.15f32, 0.15f32)

          GL.load_identity
          GL.translatef(0.75f32, 0.25f32, 0f32)
          GL.rotatef(time, 0f32, 0f32, 1f32)

          GL.enable(GL::MULTISAMPLE_ARB)
          GL.rectf(-0.15f32, -0.15f32, 0.15f32, 0.15f32)

          GLFW.swap_buffers(window)
          GLFW.poll_events
        end

        GLFW.terminate
        exit(EXIT_SUCCESS)
      end
    end
  end

  main
end