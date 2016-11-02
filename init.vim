set nocompatible              " be iMproved, required

" Load plugins
  let b:plugin_dir = ''

  if has('mac')
    let b:plugin_dir = '~/.vim/plugged'
  endif

  function! DeopletePostUpdate(arg)
    UpdateRemotePlugins
  endfunction

  call plug#begin(b:plugin_dir)
    Plug 'Shougo/deoplete.nvim', { 'do': function('DeopletePostUpdate') }
    " Plug 'mhartington/deoplete-typescript'
    Plug 'carlitux/deoplete-ternjs'
    " Plug 'Shougo/neoinclude.vim'
    Plug '1995eaton/vim-better-javascript-completion'
    Plug 'ternjs/tern_for_vim', {'do': 'npm install'}

    " Linting
    Plug 'benekastah/neomake'

    " UI
    Plug 'zeis/vim-kolor'
    Plug 'nanotech/jellybeans.vim'
    Plug 'bling/vim-airline'
    Plug 'airblade/vim-gitgutter'

    " Language specifics
    Plug 'othree/yajs.vim'
    Plug 'elzr/vim-json'
    Plug 'mxw/vim-jsx'
    Plug 'isRuslan/vim-es6'
    Plug 'jtratner/vim-flavored-markdown'
    Plug 'moll/vim-node'
    Plug 'heavenshell/vim-jsdoc'
    Plug 'tpope/vim-markdown'
    Plug 'flowtype/vim-flow', {'do': 'npm install -g flow-bin', 'for': 'javascript'}

    " Unite
    Plug 'Shougo/unite.vim'
    Plug 'Shougo/neomru.vim'
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug 'Shougo/unite-outline'
    Plug 'ujihisa/unite-colorscheme'
    Plug 'osyo-manga/unite-quickfix'

    " File explorer
    Plug 'Shougo/vimfiler.vim'

    " Text manipulation
    Plug 'AndrewRadev/splitjoin.vim' " Split/join lists/objects over lines
    Plug 'junegunn/vim-easy-align' " Align text
    Plug 'tpope/vim-surround' " Surround text with parens, brackets, tags etc.
    Plug 'tommcdo/vim-exchange' " Exchange text
    " Plug 'jiangmiao/auto-pairs' " Automatically insert or delete brackets, parens, quotes in pairs
    Plug 'Shougo/neopairs.vim'
    Plug 'wellle/targets.vim' " Adds more targets to operate on e.g. change inside parens or delete item in list
    Plug 'tpope/vim-abolish' " Easily search for, substitute, and abbreviate multiple variants of a word
    Plug 'scrooloose/nerdcommenter' " Insert/remove comments
    " Plug 'Raimondi/delimitMate' " Autimatically close quotes, parenthesis, brackets etc.

    " Moving within document
    Plug 'Lokaltog/vim-easymotion'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-unimpaired' " Pairs of handy bracket mappings

    " Snippets
    Plug 'SirVer/ultisnips'

    " View information
    Plug 'majutsushi/tagbar'
    Plug 'sjl/gundo.vim' " Show undo tree
    Plug 'tpope/vim-fugitive' " Git commands
    Plug 'tommcdo/vim-fugitive-blame-ext' " Shows commit message for current line in Gblame

    " Not yet categorized
    Plug 'BufOnly.vim'
    Plug 'maxbrunsfeld/vim-yankstack'
    Plug 'tpope/vim-repeat'
    " Plug 'tpope/vim-vinegar' " Combine with netrw
    Plug 'szw/vim-tags'
    Plug 'freitass/todo.txt-vim'


    " Not working
    " Plug 'bigfish/vim-js-context-coloring', {'branch': 'neovim', 'do' : 'npm install --update'}
    " if has('nvim')
      " Plug 'neovim/node-host', {'do': 'npm install --update'}
    " endif
  call plug#end()

