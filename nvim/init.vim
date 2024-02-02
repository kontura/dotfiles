set nocp
syntax enable
filetype plugin indent on
" ================general config ====================
"set number "Line numbers are good
set backspace=indent,eol,start "Allow backspace in insert mode
set history=1000 "Store lots of :cmdline history
set showcmd "Show incomplete cmds down the bottom
set gcr=a:blinkon0 "Disable cursor blink
set visualbell "No sounds
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set autoread "Reload files changed outside vim
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
"turn on syntax highlighting
:command! -bar -bang Q quit<bang>

set path+=**
set wildmenu
let g:netrw_banner=0


:command W w
:command WQ wq
:command Wq wq
:command Qa qa
:command QA qa

:set hlsearch
" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar


" " ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
"set softtabstop=4
set cindent
"set tabstop=4
set expandtab
filetype plugin on
filetype indent on
" Display tabs and trailing spaces visually
set nowrap 
set textwidth=0 wrapmargin=0
" ================ Folds ============================
set foldmethod=indent "fold based on indent
set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb
" ================ Persistent Undo ==================
" " Keep undo history across sessions, by storing in file.
" " Only works all the time.
if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif
"
"
"colorscheme Alduin
"colorscheme monokain
"colorscheme falcon
"colorscheme blaquemagick
colorscheme default

hi StatusLine ctermbg=none

let mapleader = "\<Space>"

map <Leader>w :w<CR>
map <Leader>r :registers<CR>
map <Leader>n :bn<CR>
map <Leader>k :bd<CR>
map <Leader>= mpggVG=`pzz

map <Leader>d :Linediff<CR>
map <Leader>b :let @b=line('.')<CR>:term tig blame % +<C-R>b<CR>

function TestCmake()
    :make -C build -j10
    :make -C build tests -j10
    :make -C build test -j10
endfunction

map <Leader>m :make -C build -j10<CR>
map <Leader>t :call TestCmake()<CR>

"Buffer mappings
nnoremap <Leader>l :ls<CR>

"make . work with visually selected lines
vnoremap . :norm.<CR>

map <Leader><Leader> <C-^>

nnoremap <space>/ :Ack
cnoreabbrev ag Ack

set fileencodings=utf-8,latin2
set nolist

autocmd BufNewFile,BufRead *.frag set syntax=c
autocmd BufNewFile,BufRead *.geom set syntax=c

map <C-H> <C-W>h
map <C-L> <C-W>l
set wmh=0

let g:ctrlp_cache_dir = '~/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

hi diffadd ctermfg=green
hi diffdelete ctermfg=red
hi difftext cterm=bold,italic ctermfg=red

hi diffadd ctermbg=none
hi diffdelete ctermbg=none
hi diffchange ctermbg=none
hi difftext ctermbg=none

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"Global clipboard-
set clipboard+=unnamedplus

"clean up dividing line
set fillchars=vert:\ 
highlight VertSplit    cterm=none ctermfg=white ctermbg=none guibg=red
highlight StatusLine   cterm=none ctermfg=red   ctermbg=none guibg=red
highlight StatusLineNC cterm=none ctermfg=white ctermbg=none guibg=green

set tags=~/mytags

set runtimepath^=~/.vim/bundle/ctrlp.vim


:ab pdb import pdb; pdb.set_trace()
:ab gdb import pdb; pdb.set_trace()
:ab todo TODO(amatej):
:ab TODO TODO(amatej):

let g:toggleHighlightWhitespace = 1
function! ToggleHighlightWhitespace()
    let g:toggleHighlightWhitespace = 1 - g:toggleHighlightWhitespace
    call RefreshHighlightWhitespace()
endfunction

function! RefreshHighlightWhitespace()
    if g:toggleHighlightWhitespace == 1 " normal action, do the hi
        highlight ExtraWhitespace ctermbg=red guibg=red
        match ExtraWhitespace /\s\+$/
        augroup HighLightWhitespace
            autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
            autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
            autocmd InsertLeave * match ExtraWhitespace /\s\+$/
            autocmd BufWinLeave * call clearmatches()
        augroup END
    else " clear whitespace highlighting
        call clearmatches()
        autocmd! HighLightWhitespace BufWinEnter
        autocmd! HighLightWhitespace InsertEnter
        autocmd! HighLightWhitespace InsertLeave
        autocmd! HighLightWhitespace BufWinLeave
    endif
endfunction

autocmd BufWinEnter * call RefreshHighlightWhitespace()
autocmd BufWinLeave * call RefreshHighlightWhitespace()
nnoremap <leader>s :call ToggleHighlightWhitespace()<cr>

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

