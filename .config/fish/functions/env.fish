# Set the editor
set -gx EDITOR "nvim"

# Uncomment to set terminal-related variables
# set -gx TERM "xterm-kitty"
# set -gx TERMINFO "~/.local/kitty.app/share/terminfo/"

# Chromium flags
set -gx CHROMIUM_FLAGS "--force-dark-mode --enable-features=WebUIDarkMode --incognito"

# Locale settings
set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US.UTF-8"
set -gx LC_COLLATE "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"
set -gx LC_MESSAGES "en_US.UTF-8"
set -gx LC_MONETARY "en_US.UTF-8"
set -gx LC_NUMERIC "en_US.UTF-8"
set -gx LC_TIME "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

# Update PATH
fish_add_path -gaP ~/.local/bin
fish_add_path -gaP /opt/homebrew/bin
fish_add_path -gaP /opt/homebrew/sbin
fish_add_path -gaP $HOME/.pyenv/bin
fish_add_path -gaP $HOME/node_modules/.bin
fish_add_path -gaP /snap/bin
fish_add_path -gaP /usr/bin/yarn
fish_add_path -gaP /usr/local/go/bin
fish_add_path -gaP $HOME/go/bin
fish_add_path -gaP /usr/local/bin/lua-language-server
fish_add_path -gaP $HOME/.rbenv/bin
fish_add_path -gaP $HOME/.rbenv/shims

# Python-related variables
# set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx BETTER_EXCEPTIONS 1

# LibreOffice theme
set -gx SAL_USE_VCLPLUGIN "gtk3"

# PostgreSQL configuration
set -gx PSQL_EDITOR "nvim"
set -gx PSQLRC "$HOME/.psqlrc"

# Less pager for bat
set -gx BAT_PAGER "less -RS"

# Node configuration
set -gx NODE_PATH (which node)

# Solargraph configuration
set -gx SOLARGRAPH_GLOBAL_CONFIG "$HOME/.config/solargraph/config.yml"

# Ripgrep configuration
set -gx RIPGREP_CONFIG_PATH "$HOME/.ripgreprc"

# Thor merge command
set -gx THOR_MERGE "code-insiders -d $1 $2"

# Helix runtime
set -gx HELIX_RUNTIME ~/src/helix/runtime

# FZF configuration
set -gx FZF_BASE "/opt/homebrew/opt/fzf"

# Go path
set -gx GOPATH "$HOME/go"

# Zoxide database dir
set -gx _ZO_DATA_DIR "$HOME/.config/zoxide/"

