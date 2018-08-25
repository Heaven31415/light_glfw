module GLFW
  struct Monitor
    getter ptr : LibGLFW::Monitor*

    def initialize(@ptr)
    end

    def to_unsafe : LibGLFW::Monitor*
      @ptr
    end
  end

  # fun get_monitors = glfwGetMonitors(count : Int32*) : Monitor**
  @[AlwaysInline]
  def self.get_monitors : Array(Monitor)
    monitors = Array(Monitor).new
    monitors_ptr = LibGLFW.get_monitors(out count)

    i = 0
    while i < count 
      monitors << Monitor.new(monitors_ptr[i])
      i += 1
    end

    monitors
  end

  # todo: check me! maybe I should return Monitor? instead of Monitor
  # fun get_primary_monitor = glfwGetPrimaryMonitor : Monitor*
  @[AlwaysInline]
  def self.get_primary_monitor : Monitor
    Monitor.new(LibGLFW.get_primary_monitor)
  end

  # fun get_monitor_pos = glfwGetMonitorPos(monitor : Monitor*, xpos : Int32*, ypos : Int32*) : Void
  @[AlwaysInline]
  def self.get_monitor_pos(monitor : Monitor) : {x: Int32, y: Int32}
    LibGLFW.get_monitor_pos(monitor.ptr, out xpos, out ypos)
    {x: xpos, y: ypos}
  end

  # fun get_monitor_physical_size = glfwGetMonitorPhysicalSize(monitor : Monitor*, width : Int32*, height : Int32*) : Void
  @[AlwaysInline]
  def self.get_monitor_physical_size(monitor : Monitor) : {width: Int32, height: Int32}
    LibGLFW.get_monitor_physical_size(monitor.ptr, out width, out height)
    {width: width, height: height}
  end

  # fun get_monitor_name = glfwGetMonitorName(monitor : Monitor*) : UInt8*
  @[AlwaysInline]
  def self.get_monitor_name(monitor : Monitor) : String
    String.new(LibGLFW.get_monitor_name(monitor.ptr))
  end

  # fun set_monitor_callback = glfwSetMonitorCallback(cbfun : MonitorFun) : MonitorFun
  @@callback : Proc(Monitor, Event::Monitor, Void)? = nil
  @[AlwaysInline]
  def self.set_monitor_callback(&block : Monitor, Event::Monitor -> Void) : Proc(Monitor, Event::Monitor, Void)?
    @@callback = block
    LibGLFW.set_monitor_callback ->(monitor : LibGLFW::Monitor*, event : Int32) do
      if cb = @@callback
        cb.call(Monitor.new(monitor), Event::Monitor.new(event))
      end
    end
    @@callback
  end 

  # fun get_video_modes = glfwGetVideoModes(monitor : Monitor*, count : Int32*) : VideoMode*
  @[AlwaysInline]
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

  # fun get_video_mode = glfwGetVideoMode(monitor : Monitor*) : VideoMode*
  @[AlwaysInline]
  def self.get_video_mode(monitor : Monitor) : VideoMode
    VideoMode.new(LibGLFW.get_video_mode(monitor.ptr))
  end

  # fun set_gamma = glfwSetGamma(monitor : Monitor*, gamma : Float32) : Void
  @[AlwaysInline]
  def self.set_gamma(monitor : Monitor, gamma : Float32) : Nil
    LibGLFW.set_gamma(monitor.ptr, gamma)
  end

  # fun get_gamma_ramp = glfwGetGammaRamp(monitor : Monitor*) : GammaRamp*
  @[AlwaysInline]
  def self.get_gamma_ramp(monitor : Monitor) : GammaRamp
    GammaRamp.new(LibGLFW.get_gamma_ramp(monitor.ptr))
  end

  # fun set_gamma_ramp = glfwSetGammaRamp(monitor : Monitor*, ramp : GammaRamp*) : Void
  @[AlwaysInline]
  def self.set_gamma_ramp(monitor : Monitor, ramp : GammaRamp) : Nil
    LibGLFW.set_gamma_ramp(monitor.ptr, ramp.ptr)
  end
end