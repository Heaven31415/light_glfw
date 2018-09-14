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

counter = 0u32

struct Slot
  property window : GLFW::Window
  property number : Int32
  property closeable : Bool

  def initialize(@window, @number, @closeable)
  end
end

usage = ->(code : Int32) do
  puts "Usage: events [-f] [-h] [-n WINDOWS]"
  puts "Options:"
  puts "  -f use full screen"
  puts "  -h show this help"
  puts "  -n the number of windows to create"
  exit(code)
end

error_callback = ->(error : GLFW::Error, description : String) do
  puts "Error(#{error}): #{description}"
end