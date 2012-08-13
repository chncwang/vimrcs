version 6.0
set nocp
let s:cpo_save=&cpo
set cpo&vim
imap <D-BS> 
imap <M-BS> 
imap <M-Down> }
inoremap <D-Down> <C-End>
imap <M-Up> {
inoremap <D-Up> <C-Home>
noremap! <M-Right> <C-Right>
noremap! <D-Right> <End>
noremap! <M-Left> <C-Left>
noremap! <D-Left> <Home>
nmap gx <Plug>NetrwBrowseX
map <M-Down> }
noremap <D-Down> <C-End>
map <M-Up> {
noremap <D-Up> <C-Home>
noremap <M-Right> <C-Right>
noremap <D-Right> <End>
noremap <M-Left> <C-Left>
noremap <D-Left> <Home>
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Monaco:h14
set guitablabel=%M%t
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
colors evening
set cc=81
set number
set ruler
inoremap jj <ESC>
set incsearch
filetype plugin on
filetype indent on
syntax on
set autowrite
let completeopt=menuone,preview

let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_Auto_Open=0
let Tlist_Process_File_Always=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Sort_Type="order"
let Tlist_WinWidth=37
let Tlist_Compact_Format=1
let Tlist_Enable_Fold_Column=0
let Tlist_Display_Prototype=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=0
let Tlist_Use_Right_Window=1

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
let NERDTreeMouseMode=3


function ChangeFiletypeBetweenCppAndObjcpp()
    if &filetype=="cpp"
        set filetype=objc
    else
        set filetype=cpp
    endif
    TT
    TT
endfunction


map <F2> :wall<CR>:TT<CR>
imap <F2> <ESC>:TT<CR>
map <F3> :wall<CR>:A<CR>
imap <F3> <ESC>:wall<CR>:A<CR>
map <F4> :wall<CR>:call ChangeFiletypeBetweenCppAndObjcpp()<CR>
imap <F4> <ESC>:call ChangeFiletypeBetweenCppAndObjcpp()<CR>
map <F5> <ESC><C-w>k:q<CR>
imap <F5> <ESC><C-w>k:q<CR>a
map <F6> <ESC><C-W>h
imap <F6> <ESC><C-W>h
map <F7> <ESC><C-W>l
imap <F7> <ESC><C-W>l
map <F8> :%s/\s\+$//<CR>
map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . /usr/local/boost_1_50_0/libs/smart_ptr<CR>

command TU TlistUpdate
command TT TlistToggle
command RB ReadBookmarks
command SN set number
command NT NERDTree
command LM ListMethods
command BM BuildMethods
command HT help taglist.txt
command HL help luasupport.txt
command HN help nerd_tree.txt
command HO help omnicppcomplete
command HS help snipmate
command HC help csupport
command RC e ~/.vimrc
command JJ inoremap jj <ESC>
command UJ unmap! jj

2012-07-12
function QswVimEnter()
    NERDTree
endfunction

function ChncwangInsertLeave()
    wall
    TU
endfunction

autocmd VimEnter * call QswVimEnter()
autocmd InsertLeave * call ChncwangInsertLeave()
let g:C_MapLeader  = '\'
let g:C_ObjExtension = '.m .mm'

let OmniCpp_NamespaceSearch = 2
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_DefaultNamespaces = ["std", "cocos2d", "boost", "map"]
let OmniCpp_MayCompleteScope = 1

let g:Lua_AuthorName = "Chauncey Wang"
let g:Lua_AuthorRef = "None"
let g:Lua_Email = "chncwang@gmail.com"
let g:Lua_Company = "Jialidun"
