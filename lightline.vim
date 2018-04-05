set showtabline=2

let g:lightline_buffer_fname_mod = ':s?/index.js??:t' " Replace index.js with name of dir

let g:lightline = {
  \ 'colorscheme': 'oceanicnext',
  \ 'tabline': {
  \   'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
  \   'right': [ [ ] ],
  \ },
  \ 'component_expand': {
  \   'bufferbefore': 'lightline#buffer#bufferbefore',
  \   'buffercurrent': 'lightline#buffer#buffercurrent',
  \   'bufferafter': 'lightline#buffer#bufferafter',
  \   'neomake': 'LightlineNeomakeStatus',
  \ },
  \ 'component_type': {
  \   'buffercurrent': 'tabsel',
  \   'bufferbefore': 'raw',
  \   'bufferafter': 'raw',
  \   'neomake': 'error',
  \ },
  \ 'component_function': {
  \   'bufferinfo': 'lightline#buffer#bufferinfo',
  \   'fugitive': 'LightlineFugitive',
  \   'filename': 'LightlineFilename',
  \ },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
  \   'right': [ [ 'lineinfo' ], ['percent'], [ 'neomake', 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'subseparator': { 'left': '|', 'right': '|' }
\ }

function! LightlineNeomakeStatus()
  if len(neomake#GetJobs()) > 0
    return '…'
  endif
  return neomake#statusline#LoclistStatus()
endfunction

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
  let f = expand('%')
  let maxlength = 50
  let length = strlen(f)
  if length > maxlength
    let f = '…' . strpart(f, length - maxlength, maxlength)
  endif
  return f
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction
