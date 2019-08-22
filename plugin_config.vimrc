" vim-cpp-enhanced-highlight c++语法高亮
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
" ================================================

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
" ================================================
"


" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1


" 设置ctrlsf 使用ag
let g:ctrlsf_ackprg = 'ag'    


" 模板补全
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
"
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i(indent) 开/关缩进可视化


" 结对符作用对象
let g:wildfire_objects = {
            \ "*" : ["i'", 'i"', "i)", "i]", "i}"]
            \ }

" 设置要自动配对的符号
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", "`":"`"}
" html文件，禁止< 自动输入结对符，因为和补全插件有冲突，会导致多输入结对符
"autocmd FileType html let b:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", "`":"`"}

" 开启deoplete补全插件
let g:deoplete#enable_at_startup = 1


"设置python版本
" set pyxversion=3
" let g:python3_host_prog = "/usr/bin/python3"

let g:ale_enabled = 1

" emmet 开启
let g:user_emmet_install_global = 1
let user_emmet_expandabbr_key = '<c-e>'

" 开启vim-matchup
let g:loaded_matchit = 1
" 禁止高亮显示匹配对
let g:matchup_matchparen_enabled = 0




" vim-closetag html

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

