#========================================================================
# Multi-threading test
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
# This test is intended to verify whether the OpenGL context part of
# the GLFW API is able to be used from multiple threads
#
#========================================================================

require "../utility"

module Test
  class Thread
    property window : GLFW::Window?
    property title : String
    property r : Float32
    property g : Float32
    property b : Float32
    property id : UInt64

    def initialize(@window, @title, @r, @g, @b, @id)
    end
  end

  @@running = true

  def self.error_callback(error : GLFW::Error, description : String)
    puts "Error: #{description}"
  end

  def self.thread_main(data : Void*) : Void*
    thread = data.as(Thread)

    GLFW.make_context_current(thread.window)
    GLFW.swap_interval(1)

    while @@running
      v = Math.sin(GLFW.get_time * 2.0).abs.to_f32
      GL.clear_color(thread.r * v, thread.g * v, thread.b * v, 0f32)

      GL.clear(GL::COLOR_BUFFER_BIT)
      GLFW.swap_buffers(thread.window.as(GLFW::Window))
    end

    GLFW.make_context_current(nil)
    Pointer(Void).null
  end

  def self.main
    threads = [
      Thread.new(nil, "Red", 1f32, 0f32, 0f32, 0u64),
      Thread.new(nil, "Green", 0f32, 1f32, 0f32, 0u64),
      Thread.new(nil, "Blue", 0f32, 0f32, 1f32, 0u64)
    ]

    GLFW.set_error_callback(error_callback)

    unless GLFW.init
      exit(EXIT_FAILURE)
    else
      GLFW.window_hint_visible(false)

      threads.each_with_index do |thread, i|
        thread.window = GLFW.create_window(200, 200, thread.title)

        unless window = thread.window
          GLFW.terminate
          exit(EXIT_FAILURE)
        else
          GLFW.set_window_pos(window, {x: 200 + 250 * i, y: 200})
          GLFW.show_window(window)
        end
      end

      threads.each do |thread|
        if LibC.pthread_create(pointerof(thread.@id), nil, ->thread_main, thread.as(Void*)) != 0
          puts "Failed to create secondary thread"

          GLFW.terminate
          exit(EXIT_FAILURE)
        end
      end

      while @@running
        GLFW.wait_events

        threads.each do |thread|
          if GLFW.window_should_close(thread.window.as(GLFW::Window))
            @@running = false
          end
        end
      end

      threads.each do |thread|
        GLFW.hide_window(thread.window.as(GLFW::Window))
      end

      threads.each do |thread|
        LibC.pthread_join(thread.id, nil)
      end

      exit(EXIT_SUCCESS)
    end
  end

  main
end