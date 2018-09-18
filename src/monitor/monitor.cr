module GLFW
  struct Monitor
    getter ptr : LibGLFW::Monitor*

    def initialize(@ptr)
    end

    def to_unsafe : LibGLFW::Monitor*
      @ptr
    end
  end

  # Returns the currently connected monitors.
  #
  # This function returns an array of handles for all currently connected
  # monitors. The primary monitor is always first in the returned array.  If no
  # monitors were found, this function returns `nil`.
  #
  # Returns an array of monitor handles, or `nil` if no monitors were found or
  # if an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # monitors = GLFW.get_monitors
  # if monitors
  #   monitors.each do |monitor|
  #     puts monitor
  #   end
  # end 
  # ```
  @[AlwaysInline]
  def self.get_monitors : Array(Monitor)?
    ptr = LibGLFW.get_monitors(out count)
    if ptr.null?
      nil
    else
      monitors = Array(Monitor).new(count)
      count.times do |i|
        monitors << Monitor.new(ptr[i])
      end
      monitors
    end
  end

  # Returns the primary monitor.
  #
  # This function returns the primary monitor. This is usually the monitor
  # where elements like the task bar or global menu bar are located.
  # 
  # Returns the primary monitor, or `nil` if no monitors were found or if an
  # error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # monitor = GLFW.get_primary_monitor
  # if monitor
  #   puts monitor
  # end
  # ```
  @[AlwaysInline]
  def self.get_primary_monitor : Monitor?
    ptr = LibGLFW.get_primary_monitor
    if ptr.null?
      nil
    else
      Monitor.new(ptr)
    end
  end

  # Returns the position of the monitor's viewport on the virtual screen.
  #
  # This function returns the position, in screen coordinates, of the upper-left
  # corner of the specified monitor.
  #
  # If an error occurs, all tuple elements will be set to zero.
  #
  # Returns NamedTuple with keys: `x : Int32`, `y : Int32`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  # ```
  # monitor = GLFW.get_primary_monitor
  # if monitor
  #   position = GLFW.get_monitor_pos(monitor)
  #   puts "x: #{position[:x]} y: #{position[:y]}"
  # end
  # ```
  @[AlwaysInline]
  def self.get_monitor_pos(monitor : Monitor) : {x: Int32, y: Int32}
    LibGLFW.get_monitor_pos(monitor.ptr, out xpos, out ypos)
    {x: xpos, y: ypos}
  end

  # Returns the physical size of the monitor.
  #
  # This function returns the size, in millimetres, of the display area of the
  # specified monitor.
  #
  # Some systems do not provide accurate monitor size information, either
  # because the monitor EDID data is incorrect or 
  # because the driver does not report it accurately.
  #
  # If an error occurs, all tuple elements will be set to zero.
  #
  # Returns NamedTuple with keys: `width : Int32`, `height : Int32`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # ```
  # monitor = GLFW.get_primary_monitor
  # if monitor
  #   size = GLFW.get_monitor_physical_size(monitor)
  #   puts "width: #{size[:width]}mm height: #{size[:height]}mm"
  # end
  # ```
  @[AlwaysInline]
  def self.get_monitor_physical_size(monitor : Monitor) : {width: Int32, height: Int32}
    LibGLFW.get_monitor_physical_size(monitor.ptr, out width, out height)
    {width: width, height: height}
  end

  # Returns the name of the specified monitor.
  #
  # This function returns a human-readable name, encoded as UTF-8, of the
  # specified monitor. The name typically reflects the make and model of the
  # monitor and is not guaranteed to be unique among the connected monitors.
  #
  # Returns the UTF-8 encoded name of the monitor, or `nil` if an
  # error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  # ```
  # monitor = GLFW.get_primary_monitor
  # if monitor
  #   name = GLFW.get_monitor_name(monitor)
  #   puts "name: #{name}"
  # end
  # ```
  @[AlwaysInline]
  def self.get_monitor_name(monitor : Monitor) : String?
    ptr = LibGLFW.get_monitor_name(monitor.ptr)
    if ptr.null?
      nil
    else
      String.new(ptr)
    end
  end

  
  @@callback : Proc(Monitor, Event, Void)? = nil
  # Sets the monitor configuration callback.
  #
  # This function sets the monitor configuration callback. 
  # This is called when a monitor is connected to or disconnected from the system.
  #
  # Returns the previously set callback, or `nil` if no callback was set or the
  # library had not been initialized.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # ```
  # GLFW.set_monitor_callback do |monitor, event|
  #   case event
  #   when GLFW::Event::Connected
  #     puts "monitor #{monitor} has been connected"
  #   when GLFW::Event::Disconnected
  #     puts "monitor #{monitor} has been disconnected"
  #   end
  # end
  # ```
  @[AlwaysInline]
  def self.set_monitor_callback(&block : Monitor, Event -> Void) : Proc(Monitor, Event, Void)?
    old_callback = @@monitor_callback
    @@monitor_callback = block
    
    LibGLFW.set_monitor_callback ->(monitor : LibGLFW::Monitor*, event : Int32) do
      if cb = @@monitor_callback
        cb.call(Monitor.new(monitor), Event.new(event))
      end
    end
    
    old_callback
  end 

  # Returns the available video modes for the specified monitor.
  #
  # This function returns an array of all video modes supported by the specified
  # monitor. The returned array is sorted in ascending order, first by color
  # bit depth (the sum of all channel depths) and then by resolution area (the
  # product of width and height).
  #
  # Returns an array of video modes, or `nil` if an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # ```
  # monitor = GLFW.get_primary_monitor
  # if monitor
  #   video_modes = GLFW.get_video_modes(monitor)
  #   if video_modes
  #     video_modes.each { |video_mode| puts "video_mode: #{video_mode}" }
  #   end
  # end
  # ```
  @[AlwaysInline]
  def self.get_video_modes(monitor : Monitor) : Array(VideoMode)?
    ptr = LibGLFW.get_video_modes(monitor.ptr, out count)

    if ptr.null?
      nil
    else
      video_modes = Array(VideoMode).new(count)
      count.times do |i|
        video_modes << VideoMode.new(ptr + i)
      end
      video_modes
    end
  end

  # Returns the current mode of the specified monitor.
  #
  # This function returns the current video mode of the specified monitor. If
  # you have created a full screen window for that monitor, the return value
  # will depend on whether that window is iconified.
  #
  # Returns the current mode of the monitor, or `nil` if an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  # ```
  # monitor = GLFW.get_primary_monitor
  # if monitor
  #   video_mode = GLFW.get_video_mode(monitor)
  #   if video_mode
  #     puts "video_mode: #{video_mode}"
  #   end
  # end
  # ```
  @[AlwaysInline]
  def self.get_video_mode(monitor : Monitor) : VideoMode?
    ptr = LibGLFW.get_video_mode(monitor.ptr)
    if ptr.null?
      nil
    else
      VideoMode.new(ptr)
    end
  end

  # Generates a gamma ramp and sets it for the specified monitor.
  #
  # This function generates a 256-element gamma ramp from the specified exponent
  # and then calls `#set_gamma_ramp` with it. The value must be a finite
  # number greater than zero.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`, `GLFW::Error::InvalidValue` 
  # and `GLFW::Error::PlatformError`.
  # ```
  # monitor = GLFW.get_primary_monitor
  # if monitor
  #   GLFW.set_gamma(monitor, 1.0f32)
  # end
  # ```
  @[AlwaysInline]
  def self.set_gamma(monitor : Monitor, gamma : Float32) : Nil
    LibGLFW.set_gamma(monitor.ptr, gamma)
  end

  # Returns the current gamma ramp for the specified monitor.
  #
  # This function returns the current gamma ramp of the specified monitor.
  #
  # Returns the current gamma ramp, or `nil` if an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # ```
  # monitor = GLFW.get_primary_monitor
  # if monitor
  #   gamma_ramp = GLFW.get_gamma_ramp(monitor)
  #   if gamma_ramp
  #     puts "gamma_ramp: #{gamma_ramp}"
  #   end 
  # end
  # ```
  @[AlwaysInline]
  def self.get_gamma_ramp(monitor : Monitor) : GammaRamp?
    ptr = LibGLFW.get_gamma_ramp(monitor.ptr)
    if ptr.null?
      nil
    else
      GammaRamp.new(ptr)
    end
  end

  # Sets the current gamma ramp for the specified monitor.
  #
  # This function sets the current gamma ramp for the specified monitor. The
  # original gamma ramp for that monitor is saved by GLFW the first time this
  # function is called and is restored by `#terminate`.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized` and `GLFW::Error::PlatformError`.
  #
  # NOTE: Gamma ramp sizes other than 256 are not supported by all platforms or graphics hardware.
  #
  # ```
  # monitor = GLFW.get_primary_monitor
  # if monitor
  #   gamma_ramp = GLFW.get_gamma_ramp(monitor)
  #   if gamma_ramp
  #     GLFW.set_gamma_ramp(monitor, gamma_ramp)
  #   end 
  # end
  # ```
  @[AlwaysInline]
  def self.set_gamma_ramp(monitor : Monitor, ramp : GammaRamp) : Nil
    LibGLFW.set_gamma_ramp(monitor.ptr, ramp.ptr)
  end
end