# ========================================================================
# Cursor & input mode tests
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
# ========================================================================
#
# This test provides an interface to the cursor image and cursor mode
# parts of the API.
#
# Custom cursor image generation by urraka.
#
# ========================================================================

require "../utility"

module Test
  CURSOR_FRAME_COUNT = 60

  @@cursor_x = 0.0
  @@cursor_y = 0.0
  @@swap_interval = 1
  @@wait_events = true
  @@animate_cursor = false
  @@track_cursor = false
  @@standard_cursors = Array(GLFW::Cursor).new(6)
  @@star_cursors = Array(GLFW::Cursor).new(CURSOR_FRAME_COUNT)
  @@current_frame : GLFW::Cursor? = nil

  def self.error_callback(error : GLFW::Error, string : String) : Nil
    puts "error: #{error} string: #{string}"
  end

  def self.star(x : Int32, y : Int32, t : Float32) : Float32
    c = 64 / 2f32
    i = (0.25f32 * Math.sin(2f32 * Math::PI * t) + 0.75f32)
    k = 64 * 0.046875f32 * i

    dx = (x - c).abs
    dy = (y - c).abs

    dist = Math.sqrt(dx * dx + dy * dy)

    salpha = 1f32 - dist / c
    xalpha = (x == c) ? c : k / dx
    yalpha = (y == c) ? c : k / dy

    Math.max(0f32, Math.min(1f32, i * salpha * 0.2f32 + salpha * xalpha * yalpha))
  end

  def self.create_cursor_frame(t : Float32) : GLFW::Cursor?
    buffer = Pointer(UInt8).malloc(64 * 64 * 8)
    image = GLFW::Image.new(64, 64, buffer)

    image.height.times do |y|
      image.width.times do |x|
        index = 4 * (y * image.width + x)
        buffer[index + 0] = 255
        buffer[index + 1] = 255
        buffer[index + 2] = 255
        buffer[index + 3] = (255 * star(x, y, t)).to_u8
      end
    end

    GLFW.create_cursor(image, image.width / 2, image.height / 2)
  end

  def self.cursor_pos_callback(window : GLFW::Window, x : Float64, y : Float64) : Nil
    dx = (x - @@cursor_x).abs
    dy = (y - @@cursor_y).abs

    printf "%.3f: Cursor position: %f %f (%f %f)\n", GLFW.get_time, x, y, dx, dy

    @@cursor_x = x
    @@cursor_y = y
  end

  def self.key_callback(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod) : Nil
    return if action != GLFW::Action::Press

    case key
    when GLFW::Key::A
      @@animate_cursor = !@@animate_cursor
      unless @@animate_cursor
        GLFW.set_cursor(window, nil)
      end
    when GLFW::Key::Escape
      if GLFW.get_cursor_input_mode(window) != GLFW::CursorInputMode::Disabled
        GLFW.set_window_should_close(window, true)
      end
    when GLFW::Key::N
      GLFW.set_cursor_input_mode(window, GLFW::CursorInputMode::Normal)
      puts "(( cursor is normal ))"
    when GLFW::Key::D
      GLFW.set_cursor_input_mode(window, GLFW::CursorInputMode::Disabled)
      puts "(( cursor is disabled ))"
    when GLFW::Key::H
      GLFW.set_cursor_input_mode(window, GLFW::CursorInputMode::Hidden)
      puts "(( cursor is hidden ))"
    when GLFW::Key::Space
      @@swap_interval = 1 - @@swap_interval
      puts "(( swap interval: #{@@swap_interval} ))"
      GLFW.swap_interval(@@swap_interval)
    when GLFW::Key::W
      @@wait_events = !@@wait_events
      puts "(( #{@@wait_events ? "wait" : "poll"}ing for events ))"
    when GLFW::Key::T
      @@track_cursor = !@@track_cursor
    when GLFW::Key::Num0
      GLFW.set_cursor(window, nil)
    when GLFW::Key::Num1
      GLFW.set_cursor(window, @@standard_cursors[0])
    when GLFW::Key::Num2
      GLFW.set_cursor(window, @@standard_cursors[1])
    when GLFW::Key::Num3
      GLFW.set_cursor(window, @@standard_cursors[2])
    when GLFW::Key::Num4
      GLFW.set_cursor(window, @@standard_cursors[3])
    when GLFW::Key::Num5
      GLFW.set_cursor(window, @@standard_cursors[4])
    when GLFW::Key::Num6
      GLFW.set_cursor(window, @@standard_cursors[5])
    end
  end

  def self.main : Nil
    GLFW.set_error_callback(error_callback)

    unless GLFW.init
      exit(EXIT_FAILURE)
    end

    CURSOR_FRAME_COUNT.times do |i|
      cursor = create_cursor_frame(i / CURSOR_FRAME_COUNT.to_f32)
      unless cursor
        GLFW.terminate
        exit(EXIT_FAILURE)
      else
        @@star_cursors << cursor
      end
    end

    GLFW::CursorShape.each do |member|
      cursor = GLFW.create_standard_cursor(member)
      unless cursor
        GLFW.terminate
        exit(EXIT_FAILURE)
      else
        @@standard_cursors << cursor
      end
    end

    unless window = GLFW.create_window(640, 480, "Cursor Test")
      GLFW.terminate
      exit(EXIT_FAILURE)
    else
      GLFW.make_context_current(window)

      pos = GLFW.get_cursor_pos(window)
      puts "Cursor position: #{pos[:x]} #{pos[:y]}"

      GLFW.set_cursor_pos_callback(window, cursor_pos_callback)
      GLFW.set_key_callback(window, key_callback)

      while !GLFW.window_should_close(window)
        GL.clear(GL::COLOR_BUFFER_BIT)

        if @@track_cursor
          w_size = GLFW.get_window_size(window)
          f_size = GLFW.get_framebuffer_size(window)

          scale = f_size[:width].to_f32 / w_size[:width].to_f32

          GL.viewport(0, 0, f_size[:width], f_size[:height])

          GL.matrix_mode(GL::PROJECTION)
          GL.load_identity
          GL.ortho(0f32, f_size[:width], 0f32, f_size[:height], 0f32, 1f32)

          GL.begin_ GL::LINES
          GL.vertex2f(0f32, f_size[:height] - @@cursor_y * scale)
          GL.vertex2f(f_size[:width], f_size[:height] - @@cursor_y * scale)
          GL.vertex2f(@@cursor_x * scale, 0f32)
          GL.vertex2f(@@cursor_x * scale, f_size[:height])
          GL.end_
        end

        GLFW.swap_buffers(window)

        if @@animate_cursor
          i = (GLFW.get_time * 30.0).to_i32 % CURSOR_FRAME_COUNT

          if @@current_frame != @@star_cursors[i]
            GLFW.set_cursor(window, @@star_cursors[i])
            @@current_frame = @@star_cursors[i]
          end
        else
          @@current_frame = nil
        end

        if @@wait_events
          if @@animate_cursor
            GLFW.wait_events_timeout(1.0 / 30.0)
          else
            GLFW.wait_events
          end
        else
          GLFW.poll_events
        end
      end

      GLFW.terminate
      exit(EXIT_SUCCESS)
    end
  end

  main
end
