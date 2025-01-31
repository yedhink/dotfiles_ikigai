# Path to your oh-my-zsh installation.
export ZSH=$HOME/.antigen/bundles/robbyrussell/oh-my-zsh

########################
# Antigen
########################
source ~/antigen.zsh
# Load Antigen configurations
antigen init ~/.antigenrc
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
source ~/.antigen/themes/rounded-corners.zsh-theme

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"

#source ~/.local/bin/sysinfo
# source '${HOME}/.rbenv/libexec/../completions/rbenv.zsh'
source ~/.aliases
source ~/.functions
source ~/.paths
source ~/.fzf_config
#source ~/.fonts/*.sh

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
source ~/.auto_complete_npx

autoload -Uz add-zsh-hook

# load nvm(if .nvmrc or .node-version file exists) on cd
add-zsh-hook chpwd autoUseNvmNode

# https://stackoverflow.com/a/45605028
TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#GITSTATUS_LOG_LEVEL=DEBUG

eval "$(rbenv init -)"

# pnpm
export PNPM_HOME="/Users/ikigai/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# uncomment if we need vi mode in irb, rails console etc. Also uncomment in ~/.inputrc
#bindkey -v
