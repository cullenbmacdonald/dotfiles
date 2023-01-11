" don't bother with vi compatibility
set nocompatible

syntax enable

set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab

set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 space
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set visualbell
set cursorline
set ttyfast
set undofile
set showmode
set hidden
set hls
set nu
set listchars=tab:▸\ ,eol:¬
set textwidth=80
set colorcolumn=80
nnoremap / /\v
vnoremap / /\v
set smartcase
set showmatch
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Pathogen
call pathogen#infect()

call plug#begin('~/.vim/plugged')
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'preservim/nerdtree'
call plug#end()

let mapleader = ","

" CtrlP Maps
let g:ctrlp_map = '<c-d>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_switch_buffer = ''
let g:ctrlp_show_hidden = 1

filetype plugin on
filetype plugin indent on


" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif


set background=dark
colorscheme solarized

" Pane minimizing
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Toggle paste mode
map <leader>pp :setlocal paste!<cr>

" TaskList
map <leader>td <Plug>TaskList

" Tab nav
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>"
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

nnoremap - :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Open v-split and select
nnoremap <leader>w <C-w>v<C-w>l

map `` <CR>

" Yankring view
map <Leader>v :YRShow<cr>

" Clear search
map <Leader>c /zzzzzzsnore<CR>

" Remove spaces at the end of a line
autocmd BufWritePre * :%s/\s\+$//e

" Ack stuff
map <Leader>a :Ack -a

" Use silver searcher with vim eck
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:ctrlp_user_command =
    \['.git/', 'cd %s && git ls-files --exclude-standard -co']

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" " md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

