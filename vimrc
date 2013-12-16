"customed by sunsd

set clipboard=unnamed
"set path=.,/usr/include,,$(pd)/include

" compatible
set nocp

" number of colors
set t_Co=256

" colorscheme
colo molokai

" line number
set nu

" backspace
set bs=indent,eol,start
" whichwrap
set ww=b,s,<,>,[,]

" encoding
set enc=utf-8
" fileencodings
set fencs=utf-8,usc-bom,cp936,gb18030,gbk,gb2312,big5,enc-jp
" fileformats
set ffs=unix,dos,mac

" backup
set bk
"backupdir, set in ~/.bashrc: export VIMBKDIR=~/tmp/vim
set bdir=$VIMBKDIR

au BufWritePre * let &bex = '-' . strftime("%y%b%d%R") . '~'

" history
set hi=100

" cursorline
set nocul

" syntax
syn on
syn enable

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" autoindent
set ai

" expandtab
set et
" smarttab
"set sta
" tabstop
set ts=4
" shiftwidth
set sw=4

" incsearch
set is
" hlsearch
set hls
" showmatch
set sm

" showcmd
set sc
set wrap
" ruler
set ru

" lazyredraw
set nolz

"<<< vundle
set nocp
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"Bundle 'vim-plugin-foo'
"Bundle 'vim-plugin-bar'

" syntax
Bundle 'STL-improved'
Bundle 'Enhanced-Javascript-syntax'
"Bundle 'html5.vim'

" color
Bundle 'desert.vim'
Bundle 'molokai'
let g:molokai_original=1

" ftplugin
"Bundle 'xml.vim'
"Bundle 'lint.vim'
"Bundle 'skammer/vim-css-color'
let g:cssColorVimDoNotMessMyUpdatetime = 1

" indent
Bundle 'OOP-javascript-indentation'
Bundle 'PHP-correct-Indenting'

" plugin
Bundle 'L9'
"Bundle 'VimIM'
Bundle 'ack.vim'
" test ag, tmux, etc sometime
Bundle 'Mark'
"Bundle 'ViMail'
"Bundle 'Syntastic'
"Bundle 'mattn/emmet-vim'
"Bundle 'csv.vim'
"Bundle 'cscope.vim'
"Bundle 'dbext.vim'

Bundle 'ctrlp.vim'
  let g:ctrlp_cmd = 'CtrlPMRU'
Bundle 'AutoClose'
Bundle 'matchit.zip'
Bundle 'ShowTrailingWhitespace'
"Bundle 'jsbeautify'
"Bundle 'EasyMotion'
"Bundle 'FencView.vim'
Bundle 'The-NERD-tree'
  nmap wm :NERDTreeToggle<cr>
  let NERDTreeWinPos='right'
  let NERDTreeWinSize=30
Bundle 'The-NERD-Commenter'
  map <c-h> ,c<space>
Bundle 'UltiSnips'
  let g:UltiSnipsExpandTrigger="<c-j>"
  let g:UltiSnipsJumpForwardTrigger="<c-j>"
  let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"Bundle 'Tabular'
Bundle 'Valloric/YouCompleteMe'
Bundle 'ervandew/supertab'

"Bundle 'Lokaltog/vim-powerline'
"set ls=2 "laststatus
"set t_Co=256
"let g:Powline_symbols='fancy'
filetype plugin indent on
">>>

let mapleader = ","

map <C-W>t :tabnew<cr>

map <F11> :call Cf2wf()<CR>
"copy file to webframe dir
function Cf2wf()
    let path = expand("%:p")
    if(executable('wp'))
        execute "!wp ".path
    endif
endfunction
