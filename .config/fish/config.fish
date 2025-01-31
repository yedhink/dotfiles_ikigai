# Don't display any greeting messages
set -gx fish_greeting ''

# modular configs
source $HOME/.config/fish/functions/env.fish
source $HOME/.config/fish/functions/aliases.fish
source $HOME/.config/fish/functions/functions.fish
source $HOME/.config/fish/functions/fzf.fish

zoxide init fish | source
fzf --fish | source
starship init fish | source

# NOTE: mise is automatically activated by brew installation itself in fish
# refer: https://mise.jdx.dev/installing-mise.html#fish
