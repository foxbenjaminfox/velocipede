function! velocipede#fallback(direction, count) abort
  if a:direction ==? 'down'
    execute "normal! " . a:count . "\<C-X>"
  else
    execute "normal! " . a:count . "\<C-A>"
  endif
endfunction


let s:down = {
    \ "true": "false",
    \ "false": "true",
  \ }
let s:up = {
    \ "true": "false",
    \ "false": "true",
  \ }

function! velocipede#cycle(direction, count) abort
  let l:count = a:count
  let l:replace = tolower(expand('<cword>'))
  let l:word = l:replace
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
    silent execute 'keepjumps normal! ciw' . l:word . "\<esc>b"
  else
    call velocipede#fallback(a:direction, a:count)
  endif
endfunction
