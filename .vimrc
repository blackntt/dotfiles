" Load Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-go'
Plugin 'scrooloose/nerdtree'
Plugin 'roxma/nvim-yarp'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'tpope/vim-sensible'
Plugin 'mhinz/vim-signify'
Plugin 'sukima/xmledit'
Plugin 'vim-airline/vim-airline'
call vundle#end()
filetype on

" Use :help <option> to see the docs
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set incsearch
set ignorecase
set smartcase
set mouse=a
set hidden
set wildmode=list:longest
set number
set title
set ruler
set nospell

" Customize view
sy on
set t_Co=256
colorscheme nacx


" Key remaps
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
nmap <F4> :BufExplorerHorizontalSplit<CR>
nmap <silent> <F5> :!tmux splitw -v -l 5<CR><CR>

" GRB: use fancy buffer closing that doesn't close the split
:nnoremap <silent> <S-Left> :bprevious<CR>
:nnoremap <silent> <S-Right> :bnext<CR>
:noremap <silent> <C-Left> b
:noremap <silent> <C-Right> w

" Replace strings in local or global scope
" https://stackoverflow.com/a/597932/3540564
:nnoremap gr gd[{V%:s/<C-R>///gc<Left><Left><Left>
:nnoremap gR gD:s/<C-R>///gc<Left><Left><Left>

" :w!! sudo saves the file
cmap w!! w !sudo tee % >/dev/null

" NERDTree options
let NERDTreeAutoCenter = 1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeMouseMode = 1
let NERDTreeIgnore=['.*\.o$']
let NERDTreeIgnore+=['.*\~$']
let NERDTreeIgnore+=['.*\.out$']
let NERDTreeIgnore+=['.*\.so$', '.*\.a$']
let NERDTreeIgnore+=['.*\.pyc$']
let NERDTreeIgnore+=['.*\.class$']

" Bufexplorer options
let g:bufExplorerSplitBelow=1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '»'
let g:airline_exclude_preview = 1
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '»'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '«'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '␤ '
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'

" Vim-go
let g:go_fmt_autosave=0

" Deoplete (autocompletion)
set pyxversion=3
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
set completeopt-=preview
set completeopt+=noinsert
set completeopt+=longest,menuone
if has("patch-7.4.314")
    set shortmess+=c
endif

" Enter just selects the item in the autocomplete menu
" http://vim.wikia.com/wiki/VimTip1386
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Map Ctrl+Space to autocomplete
" https://coderwall.com/p/cl6cpq/vim-ctrl-space-omni-keyword-completion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" Tmux integration
if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Close tmux when exiting vim
autocmd VimLeave * silent !tmux killp -a

" Custom file types
au BufRead,BufNewFile *.md set filetype=markdown

" Automatic commands
autocmd VimEnter *.c,*.cpp,*.h,*.java,*.py,*.go NERDTree
autocmd FileType c,cpp,h,java,python,go nested :TagbarOpen

" QuickFix window always at the bottom
autocmd FileType qf wincmd J

" Two space indent in Ruby
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" Autoload changes in .vimrc
autocmd BufWritePost .vimrc source $MYVIMRC

