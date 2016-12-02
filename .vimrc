" .vimrc by Eric Stoycon

"Vundle Plugin Manager 
set nocompatible
filetype off
"set rtp
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

"All plugins here
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimplyFold'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'aperzdc/vim-template'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


"End of Vundle plugins
call vundle#end()
filetype plugin indent on

"Basic Settings
syntax on
let python_highlight_all=1
set title
set number
set history=9000
set timeoutlen=300
set noexrc
set fenc=utf-8
set formatoptions+=n
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s*
set viminfo+=!
set nomore
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set hidden
set fileformats=unix,dos,mac
set iskeyword+=_,$,@,%,#
set noerrorbells
set wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set wildmode=list:longest
set shortmess=a

"Color Stuff
colorscheme seti
let s:colorful_term = (&term =~ "xterm") || (&term =~"screen")
let g:erlangHighlightBif = 2
let g:erlangHighLighOperators = 2

"Vim UI
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵,extends:>,precedes:<
set matchtime=5
set report=0
set ruler
set scrolloff=10
set shortmess=aOstT
set showcmd
set showmatch
set sidescrolloff=10
set completeopt=menuone

"Tab Settings
set tabstop=5
set shiftwidth=4
set expandtab
set shiftround
set smarttab
set formatoptions=rq
set ignorecase
set infercase
set nowrap
set smartcase

"Screen Splitting
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Folding
set foldenable
set foldmethod=indent
set foldlevel=100
set foldopen=block,hor,mark,percent,quickfix,tag
function SimpleFoldText() " {
        return getline(v:foldstart).' '
endfunction " }
set foldtext=SimpleFoldText()

"Mappings
set pastetoggle=<F2>
nmap <C-N><C-N> :set invnumber<CR>
nmap <C-L><C-L> :set list<CR>
nmap <C-K><C-K> :set nolist<CR>

"Other indention settings
au BufNewFile,BufRead silent *.js, *.html, *.css
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2

"Python Specific Settings
au BufNewFile,BufRead silent *.py
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=79
    set expandtab
    set autoindent
    set fileformat=unix

"====[ Show when lines extend past column 80 ]=================================>-<=====================

highlight ColorColumn ctermfg=208 ctermbg=Black

function! MarkMargin (on)
    if exists('b:MarkMargin')
        try
            call matchdelete(b:MarkMargin)
        catch /./
        endtry
        unlet b:MarkMargin
    endif
    if a:on
        let b:MarkMargin = matchadd('ColorColumn', '\%81v\s*\S', 100)
    endif
endfunction

augroup MarkMargin
    autocmd!
    autocmd  BufEnter  *       :call MarkMargin(1)
    autocmd  BufEnter  *.vp*   :call MarkMargin(0)
augroup END
