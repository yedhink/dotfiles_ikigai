set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
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
" Pairs of handy bracket mappings : vim colorscheme switching
Plugin 'tpope/vim-unimpaired'
" switch colors on fly
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
" edit binaries.imgs,pdfs etc 
Plugin 'tpope/vim-afterimage'
" i3 syntax highlight
Plugin 'PotatoesMaster/i3-vim-syntax'
" alignment
Plugin 'godlygeek/tabular'
" neat status line
Plugin 'maciakl/vim-neatstatus'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set laststatus=2				" Airline Bar
set wildmenu					" Default command line completion
set ffs=unix,dos,mac			" Set Unix as standard file type
syntax enable
set wrap						" Word Wrap
set formatoptions+=1			" Always wrap before 1-letter words
set number						" Line number
set showbreak=+++				" Prefix for wrapped lines
set showmatch					" Show matching brackets
set smarttab					" Tab at beginning according to shiftwidth
set clipboard=unnamedplus		" default register for clipboard
set clipboard+=autoselect		" Visual selected text in clipboard
set autoindent					" Auto indent
set smartindent					" Smart indent
set hlsearch					" Highlight search-results
set wrapscan					" Continue search from top when hitting bottom
set ignorecase					" Ignore case when searching
set tabstop=4					" tab width
set shiftwidth=4
set background=dark
set ttyfast                    " Enable fast terminal connection.
" Dynamic search higlighting
set incsearch
" toggle bw paste mode and normal
set pastetoggle=<F3>
" set our colorscheme
colorscheme wal

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_Co = 256
let g:rehash256 = 1
highlight ColorColumn ctermbg=0 guibg=lightgrey


" airline theme
let g:airline_solarized_bg='dark'

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

" Exclude certain coloschemes while switching
let g:colorscheme_switcher_exclude = ['default', 'morning','oh-la-la','vividchalk']

" Make the tab line darker than the background.
let g:badwolf_tabline = 0

" ===============================================================================
" DISTRACTION FREE WRITING
function! s:goyo_enter()
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Goyo set F5 to goyo
nmap <F5> :Goyo<cr>
let g:goyo_width = 100
