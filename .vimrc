" ||||||||||||||||||||||||||||||||||||||||||||||||
" isolate config
let mapleader=","
" be iMproved, required
set nocompatible              
" 
syntax enable		      
" 

" 自动缩进
set autoindent
set cindent
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=2
" 去掉输入错误的提示声音
set noeb
"搜索忽略大小写
set ignorecase

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号
set showmatch

" 相对行号
set relativenumber

" 语法开启
syntax on
" 侦测文件类型
filetype on
" 自适应不同语言的智能缩进
filetype indent on
filetype plugin on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" set cul "高亮光标所在行
" set cuc
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
set go=             " 不要图形按钮  
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠  
""set foldmethod=manual   " 手动折叠  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  

" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

nmap <Leader>sr :source ~/.vimrc<CR>


" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

"将tab替换为空格
nmap <Leader>tt :%s/\t/    /g<CR>

" 设置运行时路径
set rtp+=~/.vim/vim-markdown-master
set rtp+=~/.vim/bundle/Vundle.vim
" ================================================

" 打开文件回到上次光标所在地方
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" ||||||||||||||||||||||||||||||||||||||||||||||||
" 环境保存及恢复
" 设置环境保存项
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 开启保存 undo 历史功能
set undofile
" undo 历史保存路径
set undodir=~/.undo_history/
" 保存快捷键
noremap <leader>se :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" 恢复快捷键
noremap <leader>re :source my.vim<cr> :rviminfo my.viminfo<cr>
" ================================================



" ||||||||||||||||||||||||||||||||||||||||||||||||
"去空行  
nnoremap <Leader><F2> :g/^\s*$/d<CR> 

"比较文件  
nnoremap <Leader>df :vert diffsplit 


" ||||||||||||||||||||||||||||||||||||||||||||||||
" isolate function 
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction



" 新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
" 定义函数SetTitle，自动插入文件头 
func! SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")

        "    elseif &filetype == 'mkd'
        "        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "	> File Name: ".expand("%")) 
        call append(line(".")+1, "	> Author: ") 
        call append(line(".")+2, "	> Mail: ") 
        call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G



"C，C++ 按F5编译运行
map <Leader><F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        "        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc


" ================================================


" ||||||||||||||||||||||||||||||||||||||||||||||||
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" ================================================


" vim plugin start
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Solarized is a sixteen color palette
" Plugin 'altercation/solarized'

" c++ 语法高亮
Plugin 'octol/vim-cpp-enhanced-highlight'

" 可视化缩进
Plugin 'nathanaelkane/vim-indent-guides'

" 头文件和对应源文件快速切换
Plugin 'derekwyatt/vim-fswitch'

" 标记书签
Plugin 'kshenoy/vim-signature'

" 标签系统
Plugin 'majutsushi/tagbar'

" 自动生成标签并引入
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'

" 内容查找
Plugin 'dyng/ctrlsf.vim'

" 内容替换
Plugin 'terryma/vim-multiple-cursors'

" 快速注释
Plugin 'scrooloose/nerdcommenter'

" 模板补全
Plugin 'SirVer/ultisnips'
" 预定义补全模板
Plugin 'honza/vim-snippets'

" 由接口快速生存实现框架
Plugin 'derekwyatt/vim-protodef'
" 文件列表
Plugin 'scrooloose/nerdtree'

" minibuffer
Plugin 'fholgado/minibufexpl.vim'
" 快速操作结对符
Plugin 'gcmt/wildfire.vim'

" 支持分支的undo
Plugin 'sjl/gundo.vim'

" 快速移动
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'easymotion/vim-easymotion'
" 语法检查
Plugin 'scrooloose/syntastic'

" 自动生存tags
" Plugin 'xolox/vim-easytags'

" 使用tmux
Plugin 'christoomey/vim-tmux-navigator'

" tmux-plugin-manager
Plugin 'tmux-plugins/tpm'

" 
" Plugin 'CaptureClipboard'

" 显示git工程修改过的文件和分支
Plugin 'kien/ctrlp.vim'
Plugin 'jasoncodes/ctrlp-modified.vim'

" 打开文件的时候回到上一次编辑的地方
" Plugin 'last_edit_marker.vim'

