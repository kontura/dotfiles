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

map <C-d> <C-d>zz
map <C-u> <C-u>zz

map <C-j> :cnext<CR>
map <C-k> :cprev<CR>

:command W w
:command WQ wq
:command Wq wq
:command Qa qa
:command QA qa
:command Vs vs
:command VS vs

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
set nofoldenable "dont fold by default
set foldlevel=99 "dont start with everything folded

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

set notermguicolors

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

autocmd VimResized * wincmd =

map <C-H> <C-W>h
map <C-L> <C-W>l
set wmh=0

hi diffadd ctermfg=green
hi diffdelete ctermfg=red
hi difftext cterm=bold,italic ctermfg=red

hi diffadd ctermbg=none
hi diffdelete ctermbg=none
hi diffchange ctermbg=none
hi difftext ctermbg=none

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"Global clipboard-
set clipboard+=unnamedplus

"clean up dividing line
set fillchars=vert:\ 
"highlight VertSplit    cterm=none ctermfg=white ctermbg=none guibg=red
highlight StatusLine   cterm=none ctermfg=red ctermbg=none guifg=salmon guibg=None
highlight StatusLineNC cterm=none ctermfg=white ctermbg=none guifg=white guibg=None

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
Plug 'tikhomirov/vim-glsl'
Plug 'kontura/trails.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'igorlfs/nvim-dap-view'
Plug 'sphamba/smear-cursor.nvim'
call plug#end()

lua << EOF
require('smear_cursor').enabled = true

--TELESPOCE
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"container_build", "build"},
    }
}
-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
-- has the <leader>fg keybinding
require "config.telescope.multigrep".setup()
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags)

vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

-- LSP
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
})
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'L', vim.lsp.buf.hover, bufopts)
  --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.incoming_calls, bufopts)
  vim.keymap.set('n', 'go', vim.lsp.buf.outgoing_calls, bufopts)
--  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--  vim.keymap.set('n', '<space>wl', function()
--    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
end

vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('ols')
vim.lsp.enable('rust_analyzer')

require('trails').setup({})

local dap = require("dap")
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

local dap = require("dap")
dap.configurations.cpp = {
  {
    name = 'Attach to gdbserver :1234',
    type = 'gdb',
    request = 'attach',
    target = 'localhost:1234',
    cwd = '${workspaceFolder}',
    setupCommands = {
        {
           text = '-enable-pretty-printing',
           description =  'enable pretty printing',
           ignoreFailures = false
        },
    },
  },
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
    setupCommands = {
        {
           text = '-enable-pretty-printing',
           description =  'enable pretty printing',
           ignoreFailures = false
        },
    },
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
       local name = vim.fn.input('Executable name (filter): ')
       return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = '${workspaceFolder}'
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.odin = dap.configurations.cpp
vim.fn.sign_define('DapBreakpoint', { text='●', texthl='DapBreakpoint', linehl='', numhl='' })
vim.fn.sign_define('DapStopped', { text='=>', texthl='DapStopped', linehl='DapStoppedLine', numhl='DapStopped' })
vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#ff0000' })
vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#2d2d2d' })  -- dark background for current line
vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#00ff00', bg = '#2d2d2d' })

-- I have to install treesitter parser for all desired langs :TSInstall cpp
require("nvim-dap-virtual-text").setup {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = true,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    --only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = true,                -- show virtual text on all all references of the variable (not only definitions)
    clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
    --- A callback that determines how a variable is displayed or whether it should be omitted
    --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
    --- @param buf number
    --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
    --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
    --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
    --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
    display_callback = function(variable, buf, stackframe, node, options)
    -- by default, strip out new line characters
      if options.virt_text_pos == 'inline' then
        return ' = ' .. variable.value:gsub("%s+", " ")
      else
        return variable.name .. ' = ' .. variable.value:gsub("%s+", " ")
      end
    end,
    -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
    virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

    -- experimental features:
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

local widgets = require('dap.ui.widgets')
vim.keymap.set('n', '<space>gb', dap.toggle_breakpoint)
vim.keymap.set('n', '<space>gC', dap.run_to_cursor)
vim.keymap.set('n', '<F1>', dap.continue)
vim.keymap.set('n', '<F2>', dap.step_into)
vim.keymap.set('n', '<F3>', dap.step_over)
vim.keymap.set('n', '<space>?', widgets.hover)

local bt = function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end

vim.keymap.set('n', '<space>gt', bt)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.colorcolumn = "72"

    -- Create a namespace for local highlight
    local ns_id = vim.api.nvim_create_namespace("gitcommit_colorcolumn")
    vim.api.nvim_buf_set_extmark(0, ns_id, 0, 0, {})  -- anchor namespace

    -- Set highlight in this namespace
    vim.api.nvim_set_hl(ns_id, "ColorColumn", { bg = "#333333" })
  end,
})

EOF