" Basic settings
  filetype plugin indent on

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
  set tabstop=2

  " do not wrap in the middle of a word
  set linebreak

  " use relative numbers by default, unless when not in focus
  set relativenumber
  au FocusLost * :set norelativenumber
  au FocusGained * :set relativenumber

  let mapleader = ','

  " let g:python_host_prog = '/usr/bin/python'

" Settings in other files
  exec "source " . expand("<sfile>:p:h") . "/folding.vim"
  exec "source " . expand("<sfile>:p:h") . "/reveal.vim"
  exec "source " . expand("<sfile>:p:h") . "/large-files.vim"

" Plugin settings
  if exists('g:plugs["vim-airline"]')
    let g:airline#extensions#tabline#enabled = 1
    " let g:airline#extensions#tabline#fnamemod = ':p:s?index.js??'
    let g:airline#extensions#tabline#fnamemod = ':.'
    let g:airline#extensions#tabline#fnamecollapse = 0

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
    let g:tern_map_keys=1
    let g:tern_show_argument_hints='on_hold'

    nnoremap gd :TernDef<CR>
  endif

  if exists('g:plugs["neomake"]')
    " use neomake instead of syntastic
    let syntastic_check_on_wq = 0
    augroup neomake_config
      autocmd!
      autocmd BufWritePost * if exists(":Neomake") | Neomake | endif
    augroup END

    let g:neomake_javascript_eslint_exe = system('echo -n `npm bin`') . '/eslint'
    let g:neomake_javascript_flow_maker = {
            \ 'args': ['--old-output-format', '--one-line'],
            \ 'errorformat': '%E%f:%l:%c\,%n: %m',
            \ 'mapexpr': 'substitute(v:val, "\\\\n", " ", "g")'
            \ }
    let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
  endif

  if exists('g:plugs["vim-flow"]')
    let g:flow#enable = 0
  endif

  if exists('g:plugs["vimfiler.vim"]')
    let g:vimfiler_as_default_explorer = 1
    nnoremap - :VimFilerBufferDir -find<CR>
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

  if exists('g:plugs["unite.vim"]')
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    " call unite#filters#sorter_default#use(['sorter_rank'])
    " "call unite#custom#source('file_rec/async','sorters','sorter_rank', )
    " " replacing unite with ctrl-p
    " let g:unite_data_directory='~/.vim/.cache/unite'
    " let g:unite_enable_start_insert=1
    " let g:unite_source_history_yank_enable=1
    " let g:unite_prompt='» '
    " let g:unite_split_rule = 'botright'
    " if executable('ag')
      " let g:unite_source_grep_command='ag'
      " let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
      " let g:unite_source_grep_recursive_opt=''
    " endif
    let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--vimgrep'
    let g:unite_source_line_enable_highlight = 1
    call unite#custom#source('buffer,file,file_rec,file_rec/async', 'sorters', 'sorter_selecta')
    call unite#custom#source('neomru/file', 'converters', ['converter_relative_abbr'])

    " function! Grep_syntax(args, context)
      " set syntax=javascript
    " endfunction
    " call unite#custom#source('grep', 'on_syntax', function('Grep_syntax'))

    nnoremap <silent> <c-p> :Unite -auto-resize -start-insert -direction=botright buffer neomru/file file_rec/async<cr>
    nnoremap gr :Unite grep:.<CR>
    nnoremap <Leader>f :UniteWithCursorWord grep:.<CR>
    nnoremap <Leader>u<CR> :Unite<CR>
    nnoremap <Leader>ub :Unite buffer<CR>
    nnoremap <Leader>u/ :Unite line<CR>
    nnoremap <Leader>ur :UniteResume<CR>
    nnoremap <Leader>us :Unite ultisnips<CR>
    nnoremap <Leader>uq :Unite quickfix<CR>
    nnoremap <Leader>ul :Unite location_list<CR>
    nnoremap <Leader>um :Unite mapping<CR>

    vnoremap gr y:Unite grep:.::<C-R>"

    autocmd FileType unite call s:unite_my_settings()
    function! s:unite_my_settings()"{{{
      imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
      imap <buffer> ' <Plug>(unite_quick_match_default_action)
      nmap <buffer> ' <Plug>(unite_quick_match_default_action)
      imap <buffer><expr> x
            \ unite#smart_map('x', "\<Plug>(unite_quick_match_jump)")
      nmap <buffer> x <Plug>(unite_quick_match_jump)
      nmap <buffer> <C-j> <Plug>(unite_toggle_auto_preview)
      nmap <buffer> <C-r> <Plug>(unite_narrowing_input_history)
      imap <buffer> <C-r> <Plug>(unite_narrowing_input_history)

      let unite = unite#get_current_unite()
      if unite.profile_name ==# 'search'
        nnoremap <silent><buffer><expr> r     unite#do_action('replace')
      else
        nnoremap <silent><buffer><expr> r     unite#do_action('rename')
      endif
    endfunction"}}}
  endif

  if exists('g:plugs["ultisnips"]') && exists('g:plugs["deoplete.nvim"]')
    " Ultisnips and deoplete
    " Make <CR> smart
    let g:ulti_expand_res = 0
    function! Ulti_ExpandOrEnter()
      " First try to expand a snippet
      call UltiSnips#ExpandSnippet()
      if g:ulti_expand_res
        " if successful, just return
        return ''
      elseif pumvisible()
        " if in completion menu - just close it and leave the cursor at the
        " end of the completion
        return deoplete#mappings#close_popup()
      else
        " otherwise, just do an "enter"
        return "\<return>"
      endif
    endfunction
    inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>
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

    if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
    endif
    " let g:deoplete#disable_auto_complete = 1
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

    let g:deoplete#enable_ignore_case = 1
    let g:deoplete#auto_complete_start_length = 0
    let g:auto_complete_start_length = 0
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#enable_debug = 1
    let g:deoplete#enable_profile = 1
    let g:deoplete#sources#tss#javascript_support = 1
    "call deoplete#enable_logging('DEBUG', $HOME.'/deoplete.log') 
  endif

  if exists('g:plugs["vim-json"]')
    " vim-json config -- don't hide double qoutes
    let g:vim_json_syntax_conceal = 0
  endif

  if exists('g:plugs["vim-yankstack"]')
    call yankstack#setup()
  endif

