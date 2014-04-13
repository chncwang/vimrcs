"version 6.0
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
if (has("gui_running"))
    let completeopt=preview
endif
colors evening

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
nmap <F3> :wall<CR>:A<CR>
imap <F3> <ESC>:wall<CR>:A<CR>
map <F5> <ESC><C-w>k:q<CR>
imap <F5> <ESC><C-w>k:q<CR>a

nmap th <C-w>h
nmap tl <C-w>l
nmap tk <C-w>k
nmap tj <C-w>j
nmap tr <C-w><C-r>
nmap tn :tnext<CR>
nmap tp :tprevious<CR>
nmap rjv 20<C-w>>2<C-w>l22<C-w><2<C-w>h

function BuildIde()
    let Tlist_WinWidth=80
    TlistToggle
    Nt
endfunction

function BuildJava()
    set cc=100
    TlistToggle
    Nt
endfunction

function ChncwangInsertLeave()
"    Tu
endfunction

command Ct !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . /usr/include/c++/4.6 /usr/include/c++/4.6/x86_64-linux-gnu  /usr/include/c++/4.6/backward /usr/lib/gcc/x86_64-linux-gnu/4.6/include /usr/local/include /usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed /usr/include/x86_64-linux-gnu /usr/include 2>&1 &
command Ide call BuildIde()
command Java call BuildJava()
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
command Db %s/\s\+$//
command Oc set cc=80
command Cc set cc=0

autocmd InsertLeave * call ChncwangInsertLeave()

let g:C_MapLeader  = '\'
let g:C_ObjExtension = '.m .mm'

" OmniFunc configs.
let OmniCpp_NamespaceSearch = 2
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_DefaultNamespaces = ["std", "cocos2d", "boost", "map"]
let OmniCpp_MayCompleteScope = 1

let g:Lua_AuthorName = "Chauncey Wang"
let g:Lua_AuthorRef = "None"
let g:Lua_Email = "chncwang@gmail.com"
let g:Lua_Company = "Jialidun"
let g:C_Printheader = 0

" TagList configs.
let Tlist_Ctags_Cmd="/usr/bin/ctags"
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

" Eclim configs.
let g:EclimCValidate = 0
nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <cr> :JavaSerachContext<cr>
command Jc JavaCorrect
command Jdp JavaDocPreview
command Jds JavaDocSearch
command Jdc JavaDocComment
command Jf JavaFormat
command Ji JavaImport
command Jio JavaImportOrganize
command Js JavaSearch
command Jr JavaRename

" pathogen
execute pathogen#infect()

" vim-markdown
let g:vim_markdown_folding_disabled=1
