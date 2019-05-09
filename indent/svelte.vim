" Vim indent file
" Language: svelte.js
" Maintainer: Robert burner Schadek
" Author: Robert burner Schadek

if exists('b:did_indent')
  finish
endif

function! s:get_indentexpr(language)
  unlet! b:did_indent
  execute 'runtime! indent/' . a:language . '.vim'
  return &indentexpr
endfunction

" The order is important here, tags without attributes go last.
" HTML is left out, it will be used when there is no match.
let s:languages = [
      \   { 'name': 'css', 'pairs': ['<style', '</style>'] },
      \   { 'name': 'javascript', 'pairs': ['<script', '</script>'] },
      \ ]

for s:language in s:languages
  " Set 'indentexpr' if the user has an indent file installed for the language
  if strlen(globpath(&rtp, 'indent/'. s:language.name .'.vim'))
    let s:language.indentexpr = s:get_indentexpr(s:language.name)
  endif
endfor

let s:html_indent = s:get_indentexpr('html')

let b:did_indent = 1

setlocal indentexpr=GetVueIndent()

if exists('*GetSvelteIndent')
  finish
endif

function! GetSvelteIndent()
  for language in s:languages
    let opening_tag_line = searchpair(language.pairs[0], '', language.pairs[1], 'bWr')

    if opening_tag_line
      execute 'let indent = ' . get(language, 'indentexpr', -1)
      break
    endif
  endfor

  if exists('l:indent')
    if (opening_tag_line == prevnonblank(v:lnum - 1) || opening_tag_line == v:lnum)
          \ || getline(v:lnum) =~ '\v^\s*\</(script|style)'
      return 0
    endif
  else
    " Couldn't find language, fall back to html
    execute 'let indent = ' . s:html_indent
  endif

  return indent
endfunction
