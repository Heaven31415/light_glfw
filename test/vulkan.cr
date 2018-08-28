require "../glfw"

if GLFW.init == true
  puts "vulkan_supported: #{GLFW.vulkan_supported}"
  puts GLFW.get_required_instance_extensions
end