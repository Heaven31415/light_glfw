# enums definitions

module GLFW
  enum Key
    Unknown                         = -1
    Space                           = 32
    Apostrophe                      = 39
    Comma                           = 44
    Minus                           = 45
    Period                          = 46
    Slash                           = 47
    Num0                            = 48
    Num1                            = 49
    Num2                            = 50
    Num3                            = 51
    Num4                            = 52
    Num5                            = 53
    Num6                            = 54
    Num7                            = 55
    Num8                            = 56
    Num9                            = 57
    Semicolon                       = 59
    Equal                           = 61
    A                               = 65
    B                               = 66
    C                               = 67
    D                               = 68
    E                               = 69
    F                               = 70
    G                               = 71
    H                               = 72
    I                               = 73
    J                               = 74
    K                               = 75
    L                               = 76
    M                               = 77
    N                               = 78
    O                               = 79
    P                               = 80
    Q                               = 81
    R                               = 82
    S                               = 83
    T                               = 84
    U                               = 85
    V                               = 86
    W                               = 87
    X                               = 88
    Y                               = 89
    Z                               = 90
    LeftBracket                     = 91
    Backslash                       = 92
    RightBracket                    = 93
    GraveAccent                     = 96
    World1                          = 161
    World2                          = 162

    Escape                          = 256
    Enter                           = 257
    Tab                             = 258
    Backspace                       = 259
    Insert                          = 260
    Delete                          = 261
    Right                           = 262
    Left                            = 263
    Down                            = 264
    Up                              = 265
    PageUp                          = 266
    PageDown                        = 267
    Home                            = 268
    End                             = 269
    CapsLock                        = 280
    ScrollLock                      = 281
    NumLock                         = 282
    PrintScreen                     = 283
    Pause                           = 284
    F1                              = 290
    F2                              = 291
    F3                              = 292
    F4                              = 293
    F5                              = 294
    F6                              = 295
    F7                              = 296
    F8                              = 297
    F9                              = 298
    F10                             = 299
    F11                             = 300
    F12                             = 301
    F13                             = 302
    F14                             = 303
    F15                             = 304
    F16                             = 305
    F17                             = 306
    F18                             = 307
    F19                             = 308
    F20                             = 309
    F21                             = 310
    F22                             = 311
    F23                             = 312
    F24                             = 313
    F25                             = 314
    Pad0                            = 320
    Pad1                            = 321
    Pad2                            = 322
    Pad3                            = 323
    Pad4                            = 324
    Pad5                            = 325
    Pad6                            = 326
    Pad7                            = 327
    Pad8                            = 328
    Pad9                            = 329
    PadDecimal                      = 330
    PadDivide                       = 331
    PadMultiply                     = 332
    PadSubtract                     = 333
    PadAdd                          = 334
    PadEnter                        = 335
    PadEqual                        = 336
    LeftShift                       = 340
    LeftControl                     = 341
    LeftAlt                         = 342
    LeftSuper                       = 343
    RightShift                      = 344
    RightControl                    = 345
    RightAlt                        = 346
    RightSuper                      = 347
    Menu                            = 348
    Last                            = Menu
  end

  @[Flags]
  enum Mod
    Shift                           = 0x0001
    Control                         = 0x0002
    Alt                             = 0x0004
    Super                           = 0x0008
  end

  enum MouseButton
    Num1                            = 0
    Num2                            = 1
    Num3                            = 2
    Num4                            = 3
    Num5                            = 4
    Num6                            = 5
    Num7                            = 6
    Num8                            = 7
    Left                            = Num1
    Right                           = Num2
    Middle                          = Num3
    Last                            = Num8
  end

  enum Joystick
    Num1                            = 0
    Num2                            = 1
    Num3                            = 2
    Num4                            = 3
    Num5                            = 4
    Num6                            = 5
    Num7                            = 6
    Num8                            = 7
    Num9                            = 8
    Num10                           = 9
    Num11                           = 10
    Num12                           = 11
    Num13                           = 12
    Num14                           = 13
    Num15                           = 14
    Num16                           = 15
    Last                            = Num16
  end

  enum Error
    NotInitialized                  = 0x00010001
    NoCurrentContext                = 0x00010002
    InvalidEnum                     = 0x00010003
    InvalidValue                    = 0x00010004
    OutOfMemory                     = 0x00010005
    ApiUnavailable                  = 0x00010006
    VersionUnavailable              = 0x00010007
    PlatformError                   = 0x00010008
    FormatUnavailable               = 0x00010009
    NoWindowContext                 = 0x0001000A
  end

  module Event
    enum Monitor
      Connected                     = 0x00040001
      Disconnected                  = 0x00040002
    end
  end
end