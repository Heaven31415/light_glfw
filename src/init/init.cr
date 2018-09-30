module GLFW
  # Initializes the GLFW library.
  # 
  # This function initializes the GLFW library. Before most GLFW functions can
  # be used, GLFW must be initialized, and before an application terminates GLFW
  # should be terminated in order to free any resources allocated during or
  # after initialization.
  #
  # If this function fails, it calls `GLFW.terminate` before returning. If it
  # succeeds, you should call `GLFW.terminate` before the application exits.
  #
  # Additional calls to this function after successful initialization but before
  # termination will return `true` immediately.
  #
  # Returns `true` if successful, or `false` if an
  # `GLFW::Error` occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 1.0.
  # ```
  # if GLFW.init
  #   puts "Initialized GLFW successfully!"
  #   # do your thing...
  #   GLFW.terminate
  # else
  #   puts "Unable to initialize GLFW."
  # end
  # ```
  @[AlwaysInline]
  def self.init : Bool
    LibGLFW.init == LibGLFW::TRUE ? true : false
  end

  # Terminates the GLFW library.
  #
  # This function destroys all remaining windows and cursors, restores any
  # modified gamma ramps and frees any other allocated resources. Once this
  # function is called, you must again call `GLFW.init` successfully before
  # you will be able to use most GLFW functions.
  #
  # If GLFW has been successfully initialized, this function should be called
  # before the application exits. If initialization fails, there is no need to
  # call this function, as it is called by `GLFW.init` before it returns
  # failure.
  #
  # NOTE: Possible errors include `GLFW::Error::PlatformError`.
  #
  # NOTE: This function may be called before `GLFW.init`.
  #
  # NOTE: This function must not be called from a callback.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 1.0.
  # ```
  # if GLFW.init
  #   puts "Initialized GLFW successfully!"
  #   # do your thing...
  #   GLFW.terminate
  # else
  #   puts "Unable to initialize GLFW."
  # end
  # ```
  @[AlwaysInline]
  def self.terminate : Nil
    LibGLFW.terminate
  end

  # Retrieves the version of the GLFW library.
  # 
  # This function retrieves the major, minor and revision numbers of the GLFW
  # library. It is intended for when you are using GLFW as a shared library and
  # want to ensure that you are using the minimum required version.
  #
  # Returns NamedTuple with keys: `major : Int32`, `minor : Int32`, `rev : Int32`.
  #
  # NOTE: This function may be called before `GLFW.init`.
  #
  # NOTE: This function may be called from any thread.
  #
  # NOTE: Added in version 1.0.
  # ```
  # version = GLFW.get_version
  # puts "major: #{version[:major]}" # => 3
  # puts "minor: #{version[:minor]}" # => 2
  # puts "rev: #{version[:rev]}" # => 1
  # ```
  @[AlwaysInline]
  def self.get_version : {major: Int32, minor: Int32, rev: Int32}
    LibGLFW.get_version(out major, out minor, out rev)
    {major: major, minor: minor, rev: rev}
  end

  # Returns a string describing the compile-time configuration.
  #
  # This function returns the compile-time generated
  # version string of the GLFW library binary. It
  # describes the version, platform, compiler and any platform-specific
  # compile-time options. 
  #
  # Do not use the version string to parse the GLFW library version. The
  # `GLFW.get_version` function provides the version of the running library
  # binary in numerical format.
  #
  # Returns the ASCII encoded GLFW version string.
  #
  # NOTE: This function may be called before `GLFW.init`.
  #
  # NOTE: This function may be called from any thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # string = GLFW.get_version_string
  # puts string # => "3.2.1 X11 GLX EGL clock_gettime /dev/js Xf86vm shared"
  # ```
  @[AlwaysInline]
  def self.get_version_string : String
    String.new(LibGLFW.get_version_string)
  end

  @@error_callback : Proc(Error, String, Nil)? = nil
  # Sets the error callback.
  #
  # This function sets the error callback, which is called with an error code
  # and a human-readable description each time a GLFW error occurs.
  #
  # The error callback is called on the thread where the error occurred. If you
  # are using GLFW from multiple threads, your error callback needs to be
  # written accordingly.
  #
  # Once set, the error callback remains set even after the library has been
  # terminated.
  #
  # `Parameters:`
  #
  #  *`block`* The new error callback.
  #
  # Returns the previously set callback or `nil` if no callback was set.
  #
  # NOTE: This function may be called before `GLFW.init`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # USING_METHOD = true
  # USING_MACRO = true
  #
  # def error_callback(error : GLFW::Error, string : String)
  #   puts "error: #{error} string: #{string}"
  # end
  #
  # if GLFW.init && (window = GLFW.create_window(640, 480, "Window"))
  #   GLFW.make_context_current(window)
  #
  #   if USING_METHOD
  #     if USING_MACRO
  #       # macro with the same name allows you to avoid writing boilerplate code, 
  #       # but compiler errors will be more difficult to understand.
  #       GLFW.set_error_callback(error_callback)
  #     else
  #       GLFW.set_error_callback(&->error_callback(GLFW::Error, String))
  #     end
  #   else
  #     GLFW.set_error_callback do |error, string|
  #       puts "error: #{error} string: #{string}"
  #     end
  #   end
  #
  #   while !GLFW.window_should_close(window)
  #     GLFW.poll_events
  #     GLFW.swap_buffers(window)
  #   end
  #
  #   GLFW.terminate
  # end
  # ```
  @[AlwaysInline]
  def self.set_error_callback(&block : Error, String -> Nil) : Proc(Error, String, Nil)?
    old_callback = @@error_callback
    @@error_callback = block
    
    LibGLFW.set_error_callback ->(error : Int32, description : UInt8*) do
      if cb = @@error_callback
        cb.call(Error.new(error), String.new(description))
      end
    end

    old_callback
  end
end