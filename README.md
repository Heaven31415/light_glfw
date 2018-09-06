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

The library is still under heavy development. Many essential things are missing including documentation, tutorials, tests, examples. Almost every struct, enum or function has an already working wrapper, but right now I cannot guarantee that they are correct. You use it at your own risk.

## Installation

You need to install GLFW3 on your system. I was developing this library using version 3.2.1, so this version or any newer should work fine for you. Right now you won't be able to use any new features from 3.3 version. They aren't not implemented.

After that, you need to add this to your application's `shard.yml`:

```yaml
dependencies:
  light_glfw:
    github: Heaven31415/light_glfw
```

## Example
```crystal
require "light_glfw"

GLFW.set_error_callback do |error, string|
  puts "Error: `#{error}` description: `#{string}`"
end

if GLFW.init
  GLFW.window_hint_client_api(GLFW::ClientApi::OpenGL)
  GLFW.window_hint_context_version_major(3)
  GLFW.window_hint_context_version_minor(0)
  GLFW.window_hint_resizable(false)
  window = GLFW.create_window(640, 480, "Window", nil, nil)

  if window
    GLFW.make_context_current(window)
    GLFW.set_key_callback(window) do |window, key, scancode, action, mods|
      next if action != GLFW::Action::Press

      case key
      when GLFW::Key::Escape
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

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/Heaven31415/light_glfw/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [github](https://github.com/Heaven31415) Heaven31415 - creator, maintainer
