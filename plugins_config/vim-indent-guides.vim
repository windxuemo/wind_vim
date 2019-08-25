" vim-indent-guides  可视化缩进
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 自动选择颜色
" let g:indent_guides_auto_colors = 1
" 配置颜色
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=darkgrey
hi IndentGuidesEven ctermbg=darkgrey


" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1





" ===============================================
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
