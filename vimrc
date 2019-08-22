" ====================基本设置============================
" 设置leader键
let mapleader=","
" 使用vim增强功能
set nocompatible              

" 去掉输入错误的提示声音
set noeb
" 启动的时候不显示那个援助乌干达儿童的提示  
set shortmess=atI
" 不要图形按钮  
set go=

" 语法高亮
syntax enable		      

"搜索忽略大小写
set ignorecase

" 开启文件类型检测
filetype on
" 并允许vim加载文件类型的插件
filetype plugin on


" 自适应不同语言的缩进
filetype indent on
" 自动缩进
set smartindent



" 在行和段开始处使用制表符
set smarttab
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4



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

" 命令行的高度
set cmdheight=2

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号
set showmatch

" 相对行号
set relativenumber

"高亮光标所在行
set cul
" 高亮光标所在列
" set cuc


set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  


" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif


" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-


" 设置运行时路径
set rtp+=~/.vim/bundle/Vundle.vim


" 打开文件回到上次光标所在地方
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" 开启html补全
set omnifunc=htmlcomplete#CompleteTags


source ~/.vim/plugin_install.vimrc
source ~/.vim/theme.vimrc
source ~/.vim/plugin_config.vimrc

source ~/.vim/self_function.vimrc
source ~/.vim/self_function_config.vimrc
source ~/.vim/set_key.vimrc


" 新建文件自动定位到最后一行
autocmd BufNewFile * normal G

