# Intro

My **macOs dotfiles** is the end product of my effort towards creating a sensible, and mostly terminal based productive environment which I can use to conquer my daily dev works. Looking back, in the last few years, some of the major jumps I have made are from `zsh -> fish`, `vim -> vscode -> neovim+tmux` and `urxvt/st -> ghostty`.

I have grown over the mindset of being a `ricer` towards a more `productive` mindset, where, I only make changes that help me be more productive. Thus, I don't call myself a "ricer" nor a "minimalist" anymore!

Over the years, I have had some strong realizations:
- I don't need to use any fancy dotfiles manager like say `stow`, `yadm`, `dotbot` etc. I don't change my system/OS often. Thus just barebones `git` and some scripts gets the job done!
- I like the idea of being able to tinker and craft the tool to my needs. My terminal, neovim and tmux configs are exactly that!
- I like to try out new tools, which claims to be faster than the current tool that I use. Tried biome over eslint+prettier and I think I will switch.

## How to use this repo?

I would recommend that you cherry pick the configs that you feel might add benefit to your setup.

### My tooooolzzzz/warezzzz...

- ghostty
- neovim(release version)
- tmux
- fzf(works in yazi too)
- rg
- fd
- lazygit
- yazi(i also use this inside neovim instead of neo-tree)

Rest of the configs can be found in `.config`. Checkout `Brewfile`  and `.gemlist` files if you want to know more about specific stuff I use. You can install all the packages from `Brewfile` by running `brew bundle --file "./Brewfile"`.

## Screenshots

- "Cleanliness is all..."
![](images/home.png)

- A sample workflow where I am writing backend tests in Rails in my tmux sesh with `entr` running the tests:
![](images/workflow.gif)

- Neovim - simple, elegant, fast!
![](images/neovim.png)

- Yazi - I hop file managers from time to time. Sticking with Yazi for now.
![](images/yazi.png)

## TODO

- [ ] Add a script to automatically sync changes to dotfiles as part of `upd` function
- [ ] Add a script to stow things to place. This is low priority since I don't switch systems often.
- [x] Rick roll somewhere in this repo...
