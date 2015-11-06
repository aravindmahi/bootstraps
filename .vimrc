" Standard vim options
" ---------------------
set number				    " show line numbers
set autoread                " reload files if changed outside vim
set encoding=utf-8          " self-explanatory
colorscheme desert          " prefer the default scheme
set term=screen             " tmux specific setting
syntax on                   " turn syntax highlighting on
set autoindent              " always set autoindenting on
set backspace=2             " allow backspacing over everything in insert mode
set cindent                 " c code indenting
set diffopt=filler,iwhite   " keep files synced and ignore whitespace
set expandtab               " Get rid of tabs altogether and replace with spaces
set foldcolumn=2            " set a column incase we need it
set foldlevel=0             " show contents of all folds
set foldmethod=indent       " use indent unless overridden
set guioptions-=m           " Remove menu from the gui
set guioptions-=T           " Remove toolbar
set hidden                  " hide buffers instead of closing
set history=50              " keep 500 lines of command line history
set undolevels=50           " undo levels
set ignorecase              " Do case insensitive matching
set incsearch               " Incremental search
set laststatus=2            " always have status bar
set linebreak               " This displays long lines as wrapped at word boundries
set matchtime=10            " Time to flash the brack with showmatch
set nobackup                " Don't keep a backup file
set nowritebackup
set noswapfile              " Don't use swap files 
set nocompatible            " Use Vim defaults (much better!)
set nofen                   " disable folds
set notimeout               " i like to be pokey
set ttimeout                " timeout on key-codes
set ttimeoutlen=100         " timeout on key-codes after 100ms
set ruler                   " the ruler on the bottom is useful
set scrolloff=1             " dont let the curser get too close to the edge
set tabstop=4               " tab spaces
set shiftwidth=4            " Set indention level to be the same as softtabstop
set showcmd                 " Show (partial) command in status line.
set showmatch               " Show matching brackets.
set softtabstop=4           " Why are tabs so big?  This fixes it
set shiftround
set expandtab
set textwidth=0             " Don't wrap words by default
set textwidth=80            " This wraps a line with a break when you reach 80 chars
set virtualedit=block       " let blocks be in virutal edit mode
set wildmenu                " This is used with wildmode(full) to cycle options
set mouse=a                 " enable mouse
set hlsearch
set incsearch
set smartcase
set nowrap                  " dont auto wrap on load
set fo-=t                   " dont auto wrap when typing

" improve code completion
set completeopt=longest,menuone

" yank to clipboard
set clipboard=unamedplus,unamed,autoselect,exclude:cons\|linux.

"Turn on filetype plugins to automagically
"Grab commands for particular filetypes.
"Grabbed from $VIM/ftplugin
filetype plugin on
filetype indent on

" show trailing whitespaces
"highlight ExtraWhitespace ctermbg=red guibg=red
"autocmd Syntax * syn match ExtraWhitespace /\s\+\| \+\ze\t/
"map <Leader>x :%/s\s+$//

set colorcolumn=80
highlight ColorColumn cterm=None ctermbg=0 ctermfg=5

set cursorcolumn
augroup CursorColumn
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    au WinLeave * setlocal nocursorcolumn
augroup END
highlight CursorColumn cterm=None ctermbg=0 ctermfg=5

" spell check
" -----------
hi SpellBad cterm=underline ctermbg=6 ctermfg=2 gui=undercurl guisp=Red

" Latex Mode
" ----------
set modeline
let g:tex_fold_enabled=1
let g:tex_comment_nospell=1
let g:tex_flavor="pdflatex --shell-escape"
"compiler tex

" Set Title to file name
" -----------------------
function! SetTitle()
  if $TERM =~ "^screen"
    let l:title = 'vi: ' . expand('%:t')        
    
    if (l:title != 'vi: __Tag_List__')
      let l:truncTitle = strpart(l:title, 0, 15)
      silent exe '!echo -e -n "\033k' . l:truncTitle . '\033\\"'     
    endif
  endif
endfunction

" Run it every time we change buffers
autocmd BufEnter,BufFilePost * call SetTitle()
