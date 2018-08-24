module GLFW
  class Monitor
    getter ptr : LibGLFW::Monitor*

    def initialize(@ptr)
    end

    def to_unsafe : LibGLFW::Monitor*
      @ptr
    end

    def self.get_array : Array(Monitor)
      monitors = Array(Monitor).new
      monitors_ptr = LibGLFW.get_monitors(out count)

      i = 0
      while i < count 
        monitors << Monitor.new(monitors_ptr[i])
        i += 1
      end

      monitors
    end

    def self.get_primary : Monitor
      Monitor.new(LibGLFW.get_primary_monitor)
    end

    def self.get_position(monitor : Monitor) : {x: Int32, y: Int32}
      LibGLFW.get_monitor_pos(monitor.ptr, out xpos, out ypos)
      {x: xpos, y: ypos}
    end

    def self.get_physical_size(monitor : Monitor) : {width: Int32, height: Int32}
      LibGLFW.get_monitor_physical_size(monitor.ptr, out width, out height)
      {width: width, height: height}
    end

    def self.get_name(monitor : Monitor) : String
      String.new(LibGLFW.get_monitor_name(monitor.ptr))
    end

    @@callback : Proc(Monitor, Event::Monitor, Void)? = nil
    def self.set_callback(&block : Monitor, Event::Monitor -> Void)
      @@callback = block
      LibGLFW.set_monitor_callback ->(monitor : LibGLFW::Monitor*, event : Int32) do
        if cb = @@callback
          cb.call(Monitor.new(monitor), Event::Monitor.new(event))
        end
      end
    end 

    def self.get_video_modes(monitor : Monitor) : Array(VideoMode)
      video_modes = Array(VideoMode).new
      video_modes_ptr = LibGLFW.get_video_modes(monitor.ptr, out count)

      i = 0
      while i < count
        video_modes << VideoMode.new(video_modes_ptr + i)
        i += 1
      end

      video_modes
    end

    def self.get_video_mode(monitor : Monitor) : VideoMode
      VideoMode.new(LibGLFW.get_video_mode(monitor.ptr))
    end

    def self.set_gamma(monitor : Monitor, gamma : Float32)
      LibGLFW.set_gamma(monitor.ptr, gamma)
    end

    def self.get_gamma_ramp(monitor : Monitor) : GammaRamp
      GammaRamp.new(LibGLFW.get_gamma_ramp(monitor.ptr))
    end

    def self.set_gamma_ramp(monitor : Monitor, ramp : GammaRamp)
      LibGLFW.set_gamma_ramp(monitor.ptr, ramp.ptr)
    end
  end
end