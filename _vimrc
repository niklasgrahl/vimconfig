set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/Vim/vimfiles/bundle/Vundle.vim
let path='~/Vim/vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'ctrlp.vim'
Plugin 'The-NERD-Commenter'
Plugin 'The-NERD-tree'
Plugin 'SuperTab'
Plugin 'Syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'taglist-plus'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'surround-vim'
Plugin 'zeis/vim-kolor'
Plugin 'JavaScript-Indent'
" lh-vim-lib
" local-vimrc
" taglist
" vim-nerdtree-tabs



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"Personal Settings.
"More to be added soon.
execute pathogen#infect()
filetype plugin indent on
syntax on

"Set Color Scheme and Font Options
colorscheme kolor
set guifont=Consolas:h12
"set line no, buffer, search, highlight, autoindent and more.
set nu
set hidden
set ignorecase
set incsearch
set smartcase
set showmatch
set autoindent
set ruler
set vb
set viminfo+=n$VIM/_viminfo
set noerrorbells
set showcmd
set mouse=a
set history=1000
set undolevels=1000
set encoding=utf-8

"indentation
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

"tab completion
set wildmode=longest,list,full
set wildmenu

"ctags
let Tlist_Ctags_Cmd = '"C:\Users\Niklas\Vim\ctags\ctags.exe"'

"jshint
let g:syntastic_javascript_checkers=['jshint']

"shortcuts
map ,nt :NERDTreeToggle<CR>
map ,nf :NERDTreeFind<CR>

map ,tn :tabnew<CR>
map ,ve :e C:\Users\Niklas\Vim\_vimrc<CR>
map ,/ :nohl<CR>
map <F7> mzgg=G`z<CR>
map ,oc :!chrome file:///%:p 
map ,bn :bn<CR>
map ,bp :bp<CR>
map ,bd :bp<bar>sp<bar>bn<bar>bd<CR>
map ,p p=']

set foldmethod=indent
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

function! MyFold(lnum)
  let prev_indent = IndentLevel(a:lnum-1)
  let this_indent = IndentLevel(a:lnum)
  let next_indent = IndentLevel(a:lnum+1)
  if getline(a:lnum) =~? '\v^\s*$'
    return "="
  elseif next_indent > this_indent "startline
    return ">" . next_indent
  elseif prev_indent > this_indent
    return "<" . prev_indent
  else
    return this_indent
  endif
endfunction

function! IndentLevel(lnum)
  return indent(a:lnum) / &shiftwidth
endfunction

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
set foldmethod=expr
set foldexpr=MyFold(v:lnum)
set foldtext=CustomFoldText()

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules|bower_components)$',
  \ 'file': '\v(\.swp|\~)$',
  \ }
