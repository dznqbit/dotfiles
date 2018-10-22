#
# Add dotfiles install/uninstall tasks, just a bunch of symlinking

HOME = File.expand_path('~')
DOTFILES = File.dirname(__FILE__)

FILES_TO_LINK = %w[
  .gitconfig
  .tmux.conf
  .vim
  .vimrc
  .zshrc 
  .zsh
]

task :install do
  FILES_TO_LINK.each do |filename|
    origin = "#{DOTFILES}/#{filename}"
    destination = "#{HOME}/#{filename}"

    print "Installing #{filename.ljust(16)} ... "

    if File.exists?(destination)
      puts "#{destination.ljust(32)} exists - skipping"
    else
      `ln -s #{origin} #{destination}`
      puts "Done"
    end
  end
end

task :uninstall do
  safe_to_uninstall = FILES_TO_LINK.all? do |filename|
    File.readlink("#{HOME}/#{filename}") == "#{DOTFILES}/#{filename}"
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
