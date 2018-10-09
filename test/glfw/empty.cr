#========================================================================
# Empty event test
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
# This test is intended to verify that posting of empty events works
#
#========================================================================

require "../utility"

lib LibC
  fun sleep(seconds : LibC::UInt) : LibC::UInt
end

module Test
  @@running = true

  def self.error_callback(error : GLFW::Error, string : String) : Nil
    puts "error: #{error} string: #{string}"
  end

  def self.key_callback(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod) : Nil
    if key.escape? && action.press?
      GLFW.set_window_should_close(window, true)
    end
  end

  def self.event_sender(arg : Pointer(Void)) : Pointer(Void)
    while @@running
      LibC.sleep(1)
      GLFW.post_empty_event
    end

    Pointer(Void).null
  end

  def self.main
    GLFW.set_error_callback(error_callback)

    unless GLFW.init
      exit(EXIT_FAILURE)
    end

    unless window = GLFW.create_window(640, 480, "Empty Event Test")
      GLFW.terminate
      exit(EXIT_FAILURE)
    else
      GLFW.make_context_current(window)
      GLFW.set_key_callback(window, key_callback)

      if LibC.pthread_create(out thread, nil, ->event_sender, nil) != 0
        puts "Failed to create secondary thread"

        GLFW.terminate
        exit(EXIT_FAILURE)
      end

      while @@running
        r, g, b = rand.to_f32, rand.to_f32, rand.to_f32
        l = Math.sqrt(r * r + g * g + b * b)

        f_size = GLFW.get_framebuffer_size(window)

        GL.viewport(0, 0, f_size[:width], f_size[:height])
        GL.clear_color(r / l, g / l, b / l, 1f32)
        GL.clear(GL::COLOR_BUFFER_BIT)
        GLFW.swap_buffers(window)

        GLFW.wait_events

        if GLFW.window_should_close(window)
          @@running = false
        end
      end

      GLFW.hide_window(window)
      LibC.pthread_join(thread, nil)
      GLFW.destroy_window(window)

      GLFW.terminate
      exit(EXIT_SUCCESS)
    end
  end

  main
end