" vim plugin start
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/L9'

Plug 'wincent/command-t'

" 快速编辑html
Plug 'mattn/emmet-vim'

" 可视化缩进
Plug 'nathanaelkane/vim-indent-guides'

" 标记书签
Plug 'kshenoy/vim-signature'

" 多光标编辑
Plug 'terryma/vim-multiple-cursors'

" 快速注释
Plug 'scrooloose/nerdcommenter'

" 模板补全
Plug 'SirVer/ultisnips'
" 预定义补全模板
Plug 'honza/vim-snippets'

" 文件列表
Plug 'scrooloose/nerdtree'

" minibuffer
Plug 'fholgado/minibufexpl.vim'

" 快速操作结对符
Plug 'gcmt/wildfire.vim'

" 支持分支的undo
Plug 'sjl/gundo.vim'

" 快速移动
Plug 'easymotion/vim-easymotion'

" 语法检查
Plug 'dense-analysis/ale'

" 选中字符串并搜索，可以自动解析特殊符号
Plug 'luochen1990/select-and-search'

" 查看buffer，切换buffer
Plug 'bsdelf/bufferhint'

" 自动弹出补全列表
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete-clangx'
" Plug 'Chiel92/vim-autoformat'


" 快速输入结对符
Plug 'jiangmiao/auto-pairs'

Plug 'gregsexton/MatchTag'
Plug 'andymass/vim-matchup'

Plug 'alvan/vim-closetag'

Plug 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call plug#end()            " required

