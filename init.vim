" set some property
let mapleader=" "
syntax on
set ignorecase
set smartcase
set showcmd
set wildmenu
set wrap
set cursorline

filetype on


set showmatch
set hlsearch
set incsearch
set scrolloff=5
set sidescrolloff=5
set tags=./tags,tags;
" set autochdir

:set number
:set relativenumber
:set autoindent

:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4

:set mouse=a
:set modifiable


let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" set some personal shortcut
nnoremap <c-e> :e $HOME/.config/nvim/init.vim<CR>

inoremap jj <esc>
nnoremap <space> :
nnoremap Y y$

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap tt :NERDTreeToggle<cr>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Quick quit, save, reload
nnoremap Q :q<CR>
nnoremap S :w<CR>
nnoremap R :source $HOME/.config/nvim/init.vim<CR>

" Fzf specific mappings
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Ag<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 


call plug#begin('$HOME/.config/nvim/plugged')

Plug 'stevearc/aerial.nvim' " file outline window

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" github theme
Plug 'projekt0n/github-nvim-theme'
" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
" Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
" fzf search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search
Plug 'junegunn/fzf.vim'

" Auto save
" Plug 'Pocco81/AutoSave.nvim'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }


Plug 'w0rp/ale'


set encoding=UTF-8

call plug#end()


:set completeopt-=preview " For No Previews


"let g:NERDTreeDirArrowExpandable="+"
"let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins

" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" Example config in VimScript
" NOTE: Configuration needs to be set BEFORE loading the color scheme with `colorscheme` command
let g:github_function_style = "italic"
let g:github_sidebars = ["qf", "vista_kind", "terminal", "packer"]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:github_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
colorscheme github_dimmed

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" ==
" == NERDTree-git
" ==
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']


" ===
" === MarkdownPreviewTrailing characters: <Plug>MarkdownPreview
" ===
source $HOME/.config/nvim/mkdp.vim
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

" ===
" === Undotree
" ===
let g:und0otree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>

" === AutoSave.nvim
" ===
" lua << EOF
" local autosave = require("autosave")

" autosave.setup(
"     {
"         enabled = true,
"         execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
"         events = {"InsertLeave", "TextChanged"},
"         conditions = {
"             exists = true,
"             filename_is_not = {},
"             filetype_is_not = {},
"             modifiable = true
"         },
"         write_all_buffers = false,
"         on_off_commands = true,
"         clean_command_line_interval = 0,
"         debounce_delay = 135
"     }
" )
" EOF

" ===
" === treesitter
" ===
lua << EOF

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" , "python" , "cpp" , "yaml"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

EOF

