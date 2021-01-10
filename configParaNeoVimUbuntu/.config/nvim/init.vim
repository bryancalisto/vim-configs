set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode

call plug#begin('plugged')

" TEMAS
 Plug 'morhetz/gruvbox'
" IDE
 Plug 'easymotion/vim-easymotion'
 Plug 'scrooloose/nerdtree'
 Plug 'christoomey/vim-tmux-navigator'
 Plug 'tpope/vim-surround'

 call plug#end()

 colorscheme gruvbox

 let g:gruvbox_contrast_dark = "hard"

 let mapleader=" "

 let NERDTreeQuitOnOpen=1

 nmap <Leader>s <Plug>(easymotion-s2)

 nmap <Leader>nt :NERDTreeFind<CR>

 nmap <Leader>q :q<CR>
 nmap <Leader>w :w<CR>
 nmap <Leader>1 80j<CR>
