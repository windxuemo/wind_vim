nmap <silent> <M-c> <Plug>(coc-declaration)
nmap <silent> <M-d> <Plug>(coc-definition)
nmap <silent> <M-r> <Plug>(coc-references)
nmap <silent> <M-i> <Plug>(coc-implementation)
nmap <silent> <M-f>  <Plug>(coc-fix-current)
nn <silent> K :call CocActionAsync('doHover')<cr>



set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')


" bases
nn <silent> cb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nn <silent> cb :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
nn <silent> cd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> cD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
nn <silent> cc :call CocLocations('ccls','$ccls/call')<cr>
" callee
nn <silent> cC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

" $ccls/member
" member variables / variables in a namespace
nn <silent> cm :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nn <silent> cf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nn <silent> cs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

nmap <silent> ct <Plug>(coc-type-definition)<cr>
nn <silent> cv :call CocLocations('ccls','$ccls/vars')<cr>
nn <silent> cV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>


