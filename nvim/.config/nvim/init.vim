set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set shiftwidth=4	" Number of auto-indent spaces
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
set tabstop=4
set ruler	" Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set relativenumber
set nocursorline
set guicursor=
set autoindent
set smartindent
set cursorline
set hidden
set t_Co=256
set mouse=a
set conceallevel=0

filetype plugin indent on
syntax on

call plug#begin()

Plug 'metalelf0/supertab'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'vimwiki/vimwiki'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ayu-theme/ayu-vim'
Plug 'rainglow/vim'
Plug 'arcticicestudio/nord-vim'
Plug 'airblade/vim-gitgutter'
Plug 'neovim/nvim-lsp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-scripts/SingleCompile'

call plug#end()

let mapleader = ","

" Themes
set termguicolors     " enable true colors support
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
"let g:nord_bold = 1
"let g:nord_italic = 1
"let g:nord_underline = 1
let g:nord_italic_comments = 1
set background=dark

augroup nord-theme-overrides
	autocmd!
	autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
	autocmd ColorScheme nord highlight Normal ctermbg=1 guibg=1
	autocmd ColorScheme nord highlight SignColumn ctermbg=1 guibg=1
	autocmd ColorScheme nord highlight LineNr ctermbg=1 guibg=1
	autocmd ColorScheme nord highlight CursorLine ctermbg=2 guibg=#232831
augroup END

colorscheme nord

let g:lightline = { 'colorscheme': 'nord' }
" IndentLine
let g:indentLine_char = '┆'

" vim-asterisk
map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
map z*  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map gz* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map z#  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map gz# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
let g:asterisk#keeppos = 1

" fzf.vim
let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }

nnoremap <C-p> :FZF<Cr>
nnoremap <C-f> :Rg<Cr>

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Filetype associations
autocmd FileType json syntax match Comment +\/\/.\+$+ " Highlight comments in JSON files
autocmd BufNewFile,BufRead *.asm set filetype=nasm

" Rust
lua require'nvim_lsp'.rust_analyzer.setup{}
autocmd FileType rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('_', 'max_menu_width', 80)
let g:SuperTagDefaultCompletionType = "<c-n>"
autocmd BufWrite * :Autoformat
nnoremap <leader>c :!cargo clippy

" Compile
nnoremap <C-k> :SCCompileRun<cr>

" Vimwiki
let wiki_style = {}
let wiki_style.path = '~/wiki'
let wiki_style.syntax = 'markdown'
let wiki_style.ext = '.md'

let g:vimwiki_list = [wiki_style]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

autocmd FileType vimwiki set ft=markdown

