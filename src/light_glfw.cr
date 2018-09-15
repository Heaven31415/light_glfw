require "./enums"
require "./functions"

require "./context/*"
require "./init/*"
require "./input/*"
require "./monitor/*"
require "./window/*"

{% begin %}
  LibGLFW::MINIMUM = "3.2.1"
  LibGLFW::EXISTS  = {{ `command -v pkg-config > /dev/null && pkg-config --exists glfw3 || printf %s false`.stringify != "false" }}
  LibGLFW::VERSION = {{ `pkg-config --modversion --silence-errors glfw3 || printf %s 0.0.0`.stringify }}
{% end %}

{% if !LibGLFW::EXISTS %}
  raise "Unable to find installed GLFW3 library on your system"
{% elsif compare_versions(LibGLFW::VERSION, LibGLFW::MINIMUM) == -1 %}
  raise "Your GLFW3 library is too old. You have {{LibGLFW::VERSION.id}} version, but need {{LibGLFW::MINIMUM.id}}"
{% else %}
  @[Link("glfw")]
{% end %}
lib LibGLFW
end

module GLFW
  VERSION = "0.1.0"
end
