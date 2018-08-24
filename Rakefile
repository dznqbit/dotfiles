#
# Add dotfiles install/uninstall tasks, just a bunch of symlinking

HOME = File.expand_path('~')
DOTFILES = Dir.getwd

FILES_TO_LINK = %w[
  .zshrc 
  .zsh
]

task :install do
  FILES_TO_LINK.each do |filename|
    print "Installing #{filename.ljust(16)} ... "
    `ln -s #{DOTFILES}/#{filename} #{HOME}/#{filename}`
    puts "Done"
  end
end

task :uninstall do
  safe_to_uninstall = FILES_TO_LINK.all? do |filename|
    File.readlink(File.expand_path(filename)) == "#{DOTFILES}/#{filename}"
  end

  if safe_to_uninstall 
    FILES_TO_LINK.each do |filename|
      print "Uninstalling #{filename.ljust(16)} ... "
      `rm #{HOME}/#{filename}`
      puts "Done"
    end
  else
    $stderr.puts "SKIPPING uninstall, one or more dotfiles have been altered"
  end
end
