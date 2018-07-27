let mapleader=";"
nmap LB 0
nmap LE $

vnoremap <Leader>y "+y
nmap <Leader>p "+p

nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>

autocmd BufWritePost $MYVIMRC source $MYVIMRC
set incsearch
set hlsearch
set ignorecase
nmap <silent> <CR> :nohlsearch<CR>

" Vundle Section start
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nvie/vim-flake8'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on

syntax on
set backspace=2
set number
set showcmd
set ruler
set laststatus=2
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set nowrap
set textwidth=79
" set scroll=10
set fileencodings=utf-8,gb2312,cp936,latin-1
set fileencoding=utf-8
set termencoding=utf-8
set fileformat=unix
set encoding=utf-8
set background=dark

let g:airline_powerline_fots = 1
let g:airline_theme = "molokai"
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>

" file list 
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=28
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.DS_Store']

" comfortable motion
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>
let g:comfortable_motion_scroll_down_key = "j"
let g:fomfortable_motion_scroll_up_key = "k"


" 缩进指示线
let g:indentLine_char='¦'
let g:indentLine_enabled=1

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"nvie/vim-flake8 关于注释
let g:NERDSpaceDelims = 1

" python 代码自动检查
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
" autocmd BufWritePost *.py call Flake8()
let g:flake8_quickfix_location="topleft"
let g:flake8_quickfix_height=8

" run python code
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w" 
    if &filetype == 'python'
        exec '!time python %'
    endif                                                                              
endfunc 





