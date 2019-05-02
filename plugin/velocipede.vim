nmap <silent> <Plug>SpeedDatingFallbackUp :<C-U>call velocipede#cycle('up', v:count1)<cr>
nmap <silent> <Plug>SpeedDatingFallbackDown :<C-U>call velocipede#cycle('down', v:count1)<cr>

if !exists("g:loaded_speeddating")
  nnoremap  <C-A> :<C-U>call velocipede#cycle('up', v:count1)<cr>
  nnoremap  <C-X> :<C-U>call velocipede#cycle('down', v:count1)<cr>
  xnoremap  <C-A> :<C-U>call velocipede#cycle('up', v:count1)<cr>
  xnoremap  <C-X> :<C-U>call velocipede#cycle('down', v:count1)<cr>
endif