" 模糊搜索当前文件的函数
" Plugin 'acahiroy/ctrlp-funky'

" 选中字符串并搜索，可以自动解析特殊符号
Plugin 'luochen1990/select-and-search'

" 查看buffer，切换buffer
Plugin 'bsdelf/bufferhint'

" 函数手册
Plugin 'vim-utils/vim-man'

" tab补全
Plugin 'ervandew/supertab'

" YouCompleteMe 智能补全
" Plugin 'Valloric/YouCompleteMe'
"
" OminiCppComplete
" Plugin 'vim-scripts/OmniCppComplete' 

" 自动弹出补全列表
Plugin 'vim-scripts/AutoComplPop'

" 快速输入结对符
Plugin 'Raimondi/delimitMate'

" 智能补全
Plugin 'Shougo/neocomplete.vim'

" 文本对齐
Plugin 'godlygeek/tabular'

" vim 会话管理 
Plugin 'vim-scripts/sessionman.vim'

" 分屏终端
Plugin 'pazzavita/ConqueTerm'

" python format pep8
Plugin 'tell-k/vim-autopep8'

" python mode
" Plugin 'klen/python-mode'

" markdown mode
" Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
" ||||||||||||||||||||||||||||||||||||||||||||||||
" Solarized 配色 
if has('gui_running')         " 如果有GUI
    set background=light  " 背景主题为亮色
else                          " 如果是终端
    set background=dark   " 背景主题为暗色
endif

set t_Co=256
let g:solarized_termcolors=256

" colorscheme solarized" 颜色主题为solarized
" colorscheme molokai " 颜色主题为molokai
colorscheme vmolokai " 颜色主题为vmolokai
" colorscheme codeschool " 颜色主题为codeschool
" colorscheme jellybeans " 颜色主题为codeschool
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" vim-cpp-enhanced-highlight c++语法高亮
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" vim-indent-guides  可视化缩进
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 自动选择颜色
" let g:indent_guides_auto_colors = 1
" 配置颜色
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray ctermbg=4


" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i(indent) 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" vim-fswitch 头文件和对应源文件快速切换
nmap <silent> <Leader>sw :FSHere<cr>
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" vim-signature 书签
let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "m,",
            \ 'ToggleMarkAtLine'   :  "m.",
            \ 'PurgeMarksAtLine'   :  "m-",
            \ 'DeleteMark'         :  "dm",
            \ 'PurgeMarks'         :  "mda",
            \ 'PurgeMarkers'       :  "m<BS>",
            \ 'GotoNextLineAlpha'  :  "']",
            \ 'GotoPrevLineAlpha'  :  "'[",
            \ 'GotoNextSpotAlpha'  :  "`]",
            \ 'GotoPrevSpotAlpha'  :  "`[",
            \ 'GotoNextLineByPos'  :  "]'",
            \ 'GotoPrevLineByPos'  :  "['",
            \ 'GotoNextSpotByPos'  :  "mn",
            \ 'GotoPrevSpotByPos'  :  "mp",
            \ 'GotoNextMarker'     :  "[+",
            \ 'GotoPrevMarker'     :  "[-",
            \ 'GotoNextMarkerAny'  :  "]=",
            \ 'GotoPrevMarkerAny'  :  "[=",
            \ 'ListLocalMarks'     :  "ms",
            \ 'ListLocalMarkers'   :  "ml"
            \ }
" ================================================


