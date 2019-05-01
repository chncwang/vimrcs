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

"cuda begin
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda
"cuda end

let os = linux
let s:uname = system("echo -n \"$(uname)\"")
if s:uname == "Darwin"
    let os = osx
endif
if os == linux
    let ctags = '/usr/bin/ctags'
    command Ct !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.cuh+.cu . /usr/include/c++/5/
else
    let ctags = '/usr/local/bin/ctags'
    command Ct !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
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

" terminal
Plugin 'skywind3000/asyncrun.vim'

" window
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'

" auto complete
"Plugin 'vim-scripts/AutoComplPop'
Plugin 'ervandew/supertab'

" quick edit
Plugin 'hrp/EnhancedCommentify'

" refactoring
Plugin 'vim-scripts/EasyGrep'

" C++
Plugin 'vim-scripts/a.vim'
Plugin 'vimscript/c-support'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'w0rp/ale'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Valloric/YouCompleteMe'

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

" vim8 timer
"======================================================
function! SaveFile(timer)
    silent! :wall!
endfunction
let save_file_timer = timer_start(500, 'SaveFile', {'repeat':-1})

function BuildCTags(timer)
    :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.cuh+.cu . /usr/include/c++/5 /usr/include/c++/5/backward /usr/lib/gcc/x86_64-linux-gnu/5/include /usr/local/include /usr/lib/gcc/x86_64-linux-gnu/5/include-fixed /usr/include/x86_64-linux-gnu /usr/include > /dev/null 2>&1 &
endfunction
"======================================================

" gutentags
"======================================================
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = 'tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q', '--langmap=c++:+.cuh+.cu']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"======================================================

" asyncrun
"======================================================
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
nnoremap <silent> <F5> :AsyncRun cd build && make -j8 <cr>
"======================================================

" ale
"======================================================
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
"======================================================
