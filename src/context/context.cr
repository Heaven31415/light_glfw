module GLFW
  # Makes the context of the specified window current for the calling thread.
  #
  # This function makes the OpenGL or OpenGL ES context of the specified window
  # current on the calling thread. A context can only be made current on
  # a single thread at a time and each thread can have only a single current
  # context at a time.
  #
  # By default, making a context non-current implicitly forces a pipeline flush.
  # On machines that support `GL_KHR_context_flush_control`, you can control
  # whether a context performs this flush by calling
  # `GLFW.window_hint_context_release_behavior` method.
  #
  # The specified window must have an OpenGL or OpenGL ES context. Specifying
  # a window without a context will generate a `GLFW::Error::NoWindowContext` error.
  #
  # `Parameters:`
  #
  # *`window`* The window whose context to make current, or `nil` to
  # detach the current context.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`, `GLFW::Error::NoWindowContext`
  # and `GLFW::Error::PlatformError`.
  # 
  # NOTE: This function may be called from any thread.
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init
  #   window = GLFW.create_window(480, 480, "Window")
  #   if window
  #     GLFW.make_context_current(window)
  #     # do your thing...
  #   end
  # end
  # ```
  @[AlwaysInline]
  def self.make_context_current(window : Window?) : Nil
    LibGLFW.make_context_current(window)
  end

  # Returns the window whose context is current on the calling thread.
  #
  # This function returns the window whose OpenGL or OpenGL ES context is
  # current on the calling thread.
  #
  # Returns the window whose context is current, or `nil` if no window's
  # context is current.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # NOTE: This function may be called from any thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init
  #   window = GLFW.create_window(480, 480, "Window")
  #   GLFW.make_context_current(window)
  #   (window == GLFW.get_current_context) # => true
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.get_current_context : Window?
    ptr = LibGLFW.get_current_context
    ptr.null? ? nil : Window.new(ptr)
  end

  # Sets the swap interval for the current context.
  #
  # This function sets the swap interval for the current OpenGL or OpenGL ES
  # context, i.e. the number of screen updates to wait from the time
  # `GLFW.swap_buffers` was called before swapping the buffers and returning. This
  # is sometimes called vertical synchronization, vertical retrace
  # synchronization or just vsync.
  #
  # Contexts that support either of the `WGL_EXT_swap_control_tear` and
  # `GLX_EXT_swap_control_tear` extensions also accept negative swap intervals,
  # which allow the driver to swap even if a frame arrives a little bit late.
  # You can check for the presence of these extensions using `GLFW.extension_supported`.
  # For more information about swap tearing, see the extension specifications.
  #
  # A context must be current on the calling thread. Calling this function
  # without a current context will cause a `GLFW::Error::NoCurrentContext` error.
  #
  # This function does not apply to Vulkan. If you are rendering with Vulkan,
  # see the present mode of your swapchain instead.
  #
  # `Parameters:`
  #
  #  *`interval`* The minimum number of screen updates to wait for,
  #  until the buffers are swapped by `GLFW.swap_buffers`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`, `GLFW::Error::NoCurrentContext` 
  # and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function is not called during context creation, leaving the
  # swap interval set to whatever is the default on that platform. This is done
  # because some swap interval extensions used by GLFW do not allow the swap
  # interval to be reset to zero once it has been set to a non-zero value.
  #
  # NOTE: Some GPU drivers do not honor the requested swap interval, either
  # because of a user setting that overrides the application's request or due to
  # bugs in the driver.
  #
  # NOTE: This function may be called from any thread.
  #
  # NOTE: Added in version 1.0.
  # ```
  # if GLFW.init
  #   GLFW.swap_interval(1) # enable vsync
  #   window = GLFW.create_window(800, 600, "Window")
  #   if window
  #     # do your thing...
  #   end
  # end
  # ```
  @[AlwaysInline]
  def self.swap_interval(interval : Int32) : Nil
    LibGLFW.swap_interval(interval)
  end

  # Returns whether the specified extension is available.
  #
  # This function returns whether the specified
  # API extension is supported by the current OpenGL or
  # OpenGL ES context. It searches both for client API extension and context
  # creation API extensions.
  #
  # A context must be current on the calling thread. Calling this function
  # without a current context will cause a `GLFW::Error::NoCurrentContext` error.
  #
  # As this functions retrieves and searches one or more extension strings each
  # call, it is recommended that you cache its results if it is going to be used
  # frequently. The extension strings will not change during the lifetime of
  # a context, so there is no danger in doing this.
  #
  # This function does not apply to Vulkan. If you are using Vulkan, see
  # `GLFW.get_required_instance_extensions`, `vkEnumerateInstanceExtensionProperties`
  # and `vkEnumerateDeviceExtensionProperties` instead.
  #
  # `Parameters:`
  # 
  # *`extension`* The ASCII encoded name of the extension.
  #
  # Returns `true` if the extension is available, or `false` otherwise.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`, `GLFW::Error::NoCurrentContext`, 
  # `GLFW::Error::InvalidValue` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function may be called from any thread.
  #
  # NOTE: Added in version 1.0.
  # ```
  # if GLFW.init
  #   if GLFW.extension_supported("GLX_EXT_swap_control_tear")
  #     puts "`GLX_EXT_swap_control_tear` is supported"
  #   else
  #     puts "`GLX_EXT_swap_control_tear` is not supported"
  #   end
  # end
  # ```
  @[AlwaysInline]
  def self.extension_supported(extension : String) : Bool
    LibGLFW.extension_supported(extension.to_unsafe) == LibGLFW::TRUE ? true : false
  end

  # Returns the address of the specified function for the current context.
  #
  # This function returns the address of the specified OpenGL or OpenGL ES
  # core or extension function, if it is supported by the current context.
  #
  # A context must be current on the calling thread. Calling this function
  # without a current context will cause a `GLFW::Error::NoCurrentContext` error.
  #
  # This function does not apply to Vulkan. If you are rendering with Vulkan,
  # see `GLFW.get_instance_proc_address`, `vkGetInstanceProcAddr` and
  # `vkGetDeviceProcAddr` instead.
  #
  # `Parameters:`
  #
  #  *`procname`* The ASCII encoded name of the function.
  #
  # Returns the address of the function, or `nil` if an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`, `GLFW::Error::NoCurrentContext` 
  # and `GLFW::Error::PlatformError`.
  #
  # NOTE: The address of a given function is not guaranteed to be the same
  # between contexts.
  #
  # NOTE: This function may return a non-`nil` address despite the
  # associated version or extension not being available. Always check the
  # context version or extension string first.
  #
  # NOTE: The returned function pointer is valid until the context
  # is destroyed or the library is terminated.
  #
  # NOTE: This function may be called from any thread.
  #
  # NOTE: Added in version 1.0.
  @[AlwaysInline]
  def self.get_proc_address(procname : String) : LibGLFW::GlProc?
    proc = LibGLFW.get_proc_address(procname.to_unsafe)
    proc.pointer.null? ? nil : proc
  end
end