" ||||||||||||||||||||||||||||||||||||||||||||||||
" tagbar 标签列表
" 打开/关闭标签列表
nnoremap <silent> <Leader>tl :TagbarToggle<CR>
" 选中标签之后，自动将标签列表关闭
" let g:tagbar_autoclose=1
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
            \ 'kinds' : [
            \ 'c:classes:0:1',
            \ 'd:macros:0:1',
            \ 'e:enumerators:0:0', 
            \ 'f:functions:0:1',
            \ 'g:enumeration:0:1',
            \ 'l:local:0:1',
            \ 'm:members:0:1',
            \ 'n:namespaces:0:1',
            \ 'p:functions_prototypes:0:1',
            \ 's:structs:0:1',
            \ 't:typedefs:0:1',
            \ 'u:unions:0:1',
            \ 'v:global:0:1',
            \ 'x:external:0:1'
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
            \ 'g' : 'enum',
            \ 'n' : 'namespace',
            \ 'c' : 'class',
            \ 's' : 'struct',
            \ 'u' : 'union'
            \ },
            \ 'scope2kind' : {
            \ 'enum'      : 'g',
            \ 'namespace' : 'n',
            \ 'class'     : 'c',
            \ 'struct'    : 's',
            \ 'union'     : 'u'
            \ }
            \ }
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" indexer 自动生存标签并引入
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
" 设置ctrlsf 使用ag
let g:ctrlsf_ackprg = 'ag'    
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" 模板补全
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" 补全快捷键
let g:UltiSnipsExpandTrigger="<Leader><tab>"  
" 下一个输入选项
let g:UltiSnipsJumpForwardTrigger="<Leader><s-n>"
" 上一个输入选项
let g:UltiSnipsJumpBackwardTrigger="<Leader><s-p>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:ultisnipsSnippetDirectoryies=["mysnippets"]
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 打开文件时，自动打开文件列表
" autocmd vimenter * NERDTree
" 在直接执行vim的时候，没有后接文件或者目录的时候，默认列出当前文件列表
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 在打开一个目录的时候，自动打开文件列表
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 当关闭最后一个文件后，如果只剩下文件列表，则退出vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" ================================================


" ||||||||||||||||||||||||||||||||||||||||||||||||
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>mbt :MBEToggle<cr>
" buffer 切换快捷键
noremap <Leader><C-F>   :MBEbn<CR>
noremap <Leader><C-B> :MBEbp<CR>
noremap <Leader><C-J>     <C-W>j
noremap <Leader><C-K>     <C-W>k
noremap <Leader><C-H>     <C-W>h
noremap <Leader><C-L>     <C-W>l
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" 快速操作结对符
" 映射为空格选中一个结对符内容
map <SPACE> <Plug>(wildfire-fuel)
" 选中上一个结对符内容
" This selects the previous closest text object.
map <C-SPACE> <Plug>(wildfire-water)
" 结对符作用对象
let g:wildfire_objects = {
            \ "*" : ["i'", 'i"', "i)", "i]", "i}"]
            \ }

cal wildfire#triggers#Add("<ENTER>", {
            \ "html,xml" : ["at", "it"],
            \ })
" 快速选中
nmap <leader>qs <Plug>(wildfire-quick-select)
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" 支持分支的gundo
" 调用 gundo 树
" 打开或者关闭undo树
nnoremap <Leader>ud :GundoToggle<CR>

" ||||||||||||||||||||||||||||||||||||||||||||||||
" git工程修改的文件
map <Leader><Leader>m :CtrlPModified<CR>
map <Leader><Leader>M :CtrlPBranch<CR>
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" ctrlp_funky 模糊搜索函数
" 模糊搜索语法高亮
let g:ctrlp_funky_syntax_highlight = 1
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" buffer 快速查看和切换
nnoremap - :call bufferhint#Popup()<CR>
nnoremap \ :call bufferhint#LoadPrevious()<CR>
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" 函数查看手册
" 水平分屏打开manual
" map <leader>vm <Plug>(Man) 
" 垂直分屏打开manual
" map <leader>hm <Plug>(Vman) 
" ================================================

" ||||||||||||||||||||||||||||||||||||||||||||||||
" vim 会话管理
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
nmap <leader>sl :SessionList<CR>
nmap <leader>ss :SessionSave<CR>
nmap <leader>sc :SessionClose<CR>
" ================================================


" ||||||||||||||||||||||||||||||||||||||||||||||||
" 
" 水平分割出一个bash
nnoremap    <Leader>hb              :ConqueTermSplit bash<CR>
" 垂直分割出一个bash
nnoremap    <Leader>vb             :ConqueTermVSplit bash<CR>
" ================================================

" #################################################################################################
" 所有的 leader map
" :nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" nmap <silent> <Leader>sw :FSHere<cr>
" nnoremap <silent> <Leader>tg :TagbarToggle<CR>
