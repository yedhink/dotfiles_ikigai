call plug#begin('~/.vim/plugged')
Plug 'nanotech/jellybeans.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()
filetype plugin indent on    " required
filetype plugin on    " required

"---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
" enable javacomplete
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" indent guides
let g:indentLine_enabled = 1


" <c-n> for keyword completion during typing
" <c-x><c-o> omni complete
" <c-x><c-f> file name complete
" <c-e> down <c-y> up

colorscheme jellybeans

set relativenumber
set sessionoptions+=resize,winpos



set nrformats+=alpha
if &diff
    autocmd bufwritepost *.csv silent diffupdate
endif
set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
" Make backspace great again
set backspace=2
" Allow mouse
set mouse=a
" Confirm before quit without save
set confirm
" Highlight cursor line (slows down)
set nocursorline
" statusline
set laststatus=2
" Incremental search
set incsearch
" Highlighted search results
set hlsearch
" Smart search
set ignorecase
" Set split direction
set splitbelow
set splitright
" Default intent to 4 spaces ( auto switch based on type in code section )
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Show invisibles
set list
set listchars=tab:\ \ ,eol:¬,trail:⋅
" Show line breaks
set showbreak=↪
" When scrolling, keep cursor 5 lines away from screen border
set scrolloff=5
" Autocompletion of files and commands behaves like zsh
set wildmenu
set wildmode=full
" pasting options
set pastetoggle=<F3>
" Setting up ignores
set wildignore=*/tmp/*,*.so,*.pyc,*.png,*.jpg,*.gif,*.jpeg,*.ico,*.pdf
set wildignore=*.wav,*.mp4,*.mp3
set wildignore=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/.git/*
set wildignore=*.swp,*~,._*
set wildignore=_pycache_,.DS_Store,.vscode,.localized


highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
" Better coloring for errors
highlight clear SpellBad
highlight SpellBad cterm=underline gui=underline ctermfg=11 guifg=#ffff00
" Use italics for some text
highlight htmlArg gui=italic
highlight Comment gui=italic
highlight Type    gui=italic
highlight htmlArg cterm=italic
highlight Comment cterm=italic
highlight Type    cterm=italic

" Remove whitespace at save
autocmd BufWritePre *.py,*.css,*.js,*.html,*.cpp,*.c,*.java,*.go,*.rs,*.ts,*.cljs,*.clj :%s/\s\+$//e

" Place cursor at last edited position
augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" set spell check on for markdown and markup files
augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd BufRead,BufNewFile *.md,*.html setlocal spell
augroup END

" specify netrw size
let g:netrw_winsize = 20
let g:netrw_banner=0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist
nmap <leader>n :Lex<CR>
let g:netrw_liststyle = 3

noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
nnoremap <leader>sp :normal! mm[s1z=`m<cr>
nnoremap <leader>so :w<cr>:source %<cr>
nnoremap <leader>ps :normal! mm{Oji"205A-}oki"205A-`m^[<cr>

" seperator - lines at beg and end of a para
nmap <leader>pp :call AddComments()<CR>

" replace vim's built-in visual * and # behavior
xnoremap * :<C-u>call VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>

" a simple remap to cause less annoyance by not moving the cursor
nnoremap * *<c-o>
nnoremap # #<c-o>

" default filetype
autocmd BufEnter * if &filetype == "" | setlocal ft=sh | endif

" Navigating with guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>


" makes * and # work on visual mode too.  global function so user mappings can call it.
" specifying 'raw' for the second argument prevents escaping the result for vimgrep
" TODO: there's a bug with raw mode.  since we're using @/ to return an unescaped
" search string, vim's search highlight will be wrong.  Refactor plz.
function! VisualStarSearchSet(cmdtype,...)
    let temp = @"
    normal! gvy
    if !a:0 || a:1 != 'raw'
        let @" = escape(@", a:cmdtype.'\*')
    endif
    let @/ = substitute(@", '\n', '\\n', 'g')
    let @/ = substitute(@/, '\[', '\\[', 'g')
    let @/ = substitute(@/, '\~', '\\~', 'g')
    let @" = temp
endfunction

" comment shit out and make it look good
function! AddComments()
    let isp = input('Whats the single line comment symbol for the used language? ')
    let width = max(map(range(1, line('$')), "col([v:val, '$'])")) - 1
    execute "normal! ". "{Oji". isp. "".width."A- "
    let top_row_no = line('.')
    execute "normal! ". "}oki". isp. "".width."A-k"
    let bot_row_no = line('.')
    while (bot_row_no>=top_row_no)
        let bot_row_no -= 1
        normal! 0
        normal! evby
        let begword = @0
        normal! $
        if begword != "normal" && begword != "execute" && begword != "echom" && begword != "echo"
            let no_of_spaces = width - 16 - virtcol('.')
            execute "normal! ". no_of_spaces."A "
            execute "normal! A". isp."<++>"
        endif
        normal! k
    endwhile
endfunction

" statusline
let g:currentmode={
            \ 'n'  : 'NORMAL ',
            \ 'no' : 'N·OPERATOR PENDING ',
            \ 'v'  : 'VISUAL ',
            \ 'V'  : 'V·LINE ',
            \ '' : 'V·BLOCK ',
            \ 's'  : 'SELECT ',
            \ 'S'  : 'S·LINE ',
            \ '' : 'S·BLOCK ',
            \ 'i'  : 'INSERT ',
            \ 'R'  : 'REPLACE ',
            \ 'Rv' : 'V·REPLACE ',
            \ 'c'  : 'COMMAND ',
            \ 'cv' : 'VIM EX ',
            \ 'ce' : 'EX ',
            \ 'r'  : 'PROMPT ',
            \ 'rm' : 'MORE ',
            \ 'r?' : 'CONFIRM ',
            \ '!'  : 'SHELL ',
            \ 't'  : 'TERMINAL '}
hi PrimaryBlock ctermfg=00 ctermbg=02 cterm=bold
"hi SecondaryBlock ctermfg=07 ctermbg=11
"hi Blanks ctermfg=8 ctermbg=00
"highlight EndOfBuffer ctermfg=black ctermbg=black
set statusline=
set statusline+=%#PrimaryBlock#
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=%#SecondaryBlock#
set statusline+=%{StatuslineGit()}
set statusline+=%#Blanks#
set statusline+=\ %t\
set statusline+=%(%m%)
set statusline+=%=
set statusline+=%#SecondaryBlock#
set statusline+=\ Ln
set statusline+=\ %l
set statusline+=,Col
set statusline+=\ %c\
set statusline+=%#PrimaryBlock#
set statusline+=\ %Y\
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
