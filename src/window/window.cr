# todo: get rid of class methods for Window?
# todo: I think I should handle errors with exceptions

# todo: every method should be inlined and I should avoid to_unsafe implicit call
# todo: every method which doesn't return anything interesing should have Nil return value

# todo: right now it's impossible to remove currently set callback, because
# user have to pass a block, instead of a proc, however someone can pass an empty block, is this enough?

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
  # This function sets `focused` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `resizable` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `visible` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `decorated` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `auto_iconify` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `floating` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `maximized` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `red_bits` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `green_bits` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `blue_bits` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `alpha_bits` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `depth_bits` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `stencil_bits` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `accum_red_bits` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `accum_green_bits` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `accum_blue_bits` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `accum_alpha_bits` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
  # This function sets `aux_buffers` hint for the next call to `#create_window`.
  # The hint, once set, retain their value until changed by another call to this
  # function or `#default_window_hints`, or until the library is terminated.
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
    if ptr.null?
      nil
    else
      Window.new(ptr)
    end
  end

  # Destroys the specified window and its context.
  @[AlwaysInline]
  def self.destroy_window(window : Window) : Nil
    LibGLFW.destroy_window(window.ptr)
  end

  # Checks the close flag of the specified window.
  @[AlwaysInline]
  def self.window_should_close(window : Window) : Bool
    LibGLFW.window_should_close(window.ptr) == LibGLFW::TRUE ? true : false
  end

  # Sets the close flag of the specified window.
  @[AlwaysInline]
  def self.set_window_should_close(window : Window, value : Bool) : Nil
    LibGLFW.set_window_should_close(window.ptr, value == true ? LibGLFW::TRUE : LibGLFW::FALSE)
  end

  # Sets the title of the specified window.
  @[AlwaysInline]
  def self.set_window_title(window : Window, title : String) : Nil
    LibGLFW.set_window_title(window.ptr, title)
  end

  # Sets the icon for the specified window.
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
  # end
  # ```
  @[AlwaysInline]
  def self.get_window_pos(window : Window) : {x: Int32, y: Int32}
    LibGLFW.get_window_pos(window.ptr, out xpos, out ypos)
    {x: xpos, y: ypos}
  end

  # Sets the position of the client area of the specified window.
  @[AlwaysInline]
  def self.set_window_pos(window : Window, position : {x: Int32, y: Int32}) : Nil
    LibGLFW.set_window_pos(window.ptr, position[:x], position[:y])
  end

  # Retrieves the size of the client area of the specified window.
  @[AlwaysInline]
  def self.get_window_size(window : Window) : {width: Int32, height: Int32}
    LibGLFW.get_window_size(window.ptr, out w, out h)
    {width: w, height: h}
  end

  # Sets the size limits of the specified window.
  @[AlwaysInline]
  def self.set_window_size_limits(window : Window, min_width : Int32, min_height : Int32, max_width : Int32, max_height : Int32) : Nil
    LibGLFW.set_window_size_limits(window.ptr, min_width, min_height, max_width, max_height)
  end

  # Sets the aspect ratio of the specified window.
  @[AlwaysInline]
  def self.set_window_aspect_ratio(window : Window, numerator : Int32, denominator : Int32) : Nil
    LibGLFW.set_window_aspect_ratio(window.ptr, numerator, denominator)
  end

  # Sets the size of the client area of the specified window.
  @[AlwaysInline]
  def self.set_window_size(window : Window, width : Int32, height : Int32) : Nil
    LibGLFW.set_window_size(window.ptr, width, height)
  end

  # Retrieves the size of the framebuffer of the specified window.
  @[AlwaysInline]
  def self.get_framebuffer_size(window : Window) : {width: Int32, height: Int32}
    LibGLFW.get_framebuffer_size(window.ptr, out w, out h)
    {width: w, height: h}
  end

  # Retrieves the size of the frame of the window.
  @[AlwaysInline]
  def self.get_window_frame_size(window : Window) : {left: Int32, top: Int32, right: Int32, bottom: Int32}
    LibGLFW.get_window_frame_size(window.ptr, out l, out t, out r, out b)
    {left: l, top: t, right: r, bottom: b}
  end

  # Iconifies the specified window.
  @[AlwaysInline]
  def self.iconify_window(window : Window) : Nil
    LibGLFW.iconify_window(window.ptr)
  end

  # Restores the specified window.
  @[AlwaysInline]
  def self.restore_window(window : Window) : Nil
    LibGLFW.restore_window(window.ptr)
  end

  # Maximizes the specified window.
  @[AlwaysInline]
  def self.maximize_window(window : Window) : Nil
    LibGLFW.maximize_window(window.ptr)
  end

  # Makes the specified window visible.
  @[AlwaysInline]
  def self.show_window(window : Window) : Nil
    LibGLFW.show_window(window.ptr)
  end

  # Hides the specified window.
  @[AlwaysInline]
  def self.hide_window(window : Window) : Nil
    LibGLFW.hide_window(window.ptr)
  end

  # Brings the specified window to front and sets input focus.
  @[AlwaysInline]
  def self.focus_window(window : Window) : Nil
    LibGLFW.focus_window(window.ptr)
  end

  # Returns the monitor that the window uses for full screen mode.
  @[AlwaysInline]
  def self.get_window_monitor(window : Window) : Monitor?
    ptr = LibGLFW.get_window_monitor(window.ptr)
    if ptr.null?
      nil
    else
      Monitor.new(ptr)
    end
  end

  # Sets the mode, monitor, video mode and placement of a window.
  @[AlwaysInline]
  def self.set_window_monitor(window : Window, monitor : Monitor?, xpos : Int32, ypos : Int32, width : Int32, height : Int32, refresh_rate : Int32?) : Nil
    LibGLFW.set_window_monitor(window.ptr, monitor, xpos, ypos, width, height, refresh_rate ? refresh_rate : LibGLFW::DONT_CARE)
  end

  # fun get_window_attrib = glfwGetWindowAttrib(window : Window*, attrib : Int32) : Int32
  @[AlwaysInline]
  def self.get_window_focused(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Focused) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_iconified(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Iconified) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_resizable(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Resizable) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_visible(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Visible) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_decorated(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Decorated) == LibGLFW::TRUE ? true : false
  end

  @[AlwaysInline]
  def self.get_window_floating(window : Window) : Bool
    LibGLFW.get_window_attrib(window.ptr, Attribute::Floating) == LibGLFW::TRUE ? true : false
  end

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
    @@pos_callback = block
    LibGLFW.set_window_pos_callback(window.ptr, ->(window : LibGLFW::Window*, x : Int32, y : Int32) do 
      if cb = @@pos_callback
        cb.call(Window.new(window), x, y)
      end
    end)
    @@pos_callback
  end

  @@size_callback : Proc(Window, Int32, Int32, Void)? = nil
  # Sets the size callback for the specified window.
  @[AlwaysInline]
  def self.set_window_size_callback(window : Window, &block : Window, Int32, Int32 -> Void) : Proc(Window, Int32, Int32, Void)?
    @@size_callback = block
    LibGLFW.set_window_size_callback(window.ptr, ->(window : LibGLFW::Window*, width : Int32, height : Int32) do
      if cb = @@size_callback
        cb.call(Window.new(window), width, height)
      end
    end)
    @@size_callback
  end

  @@close_callback : Proc(Window, Void)? = nil
  # Sets the close callback for the specified window.
  @[AlwaysInline]
  def self.set_window_close_callback(window : Window, &block : Window -> Void) : Proc(Window, Void)?
    @@close_callback = block
    LibGLFW.set_window_close_callback(window.ptr, ->(window : LibGLFW::Window*) do 
      if cb = @@close_callback
        cb.call(Window.new(window))
      end
    end)
    @@close_callback
  end

  @@refresh_callback : Proc(Window, Void)? = nil
  # Sets the refresh callback for the specified window.
  @[AlwaysInline]
  def self.set_window_refresh_callback(window : Window, &block : Window -> Void) : Proc(Window, Void)?
    @@refresh_callback = block
    LibGLFW.set_window_refresh_callback(window.ptr, ->(window : LibGLFW::Window*) do 
      if cb = @@refresh_callback
        cb.call(Window.new(window))
      end
    end)
    @@refresh_callback
  end

  @@focus_callback : Proc(Window, Bool, Void)? = nil
  # Sets the focus callback for the specified window.
  @[AlwaysInline]
  def self.set_window_focus_callback(window : Window, &block : Window, Bool -> Void) : Proc(Window, Bool, Void)?
    @@focus_callback = block
    LibGLFW.set_window_focus_callback(window.ptr, ->(window : LibGLFW::Window*, focused : Int32) do
      if cb = @@focus_callback
        cb.call(Window.new(window), focused == LibGLFW::TRUE ? true : false)
      end
    end)
    @@focus_callback
  end

  @@iconify_callback : Proc(Window, Bool, Void)? = nil
  # Sets the iconify callback for the specified window.
  @[AlwaysInline]
  def self.set_window_iconify_callback(window : Window, &block : Window, Bool -> Void) : Proc(Window, Bool, Void)?
    @@iconify_callback = block
    LibGLFW.set_window_iconify_callback(window.ptr, ->(window : LibGLFW::Window*, iconified : Int32) do
      if cb = @@iconify_callback
        cb.call(Window.new(window), iconified == LibGLFW::TRUE ? true : false)
      end
    end)
    @@iconify_callback
  end

  @@framebuffer_size_callback : Proc(Window, Int32, Int32, Void)? = nil
  # Sets the framebuffer resize callback for the specified window.
  @[AlwaysInline]
  def self.set_framebuffer_size_callback(window : Window, &block : Window, Int32, Int32 -> Void) : Proc(Window, Int32, Int32, Void)?
    @@framebuffer_size_callback = block
    LibGLFW.set_framebuffer_size_callback(window.ptr, ->(window : LibGLFW::Window*, width : Int32, height : Int32) do
      if cb = @@framebuffer_size_callback
        cb.call(Window.new(window), width, height)
      end
    end)
    @@framebuffer_size_callback
  end

  # Processes all pending events.
  @[AlwaysInline]
  def self.poll_events : Nil
    LibGLFW.poll_events
  end

  # Waits until events are queued and processes them.
  @[AlwaysInline]
  def self.wait_events : Nil
    LibGLFW.wait_events
  end

  # Waits with timeout until events are queued and processes them.
  @[AlwaysInline]
  def self.wait_events_timeout(timeout : Float64) : Nil
    LibGLFW.wait_events_timeout(timeout)
  end

  # Posts an empty event to the event queue.
  @[AlwaysInline]
  def self.post_empty_event : Nil
    LibGLFW.post_empty_event
  end

  # Swaps the front and back buffers of the specified window.
  @[AlwaysInline]
  def self.swap_buffers(window : Window) : Nil
    LibGLFW.swap_buffers(window.ptr)
  end
end