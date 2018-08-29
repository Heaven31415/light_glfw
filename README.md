# light_glfw

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
