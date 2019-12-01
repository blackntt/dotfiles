call plug#begin('~/.vim/plugged')
" Plug 'ervandew/supertab'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
" Plug 'Townk/vim-autoclose'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'ycm-core/YouCompleteMe'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()
" Set options for vim
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set number
set title
set ruler
set mouse=a
set ignorecase
set relativenumber
set smartindent
set encoding=utf-8
set timeoutlen=1000 ttimeoutlen=0
colorscheme gruvbox
set bg=dark
syntax on
" Map leader key
let mapleader = "," " map leader key to ,
let g:mapleader = ","
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
imap jj <Esc>

map <silent> <leader><cr> :noh<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h
"fzf
nnoremap <c-p> :Files<CR>
nmap <c-f> :Ag<cr>

"Mapping keys for commentary
nmap <c-_> gcc
vmap <c-_> gc
" Mapping keys for autoformat
noremap <c-s-i> :Autoformat<CR>
let g:ycm_global_ycm_extra_conf = '/home/blackntt/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_clangd_binary_path = '/usr/local/bin/clangd'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_clangd = 0
nnoremap <leader>gd :YcmCompleter GoTo<CR>
" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:ycm_semantic_triggers =  {
            \   'c': ['->', '.'],
            \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
            \            're!\[.*\]\s'],
            \   'ocaml': ['.', '#'],
            \   'cpp,cuda,objcpp': ['->', '.', '::'],
            \   'perl': ['->'],
            \   'php': ['->', '::'],
            \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
            \   'ruby,rust': ['.', '::'],
            \   'lua': ['.', ':'],
            \   'erlang': [':'],
            \ }
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
" gitgutter
set signcolumn=yes
