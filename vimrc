" 2013/04/18 sunsd
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif

" colorscheme
colo desert

" number of colors
"set t_Co=256

" compatible
set nocp

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

"backup
set bk
"backupdir, set in ~/.bashrc: export BDIR=~/tmp/vim
set bdir=$BDIR

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


if(g:iswindows==1)
    if has('mouse')
        set mouse=a
    endif
    au GUIEnter * simalt ~x
endif

" guifont, guifontwide
if(g:iswindows==1)
    if (has("gui_running"))
        set gfn=DejaVu_Sans_Mono:h11:cANSI
        set gfw=微软雅黑:h11:cGB2312
    endif
else
    if (has("gui_running"))
        set gfn=DejaVu\ Sans\ Mono\ 11
    endif
endif

"<<< vundle
set nocp
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'vim-plugin-foo'
Bundle 'vim-plugin-bar'

" syntax
Bundle 'Enhanced-Javascript-syntax'
Bundle 'html5.vim'

" color

" ftplugin
Bundle 'xml.vim'

" indent
Bundle 'OOP-javascript-indentation'
Bundle 'PHP-correct-Indenting'

" plugin
Bundle 'L9'
"Bundle 'VimIM'
Bundle 'mru.vim'
Bundle 'Mark'
Bundle 'ViMail'
Bundle 'checksyntax'
Bundle 'mattn/emmet-vim'
Bundle 'csv.vim'
"Bundle 'cscope.vim'
Bundle 'dbext.vim'
"Bundle 'project.tar.gz'
"Bundle 'c.vim--Fritz-Mehner'

Bundle 'ctrlp.vim'
Bundle 'AutoClose'
Bundle 'ZenCoding.vim'
Bundle 'matchit.zip'
Bundle 'ShowTrailingWhitespace'
"Bundle '_jsbeautify'
"Bundle 'EasyMotion'
"Bundle 'FencView.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
"Bundle 'UltiSnips'
"Bundle 'Tabular'
Bundle 'Valloric/YouCompleteMe'

"Bundle 'Lokaltog/vim-powerline'
"set ls=2 "laststatus
"set t_Co=256
"let g:Powline_symbols='fancy'
filetype plugin indent on
">>>

let g:winManagerWindowLayout='FileExplorer' "|TagList
"let g:persistentBehaviour=0
"let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1

nmap wm :NERDTreeToggle<cr>
let NERDTreeWinPos='right'
let NERDTreeWinSize=30

map <F7> :call Do_CsTag()<CR>
"<<<
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
        "ctags -R --languages=c++ --langmap=c++:+.inl -h +.inl --c++-kinds=+px --fields=+iaSKz --extra=+q --exclude=path --exclude=file.ext
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction
">>>
