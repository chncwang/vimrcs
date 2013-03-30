"version 6.0
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
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowse
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set expandtab
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Monaco:h12
set fo
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
if (has("gui_running"))
    let completeopt=menuone,preview
endif

let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_Auto_Open=0
let Tlist_Process_File_Always=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Sort_Type="order"
let Tlist_WinWidth=50
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
let NERDTreeMouseMode=1


function ChangeFiletypeBetweenCppAndObjcpp()
    if &filetype=="cpp"
        set filetype=objc
    else
        set filetype=cpp
    endif
    Tt
    Tt
endfunction

vmap <F2> <ESC><ESC>:call EnhancedCommentify('guess', 'comment')<CR>
nmap <F2> :wall<CR>:Tt<CR>
imap <F2> <ESC>:Tt<CR>
nmap <F3> :wall<CR>:A<CR>
imap <F3> <ESC>:wall<CR>:A<CR>
map <F5> <ESC><C-w>k:q<CR>
imap <F5> <ESC><C-w>k:q<CR>a
map <F8> :%s/\s\+$//<CR>
"map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . /usr/local/boost_1_50_0/libs/smart_ptr /Library/lua-5.2.1/src<CR>
map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . /usr/include/c++/4.2.1<CR>

map th <C-w>h
map tl <C-w>l
map tk <C-w>k
map tj <C-w>j
map tr <C-w><C-r>
nmap tn :tnext<CR>

map zu <C-u>
map zd <C-d>

command Tu TlistUpdate
command Tt TlistToggle
command Rb ReadBookmarks
command Sn set number
command Nt NERDTree
command Lm ListMethods
command Bm BuildMethods
command Ha help alternate.txt
command Ht help taglist.txt
command Hl help luasupport.txt
command Hn help nerd_tree.txt
command Ho help omnicppcomplete
command Hs help snipmate
command Hc help csupport
command Rc e ~
command Jj inoremap jj <ESC>
command Uj unmap! jj

function QswVimEnter()
    NERDTree
endfunction

function ChncwangInsertLeave()
    wall
    Tu
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

let g:C_Printheader = 0
