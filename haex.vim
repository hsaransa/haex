" Syntax file for haex

if exists("b:current_syntax")
    finish
endif

syn keyword haexKeyword local global fun class if while set include enum or not and add mul continue break return eq lt le gt ge setm
syn keyword haexType int void string
" nextgroup=syntaxElement2
" syn match   haexMatch 'regexp' contains=syntaxElement1 nextgroup=syntaxElement2 skipwhite
" syn region  haexRegion start='x' end='y'

syn region heaxString start='"' end='"' contained

syn region haexDescBlock start="(" end=")" fold transparent

syn match haexComment "//.*$" contains=haexTodo


highlight link haexKeyword Keyword
highlight link haexDescBlock Statement
highlight link haexComment Comment
highlight link haexComment Constant
highlight link haexType Type

let b:current_syntax = "haex"

" vim:set sw=2 sts=2 ts=8 noet:
