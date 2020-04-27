" force Vim setting
set nocompatible
set nomore
" base setting
set encoding=utf-8
set fileencodings=utf-8
syntax on
" options
set wrap
set ambiwidth=double
set modeline

enew!

source <sfile>:h/tag_aliases.vim
source <sfile>:h/untranslated.vim
source <sfile>:h/makehtml.vim

let s:tools_dir = expand('<sfile>:p:h')
let s:proj_dir = expand('<sfile>:p:h:h')

function! s:main()
  " for the lastest help syntax
  let &runtimepath = s:tools_dir . ',' . &runtimepath
  " for ja custom syntax
  let &runtimepath = s:proj_dir  . ',' . &runtimepath

  " additinal plugin/colorscheme
  for name in ['github']
    let &runtimepath = s:tools_dir . '/' name . ',' . &runtimepath
  endfor

  " colorscheme set
  let bg = getenv('BACKGROUND')
  if bg == v:null || (bg isnot? 'light' && bg isnot? 'dark')
    let bg = 'light'
  else
    let bg = tolower(bg)
  endif
  let scheme = getenv('COLORSHEME')
  if scheme == v:null
    let scheme = 'delek'
    if isdirectory(s:tools_dir . 'github')
      let scheme = 'github'
    endif
  endif

  let &background = bg
  execute 'colorscheme' scheme

  " 2html option
  let g:html_no_progress = 1

  call s:BuildHtml()
endfunction

function! s:BuildHtml()

  " generate tags
  try
    helptags .
  catch
    echo v:exception
  endtry

  enew

  "
  " generate html
  "
  set foldlevel=1000
  call MakeHtmlAll()

  " old additional style
  " add header and footer
  " tabnew
  " " XXX: modeline may cause error.
  " " 2html.vim escape modeline.  But it doesn't escape /^vim:/.
  " set nomodeline
  " silent args *.html
  " silent argdo call s:PostEdit() | update!
endfunction

" function! s:PostEdit()
"   set fileformat=unix
"   call s:ToJekyll()
" endfunction
"
" function! s:ToJekyll()
"   let helpname = expand('%:t:r')
"   if helpname == 'index'
"     let helpname = 'help'
"   endif
"   " remove header
"   silent 1,/^<hr>/delete _
"   " remove footer
"   silent /^<hr>/,$delete _
"   " escape jekyll tags
"   silent %s/{\{2,}\|{%/{{ "\0" }}/ge
"   " YAML front matter
"   call append(0, [
"        \ '---',
"        \ 'layout: vimdoc',
"        \ printf("helpname: '%s'", helpname),
"        \ '---',
"        \ ])
" endfunction

call s:main()
