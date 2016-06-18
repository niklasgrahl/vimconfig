if !has('nvim')
  set nocompatible              " be iMproved, required
endif

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

if has('mac')
  call plug#begin('~/.vim/plugged')
endif
if has('win32')
  call plug#begin()
endif

" Plug 'VundleVim/Vundle.vim' 
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'The-NERD-tree'
" Plug 'Syntastic'
Plug 'tpope/vim-surround'
Plug 'zeis/vim-kolor'
Plug 'rking/ag.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-unimpaired'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'othree/yajs.vim'
Plug 'elzr/vim-json'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
" Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'SirVer/ultisnips'
Plug 'isRuslan/vim-es6'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'BufOnly.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'benekastah/neomake'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'sjl/gundo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-vinegar'
Plug 'jlanzarotta/bufexplorer'

call plug#end()            " required

if has('win32')
  " Neovim-qt Guifont command, to change the font
  command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>")
  " Set font on startq
  let g:Guifont="DejaVu Sans Mono:h12"
  let g:airline_powerline_fonts = 1
endif

filetype plugin indent on    " required

colorscheme kolor
syntax on

if !has('nvim')
  set autoindent
  set encoding=utf-8
  set hlsearch "highlight search matches
  set mouse=a "enable mouse interaction
  set laststatus=2 " make sure airline appears
endif

set noswapfile
set number "show line numbers
set hidden "allow hidden buffers

set pastetoggle=<F2> "toggle paste mode with F2
set ignorecase
set smartcase

" indentation
set expandtab
set shiftwidth=2
set softtabstop=2

" do not wrap in the middle of a word
set linebreak

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':s?index.js??'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:syntastic_javascript_checkers=['eslint']
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_extensions = ['line']
let g:python_host_prog = '/usr/bin/python'

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript']

" UltiSnips config
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

exec "source " . expand("<sfile>:p:h") . "/folding.vim"
exec "source " . expand("<sfile>:p:h") . "/reveal.vim"
exec "source " . expand("<sfile>:p:h") . "/large-files.vim"

"shortcuts
" map ,nt :NERDTreeToggle<CR>
" map ,nf :NERDTreeFind<CR>
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

" Shortcut: Edit/Write file in same directory
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>w :w <C-R>=expand("%:p:h") . "/" <CR>

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

" same mappings on mac
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" move windows around easily
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Space>\<Space>"

" Enable file source completion from the current buffer path
let g:deoplete#file#enable_buffer_path = 1

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" add extra space before comment (// abc instead of //abc)
let NERDSpaceDelims = 1

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" Use deoplete.
" let g:tern_request_timeout = 1
" let g:tern_show_signature_in_pum = 0  " This do disable full signature type on autocomplete

" deoplete tab-complete
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" " ,<Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

if has('mac')
  nmap π <Plug>yankstack_substitute_older_paste
  nmap ∏ <Plug>yankstack_substitute_newer_paste
endif

autocmd CompleteDone * pclose "Close scratch window after autocompletion

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" use neomake instead of syntastic
let syntastic_check_on_wq = 0
autocmd! BufWritePost * if exists(":Neomake") | Neomake | endif

" recreate tags file for js files
nnoremap ,t :call jobstart([&shell, &shcf, "find . -type f -iregex .*\.js -not -path './node_modules/*' -exec jsctags {} -f \; \| sed '/^$/d' \| sort > tags"])

" try to get ycm to use ctags file
let g:ycm_collect_identifiers_from_tags_files = 0

" toggle relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" kill netrw buffer when hidden
autocmd FileType netrw setl bufhidden=wipe

call yankstack#setup()
