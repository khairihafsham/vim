" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" editorconfig to make formatting compatible with IDE guys
Plugin 'editorconfig/editorconfig-vim'

" cosco adding ;, at the end
Plugin 'lfilho/cosco.vim'

" Omnisharp
Plugin 'OmniSharp/omnisharp-vim'

" elixir stuff
Plugin 'elixir-editors/vim-elixir'

" something to make vim nicer in tmux
" Plugin 'wincent/terminus'

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" pep8 indent
Plugin 'hynek/vim-python-pep8-indent'

" nerdtree
Plugin 'scrooloose/nerdtree'

" ultisnips
Plugin 'SirVer/ultisnips'

" vim snippets
Plugin 'honza/vim-snippets'

" zen coding
Plugin 'mattn/emmet-vim'

" closetag
Plugin 'vim-scripts/closetag.vim'

" surround
Plugin 'tpope/vim-surround'

" supertab
Plugin 'ervandew/supertab'

" jinja-vim
Plugin 'mitsuhiko/vim-jinja'

" syntastic
Plugin 'scrooloose/syntastic'

" color wombat
Plugin 'khairihafsham/Wombat'

" slimv, lisp support for vim
Plugin 'vim-scripts/slimv.vim'

" pretty status line
Plugin 'bling/vim-airline'

" js better syntax
Plugin 'jelera/vim-javascript-syntax'

" gitgutter
Plugin 'airblade/vim-gitgutter'

" tagbar
Plugin 'majutsushi/tagbar'

" ctrlP
Plugin 'kien/ctrlp.vim'

" delimitmate
Plugin 'Raimondi/delimitMate'

" fugitive
Plugin 'tpope/vim-fugitive'

" use local eslint
Plugin 'mtscout6/syntastic-local-eslint.vim'

call vundle#end()

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set relativenumber

set hlsearch
set langmenu=en_US.UTF-8
colorscheme wombat 
" set autoindent
" set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set backupdir=~/.vim_backups
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" autocomplete funcs and identifiers for languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete

" ft indent
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 sts=4
autocmd FileType css setlocal shiftwidth=2 tabstop=2 sts=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 sts=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 sts=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 sts=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 sts=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 sts=2

" not sure, from GVIM i think
"
" let g:snips_author = 'khairi'
" set guioptions-=m
" set guioptions-=T
" set mousemodel=popup

" if has("gui_running")
"   " GUI is running or is about to start.
"   " Maximize gvim window.
"   set lines=30 columns=120
" else
"   " This is console Vim.
"   if exists("+lines")
"     set lines=30
"   endif
"   if exists("+columns")
"     set columns=100
"   endif
" endif

" pressing backspace jumps to upper line when reached the end
set backspace=2

" Vim change dir reference to current file's
set autochdir

" padding 8 lines top and bottom
set scrolloff=8

" add line indicator at 120 char
" do not commit this, this is for making it compatible with work standards
" not my personal preference
set colorcolumn=120

" enable line number
set number

" control+a to select all
" ":nmap <C-a> ggVG<CR>

" ignore .pyc file in nerdtree
let NERDTreeIgnore = ['\.pyc$']

" set current cursor position to be blue
highlight Cursor guifg=white guibg=steelblue
highlight iCursor guifg=white guibg=steelblue

au BufNewFile,BufRead *.jinja2 set filetype=htmljinja
au BufNewFile,BufRead *.djt set filetype=htmldjango

ca WQ wq
ca Wq wq
ca W w
ca Q q
ca Qa qa
ca Cw cw
ca cW cw

" syntastic config
let g:syntastic_python_flake8_post_args='--ignore=W601,E121,E122,E123,E124,E126,E127,E128'
let g:syntastic_html_checkers = ['']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = '$(npm bin)/eslint'
let g:syntastic_ruby_checkers = ['ruby/mri','rubocop']

" toggling tagbar
nmap <F9> :TagbarToggle<CR>

set tags=tags;/

" show full hierarchy from tagbar (this option is actually passed to
" currenttag in tagbar)
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#whitespace#enabled = 0


" storing swap files in a centralized place and working around the issue of
" adding .swp into .gitignore
" 
" prevents vim from checking if multiple users are editing the same file, but
" should not affect me working locally
set directory^=$HOME/.vim/tmp//

let g:ctrlp_custom_ignore = {'dir':  '\v[\/](node_modules|vendor|coverage)$'}

set cursorcolumn
set cursorline

" let g:SuperTabDefaultCompletionType = "context"

" for cosco to work
autocmd FileType cs nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
autocmd FileType cs imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)

" Omnisharp related
" ########################
let g:OmniSharp_server_use_mono = 1

set completeopt=longest,menuone

" Fetch semantic type/interface/identifier names on BufEnter and highlight them
let g:OmniSharp_highlight_types = 1

augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " Update the highlighting whenever leaving insert mode
    autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()

    " Alternatively, use a mapping to refresh highlighting for the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
let g:OmniSharp_want_snippet=1
