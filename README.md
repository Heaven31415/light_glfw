# light_glfw

[![Build Status](https://travis-ci.org/Heaven31415/light_glfw.svg?branch=master)](https://travis-ci.org/Heaven31415/light_glfw)

Light GLFW is a very simple wrapper around GLFW3 library. I had a few simple goals in mind when I was creating it:
* Don't force OOP API on things which weren't supposed to be OOP.
* Make API as close to the original as it's possible, so someone experienced with GLFW can use their knowledge to good use.
Almost every struct, enum or function is using the original name (of course I'm using snake_case instead of camelCase). There are a few exceptions, but they were necessary.
* Make API as convenient as it's possible, introducing a small number of new ideas:
  - Return and get a bool instead of int32 with 0 and 1 value.
  - Return and get an enum instead of int32 with proper values.
  - Return and get a string instead of a pointer to uint8.
  - Return and get light wrappers for structs instead of pointers.
  - Return and get arrays instead of a pointer with size variable.
  - Set callbacks using blocks with optional context instead of raw C functions.

## Documentation

- [API Documentation](https://heaven31415.github.io/light_glfw/GLFW.html)

## Status

This shard is still under heavy development. Many essential things are not ready including documentation, tutorials, tests, examples. Every struct, enum or function has an already working wrapper, but right now I cannot guarantee that they won't change. Your application may break after update, be aware of that.

## Installation

In order to use it, you need to install `light_glfw` shard and `GLFW3` library (at least 3.2.1 version).

### Shard Installation:

- Add this code to your application's `shard.yml`:

```yaml
dependencies:
  light_glfw:
    github: Heaven31415/light_glfw
```

- Using CLI, go to your application's root directory (where your `shard.yml` file is located)

- Run following command: `shards install`

- If everything went well, you should see something like this:

```
Fetching https://github.com/Heaven31415/light_glfw.git
Installing light_glfw (0.1.0 at HEAD)
```

### Library Installation

- Debian and Ubuntu: `sudo apt install libglfw3-dev`

## Example
```crystal
require "light_glfw"

GLFW.error_callback do |error, msg|
  puts "Error: `#{error}` msg: `#{msg}`"
end

def mouse_button_callback(window : GLFW::Window, button : GLFW::MouseButton, action : GLFW::Action, mods : GLFW::Mod)
  case action
  when .press?
    puts "#{button} is pressed"
  when .release?
    puts "#{button} is released"
  end
end

if GLFW.init
  GLFW.window_hint_client_api(GLFW::ClientApi::OpenGL)
  GLFW.window_hint_context_version_major(3)
  GLFW.window_hint_context_version_minor(0)
  GLFW.window_hint_resizable(false)

  if window = GLFW.create_window(640, 480, "Window")

    GLFW.make_context_current(window)

    GLFW.mouse_button_callback(window, mouse_button_callback)

    GLFW.key_callback(window) do |window, key, scancode, action, mods|
      next if action != GLFW::Action::Press

      case key
      when .escape?
        GLFW.set_window_should_close(window, true)
      end
    end

    while !GLFW.window_should_close(window)
      GLFW.poll_events
      GLFW.swap_buffers(window)
    end
  
    GLFW.destroy_window(window)
  end

  GLFW.terminate
end
```

## Usage

```crystal
require "light_glfw"
```

## Contributing

1. Fork it (<https://github.com/Heaven31415/light_glfw/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [github](https://github.com/Heaven31415) Heaven31415 - creator, maintainer
