module GLFW
  # fun vulkan_supported = glfwVulkanSupported : Int32
  @[AlwaysInline]
  def self.vulkan_supported : Bool
    LibGLFW.vulkan_supported == LibGLFW::TRUE ? true : false
  end

  # fun get_required_instance_extensions = glfwGetRequiredInstanceExtensions(count : UInt32) : UInt8**
  @[AlwaysInline]
  def self.get_required_instance_extensions : Array(String)?
    ptr = LibGLFW.get_required_instance_extensions(out count)
    if ptr.null?
      nil
    else
      extensions = Array(String).new(count)
      count.times do |i|
        extensions << String.new(ptr[i])
      end
      extensions
    end
  end
end