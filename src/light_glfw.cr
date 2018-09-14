require "./enums"
require "./functions"

require "./context/*"
require "./init/*"
require "./input/*"
require "./monitor/*"
require "./vulkan/*"
require "./window/*"

@[Link("glfw")]
lib LibGLFW
end

module GLFW
  VERSION = "0.1.0"
end