" Mappings - Start
  noremap <Leader>ve :e $MYVIMRC<CR>
  noremap <Leader>/ :nohl<CR>
  noremap <F7> mzgg=G`z<CR>
  " noremap <Leader>oc :!chrome file:///%:p 
  noremap <Leader>oc :!open -a "Google Chrome" file:///%:p 
  noremap <Leader>bn <nop> " use ]b instead
  noremap <Leader>bp <nop>
  noremap <Leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>
  noremap <Leader>bo :BufOnly<CR>
  noremap <Leader>bb :b#<CR>
  noremap <Leader>= =']
  nnoremap <SPACE> za
  vnoremap <C-x> :!pbcopy<CR>  
  vnoremap <C-c> :w !pbcopy<CR><CR> 

  " Shortcut: Edit/Write file in same directory
  noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
  noremap <Leader>w :w <C-R>=expand("%:p:h") . "/" <CR>

  inoremap jk <ESC>
  inoremap <ESC> <nop>

  " Easy align
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

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
  vmap > >gv
  vmap < <gv

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
  command! EslintFix !eslint % --fix

" Autocommands
  augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  augroup end

  augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
  augroup END

" Trash (Old settings no longer in use)
  " recreate tags file for js files
  " nnoremap ,t :call jobstart([&shell, &shcf, "find . -type f -iregex .*\.js -not -path './node_modules/*' -exec jsctags {} -f \; \| sed '/^$/d' \| sort > tags"])

  " kill netrw buffer when hidden
  " autocmd FileType netrw setl bufhidden=wipe
