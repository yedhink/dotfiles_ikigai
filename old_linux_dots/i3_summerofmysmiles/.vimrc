set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" Snippets engine.Snippets are seperate
Plugin 'SirVer/ultisnips'
" Snippets by honza
Plugin 'honza/vim-snippets'
" Airline Themes displayed on bottom
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" YouCompleteMe Plugin also installed outside vundle
Plugin 'Valloric/YouCompleteMe'
" Kure colorschemes
Plugin 'morhetz/gruvbox'
Plugin 'ayu-theme/ayu-vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'nanotech/jellybeans.vim'
Plugin 'sjl/badwolf'
" Pairs of handy bracket mappings : vim colorscheme switching
Plugin 'tpope/vim-unimpaired'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
" Colorizer just like ColorHighlighter in sublime
Plugin 'lilydjwg/colorizer'
" for setting wal colorscheme
Plugin 'dylanaraps/wal.vim'
" distraction free writing
Plugin 'junegunn/goyo.vim'
" hyperfocus viewing
Plugin 'junegunn/limelight.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set laststatus=2				" Airline Bar
set wildmenu					" Default command line completion
set ffs=unix,dos,mac				" Set Unix as standard file type
syntax enable
set wrap					" Word Wrap
set formatoptions+=1				" Always wrap before 1-letter words
set number					" Line number
set showbreak=+++				" Prefix for wrapped lines
set showmatch					" Show matching brackets
set smarttab					" Tab at beginning according to shiftwidth
" set clipboard=unnamed				" Default clipboard
set clipboard=unnamedplus
set clipboard+=autoselect			" Visual selected text in clipboard
set autoindent					" Auto indent
set smartindent					" Smart indent
set hlsearch					" Highlight search-results
set wrapscan					" Continue search from top when hitting bottom
set ignorecase					" Ignore case when searching
set background=dark

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_Co = 256
let g:gruvbox_italic=1
"set termguicolors     " enable true colors support
"let ayucolor="dark"   " for dark version of theme
colorscheme badwolf
highlight ColorColumn ctermbg=0 guibg=lightgrey

set tabstop=4
set shiftwidth=4
"set cindent
set pastetoggle=<F3>
let g:airline_solarized_bg='dark'
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-n>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Place cursor at last edited position
augroup resCur
  	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
" open a new file in same path
nnoremap <leader>f :e %
" copy to cliboard
map <F11> :!xclip -f<CR>
map <F12> :r !xclip -o<CR>
" define max lines for colorizer to avoid pauses in large files
let g:colorizer_maxlines=2000
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Complete braces
autocmd BufRead *.java inoremap { {<CR>}<Esc>ko
" Show invisible chars
"set lcs=tab:▸\ ,trail:·,nbsp:_
"set list lcs=tab:\|\
" Dynamic search higlighting
set incsearch
" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
" No more whitespces
noremap <leader>ss :call StripWhitespace()<CR>
set ttyfast                    " Enable fast terminal connection.
" Exclude certain coloschemes while switching
let g:colorscheme_switcher_exclude = ['default', 'morning','oh-la-la','vividchalk']
"let g:jellybeans_overrides = {
"\    'background': { 'guibg': '000000' },
"\}

" Make the tab line darker than the background.
let g:badwolf_tabline = 0
" ===============================================================================
" DISTRACTION FREE WRITING
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" ===============================================================================
