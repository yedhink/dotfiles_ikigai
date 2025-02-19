require 'fileutils'

DOTFILES_DIR = File.expand_path('~/.dotfiles')

# Directories and files to sync
dirs = [
  '~/.config/fish',
  '~/.config/ghostty',
  '~/.config/helix',
  '~/.config/htop',
  '~/.config/mise',
  '~/.config/nvim',
  '~/.config/ranger',
  '~/.config/solargraph',
  '~/.config/wezterm',
  '~/.config/yazi',
  '~/.config/zoxide'
]

files = [
  '~/.config/starship.toml',
  '~/.fdignore',
  '~/.gemlist',
  '~/.gitconfig',
  '~/.ripgreprc',
  '~/.tmux.conf',
  '~/biome.jsonc',
  '~/Brewfile',
  '~/.psqlrc'
]

unless Dir.exist?(DOTFILES_DIR)
  puts "Error: Dotfiles directory #{DOTFILES_DIR} does not exist."
  exit(1)
end

def make_up_to_date
  home_dir = ENV['HOME']
  Dir.chdir(home_dir) do
    puts "Generating latest Brewfile in #{home_dir}"
    system('brew bundle --force --describe dump')
    puts "Generating latest .gemlist in #{home_dir}"
    system('gem list > .gemlist')
  end
end

def sync_items(items, destination)
  items.each do |item|
    src = File.expand_path(item)
    dest = File.join(destination, item.sub(/^~/, ''))

    if File.exist?(src)
      FileUtils.mkdir_p(File.dirname(dest)) # Ensure parent directories exist
      FileUtils.rm_rf(dest) # Remove existing file/directory
      FileUtils.cp_r(src, dest)
      puts "Copied: #{src} -> #{dest}"
    else
      puts "Warning: #{src} does not exist"
    end
  end
end

make_up_to_date
sync_items(dirs, DOTFILES_DIR)
sync_items(files, DOTFILES_DIR)

puts 'Dotfiles sync complete!'
