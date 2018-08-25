# TODO: change semantics of == for Window and probably even more classes

module GLFW
  # fun get_key = glfwGetKey(window : Window*, key : Int32) : Int32

  # fun set_key_callback = glfwSetKeyCallback(window : Window*, cbfun : KeyFun) : KeyFun
  @@key_callback : Proc(Window, Key, Int32, Action, Mod, Void)? = nil
  def self.set_key_callback(window : Window, &block : Window, Key, Int32, Action, Mod -> Void)
    @@key_callback = block
    LibGLFW.set_key_callback(window, 
    ->(window : LibGLFW::Window*, key : Int32, scancode : Int32, action : Int32, mods : Int32) do
      if cb = @@key_callback
        cb.call(Window.new(window), Key.new(key), scancode, Action.new(action), Mod.new(mods))
      end
    end)
  end
end