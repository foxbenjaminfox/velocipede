function! velocipede#fallback(direction, count) abort
  if a:direction ==? 'down'
    execute 'normal! ' . a:count . "\<C-X>"
  else
    execute 'normal! ' . a:count . "\<C-A>"
  endif
endfunction

let s:down = {
    \ 'true': 'false',
    \ 'false': 'true',
  \ }
let s:up = {
    \ 'true': 'false',
    \ 'false': 'true',
  \ }

function! velocipede#cycle(direction, count) abort
  let l:count = a:count
  if !empty(g:_velocipede_cycle_buffer)
    call velocipede#add_all(g:_velocipede_cycle_buffer)
    let g:_velocipede_cycle_buffer = []
  endif
  if l:count == 0
    return
  endif
  let l:replaced = expand('<cword>')
  let l:word = tolower(l:replaced)
  if a:direction ==? 'down'
    let l:dict = s:down
  else
    let l:dict = s:up
  endif
  if has_key(l:dict, l:word)
    while l:count > 0
      let l:word = l:dict[l:word]
      let l:count -= 1
    endwhile
    let l:word = velocipede#matchcase(l:word, l:replaced)
    silent execute 'keepjumps normal! ciw' . l:word . "\<esc>wb"
  else
    call velocipede#fallback(a:direction, a:count)
  endif
endfunction

function! velocipede#add(wordlist) abort
  if empty(a:wordlist)
    echoerr 'Velocipede list must not be empty'
    return
  endif
  let l:prev = tolower(a:wordlist[-1])
  for l:item in a:wordlist
    let l:item = tolower(l:item)
    let s:down[l:item] = l:prev
    let s:up[l:prev] = l:item
    let l:prev = l:item
  endfor
endfunction

function! velocipede#add_all(wordlists) abort
  for l:list in a:wordlists
    call velocipede#add(l:list)
  endfor
endfunction

function! velocipede#matchcase(word, from) abort
  if a:from ==# tolower(a:from)
    return tolower(a:word)
  elseif a:from ==# toupper(a:from)
    return toupper(a:word)
  elseif a:from[0] ==# toupper(a:from[0]) &&
        \ a:from[1:] ==# tolower(a:from[1:])
    return toupper(a:word[0]) . tolower(a:word[1:])
  else
    return a:word
  endif
endfunction
