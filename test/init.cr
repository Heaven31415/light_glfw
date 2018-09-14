require "./utility"

GLFW.set_error_callback do |error, string|
  puts "Error: `#{error}` description: `#{string}`"
end

version = GLFW.get_version
puts "Major: #{version[:major]}, Minor: #{version[:minor]}, Revision: #{version[:rev]}"

version_string = GLFW.get_version_string
puts "Version String: `#{version_string}`"

if GLFW.init
  GLFW.terminate
end