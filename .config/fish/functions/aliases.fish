# Aliases - might need to use these in scripts too
# thus using aliases instead of abbr
alias v="nvim"
alias rr="ranger"
alias gs="git status"
alias ga="git add"
alias gA="git add -A"
alias gd="git diff"
alias gco="git checkout"
alias gcmsg="git commit -m"
alias gplom="git pull origin (git rev-parse --abbrev-ref HEAD)"
alias gpuom="git push origin (git rev-parse --abbrev-ref HEAD)"
alias gpuomf="git push origin (git rev-parse --abbrev-ref HEAD) --force-with-lease"
alias gitsize="~/.local/bin/git-sizer --verbose"
alias y="yazi"
alias lg="lazygit"
alias c="code-insiders"

# switch between prev dir and current dir using "-"
abbr -a -g -- - "cd -"

# rails/ruby stuff
abbr -a be "bundle exec"
abbr -a bi "bundle install"
abbr -a ba "bundle add"
abbr -a rs "rails s"
abbr -a bergm "bundle exec rails g migration"

# General abbreviations
abbr -a cx "chmod a+x"

# Enhanced tools
abbr -a less "bat"
abbr -a snake "~/.local/bin/quinesnake.cpp"
abbr -a openports "lsof -i -P -n | grep -i listen"

# Miscellaneous utilities
abbr -a aq "asciiquarium"
abbr -a progall "watch progress -q"
abbr -a what "sudo ~/.local/bin/what"
abbr -a fx "/home/ikigai/.local/bin/fx-linux"

# Git log dropped stashes
abbr -a gitlogdroppedstashes "git fsck --unreachable | grep commit | cut -d' ' -f3 | xargs git log --merges --no-walk"

# YouTube download aliases
abbr -a yt_aria "yt-dlp --external-downloader aria2c --external-downloader-args '-c -j 5 -x 10 --summary-interval=0'"
abbr -a yb "yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"

# Editor and configuration shortcuts
abbr -a vconf "nvim ~/.config/nvim/init.lua"
