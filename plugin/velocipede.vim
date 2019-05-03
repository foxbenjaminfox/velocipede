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
