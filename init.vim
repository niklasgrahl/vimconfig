set nocompatible " be iMproved, required
" --- PLUGINS ---
  let b:plugin_dir = '~/.vim/plugged'

  function! DeopletePostUpdate(arg)
    UpdateRemotePlugins
  endfunction

  call plug#begin(b:plugin_dir)
    " Essential
    Plug 'Shougo/deoplete.nvim', { 'do': function('DeopletePostUpdate') }
    Plug 'benekastah/neomake'
    Plug 'Lokaltog/vim-easymotion'
    Plug 'tpope/vim-unimpaired' " Pairs of handy bracket mappings
    Plug 'wellle/targets.vim' " Adds more targets to operate on e.g. change inside parens or delete item in list
    Plug 'maxbrunsfeld/vim-yankstack'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-fugitive' " Git commands

    " UI
    Plug 'zeis/vim-kolor'
    Plug 'mhartington/oceanic-next'
    Plug 'nanotech/jellybeans.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'itchyny/lightline.vim'
    Plug 'taohex/lightline-buffer'

    " Denite
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/neomru.vim'
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug 'Shougo/unite.vim' " Only until vimfiler is replaced

    " File explorer
    Plug 'Shougo/vimfiler.vim'

    " Text manipulation
    Plug 'AndrewRadev/splitjoin.vim' " Split/join lists/objects over lines
    Plug 'junegunn/vim-easy-align' " Align text
    Plug 'tpope/vim-surround' " Surround text with parens, brackets, tags etc.
    Plug 'tommcdo/vim-exchange' " Exchange text
    Plug 'tpope/vim-abolish' " Easily search for, substitute, and abbreviate multiple variants of a word
    Plug 'scrooloose/nerdcommenter' " Insert/remove comments

    " Snippets
    " Plug 'SirVer/ultisnips'

    " View information
    Plug 'sjl/gundo.vim' " Show undo tree
    Plug 'tommcdo/vim-fugitive-blame-ext' " Shows commit message for current line in Gblame
    Plug 'machakann/vim-highlightedyank'

    " Javascript
    Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
    Plug '1995eaton/vim-better-javascript-completion', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'ternjs/tern_for_vim', {'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
    Plug 'flowtype/vim-flow', {'do': 'npm install -g flow-bin', 'for': ['javascript', 'javascript.jsx'] }
    Plug 'steelsojka/deoplete-flow', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'elzr/vim-json', { 'for': 'json'}
    " Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'pangloss/vim-javascript' , { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'moll/vim-node', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'prettier/vim-prettier', { 'tag': '0.1.3', 'for': ['javascript', 'javascript.jsx'] }


    " Markdown
    Plug 'jtratner/vim-flavored-markdown', { 'for': ['markdown', 'ghmarkdown'] }
    Plug 'tpope/vim-markdown', { 'for': ['markdown', 'ghmarkdown'] }

    " Terraform
    Plug 'hashivim/vim-terraform'

    " Not yet categorized
    Plug 'vim-scripts/BufOnly.vim'
    Plug 'freitass/todo.txt-vim'

    " For debugging
    " Plug 'gerw/vim-HiLinkTrace'

    " Disabled
    " Plug 'otree/yajs.vim'
    " Plug 'mhartington/deoplete-typescript'
    " Plug 'Shougo/neoinclude.vim'
    " Plug 'isRuslan/vim-es6'
    " Plug 'kern/vim-es7'
    " Plug 'jiangmiao/auto-pairs' " Automatically insert or delete brackets, parens, quotes in pairs
    " Plug 'Raimondi/delimitMate' " Autimatically close quotes, parenthesis, brackets etc.
    " Plug 'terryma/vim-multiple-cursors'
    " Plug 'majutsushi/tagbar'
    " Plug 'szw/vim-tags'
    " Plug 'tpope/vim-vinegar' " Combine with netrw
    " Plug 'Shougo/neopairs.vim'

    " Try out later
    " Plug 'bkad/CamelCaseMotion' " Currently has conflicting mappings with targets.vim
    " Plug 'chrisbra/NrrwRgn'

    " Not working
    " Plug 'bigfish/vim-js-context-coloring', {'branch': 'neovim', 'do' : 'npm install --update'}
    " if has('nvim')
    "   Plug 'neovim/node-host', {'do': 'npm install --update'}
    " endif
  call plug#end()

" --- BASIC SETTINGS ---
  filetype plugin indent on

  set autoindent
  set encoding=utf-8
  set laststatus=2 " make sure airline appears
  set hlsearch "highlight search matches
  set mouse=a "enable mouse interaction
  set number "show line numbers
  set hidden "allow hidden buffers
  set pastetoggle=<F2> "toggle paste mode with F2
  set ignorecase
  set smartcase

  " indentation
  set expandtab
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2

  " tab completion
  set wildmode=longest,list,full
  set wildmenu

  set linebreak " do not wrap in the middle of a word

  set relativenumber

" --- STYLING ---
  syntax on
  set termguicolors
  " colorscheme kolor
  colorscheme OceanicNext

  highlight link jsxCloseTag Function
  highlight link jsxCloseString Function

" --- PLUGIN SETTINGS ---
  let g:javascript_plugin_flow = 1

  let g:UltiSnipsExpandTrigger="<c-a>"

  let NERDSpaceDelims = 1

  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  let g:tern_set_omni_function = 0
  let g:tern_map_keys=1
  let g:tern_show_argument_hints='on_hold'

  let g:neopairs#enable = 1

  let g:vim_json_syntax_conceal = 0 " vim-json -- don't hide double qoutes

  let g:targets_argOpening = '[({[]' " targets.vim - Add curly braces as argument separator
  let g:targets_argClosing = '[]})]'

   
  au FocusLost * :set norelativenumber
  au FocusGained * :set relativenumber

  let mapleader = ','

  " let g:python_host_prog = '/usr/bin/python'

" Settings in other files
  exec "source " . expand("<sfile>:p:h") . "/folding.vim"
  exec "source " . expand("<sfile>:p:h") . "/reveal.vim"
  exec "source " . expand("<sfile>:p:h") . "/large-files.vim"
  exec "source " . expand("<sfile>:p:h") . "/lightline.vim"

" Plugin settings
  if exists('g:plugs["vim-javascript"]')
    let g:javascript_plugin_flow = 1
    set foldmethod=syntax
  endif

  if exists('g:plugs["vim-airline"]')
    let g:airline#extensions#tabline#enabled = 1
    " let g:airline#extensions#tabline#fnamemod = ':p:s?index.js??'
    " let g:airline#extensions#tabline#fnamemod = ':.'
    let g:airline#extensions#tabline#fnamecollapse = 1

    let g:airline#extensions#tabline#fnametruncate = 0

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
  endif

  if exists('g:plugs["syntastic"]')
    let g:syntastic_javascript_checkers=['eslint']
  endif

  if exists('g:plugs["ultisnips"]')
    let g:UltiSnipsExpandTrigger="<c-a>"
    " let g:UltiSnipsJumpForwardTrigger="<c-b>"
    " let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  endif

  if exists('g:plugs["nerdcommenter"]')
    " add extra space before comment (// abc instead of //abc)
    let NERDSpaceDelims = 1
  endif

  if exists('g:plugs["tern_for_vim"]')
    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature_in_pum = 1
    " autocmd FileType javascript setlocal omnifunc=tern#Complete
    "
    let g:tern_set_omni_function = 0
    let g:tern_map_keys=1
    let g:tern_show_argument_hints='on_hold'
  endif

  if exists('g:plugs["neomake"]')
    " use neomake instead of syntastic
    let syntastic_check_on_wq = 0
    augroup neomake_config
      autocmd!
      autocmd BufWritePost * Neomake
    augroup END

    let g:neomake_javascript_eslint_exe = system('echo -n `npm bin`') . '/eslint'
    " let g:neomake_javascript_eslint_exe = 'eslint'
    " let g:neomake_javascript_flow_maker = {
            " \ 'exe': system('echo -n `npm bin`') . '/flow',
            " \ 'args': ['--json'],
            " \ 'errorformat': '%EFile "%f"\, line %l\, characters %c-%.%#,%Z%m',
            " \ 'buffer_output': 1
            " \ }
    let g:neomake_javascript_enabled_makers = ['eslint']
  endif

  if exists('g:plugs["vim-flow"]')
    let g:flow#enable = 1
    let g:flow#omnifunc = 0 "prevent overwriting existing omnifunc
    " let g:flow#autoclose
    " let g:flow#qfsize
    setl omnifunc=flowcomplete#Complete
    nnoremap gh :FlowGetImporters<CR>
    nnoremap gt :FlowType<CR>
  endif

  if exists('g:plugs["vimfiler.vim"]')
    let g:vimfiler_as_default_explorer = 1
    nnoremap - :VimFilerBufferDir -find<CR>
  endif

  if exists('g:plugs["vim-jsx"]')
    let g:jsx_ext_required=1
  endif

  if exists('g:plugs["vim-jsdoc"]')
    let g:jsdoc_allow_input_prompt = 0
    let g:jsdoc_underscore_private = 1
    let g:jsdoc_enable_es6 = 1
    let g:jsdoc_param_description_separator = ' - '
  endif

  if exists('g:plugs["neopairs.vim"]')
    let g:neopairs#enable = 1
  endif

  if exists('g:plugs["denite.nvim"]')
		call denite#custom#map('insert', 'jk', '<denite:enter_mode:normal>', 'noremap')
    nnoremap <silent> <C-P> :Denite buffer file_mru file/rec<cr>
    nnoremap gr :Denite grep<CR>
    vnoremap gr y:Denite grep:::<C-R>0

    " Ripgrep command on grep source
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

    " Narrow by path in grep source.
    call denite#custom#source('grep', 'converters', ['converter/abbr_word'])
  endif

  if exists('g:plugs["deoplete.nvim"]')
    " Use deoplete.
    " let g:tern_request_timeout = 1
    " let g:tern_show_signature_in_pum = 0  " This do disable full signature type on autocomplete

    " deoplete tab-complete
    " inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
    " " ,<Tab> for regular tab
    inoremap <Leader><Tab> <Space><Space>

    inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Space>\<Space>"

    let g:deoplete#enable_at_startup = 1
    " Enable file source completion from the current buffer path
    let g:deoplete#file#enable_buffer_path = 1

    " if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni_patterns = {}
      let g:deoplete#omni_patterns.javascript = '\.\w*'

      let g:deoplete#omni#input_patterns = {}
      let g:deoplete#omni#input_patterns.javascript = ['\.\w*', '\= \w*']
    " endif
    " let g:deoplete#disable_auto_complete = 1
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

    let g:deoplete#enable_ignore_case = 1
    " let g:deoplete#auto_complete_start_length = 0
    " let g:auto_complete_start_length = 0
    " let g:deoplete#enable_refresh_always = 1
    " let g:deoplete#enable_debug = 1
    " let g:deoplete#enable_profile = 1
    " let g:deoplete#sources#tss#javascript_support = 1
    "call deoplete#enable_logging('DEBUG', $HOME.'/deoplete.log') 
    "
		inoremap <expr><C-z> deoplete#mappings#manual_complete()
  endif

  if exists('g:plugs["vim-json"]')
    " vim-json config -- don't hide double qoutes
    let g:vim_json_syntax_conceal = 0
  endif

  if exists('g:plugs["vim-yankstack"]')
    call yankstack#setup()
  endif

  if exists('g:plugs["targets.vim"]')
    " Add curly braces as argument separator
    let g:targets_argOpening = '[({[]'
    let g:targets_argClosing = '[]})]'
  endif

" Mappings - Start
  noremap <Leader>ve :e $MYVIMRC<CR>
  noremap <Leader>/ :nohl<CR>
  noremap <F7> mzgg=G`z<CR>
  " noremap <Leader>oc :!chrome file:///%:p 
  noremap <Leader>oc :!open -a "Google Chrome" file:///%:p 
  noremap <Leader>bn <nop> " use ]b instead
  noremap <Leader>bp <nop>
  noremap <Leader>bd :bd<CR>
  noremap <Leader>bo :BufOnly<CR>
  noremap <Leader>bb :b#<CR>
  noremap <Leader>= =']
  nnoremap <SPACE> za
  vnoremap <C-x> :!pbcopy<CR>  
  vnoremap <C-c> :w !pbcopy<CR><CR> 

  " Shortcut: Edit/Write file in same directory
  noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
  " noremap <Leader>w :w <C-R>=expand("%:p:h") . "/" <CR>

  inoremap jk <ESC>
  inoremap <ESC> <nop>

  " Easy align
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

  let g:enable_tern_goto = 0

  " Go to definition
  function! GoToDef()
    redir => s:messages
      FlowJumpToDef
    redir END

    let s:lastmsg=get(split(s:messages, "\n"), -1, "")

    if (s:lastmsg ==? 'No definition found' || s:lastmsg ==? 'cannot find definition') && g:enable_tern_goto == 1
      redir => s:messages
        TernDef
      redir END
      let s:lastmsg=get(split(s:messages, "\n"), -1, "")

      if s:lastmsg ==? 'timed out'
        TernDef
      endif
    endif
  endfunction

  nnoremap gd :call GoToDef()<CR>

  " move lines up or down mappings
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv

  " same mappings on mac
  nnoremap â :m .+1<CR>==
  nnoremap Ë :m .-2<CR>==
  inoremap â <Esc>:m .+1<CR>==gi
  inoremap Ë <Esc>:m .-2<CR>==gi
  vnoremap â :m '>+1<CR>gv=gv
  vnoremap Ë :m '<-2<CR>gv=gv

  " move windows around easily
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l

  " Search for visually selected text mapping
  vnoremap // y/<C-R>"<CR>

  " keep the current visual block selection active after changing indent with '<' or '>'
  vnoremap > >gv
  vnoremap < <gv

  " Unmap unnecessary default key mappings
  nnoremap Q <NOP>
  nnoremap + <NOP>

  " toggle relativenumber
  function! NumberToggle()
    if(&relativenumber == 1)
      set norelativenumber
    else
      set relativenumber
    endif
  endfunc

  nnoremap <C-n> :call NumberToggle()<cr>

  if has('mac')
    nmap π <Plug>yankstack_substitute_older_paste
    nmap ∏ <Plug>yankstack_substitute_newer_paste
  endif

" Commands
  " Eslint - External eslint --fix command for current file
  " command! EslintFix !eslint % --fix
  command! EslintFix execute '!' . g:neomake_javascript_eslint_exe . ' % --fix' | :e | :Neomake

" Autocommands
  augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript setlocal omnifunc=
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
  augroup END
