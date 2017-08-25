let osx = 'OS X'
let linux = 'Linux'
set nocp
let s:cpo_save=&cpo
set cpo&vim
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set expandtab
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Monaco\ 12
set helplang=en
set langmenu=none
set autoindent
set mouse=a
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set shiftwidth=4
set smartindent
set nocindent
set autoindent
set softtabstop=4
set termencoding=utf-8
set number
set ruler
inoremap jj <ESC>
set incsearch
filetype plugin on
filetype indent on
syntax on
set autowrite

let os = linux
let s:uname = system("echo -n \"$(uname)\"")
if s:uname == "Darwin"
    let os = osx
endif
if os == linux
    let ctags = '/usr/bin/ctags'
    command Ct !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . /usr/include/c++/4.6 /usr/include/c++/4.6/x86_64-linux-gnu  /usr/include/c++/4.6/backward /usr/lib/gcc/x86_64-linux-gnu/4.6/include /usr/local/include /usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed /usr/include/x86_64-linux-gnu /usr/include 2>&1 &
else
    let ctags = '/usr/local/bin/ctags'
    command Ct !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . /usr/include/c++/4.2.1/ /usr/local/include/
    if (has("gui_running"))
        colors evening
    endif
endif

" NERDTree
"======================================================
let g:NERDTree_title="[NERDTree]"  
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
function! NERDTree_IsValid()  
    return 1
endfunction

let NERDChristmasTree=0
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=2
let NERDTreeMouseMode=1

command Nt NERDTree
"======================================================

nmap th <C-w>h
nmap tl <C-w>l
nmap tk <C-w>k
nmap tj <C-w>j
nmap tr <C-w><C-r>
nmap tn :tnext<CR>
nmap tp :tprevious<CR>
nmap tw <ESC><C-w>k:q<CR>

function BuildIde()
    TlistToggle
    Nt
endfunction

function BuildJava()
    set cc=100
    TlistToggle
    Nt
endfunction

command Ide call BuildIde()
command Java call BuildJava()

" Vundle
"======================================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" window
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'

" auto complete
Plugin 'vim-scripts/AutoComplPop'
Plugin 'ervandew/supertab'

" quick edit
Plugin 'hrp/EnhancedCommentify'

" refactoring
Plugin 'vim-scripts/EasyGrep'

" C++
"Plugin 'vim-scripts/OmniCppComplete'
Plugin 'vim-scripts/a.vim'
Plugin 'vimscript/c-support'

" python
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/pylint.vim'

" lua
Plugin 'vim-scripts/lua-support'

call vundle#end()
filetype plugin indent on
"======================================================

" OmniCpp configs.
"======================================================
let OmniCpp_NamespaceSearch = 2
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_DefaultNamespaces = ["std", "cocos2d", "boost", "map"]
let OmniCpp_MayCompleteScope = 1
"======================================================

" TagList configs.
"======================================================
let Tlist_Ctags_Cmd=ctags
let Tlist_Auto_Open=0
let Tlist_Process_File_Always=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Sort_Type="order"
let Tlist_WinWidth=60
let Tlist_Compact_Format=1
let Tlist_Enable_Fold_Column=0
let Tlist_Display_Prototype=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=0
let Tlist_Use_Right_Window=1
"======================================================

" jedi(python auto complete plugin)
"======================================================
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_select_first = 0
"======================================================

let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
