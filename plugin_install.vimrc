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
Plugin 'wincent/command-t'
" Plugin 'kien/ctrlp.vim'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'mattn/emmet-vim'

" 可视化缩进
Plugin 'nathanaelkane/vim-indent-guides'

" 标记书签
Plugin 'kshenoy/vim-signature'

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
Plugin 'easymotion/vim-easymotion'

" 语法检查
" Plugin 'scrooloose/syntastic'
Plugin 'dense-analysis/ale'



" 选中字符串并搜索，可以自动解析特殊符号
Plugin 'luochen1990/select-and-search'

" 查看buffer，切换buffer
Plugin 'bsdelf/bufferhint'

" 自动弹出补全列表
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

Plugin 'zchee/deoplete-jedi'
Plugin 'Shougo/deoplete-clangx'


" 快速输入结对符
Plugin 'jiangmiao/auto-pairs'

Plugin 'gregsexton/MatchTag'
Plugin 'andymass/vim-matchup'

Plugin 'alvan/vim-closetag'

" 文本对齐
Plugin 'godlygeek/tabular'

" All of your Plugins must be added before the following line
call vundle#end()            " required

