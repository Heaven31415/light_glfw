module GLFW
  struct Window
    getter ptr : LibGLFW::Window*

    def initialize(@ptr)
    end

    def to_unsafe : LibGLFW::Window*
      @ptr
    end
  end

  # Resets all window hints to their default values.
  #
  # This function resets all window hints to their default values.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.default_window_hints
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.default_window_hints : Nil
    LibGLFW.default_window_hints
  end

  # Sets whether newly created window should be focused.
  #
  # This function sets `focused` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_focused(true)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_focused(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Focused.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # Sets whether newly created window should be resizable.
  #
  # This function sets `resizable` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_resizable(false)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_resizable(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Resizable.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # Sets whether newly created window should be visible.
  #
  # This function sets `visible` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_visible(true)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_visible(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Visible.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # Sets whether newly created window should be decorated.
  #
  # This function sets `decorated` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_decorated(true)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_decorated(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Decorated.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # Sets whether newly created window should be auto iconified.
  #
  # This function sets `auto_iconify` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_auto_iconify(false)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_auto_iconify(value : Bool) : Nil
    LibGLFW.window_hint(Hint::AutoIconify.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # Sets whether newly created window should be floating.
  #
  # This function sets `floating` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_floating(false)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_floating(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Floating.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # Sets whether newly created window should be maximized.
  #
  # This function sets `maximized` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_maximized(false)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_maximized(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Maximized.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # Sets number of red bits of newly created window.
  #
  # This function sets `red_bits` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_red_bits(8)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_red_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::RedBits.value, value)
  end

  # Sets number of green bits of newly created window.
  #
  # This function sets `green_bits` hint for the next call to GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_green_bits(8)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_green_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::GreenBits.value, value)
  end

  # Sets number of blue bits of newly created window.
  #
  # This function sets `blue_bits` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_blue_bits(8)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_blue_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::BlueBits.value, value)
  end

  # Sets number of alpha bits of newly created window.
  #
  # This function sets `alpha_bits` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_alpha_bits(8)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_alpha_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::AlphaBits.value, value)
  end

  # Sets number of depth buffer bits of newly created window.
  #
  # This function sets `depth_bits` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_depth_bits(8)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_depth_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::DepthBits.value, value)
  end

  # Sets number of stencil buffer bits of newly created window.
  #
  # This function sets `stencil_bits` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_stencil_bits(8)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_stencil_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::StencilBits.value, value)
  end

  # Sets number of accum red bits of newly created window.
  #
  # This function sets `accum_red_bits` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_accum_red_bits(8)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_accum_red_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::AccumRedBits.value, value)
  end

  # Sets number of accum green bits of newly created window.
  #
  # This function sets `accum_green_bits` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_accum_green_bits(8)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_accum_green_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::AccumGreenBits.value, value)
  end

  # Sets number of accum blue bits of newly created window.
  #
  # This function sets `accum_blue_bits` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_accum_blue_bits(8)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_accum_blue_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::AccumBlueBits.value, value)
  end

  # Sets number of accum alpha bits of newly created window.
  #
  # This function sets `accum_alpha_bits` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_accum_alpha_bits(8)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_accum_alpha_bits(value : Int32) : Nil
    LibGLFW.window_hint(Hint::AccumAlphaBits.value, value)
  end

  # Sets number of aux buffers of newly created window.
  #
  # This function sets `aux_buffers` hint for the next call to `GLFW.create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `GLFW.default_window_hints`, or until the library is terminated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # GLFW.window_hint_aux_buffers(1)
  # window = GLFW.create_window(640, 480, "GLFW")
  # if window
  #   # do your thing...
  #   GLFW.destroy_window(window)
  # end
  # ```
  @[AlwaysInline]
  def self.window_hint_aux_buffers(value : Int32) : Nil
    LibGLFW.window_hint(Hint::AuxBuffers.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_stereo(value : Bool) : Nil
    LibGLFW.window_hint(Hint::Stereo.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_samples(value : Int32) : Nil
    LibGLFW.window_hint(Hint::Samples.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_srgb_capable(value : Bool) : Nil
    LibGLFW.window_hint(Hint::SrgbCapable.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_refresh_rate(value : Int32) : Nil
    LibGLFW.window_hint(Hint::RefreshRate.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_double_buffer(value : Bool) : Nil
    LibGLFW.window_hint(Hint::DoubleBuffer.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_client_api(value : ClientApi) : Nil
    LibGLFW.window_hint(Hint::ClientApi.value, value.value)
  end

  @[AlwaysInline]
  def self.window_hint_context_version_major(value : Int32) : Nil
    LibGLFW.window_hint(Hint::ContextVersionMajor.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_context_version_minor(value : Int32) : Nil
    LibGLFW.window_hint(Hint::ContextVersionMinor.value, value)
  end

  @[AlwaysInline]
  def self.window_hint_context_robustness(value : ContextRobustness) : Nil
    LibGLFW.window_hint(Hint::ContextRobustness.value, value.value)
  end

  @[AlwaysInline]
  def self.window_hint_open_gl_forward_compat(value : Bool) : Nil
    LibGLFW.window_hint(Hint::OpenGLForwardCompat.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_open_gl_debug_context(value : Bool) : Nil
    LibGLFW.window_hint(Hint::OpenGLDebugContext.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_open_gl_profile(value : OpenGLProfile) : Nil
    LibGLFW.window_hint(Hint::OpenGLProfile.value, value.value)
  end

  @[AlwaysInline]
  def self.window_hint_context_release_behavior(value : ContextReleaseBehavior) : Nil
    LibGLFW.window_hint(Hint::ContextReleaseBehavior.value, value.value)
  end

  @[AlwaysInline]
  def self.window_hint_context_no_error(value : Bool) : Nil
    LibGLFW.window_hint(Hint::ContextNoError.value, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  @[AlwaysInline]
  def self.window_hint_context_creation_api(value : ContextCreationApi) : Nil
    LibGLFW.window_hint(Hint::ContextCreationApi.value, value.value)
  end

  # Creates a window and its associated context.
  @[AlwaysInline]
  def self.create_window(width : Int32, height : Int32, title : String, monitor : Monitor? = nil, share : Window? = nil) : Window?
    ptr = LibGLFW.create_window(width, height, title, monitor ? monitor.ptr : nil, share ? share.ptr : nil)
    ptr.null? ? nil : Window.new(ptr)
  end

  # Destroys the specified window and its context.
  #
  # This function destroys the specified window and its context. On calling
  # this function, no further callbacks will be called for that window.
  #
  # If the context of the specified window is current on the main thread, it is
  # detached before being destroyed.
  #
  # `Parameters:`
  #
  # *`window`* The window to destroy.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: The context of the specified window must not be current on any other
  # thread when this function is called.
  #
  # NOTE: This function must not be called from a callback.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.destroy_window(window : Window) : Nil
    LibGLFW.destroy_window(window.ptr)
  end

  # Checks the close flag of the specified window.
  #
  # This function returns the value of the close flag of the specified window.
  #
  # `Parameters:`
  #
  # *`window`* The window to query.
  #
  # Returns the value of the close flag.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # NOTE: This function may be called from any thread. Access is not
  # synchronized.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.window_should_close(window : Window) : Bool
    LibGLFW.window_should_close(window.ptr) == LibGLFW::TRUE ? true : false
  end

  # Sets the close flag of the specified window.
  #
  # This function sets the value of the close flag of the specified window.
  # This can be used to override the user's attempt to close the window, or
  # to signal that it should be closed.
  #
  # `Parameters:`
  #
  #  *`window`* The window whose flag to change.
  #
  #  *`value`* The new value.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # NOTE: This function may be called from any thread. Access is not
  # synchronized.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.set_window_should_close(window : Window, value : Bool) : Nil
    LibGLFW.set_window_should_close(window.ptr, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # Sets the title of the specified window.
  #
  # This function sets the window title, encoded as UTF-8, of the specified
  # window.
  #
  # `Parameters:`
  #
  # *`window`* The window whose title to change.
  #
  # *`title`* The UTF-8 encoded window title.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: On Mac OS X the window title will not be updated until the next time you
  # process events.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 1.0.
  @[AlwaysInline]
  def self.set_window_title(window : Window, title : String) : Nil
    LibGLFW.set_window_title(window.ptr, title.to_unsafe)
  end

  # Sets the icon for the specified window.
  #
  # This function sets the icon of the specified window. If there
  # is no image specified, the window reverts to its default icon.
  #
  # The desired image size varies depending on platform and system settings.
  # The selected image will be rescaled as needed. Good sizes include 16x16,
  # 32x32 and 48x48.
  #
  # `Parameters:`
  #
  # *`window`* The window whose icon to set.
  #
  # *`image`* The image to create the icon from, or `nil` to revert to default icon.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: On Mac OS X the GLFW window has no icon, as it is not a document
  # window, so this function does nothing. The dock icon will be the same as
  # the application bundle's icon.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.2.
  @[AlwaysInline]
  def self.set_window_icon(window : Window, image : Image?) : Nil
    if image
      LibGLFW.set_window_icon(window.ptr, 1, image.to_unsafe)
    else
      LibGLFW.set_window_icon(window.ptr, 0, nil)
    end
  end

  # Retrieves the position of the client area of the specified window.
  #
  # This function retrieves the position, in screen coordinates, of the
  # upper-left corner of the client area of the specified window.
  #
  # If an error occurs, x and y position will be set to zero.
  #
  # `Parameters:`
  #
  # *`window`* The window to query.
  #
  # Returns NamedTuple with keys: `x : Int32`, `y : Int32`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     pos = GLFW.get_window_pos(window)
  #     puts "x: #{pos[:x]} y: #{pos[:y]}"
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.get_window_pos(window : Window) : {x: Int32, y: Int32}
    LibGLFW.get_window_pos(window.ptr, out xpos, out ypos)
    {x: xpos, y: ypos}
  end

  # Sets the position of the client area of the specified window.
  #
  # This function sets the position, in screen coordinates, of the upper-left
  # corner of the client area of the specified windowed mode window. If the
  # window is a full screen window, this function does nothing.
  #
  # The window manager may put limits on what positions are allowed. GLFW
  # cannot and should not override these limits.
  #
  # `Parameters:`
  #
  # *`window`* The window to query.
  #
  # *`pos`* The x and y coordinate of the upper-left corner of the client area
  # as NamedTuple with keys: `x : Int32`, `y : Int32`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 1.0.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     GLFW.set_window_pos(window, {x: 0, y: 0})
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.set_window_pos(window : Window, pos : {x: Int32, y: Int32}) : Nil
    LibGLFW.set_window_pos(window.ptr, pos[:x], pos[:y])
  end

  # Retrieves the size of the client area of the specified window.
  #
  # This function retrieves the size, in screen coordinates, of the client area
  # of the specified window. If you wish to retrieve the size of the
  # framebuffer of the window in pixels, see `GLFW.get_framebuffer_size`.
  #
  # If an error occurs, width and height will be set to zero.
  #
  # `Parameters:`
  #
  # *`window`* The window whose size to retrieve.
  #
  # Returns NamedTuple with keys: `width : Int32`, `height : Int32`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 1.0.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     size = GLFW.get_window_size(window)
  #     puts "width: #{size[:width]} height: #{size[:height]}"
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.get_window_size(window : Window) : {width: Int32, height: Int32}
    LibGLFW.get_window_size(window.ptr, out w, out h)
    {width: w, height: h}
  end

  # Sets the size limits of the specified window.
  #
  # This function sets the size limits of the client area of the specified
  # window. If the window is full screen, the size limits only take effect
  # once it is made windowed. If the window is not resizable, this function
  # does nothing.
  #
  # The size limits are applied immediately to a windowed mode window and may
  # cause it to be resized.
  #
  # The maximum dimensions must be greater than or equal to the minimum
  # dimensions and all must be greater than or equal to zero.
  #
  # `Parameters:`
  #
  # *`window`* The window to set limits for.
  #
  # *`min_width`* The minimum width, in screen coordinates, of the client
  # area, or `nil`.
  #
  # *`min_height`* The minimum height, in screen coordinates, of the
  # client area, or `nil`.
  #
  # *`max_width`* The maximum width, in screen coordinates, of the client
  # area, or `nil`.
  #
  # *`max_height`* The maximum height, in screen coordinates, of the
  # client area, or `nil`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`, `GLFW::Error::InvalidValue`
  # and `GLFW::Error::PlatformError`.
  #
  # NOTE: If you set size limits and an aspect ratio that conflict, the
  # results are undefined.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.2.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     GLFW.set_window_size_limits(window, nil, nil, 1000, 1000)
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.set_window_size_limits(window : Window, min_width : Int32?, min_height : Int32?, max_width : Int32?, max_height : Int32?) : Nil
    LibGLFW.set_window_size_limits(window.ptr, 
    min_width ? min_width : LibGLFW::DONT_CARE, 
    min_height ? min_height : LibGLFW::DONT_CARE, 
    max_width ? max_width : LibGLFW::DONT_CARE, 
    max_height ? max_height : LibGLFW::DONT_CARE)
  end

  # Sets the aspect ratio of the specified window.
  #
  # This function sets the required aspect ratio of the client area of the
  # specified window. If the window is full screen, the aspect ratio only takes
  # effect once it is made windowed. If the window is not resizable, this
  # function does nothing.
  #
  # The aspect ratio is specified as a numerator and a denominator and both
  # values must be greater than zero. For example, the common 16:9 aspect ratio
  # is specified as 16 and 9, respectively.
  #
  # If the numerator and denominator is set to `nil` then the aspect
  # ratio limit is disabled.
  #
  # The aspect ratio is applied immediately to a windowed mode window and may
  # cause it to be resized.
  #
  # `Parameters:`
  #
  # *`window`* The window to set limits for.
  #
  # *`numerator`* The numerator of the desired aspect ratio, or `nil`.
  #
  # *`denominator`* The denominator of the desired aspect ratio, or `nil`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`, `GLFW::Error::InvalidValue`
  # and `GLFW::Error::PlatformError`.
  #
  # NOTE: If you set size limits and an aspect ratio that conflict, the
  # results are undefined.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.2.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     GLFW.set_window_aspect_ratio(window, 4, 3)
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.set_window_aspect_ratio(window : Window, numerator : Int32?, denominator : Int32?) : Nil
    LibGLFW.set_window_aspect_ratio(window.ptr, 
    numerator ? numerator : LibGLFW::DONT_CARE, 
    denominator ? denominator : LibGLFW::DONT_CARE)
  end

  # Sets the size of the client area of the specified window.
  #
  # This function sets the size, in screen coordinates, of the client area of
  # the specified window.
  #
  # For full screen windows, this function updates the resolution of its desired
  # video mode and switches to the video mode closest to it, without affecting
  # the window's context. As the context is unaffected, the bit depths of the
  # framebuffer remain unchanged.
  #
  # If you wish to update the refresh rate of the desired video mode in addition
  # to its resolution, see `GLFW.set_window_monitor`.
  #
  # The window manager may put limits on what sizes are allowed. GLFW cannot
  # and should not override these limits.
  #
  # `Parameters:`
  #
  # *`window`* The window to resize.
  #
  # *`width`* The desired width, in screen coordinates, of the window client area.
  #
  # *`height`* The desired height, in screen coordinates, of the window client area.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 1.0.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     GLFW.set_window_size(window, 320, 240)
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.set_window_size(window : Window, width : Int32, height : Int32) : Nil
    LibGLFW.set_window_size(window.ptr, width, height)
  end

  # Retrieves the size of the framebuffer of the specified window.
  #
  # This function retrieves the size, in pixels, of the framebuffer of the
  # specified window. If you wish to retrieve the size of the window in screen
  # coordinates, see `GLFW.get_window_size`.
  #
  # If an error occurs, width and height will be set to zero.
  #
  # `Parameters:`
  #
  # *`window`* The window whose framebuffer to query.
  #
  # Returns NamedTuple with keys: `width : Int32`, `height : Int32`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     size = GLFW.get_framebuffer_size(window)
  #     puts "width: #{size[:width]} height: #{size[:height]}"
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.get_framebuffer_size(window : Window) : {width: Int32, height: Int32}
    LibGLFW.get_framebuffer_size(window.ptr, out w, out h)
    {width: w, height: h}
  end

  # Retrieves the size of the frame of the window.
  #
  # This function retrieves the size, in screen coordinates, of each edge of the
  # frame of the specified window. This size includes the title bar, if the
  # window has one. The size of the frame may vary depending on the
  # window-related hints used to create it.
  #
  # Because this function retrieves the size of each window frame edge and not
  # the offset along a particular coordinate axis, the retrieved values will
  # always be zero or positive.
  #
  # If an error occurs, left, top, right and bottom will be set to zero.
  #
  # `Parameters:`
  #
  # *`window`* The window whose frame size to query.
  #
  # Returns NamedTuple with keys: `left : Int32`, `top : Int32`, `right : Int32`, `bottom : Int32`
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.1.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     frame = GLFW.get_window_frame_size(window)
  #     puts "left: #{frame[:left]} top: #{frame[:top]} right: #{frame[:right]} bottom: #{frame[:bottom]}"
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.get_window_frame_size(window : Window) : {left: Int32, top: Int32, right: Int32, bottom: Int32}
    LibGLFW.get_window_frame_size(window.ptr, out l, out t, out r, out b)
    {left: l, top: t, right: r, bottom: b}
  end

  # Iconifies the specified window.
  #
  # This function iconifies (minimizes) the specified window if it was
  # previously restored. If the window is already iconified, this function does
  # nothing.
  #
  # If the specified window is a full screen window, the original monitor
  # resolution is restored until the window is restored.
  #
  # `Parameters:`
  #
  # *`window`* The window to iconify.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 2.1.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     GLFW.iconify_window(window)
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.iconify_window(window : Window) : Nil
    LibGLFW.iconify_window(window.ptr)
  end

  # Restores the specified window.
  #
  # This function restores the specified window if it was previously iconified
  # (minimized) or maximized. If the window is already restored, this function
  # does nothing.
  #
  # If the specified window is a full screen window, the resolution chosen for
  # the window is restored on the selected monitor.
  #
  # `Parameters:`
  #
  # *`window`* The window to restore.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 2.1.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     GLFW.restore_window(window)
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.restore_window(window : Window) : Nil
    LibGLFW.restore_window(window.ptr)
  end

  # Maximizes the specified window.
  #
  # This function maximizes the specified window if it was previously not
  # maximized. If the window is already maximized, this function does nothing.
  #
  # If the specified window is a full screen window, this function does nothing.
  #
  # `Parameters:`
  #
  # *`window`* The window to maximize.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in GLFW 3.2.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     GLFW.maximize_window(window)
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.maximize_window(window : Window) : Nil
    LibGLFW.maximize_window(window.ptr)
  end

  # Makes the specified window visible.
  #
  # This function makes the specified window visible if it was previously
  # hidden. If the window is already visible or is in full screen mode, this
  # function does nothing.
  #
  # `Parameters:`
  #
  # *`window`* The window to make visible.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     GLFW.show_window(window)
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.show_window(window : Window) : Nil
    LibGLFW.show_window(window.ptr)
  end

  # Hides the specified window.
  #
  # This function hides the specified window if it was previously visible. If
  # the window is already hidden or is in full screen mode, this function does
  # nothing.
  #
  # `Parameters:`
  #
  #  *`window`* The window to hide.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  #
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     GLFW.hide_window(window)
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.hide_window(window : Window) : Nil
    LibGLFW.hide_window(window.ptr)
  end

  # Brings the specified window to front and sets input focus.
  #
  # This function brings the specified window to front and sets input focus.
  # The window should already be visible and not iconified.
  #
  # By default, both windowed and full screen mode windows are focused when
  # initially created. Set the `GLFW.window_hint_focused` to disable
  # this behavior.
  #
  # `Parameters:`
  #
  # *`window`* The window to give input focus.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.2.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     GLFW.focus_window(window)
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.focus_window(window : Window) : Nil
    LibGLFW.focus_window(window.ptr)
  end

  # Returns the monitor that the window uses for full screen mode.
  #
  # This function returns the handle of the monitor that the specified window is
  # in full screen on.
  #
  # `Parameters:`
  #
  # *`window`* The window to query.
  #
  # Returns the monitor, or `nil` if the window is in windowed mode or an
  # error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     if monitor = GLFW.get_window_monitor(window)
  #       puts "Full screen mode"
  #     else
  #       puts "Windowed mode"
  #     end
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.get_window_monitor(window : Window) : Monitor?
    ptr = LibGLFW.get_window_monitor(window.ptr)
    ptr.null? ? nil : ptr.unsafe_as(Monitor)
  end

  # Sets the mode, monitor, video mode and placement of a window.
  #
  # This function sets the monitor that the window uses for full screen mode or,
  # if the monitor is `nil`, makes it windowed mode.
  #
  # When setting a monitor, this function updates the width, height and refresh
  # rate of the desired video mode and switches to the video mode closest to it.
  # The window position is ignored when setting a monitor.
  #
  # When the monitor is `nil`, the position, width and height are used to
  # place the window client area. The refresh rate is ignored when no monitor
  # is specified.
  #
  # If you only wish to update the resolution of a full screen window or the
  # size of a windowed mode window, see `GLFW.set_window_size`.
  #
  # When a window transitions from full screen to windowed mode, this function
  # restores any previous window settings such as whether it is decorated,
  # floating, resizable, has size or aspect ratio limits, etc..
  #
  # `Parameters:`
  #
  # *`window`* The window whose monitor, size or video mode to set.
  #
  # `monitor` The desired monitor, or `nil` to set windowed mode.
  #
  # `xpos` The desired x-coordinate of the upper-left corner of the
  #  client area.
  #
  # `ypos` The desired y-coordinate of the upper-left corner of the
  #  client area.
  #
  # `width` The desired width, in screen coordinates, of the client area
  #  or video mode.
  #
  # `height` The desired height, in screen coordinates, of the client
  #  area or video mode.
  #
  # `refresh_rate` The desired refresh rate, in Hz, of the video mode, or `nil`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.2.
  # ```
  # if GLFW.init
  #   if window = GLFW.create_window(640, 480, "Window")
  #     GLFW.set_window_monitor(window, nil, 0, 0, 320, 240, nil)
  #   end
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.set_window_monitor(window : Window, monitor : Monitor?, xpos : Int32, ypos : Int32, width : Int32, height : Int32, refresh_rate : Int32?) : Nil
    LibGLFW.set_window_monitor(window.ptr, monitor, xpos, ypos, width, height, refresh_rate ? refresh_rate : LibGLFW::DONT_CARE)
  end

  # Returns whether specified window is focused.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.get_window_focused(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Focused) == LibGLFW::TRUE ? true : false
  end

  # Returns whether specified window is iconified (minimized).
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.get_window_iconified(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Iconified) == LibGLFW::TRUE ? true : false
  end

  # Returns whether specified window is resizable.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.get_window_resizable(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Resizable) == LibGLFW::TRUE ? true : false
  end

  # Returns whether specified window is visible.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.get_window_visible(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Visible) == LibGLFW::TRUE ? true : false
  end

  # Returns whether specified window is decorated.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.get_window_decorated(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Decorated) == LibGLFW::TRUE ? true : false
  end

  # Returns whether specified window is floating.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.get_window_floating(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Floating) == LibGLFW::TRUE ? true : false
  end

  # Returns whether specified window is maximized.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  @[AlwaysInline]
  def self.get_window_maximized(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Maximized) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_client_api(window : Window) : ClientApi
    ClientApi.new(LibGLFW.get_window_attrib(window.ptr, Attribute::ClientApi))
  end

  @[AlwaysInline]
  def self.get_window_context_version_major(window : Window) : Int32
    LibGLFW.get_window_attrib(window.ptr, Attribute::ContextVersionMajor)
  end

  @[AlwaysInline]
  def self.get_window_context_version_minor(window : Window) : Int32
    LibGLFW.get_window_attrib(window.ptr, Attribute::ContextVersionMinor)
  end

  @[AlwaysInline]
  def self.get_window_context_revision(window : Window) : Int32
    LibGLFW.get_window_attrib(window.ptr, Attribute::ContextRevision)
  end

  @[AlwaysInline]
  def self.get_window_context_robustness(window : Window) : ContextRobustness
    ContextRobustness.new(LibGLFW.get_window_attrib(window.ptr, Attribute::ContextRobustness))
  end

  @[AlwaysInline]
  def self.get_window_open_gl_forward_compat(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::OpenGLForwardCompat) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_open_gl_debug_context(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::OpenGLDebugContext) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_open_gl_profile(window : Window) : OpenGLProfile
    OpenGLProfile.new(LibGLFW.get_window_attrib(window.ptr, Attribute::OpenGLProfile))
  end

  @[AlwaysInline]
  def self.get_window_context_release_behavior(window : Window) : ContextReleaseBehavior
    ContextReleaseBehavior.new(LibGLFW.get_window_attrib(window.ptr, Attribute::ContextReleaseBehavior))
  end

  @[AlwaysInline]
  def self.get_window_context_no_error(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::ContextNoError) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_context_creation_api(window : Window) : ContextCreationApi
    ContextCreationApi.new(LibGLFW.get_window_attrib(window.ptr, Attribute::ContextCreationApi))
  end

  # Sets the user pointer of the specified window.
  @[AlwaysInline]
  def self.set_window_user_pointer(window : Window, pointer : Pointer(Void)) : Nil
    LibGLFW.set_window_user_pointer(window.ptr, pointer)
  end

  # Returns the user pointer of the specified window.
  @[AlwaysInline]
  def self.get_window_user_pointer(window : Window) : Pointer(Void)
    LibGLFW.get_window_user_pointer(window.ptr)
  end

  @@pos_callback : Proc(Window, Int32, Int32, Void)? = nil
  # Sets the position callback for the specified window.
  @[AlwaysInline]
  def self.set_window_pos_callback(window : Window, &block : Window, Int32, Int32 -> Void) : Proc(Window, Int32, Int32, Void)?
    old_callback = @@pos_callback
    @@pos_callback = block

    LibGLFW.set_window_pos_callback(window.ptr, ->(window : LibGLFW::Window*, x : Int32, y : Int32) do 
      if cb = @@pos_callback
        cb.call(Window.new(window), x, y)
      end
    end)

    old_callback
  end

  @@size_callback : Proc(Window, Int32, Int32, Void)? = nil
  # Sets the size callback for the specified window.
  @[AlwaysInline]
  def self.set_window_size_callback(window : Window, &block : Window, Int32, Int32 -> Void) : Proc(Window, Int32, Int32, Void)?
    old_callback = @@size_callback
    @@size_callback = block

    LibGLFW.set_window_size_callback(window.ptr, ->(window : LibGLFW::Window*, width : Int32, height : Int32) do
      if cb = @@size_callback
        cb.call(Window.new(window), width, height)
      end
    end)

    old_callback
  end

  @@close_callback : Proc(Window, Void)? = nil
  # Sets the close callback for the specified window.
  @[AlwaysInline]
  def self.set_window_close_callback(window : Window, &block : Window -> Void) : Proc(Window, Void)?
    old_callback = @@close_callback
    @@close_callback = block

    LibGLFW.set_window_close_callback(window.ptr, ->(window : LibGLFW::Window*) do 
      if cb = @@close_callback
        cb.call(Window.new(window))
      end
    end)

    old_callback
  end

  @@refresh_callback : Proc(Window, Void)? = nil
  # Sets the refresh callback for the specified window.
  @[AlwaysInline]
  def self.set_window_refresh_callback(window : Window, &block : Window -> Void) : Proc(Window, Void)?
    old_callback = @@refresh_callback
    @@refresh_callback = block

    LibGLFW.set_window_refresh_callback(window.ptr, ->(window : LibGLFW::Window*) do 
      if cb = @@refresh_callback
        cb.call(Window.new(window))
      end
    end)

    old_callback
  end

  @@focus_callback : Proc(Window, Bool, Void)? = nil
  # Sets the focus callback for the specified window.
  @[AlwaysInline]
  def self.set_window_focus_callback(window : Window, &block : Window, Bool -> Void) : Proc(Window, Bool, Void)?
    old_callback = @@focus_callback
    @@focus_callback = block

    LibGLFW.set_window_focus_callback(window.ptr, ->(window : LibGLFW::Window*, focused : Int32) do
      if cb = @@focus_callback
        cb.call(Window.new(window), focused == LibGLFW::TRUE ? true : false)
      end
    end)

    old_callback
  end

  @@iconify_callback : Proc(Window, Bool, Void)? = nil
  # Sets the iconify callback for the specified window.
  @[AlwaysInline]
  def self.set_window_iconify_callback(window : Window, &block : Window, Bool -> Void) : Proc(Window, Bool, Void)?
    old_callback = @@iconify_callback
    @@iconify_callback = block

    LibGLFW.set_window_iconify_callback(window.ptr, ->(window : LibGLFW::Window*, iconified : Int32) do
      if cb = @@iconify_callback
        cb.call(Window.new(window), iconified == LibGLFW::TRUE ? true : false)
      end
    end)

    old_callback
  end

  @@framebuffer_size_callback : Proc(Window, Int32, Int32, Void)? = nil
  # Sets the framebuffer resize callback for the specified window.
  @[AlwaysInline]
  def self.set_framebuffer_size_callback(window : Window, &block : Window, Int32, Int32 -> Void) : Proc(Window, Int32, Int32, Void)?
    old_callback = @@framebuffer_size_callback
    @@framebuffer_size_callback = block

    LibGLFW.set_framebuffer_size_callback(window.ptr, ->(window : LibGLFW::Window*, width : Int32, height : Int32) do
      if cb = @@framebuffer_size_callback
        cb.call(Window.new(window), width, height)
      end
    end)

    old_callback
  end

  # Processes all pending events.
  #
  # This function processes only those events that are already in the event
  # queue and then returns immediately. Processing events will cause the window
  # and input callbacks associated with those events to be called.
  #
  # On some platforms, a window move, resize or menu operation will cause event
  # processing to block. This is due to how event processing is designed on
  # those platforms. You can set the window refresh callback using 
  # `GLFW.set_window_refresh_callback` to redraw the contents of
  # your window when necessary during such operations.
  #
  # On some platforms, certain events are sent directly to the application
  # without going through the event queue, causing callbacks to be called
  # outside of a call to one of the event processing functions.
  #
  # Event processing is not required for joystick input to work.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must not be called from a callback.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 1.0.
  # ```
  # if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  #   while !GLFW.window_should_close(window)
  #     GLFW.poll_events
  #     GLFW.swap_buffers(window)
  #   end
  # end
  # ```
  @[AlwaysInline]
  def self.poll_events : Nil
    LibGLFW.poll_events
  end

  # Waits until events are queued and processes them.
  #
  # This function puts the calling thread to sleep until at least one event is
  # available in the event queue. Once one or more events are available,
  # it behaves exactly like `GLFW.poll_events`, i.e. the events in the queue
  # are processed and the function then returns immediately. Processing events
  # will cause the window and input callbacks associated with those events to be
  # called.
  #
  # Since not all events are associated with callbacks, this function may return
  # without a callback having been called even if you are monitoring all
  # callbacks.
  #
  # On some platforms, a window move, resize or menu operation will cause event
  # processing to block. This is due to how event processing is designed on
  # those platforms. You can set the window refresh callback using 
  # `GLFW.set_window_refresh_callback` to redraw the contents of
  # your window when necessary during such operations.
  #
  # On some platforms, certain callbacks may be called outside of a call to one
  # of the event processing functions.
  #
  # If no windows exist, this function returns immediately. For synchronization
  # of threads in applications that do not create windows, use your threading
  # library of choice.
  #
  # Event processing is not required for joystick input to work.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must not be called from a callback.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 2.5.
  # ```
  # if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  #   while !GLFW.window_should_close(window)
  #     GLFW.wait_events
  #     GLFW.swap_buffers(window)
  #   end
  # end
  # ```
  @[AlwaysInline]
  def self.wait_events : Nil
    LibGLFW.wait_events
  end

  # Waits with timeout until events are queued and processes them.
  #
  # This function puts the calling thread to sleep until at least one event is
  # available in the event queue, or until the specified timeout is reached. If
  # one or more events are available, it behaves exactly like `GLFW.poll_events`, 
  # i.e. the events in the queue are processed and the function then returns 
  # immediately. Processing events will cause the window and input callbacks 
  # associated with those events to be called.
  #
  # The timeout value must be a positive finite number.
  #
  # Since not all events are associated with callbacks, this function may return
  # without a callback having been called even if you are monitoring all
  # callbacks.
  #
  # On some platforms, a window move, resize or menu operation will cause event
  # processing to block. This is due to how event processing is designed on
  # those platforms. You can set the window refresh callback using 
  # `GLFW.set_window_refresh_callback` to redraw the contents of
  # your window when necessary during such operations.
  #
  # On some platforms, certain callbacks may be called outside of a call to one
  # of the event processing functions.
  #
  # If no windows exist, this function returns immediately. For synchronization
  # of threads in applications that do not create windows, use your threading
  # library of choice.
  #
  # Event processing is not required for joystick input to work.
  #
  # `Parameters:`
  #
  # *`timeout`* The maximum amount of time, in seconds, to wait.
  #
  # NOTE: This function must not be called from a callback.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.2.
  @[AlwaysInline]
  def self.wait_events_timeout(timeout : Float64) : Nil
    LibGLFW.wait_events_timeout(timeout)
  end

  # Posts an empty event to the event queue.
  #
  # This function posts an empty event from the current thread to the event
  # queue, causing `GLFW.wait_events` or `GLFW.wait_events_timeout` to return.
  #
  # If no windows exist, this function returns immediately. For synchronization
  # of threads in applications that do not create windows, use your threading
  # library of choice.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function may be called from any thread.
  #
  # NOTE: Added in version 3.1.
  @[AlwaysInline]
  def self.post_empty_event : Nil
    LibGLFW.post_empty_event
  end

  # Swaps the front and back buffers of the specified window.
  #
  # This function swaps the front and back buffers of the specified window when
  # rendering with OpenGL or OpenGL ES. If the swap interval is greater than
  # zero, the GPU driver waits the specified number of screen updates before
  # swapping the buffers.
  #
  # The specified window must have an OpenGL or OpenGL ES context. Specifying
  # a window without a context will generate a `GLFW::Error::NoWindowContext`
  # error.
  #
  # This function does not apply to Vulkan. If you are rendering with Vulkan,
  # see `vkQueuePresentKHR` instead.
  #
  # `Parameters:`
  #
  # *`window`* The window whose buffers to swap.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`, `GLFW::Error::NoWindowContext`
  # and `GLFW::Error::PlatformError`.
  #
  # NOTE: When using EGL the context of the specified window must be current on the
  # calling thread.
  #
  # NOTE: This function may be called from any thread.
  #
  # NOTE: Added in version 1.0.
  @[AlwaysInline]
  def self.swap_buffers(window : Window) : Nil
    LibGLFW.swap_buffers(window.ptr)
  end
end