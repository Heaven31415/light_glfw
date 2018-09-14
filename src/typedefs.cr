lib LibGLFW
  alias GlProc = Void -> Void
  alias VkProc = Void -> Void
  
  type Monitor = Void
  type Window = Void
  type Cursor = Void
  type ErrorFun = Int32, UInt8* -> Void
  type WindowPosFun = Window*, Int32, Int32 -> Void
  type WindowSizeFun = Window*, Int32, Int32 -> Void
  type WindowCloseFun = Window* -> Void
  type WindowRefreshFun = Window* -> Void
  type WindowFocusFun = Window*, Int32 -> Void
  type WindowIconifyFun = Window*, Int32 -> Void
  type FramebufferSizeFun = Window*, Int32, Int32 -> Void
  type MouseButtonFun = Window*, Int32, Int32, Int32 -> Void
  type CursorPosFun = Window*, Float64, Float64 -> Void
  type CursorEnterFun = Window*, Int32 -> Void
  type ScrollFun = Window*, Float64, Float64 -> Void
  type KeyFun = Window*, Int32, Int32, Int32, Int32 -> Void
  type CharFun = Window*, UInt32 -> Void
  type CharModsFun = Window*, UInt32, Int32 -> Void
  type DropFun = Window*, Int32, UInt8** -> Void
  type MonitorFun = Monitor*, Int32 -> Void
  type JoystickFun = Int32, Int32 -> Void
  type VkInstance = Void
  type VkPhysicalDevice = Void
  type VkAllocationCallbacks = Void
  type VkSurfaceKHR = Void

  struct VideoMode
    width         : Int32
    height        : Int32
    red_bits      : Int32
    green_bits    : Int32
    blue_bits     : Int32
    refresh_rate  : Int32
  end

  struct GammaRamp
    red   : UInt16*
    green : UInt16*
    blue  : UInt16*
    size  : UInt32
  end

  struct Image
    width  :  Int32
    height :  Int32
    pixels :  UInt8*
  end
end