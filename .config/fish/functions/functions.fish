function upd -d "Update all packages in macOs"
    set -l fish_trace 1  # Enables command tracing (like zsh's set -x)
    brew update && brew upgrade
    brew upgrade --cask --greedy
    nvim --headless +"Lazy sync" +qa
    sync_dots
end

# rebase strategy 
function gsyncr
    set defaultBranch "main"
    if git branch --list "master" | grep -q "master"
        set defaultBranch "master"
    end
    git checkout "$defaultBranch"
    git pull origin "$defaultBranch"
    git checkout -
    git rebase "$defaultBranch"
end

# merge strategy 
function gsyncm
    set defaultBranch "main"
    if git branch --list "master" | grep -q "master"
        set defaultBranch "master"
    end
    git checkout "$defaultBranch"
    git pull origin "$defaultBranch"
    git checkout -
    git merge "$defaultBranch"
end

function gcom
    set defaultBranch "main"
    if git branch --list "master" | grep -q "master"
        set defaultBranch "master"
    end
    git checkout "$defaultBranch"
end


function gcob -d "Fuzzy-find and checkout a branch"
  git branch --sort="-committerdate" | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

function sync_dots -d "Sync new config changes into dotfiles repo"
  ruby ~/.dotfiles/scripts/sync_dots.rb
end

function fzf_ctrl_f
    set fzf_file (fd . | fzf)
    if test -z "$fzf_file"
        return
    else
        if test -f "$fzf_file"
            v "$fzf_file"
        else
            cd "$fzf_file"
        end
    end
end

# Ctrl+F to open fzf file/dir selector
bind \cf fzf_ctrl_f
