
execute pathogen#infect()
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
set shiftwidth=2
set softtabstop=2
set cindent
set tabstop=2
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
map <Leader>c :!ctags -R *<CR>

"Buffer mappings
nnoremap <Leader>l :ls<CR>

"make . work with visually selected lines
vnoremap . :norm.<CR>

map <Leader><Leader> <C-^>

nnoremap <space>/ :Ack 
cnoreabbrev ag Ack

set fileencodings=utf-8,latin2
set nolist

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
set wmh=0

let g:ctrlp_cache_dir = '~/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
