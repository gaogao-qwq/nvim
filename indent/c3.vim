" https://github.com/konimarti/c3.vim
" Copyright (c) 2024 Koni Marti <koni.marti@gmail.com>
" Copyright (c) 2023-2024 Airbus5717
" Copyright (c) 2017 Tetralux

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal nosmartindent
setlocal nolisp
setlocal autoindent

setlocal indentexpr=GetC3Indent(v:lnum)

if exists("*GetC3Indent")
  finish
endif

function! GetC3Indent(lnum)
  let prev = prevnonblank(a:lnum-1)

  if prev == 0
    return 0
  endif

  let prevline = getline(prev)
  let line = getline(a:lnum)

  let ind = indent(prev)

  if prevline =~ '[({]\s*$'
    let ind += &sw
  endif

  if line =~ '^\s*[)}]'
    let ind -= &sw
  endif

  return ind
endfunction
