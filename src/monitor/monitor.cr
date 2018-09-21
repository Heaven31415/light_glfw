module GLFW
  struct Monitor
    getter ptr : LibGLFW::Monitor*

    private def initialize(@ptr)
    end
    
    private def dup
    end

    def to_unsafe : LibGLFW::Monitor*
      @ptr
    end

    def to_s(io : IO)
      io << GLFW.get_monitor_name(self)
    end
  
    def inspect(io : IO)
      name = GLFW.get_monitor_name(self)
      size = GLFW.get_monitor_physical_size(self)
      pos  = GLFW.get_monitor_pos(self)
  
      io << name << " {width: " << size[:width] << "mm" <<
      " height: " << size[:height] << "mm}" <<
      " {x: " << pos[:x] << " y: " << pos[:y] << "}"
    end
  end

  # Returns the currently connected monitors.
  #
  # This function returns an array of handles for all currently connected
  # monitors. The primary monitor is always first in the returned array. If no
  # monitors were found, this function returns `nil`.
  #
  # Returns an array of monitor handles, or `nil` if no monitors were found or
  # if an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init && (monitors = GLFW.get_monitors)
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
        monitors << ptr[i].unsafe_as(Monitor)
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
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: The primary monitor is always first in the array returned by `#get_monitors`.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init && (monitor = GLFW.get_primary_monitor)
  #   puts monitor
  # end
  # ```
  @[AlwaysInline]
  def self.get_primary_monitor : Monitor?
    ptr = LibGLFW.get_primary_monitor
    ptr.null? ? nil : ptr.unsafe_as(Monitor)
  end

  # Returns the position of the monitor's viewport on the virtual screen.
  #
  # This function returns the position, in screen coordinates, of the upper-left
  # corner of the specified monitor.
  #
  # If an error occurs, x and y position will be set to zero.
  #
  # `Parameters:`
  #
  # *`monitor`* The monitor to query.
  #
  # Returns NamedTuple with keys: `x : Int32`, `y : Int32`.
  #
  # NOTE: Possible errors include `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init && (monitor = GLFW.get_primary_monitor)
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
  # If an error occurs, width and height will be set to zero.
  #
  # `Parameters:`
  #
  # *`monitor`* The monitor to query.
  #
  # Returns NamedTuple with keys: `width : Int32`, `height : Int32`.
  #
  # NOTE: Windows calculates the returned physical size from the
  # current resolution and system DPI instead of querying the monitor EDID data.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init && (monitor = GLFW.get_primary_monitor)
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
  # `Parameters:`
  #
  # *`monitor`* The monitor to query.
  #
  # Returns the UTF-8 encoded name of the monitor.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init && (monitor = GLFW.get_primary_monitor)
  #   name = GLFW.get_monitor_name(monitor)
  #   puts "name: #{name}"
  # end
  # ```
  @[AlwaysInline]
  def self.get_monitor_name(monitor : Monitor) : String
    String.new(LibGLFW.get_monitor_name(monitor.ptr))
  end

  @@callback : Proc(Monitor, Event, Void)? = nil
  # Sets the monitor configuration callback.
  #
  # This function sets the monitor configuration callback. 
  # This is called when a monitor is connected to or disconnected from the system.
  #
  # `Parameters:`
  #
  # *`block`* The new monitor callback.
  #
  # Returns the previously set callback, or `nil` if no callback was set or the
  # library had not been initialized.
  #
  # NOTE: Possible errors include `GLFW::Error::NotInitialized`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # def monitor_callback(monitor : GLFW::Monitor, event : GLFW::Event)
  #   puts "Event #{event} for monitor #{monitor}"
  # end
  #
  # if GLFW.init
  #   # set callback with method
  #   GLFW.set_monitor_callback(&->monitor_callback(GLFW::Monitor, GLFW::Event))   
  #
  #   # set callback with block
  #   GLFW.set_monitor_callback do |monitor, event|
  #     case event
  #     when .connected?
  #       puts "Monitor #{monitor} has been connected"
  #     when .disconnected?
  #       puts "Monitor #{monitor} has been disconnected"
  #     end
  #   end
  # end
  # ```
  @[AlwaysInline]
  def self.set_monitor_callback(&block : Monitor, Event -> Void) : Proc(Monitor, Event, Void)?
    old_callback = @@monitor_callback
    @@monitor_callback = block
    
    LibGLFW.set_monitor_callback ->(monitor : LibGLFW::Monitor*, event : Int32) do
      if cb = @@monitor_callback
        cb.call(monitor.unsafe_as(Monitor), Event.new(event))
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
  # `Parameters:`
  #
  # *`monitor`* The monitor to query.
  #
  # Returns an array of video modes, or `nil` if an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 1.0.
  # ```
  # if GLFW.init && (monitor = GLFW.get_primary_monitor)
  #   if video_modes = GLFW.get_video_modes(monitor)
  #     video_modes.each { |video_mode| puts "Video_mode: #{video_mode}" }
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
  # `Parameters:`
  #
  # *`monitor`* The monitor to query.
  #
  # Returns the current mode of the monitor, or `nil` if an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init && (monitor = GLFW.get_primary_monitor)
  #   if video_mode = GLFW.get_video_mode(monitor)
  #     puts "Video_mode: #{video_mode}"
  #   end
  # end
  # ```
  @[AlwaysInline]
  def self.get_video_mode(monitor : Monitor) : VideoMode?
    ptr = LibGLFW.get_video_mode(monitor.ptr)
    ptr.null? ? nil : VideoMode.new(ptr)
  end

  # Generates a gamma ramp and sets it for the specified monitor.
  #
  # This function generates a 256-element gamma ramp from the specified exponent
  # and then calls `#set_gamma_ramp` with it. The value must be a finite
  # number greater than zero.
  #
  # `Parameters:`
  #
  # *`monitor`* The monitor whose gamma ramp to set.
  # *`gamma`* The desired exponent.
  #
  # NOTE: Possible errors include `GLFW::Error::InvalidValue` and `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init && (monitor = GLFW.get_primary_monitor)
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
  # `Parameters:`
  #
  # *`monitor`* The monitor to query.
  #
  # Returns the current gamma ramp, or `nil` if an error occurred.
  #
  # NOTE: Possible errors include `GLFW::Error::PlatformError`.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init && (monitor = GLFW.get_primary_monitor)
  #   if gamma_ramp = GLFW.get_gamma_ramp(monitor)
  #     puts "Gamma_ramp: #{gamma_ramp}"
  #   end 
  # end
  # ```
  @[AlwaysInline]
  def self.get_gamma_ramp(monitor : Monitor) : GammaRamp?
    ptr = LibGLFW.get_gamma_ramp(monitor.ptr)
    ptr.null? ? nil : GammaRamp.new(ptr)
  end

  # Sets the current gamma ramp for the specified monitor.
  #
  # This function sets the current gamma ramp for the specified monitor. The
  # original gamma ramp for that monitor is saved by GLFW the first time this
  # function is called and is restored by `#terminate`.
  #
  # NOTE: Possible errors include `GLFW::Error::PlatformError`.
  #
  # NOTE: Gamma ramp sizes other than 256 are not supported by all platforms or graphics hardware.
  #
  # NOTE: This function must only be called from the main thread.
  #
  # NOTE: Added in version 3.0.
  # ```
  # if GLFW.init && (monitor = GLFW.get_primary_monitor)
  #   if gamma_ramp = GLFW.get_gamma_ramp(monitor)
  #     GLFW.set_gamma_ramp(monitor, gamma_ramp)
  #   end 
  # end
  # ```
  @[AlwaysInline]
  def self.set_gamma_ramp(monitor : Monitor, ramp : GammaRamp) : Nil
    LibGLFW.set_gamma_ramp(monitor.ptr, ramp.ptr)
  end
end