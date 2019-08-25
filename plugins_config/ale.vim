"设置python版本
" set pyxversion=3
" let g:python3_host_prog = "/usr/bin/python3"

" ale 语法检查
let g:ale_enabled = 1

"使用clang对c和c++进行语法检查，对python使用flake8进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['flake8'],
\}

" 使用eslint
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}

let g:ale_fixers = {
\ 'python': ['yapf'],
\}

" 检查延迟
let g:ale_lint_delay = 100



