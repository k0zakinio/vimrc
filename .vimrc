" Plugins
filetype off                  " Req'd for vundle
set rtp+=~/.vim/bundle/vundle " Vundle prelude
call vundle#rc()              " ^

Plugin 'Shougo/neocomplete.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'myusuf3/numbers.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'mattn/emmet-vim'

" Post-vundle
filetype plugin indent on     " Req'd for vundle

"standard stuff
set nocompatible
filetype on
"" Solarized
if !has("gui_running")
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
endif

set background=dark
colorscheme solarized

"" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='wombat'

"" General
set ruler                     " Turn on the ruler
syntax on                     " Syntax highlighting
set nocompatible              " Eliminate backwards-compatability
set number                    " Show line numbers
set nowrap                    " Stop line wrapping (lines extend beyond page)
set noswapfile			" stop generating .swp files
" Line wrap
"set linebreak                 " Break lines at word (requires Wrap lines)
"set showbreak=+++             " Wrap-broken line prefix
"set textwidth=100             " Line wrap (number of cols)
set showmatch                 " Highlight matching brace
set visualbell                " Use visual bell (no beeping)
set autoread		      " automatically update
set hlsearch                  " Highlight all search results
set smartcase                 " Enable smart-case search
set gdefault                  " Always substitute all matches in a line
set ignorecase                " Always case-insensitive
set incsearch                 " Searches for strings incrementally

set autoindent                " Auto-indent new lines
set shiftwidth=2              " Number of auto-indent spaces
set smartindent               " Enable smart-indent
set smarttab                  " Enable smart-tabs
set softtabstop=2             " Number of spaces per Tab

"" Advanced
set ruler                     " Show row and column ruler information
set undolevels=1000           " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>

" resolve escape delay on vim modes
set timeout         " Do time out on mappings and others
set timeoutlen=2000 " Wait {num} ms before timing out a mapping

" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if !has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=300
      au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#sources#buffer#cache_limit_size = 50000
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" delimitMate
let delimitMate_expand_cr = 1
filetype indent plugin on

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"autoindent
set conceallevel=1
let g:indentLine_conceallevel=1

