def build_executable(filename : String, destination : String)
  unless File.exists? File.join(Dir.current, filename)
    raise "Unable to find file at: `#{filename}`"
  else
    destination = File.join(Dir.current, destination)
    unless File.directory? destination
      raise "Unable to find directory at: `#{destination}`"
    else
      name = filename.chomp(File.extname(filename))
      puts "Building `#{name}` executable..."
      system("crystal build #{filename} -o #{File.join(destination, name)}")
    end
  end
end

DESTINATION = "../../bin"

files = [
  "clipboard.cr",
  "cursor.cr",
  "empty.cr",
  "events.cr",
  "gamma.cr",
  "glfwinfo.cr",
  "icon.cr",
  "iconify.cr",
  "joysticks.cr",
  "monitors.cr",
  "msaa.cr",
  "reopen.cr",
  "sharing.cr",
  "tearing.cr",
  "threads.cr",
  "timeout.cr",
  "title.cr",
  "vulkan.cr",
  "windows.cr"
]

time = Time.measure do
  files.each do |file|
    build_executable(file, DESTINATION)
  end
end

puts "It took #{time.seconds}s to build #{files.size} executables"