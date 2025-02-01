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
  '~/.gitignore',
  '~/.ripgreprc',
  '~/.tmux.conf',
  '~/biome.jsonc',
  '~/Brewfile'
]

unless Dir.exist?(DOTFILES_DIR)
  puts "Error: Dotfiles directory #{DOTFILES_DIR} does not exist."
  exit(1)
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

sync_items(dirs, DOTFILES_DIR)
sync_items(files, DOTFILES_DIR)

puts 'Dotfiles sync complete!'
