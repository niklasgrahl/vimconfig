function! s:RevealInFinder()
  if has('mac')
    if filereadable(expand("%"))
      let l:command = "open -R %"
    elseif getftype(expand("%:p:h")) == "dir"
      let l:command = "open %:p:h"
    else
      let l:command = "open ."
    endif
    execute ":silent! !" . l:command
    redraw!
  endif
endfunction
command! Reveal call <SID>RevealInFinder()
