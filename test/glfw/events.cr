#========================================================================
# Event linter (event spewer)
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
# This test hooks every available callback and outputs their arguments
#
# Log messages go to stdout, error messages to stderr
#
# Every event also gets a (sequential) number to aid discussion of logs
#
#========================================================================

require "../utility"

module Test
  @@counter = 0u32

  struct Slot
    property window : GLFW::Window
    property number : Int32
    property closeable : Bool

    def initialize(@window, @number, @closeable)
    end
  end

  def self.usage(code : Int32)
    puts "Usage: events [-f] [-h] [-n WINDOWS]"
    puts "Options:"
    puts "  -f use full screen"
    puts "  -h show this help"
    puts "  -n the number of windows to create"
    exit(code)
  end

  def self.error_callback(error : GLFW::Error, description : String)
  end

  def self.window_pos_callback(window : GLFW::Window, x : Int32, y : Int32)
  end

  def self.window_size_callback(window : GLFW::Window, width : Int32, height : Int32)
  end

  def self.framebuffer_size_callback(window : GLFW::Window, width : Int32, height : Int32)
  end

  def self.window_close_callback(window : GLFW::Window)
  end

  def self.window_refresh_callback(window : GLFW::Window)
  end

  def self.window_focus_callback(window : GLFW::Window, focused : Bool)
  end

  def self.window_iconify_callback(window : GLFW::Window, iconified : Bool)
  end

  def self.mouse_button_callback(window : GLFW::Window, button : GLFW::MouseButton, action : GLFW::Action, mods : GLFW::Mod)
  end

  def self.cursor_position_callback(window : GLFW::Window, x : Float64, y : Float64)
  end

  def self.cursor_enter_callback(window : GLFW::Window, entered : Bool)
  end

  def self.scroll_callback(window : GLFW::Window, dx : Float64, dy : Float64)
  end

  def self.key_callback(window : GLFW::Window, key : GLFW::Key, scancode : Int32, action : GLFW::Action, mods : GLFW::Mod)
  end

  def self.char_callback(window : GLFW::Window, char : Char)
  end

  def self.char_mods_callback(window : GLFW::Window, char : Char, mods : GLFW::Mod)
  end

  def self.drop_callback(window : GLFW::Window, paths : Array(String))
  end

  def self.monitor_callback(monitor : GLFW::Monitor, event : GLFW::Event)
  end

  def self.joystick_callback(joy : GLFW::Joystick, event : GLFW::Event)
  end
end