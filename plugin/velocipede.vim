if exists("g:loaded_velocipede") || &compatible
  finish
endif
let g:loaded_velocipede = 1
nmap <silent> <Plug>VelocipedeUp   :<C-U>call velocipede#cycle('up', v:count1)<cr>
nmap <silent> <Plug>VelocipedeDown :<C-U>call velocipede#cycle('down', v:count1)<cr>

nmap <silent> <Plug>SpeedDatingFallbackUp   <Plug>VelocipedeUp
nmap <silent> <Plug>SpeedDatingFallbackDown <Plug>VelocipedeDown

if !exists("g:loaded_speeddating")
  nmap <C-A> <Plug>VelocipedeUp
  nmap <C-X> <Plug>VelocipedeDown
  xmap <C-A> <Plug>VelocipedeUp
  xmap <C-X> <Plug>VelocipedeDown
endif

" Addition is lazy, in order to avoid triggering autoload if we can avoid it
let g:_velocipede_cycle_buffer = []
command! -nargs=+ VelocipedeAdd silent call add(g:_velocipede_cycle_buffer, [<f-args>])
