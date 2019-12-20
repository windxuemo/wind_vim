" 操作结对符
" use '*' to mean 'all other filetypes'
" in this example, html and xml share the same text objects
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "i>"],
    \ "html,xml" : ["at", "it"],
\ }



" ===============================================
" 映射为空格选中一个结对符内容
map <SPACE> <Plug>(wildfire-fuel)
