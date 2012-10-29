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

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" nerdtree
Bundle 'scrooloose/nerdtree'

" snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

" zen coding
Bundle "mattn/zencoding-vim"

" closetag
Bundle "vim-scripts/closetag.vim"

" surround
Bundle "tpope/vim-surround"

" supertab
Bundle "ervandew/supertab"

" jinja-vim
Bundle "uggedal/jinja-vim"

" syntastic
Bundle "scrooloose/syntastic"

" color wombat
Bundle "vim-scripts/Wombat"

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
" if has("autocmd")
"   filetype plugin indent on
" endif

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

set hlsearch
set langmenu=en_US.UTF-8
colorscheme wombat 
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set backupdir=/home/jumanjisama/.vim_backups
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nnoremap <silent> <C-P> :NERDTreeToggle<CR> 

" autocomplete funcs and identifiers for languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

:nmap <C-V> "+gP
:imap <C-V> <ESC>l<C-V>i
:vmap <C-C> "+y
:inoremap <C-S> <Space><BS><C-\><C-O>:update<CR>
nnoremap <silent> <C-S> :w!<CR>
nnoremap <C-TAB> <C-W>w

let g:snips_author = 'khairi'
set guioptions-=m
set guioptions-=T
set mousemodel=popup

"php lint
map <C-B> :!php -l %<CR>

" pressing backspace jumps to upper line when reached the end
set backspace=2

" Vim change dir reference to current file's
set autochdir

" padding 8 lines top and bottom
set scrolloff=8

" add line indicator at 80 char
set colorcolumn=80

" enable line number
set number

" control+a to select all
:nmap <C-a> ggVG<CR>

" ignore .pyc file in nerdtree
let NERDTreeIgnore = ['\.pyc$']

" set current cursor position to be blue and stop
" fucking blinking when not in insert mode
"highlight Cursor guifg=white guibg=steelblue
"highlight iCursor guifg=white guibg=steelblue
"set guicursor=n-v-c:block-Cursor
"set guicursor+=n-v-c:blinkon0

au BufNewFile,BufRead *.jinja2 set filetype=jinja.html.javascript.css

" remap increment and decrement
:nnoremap <A-a> <C-a>
:nnoremap <A-x> <C-x>
