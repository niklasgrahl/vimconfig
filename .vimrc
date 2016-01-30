set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlp.vim'
Plugin 'The-NERD-tree'
Plugin 'Syntastic'
Plugin 'tpope/vim-surround'
Plugin 'zeis/vim-kolor'
Plugin 'rking/ag.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-unimpaired'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'othree/yajs.vim'
Plugin 'elzr/vim-json'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/vim-easy-align'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'ternjs/tern_for_vim'
Plugin 'SirVer/ultisnips'
Plugin 'isRuslan/vim-es6'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'BufOnly.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line

colorscheme kolor
syntax on

set noswapfile
set number "show line numbers
set hidden "allow hidden buffers
set autoindent
set encoding=utf-8
set hlsearch "highlight search matches
set mouse=a "enable mouse interaction
set pastetoggle=<F2> "toggle paste mode with F2
set ignorecase
set smartcase

"indentation
set expandtab
set shiftwidth=2
set softtabstop=2

" make sure airline appears
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':s?index.js??'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:syntastic_javascript_checkers=['eslint']
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:python_host_prog = '/usr/bin/python'

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript']

" UltiSnips config
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

"function! JavaScriptFold()
  "setl foldmethod=syntax
  "setl foldlevelstart=1
  "syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
"endfunction

"au FileType javascript call JavaScriptFold()
"
" folding
" au FileType javascript call JavaScriptFold()
"setlocal foldmethod=expr
"setlocal foldexpr=(getline(v:lnum)=~'^$')?-1:((indent(v:lnum)<indent(v:lnum+1))?('>'.indent(v:lnum+1)):indent(v:lnum))
"syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
"setlocal foldmethod=syntax
"setlocal foldlevel=99
"setlocal foldmethod=indent
"
setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)

function! IndentLevel(lnum)
  return indent(a:lnum) / &shiftwidth
endfunction

function! NextNonBlankLine(lnum)
  let numlines = line('$')
  let current = a:lnum + 1

  while current <= numlines
    if getline(current) =~? '\v\S'
      return current
    endif

    let current += 1
  endwhile

  return -2
endfunction

function! GetPotionFold(lnum)
  if getline(a:lnum) =~? '\v^\s*$'
    return '-1'
  endif

  let this_indent = IndentLevel(a:lnum)
  let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

  if next_indent == this_indent
    return this_indent
  elseif next_indent < this_indent
    return this_indent
  elseif next_indent > this_indent
    return '>' . next_indent
  endif
endfunction


"shortcuts
map ,nt :NERDTreeToggle<CR>
map ,nf :NERDTreeFind<CR>
map ,ve :e $MYVIMRC<CR>
map ,/ :nohl<CR>
map <F7> mzgg=G`z<CR>
map ,oc :!chrome file:///%:p 
map ,bn :bn<CR>
map ,bp :bp<CR>
map ,bd :bp<bar>sp<bar>bn<bar>bd<CR>
map ,= =']
nmap <SPACE> za
vmap <C-x> :!pbcopy<CR>  
vmap <C-c> :w !pbcopy<CR><CR> 

imap jj <ESC>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" move lines up or down mappings
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" mac specific
nmap π <Plug>yankstack_substitute_older_paste
nmap ∏ <Plug>yankstack_substitute_newer_paste

fu! CustomFoldText()
  "get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif
  
  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let lineCount = line("$")
  let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
  let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf

"au FileType javascript call MyJavaScriptFold()
"set foldmethod=expr
set foldtext=CustomFoldText()

function! s:RevealInFinder()
  if filereadable(expand("%"))
    let l:command = "open -R %"
  elseif getftype(expand("%:p:h")) == "dir"
    let l:command = "open %:p:h"
  else
    let l:command = "open ."
  endif
  execute ":silent! !" . l:command
  redraw!
endfunction
command! Reveal call <SID>RevealInFinder()

autocmd CompleteDone * pclose "Close scratch window after autocompletion

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowrite (file is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
  augroup END
endif

call yankstack#setup()
