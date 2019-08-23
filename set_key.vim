
"去空行  
nnoremap <Leader>rbl :g/^\s*$/d<CR> 

"比较文件  
nnoremap <Leader>df :vert diffsplit 

nmap <Leader>sr :source ~/.vimrc<CR>

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


:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" vim-fswitch 头文件和对应源文件快速切换
nmap <silent> <Leader>sw :FSHere<cr>

" 映射为空格选中一个结对符内容
map <SPACE> <Plug>(wildfire-fuel)


" buffer 快速查看和切换
nnoremap - :call bufferhint#Popup()<CR>
nnoremap \ :call bufferhint#LoadPrevious()<CR>

" 自动输入结对符 打开/关闭
let g:AutoPairsShortcutToggle = '<leader>p'


" emmet 补全
let user_emmet_expandabbr_key = '<c-e>'


" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" 输入html tag的时候，自动补全 开关
nnoremap <silent>  <Leader>c :CloseTagToggleBuffer<CR>

" 回车并缩进，主要用于html tag
inoremap <Leader><TAB> <CR><ESC>O



" 快速移动
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
