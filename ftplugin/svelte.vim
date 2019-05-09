" Vim filetype plugin
" Language: svlete.js
" Maintainer: Robert burner Schadek
" Author: Robert burner Schadek

if exists('b:did_ftplugin')
  finish
endif

runtime! ftplugin/html.vim

setlocal suffixesadd+=.svelte

if !exists('g:no_plugin_maps') && !exists('g:no_svelte_maps')
  nnoremap <silent> <buffer> [[ :call search('^<\(template\<Bar>script\<Bar>style\)', 'bW')<CR>
  nnoremap <silent> <buffer> ]] :call search('^<\(template\<Bar>script\<Bar>style\)', 'W')<CR>
  nnoremap <silent> <buffer> [] :call search('^</\(template\<Bar>script\<Bar>style\)', 'bW')<CR>
  nnoremap <silent> <buffer> ][ :call search('^</\(template\<Bar>script\<Bar>style\)', 'W')<CR>
endif
