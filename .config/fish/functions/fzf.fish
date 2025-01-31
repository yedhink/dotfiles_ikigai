set -gx FZF_DEFAULT_OPTS "--ansi --preview-window 'right:40%' --preview 'fish ~/.local/bin/bat_ls.fish {}'"
set -gx FZF_DEFAULT_COMMAND "fd $pwd --follow --hidden --exclude .git --exclude node_modules --exclude yarn.lock --exclude Gemfile.lock --color=always"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND "fd --type d --hidden --follow --exclude .git"
