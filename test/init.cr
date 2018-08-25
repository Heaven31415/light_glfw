require "../glfw"

version = GLFW.get_version
puts "Major: #{version[:major]}, Minor: #{version[:minor]}, Revision: #{version[:rev]}"

version_string = GLFW.get_version_string
puts "Version String: `#{version_string}`"

GLFW.set_error_callback do |error, description|
  raise "Error: #{error} => #{description}"
end

status = GLFW.init
unless status == true
  raise "Failed to initialize GLFW"
end

GLFW.terminate