" ===
" === Tagbar
" ===
lua << EOF
-- Call the setup function to change the default behavior
require("aerial").setup({
  -- Priority list of preferred backends for aerial.
  -- This can be a filetype map (see :help aerial-filetype-map)
  backends = { "treesitter" },

  -- Enum: persist, close, auto, global
  --   persist - aerial window will stay open until closed
  --   close   - aerial window will close when original file is no longer visible
  --   auto    - aerial window will stay open as long as there is a visible
  --             buffer to attach to
  --   global  - same as 'persist', and will always show symbols for the current buffer
  close_behavior = "auto",

  -- Set to false to remove the default keybindings for the aerial buffer
  default_bindings = true,

  -- Enum: prefer_right, prefer_left, right, left, float
  -- Determines the default direction to open the aerial window. The 'prefer'
  -- options will open the window in the other direction *if* there is a
  -- different buffer in the way of the preferred direction
  default_direction = "prefer_right",

  -- Disable aerial on files with this many lines
  disable_max_lines = 10000,

  -- Disable aerial on files this size or larger (in bytes)
  disable_max_size = 10000000,

  -- A list of all symbols to display. Set to false to display all symbols.
  -- This can be a filetype map (see :help aerial-filetype-map)
  -- To see all available values, see :help SymbolKind
  filter_kind = {
    "Class",
    "Constructor",
    "Enum",
    "Function",
    "Interface",
    "Module",
    "Method",
    "Struct",
  },

  -- Enum: split_width, full_width, last, none
  -- Determines line highlighting mode when multiple splits are visible.
  -- split_width   Each open window will have its cursor location marked in the
  --               aerial buffer. Each line will only be partially highlighted
  --               to indicate which window is at that location.
  -- full_width    Each open window will have its cursor location marked as a
  --               full-width highlight in the aerial buffer.
  -- last          Only the most-recently focused window will have its location
  --               marked in the aerial buffer.
  -- none          Do not show the cursor locations in the aerial window.
  highlight_mode = "split_width",

  -- Highlight the closest symbol if the cursor is not exactly on one.
  highlight_closest = true,

  -- Highlight the symbol in the source buffer when cursor is in the aerial win
  highlight_on_hover = false,

  -- When jumping to a symbol, highlight the line for this many ms.
  -- Set to false to disable
  highlight_on_jump = 300,

  -- Define symbol icons. You can also specify "<Symbol>Collapsed" to change the
  -- icon when the tree is collapsed at that symbol, or "Collapsed" to specify a
  -- default collapsed icon. The default icon set is determined by the
  -- "nerd_font" option below.
  -- If you have lspkind-nvim installed, aerial will use it for icons.
  icons = {},

  -- Control which windows and buffers aerial should ignore.
  -- If close_behavior is "global", focusing an ignored window/buffer will
  -- not cause the aerial window to update.
  -- If open_automatic is true, focusing an ignored window/buffer will not
  -- cause an aerial window to open.
  -- If open_automatic is a function, ignore rules have no effect on aerial
  -- window opening behavior; it's entirely handled by the open_automatic
  -- function.
  ignore = {
    -- Ignore unlisted buffers. See :help buflisted
    unlisted_buffers = true,

    -- List of filetypes to ignore.
    filetypes = {},

    -- Ignored buftypes.
    -- Can be one of the following:
    -- false or nil - No buftypes are ignored.
    -- "special"    - All buffers other than normal buffers are ignored.
    -- table        - A list of buftypes to ignore. See :help buftype for the
    --                possible values.
    -- function     - A function that returns true if the buffer should be
    --                ignored or false if it should not be ignored.
    --                Takes two arguments, `bufnr` and `buftype`.
    buftypes = "special",

    -- Ignored wintypes.
    -- Can be one of the following:
    -- false or nil - No wintypes are ignored.
    -- "special"    - All windows other than normal windows are ignored.
    -- table        - A list of wintypes to ignore. See :help win_gettype() for the
    --                possible values.
    -- function     - A function that returns true if the window should be
    --                ignored or false if it should not be ignored.
    --                Takes two arguments, `winid` and `wintype`.
    wintypes = "special",
  },

  -- When you fold code with za, zo, or zc, update the aerial tree as well.
  -- Only works when manage_folds = true
  link_folds_to_tree = false,

  -- Fold code when you open/collapse symbols in the tree.
  -- Only works when manage_folds = true
  link_tree_to_folds = true,

  -- Use symbol tree for folding. Set to true or false to enable/disable
  -- 'auto' will manage folds if your previous foldmethod was 'manual'
  manage_folds = false,

  -- These control the width of the aerial window.
  -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
  -- min_width and max_width can be a list of mixed types.
  -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
  max_width = { 40, 0.2 },
  width = nil,
  min_width = 10,

  -- Set default symbol icons to use patched font icons (see https://www.nerdfonts.com/)
  -- "auto" will set it to true if nvim-web-devicons or lspkind-nvim is installed.
  nerd_font = "auto",

  -- Call this function when aerial attaches to a buffer.
  -- Useful for setting keymaps. Takes a single `bufnr` argument.
  on_attach = nil,

  -- Call this function when aerial first sets symbols on a buffer.
  -- Takes a single `bufnr` argument.
  on_first_symbols = nil,

  -- Automatically open aerial when entering supported buffers.
  -- This can be a function (see :help aerial-open-automatic)
  open_automatic = false,

  -- Set to true to only open aerial at the far right/left of the editor
  -- Default behavior opens aerial relative to current window
  placement_editor_edge = false,

  -- Run this command after jumping to a symbol (false will disable)
  post_jump_cmd = "normal! zz",

  -- When true, aerial will automatically close after jumping to a symbol
  close_on_select = false,

  -- Show box drawing characters for the tree hierarchy
  show_guides = false,

  -- The autocmds that trigger symbols update (not used for LSP backend)
  update_events = "TextChanged,InsertLeave",

  -- Customize the characters used when show_guides = true
  guides = {
    -- When the child item has a sibling below it
    mid_item = "├─",
    -- When the child item is the last in the list
    last_item = "└─",
    -- When there are nested child guides to the right
    nested_top = "│ ",
    -- Raw indentation
    whitespace = "  ",
  },

  -- Options for opening aerial in a floating win
  float = {
    -- Controls border appearance. Passed to nvim_open_win
    border = "rounded",

    -- Enum: cursor, editor, win
    --   cursor - Opens float on top of the cursor
    --   editor - Opens float centered in the editor
    --   win    - Opens float centered in the window
    relative = "cursor",

    -- These control the height of the floating window.
    -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_height and max_height can be a list of mixed types.
    -- min_height = {8, 0.1} means "the greater of 8 rows or 10% of total"
    max_height = 0.9,
    height = nil,
    min_height = { 8, 0.1 },

    override = function(conf)
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      return conf
    end,
  },

  lsp = {
    -- Fetch document symbols when LSP diagnostics update.
    -- If false, will update on buffer changes.
    diagnostics_trigger_update = true,

    -- Set to false to not update the symbols when there are LSP errors
    update_when_errors = true,

    -- How long to wait (in ms) after a buffer change before updating
    -- Only used when diagnostics_trigger_update = false
    update_delay = 300,
  },

  treesitter = {
    -- How long to wait (in ms) after a buffer change before updating
    update_delay = 300,
  },

  markdown = {
    -- How long to wait (in ms) after a buffer change before updating
    update_delay = 300,
  },
})


EOF

nnoremap <C-s> :AerialToggle<CR>


" ===
" === Tagbar
" ===
" nmap <C-s> :TagbarToggle<CR>

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
