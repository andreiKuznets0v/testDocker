autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <Enter> o<ESC>
map <C-n> :NERDTreeToggle<CR>
syntax on
set nu
"customization
filetype plugin indent on
set encoding=utf-8
set nocompatible

set t_Co=256
if empty(glob('~/.vim/autoload/plug.vim')) 
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/bundle') 
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end() 
let g:airline#extensions#keymap#enabled = 0
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline_section_z = "\Ln:%l/%L Col:%c" 
