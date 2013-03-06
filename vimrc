" use vim settings, not vi settings
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-endwise'
Bundle 'tsaleh/vim-align'
Bundle 'tsaleh/vim-matchit'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/ZoomWin'
Bundle 'gregsexton/MatchTag'
Bundle 'Townk/vim-autoclose'
Bundle 'kogakure/vim-sparkup'
Bundle 'mileszs/ack.vim'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'rgarver/Kwbd.vim'
Bundle 'majutsushi/tagbar'
Bundle 'juvenn/mustache.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'danro/rename.vim'
Bundle 'xolox/vim-session'
Bundle 'w0ng/vim-hybrid'
Bundle 'airblade/vim-gitgutter'

so $HOME/.vim/statusline
so $HOME/.vim/functions

" setup
" ----------------------------------------------------
filetype plugin indent on
syntax on

let g:hybrid_use_Xresources = 1
colorscheme hybrid

" Use UTF-8
set encoding=utf-8

" allow backspace in insert mode
set backspace=indent,eol,start

" store lots of :cmdline history
set history=1000

" show incomplete cmds down the bottom
set showcmd

" show current mode down the bottom
set showmode

" no sounds
set visualbell

" reload files changed outside vim
set autoread

" allow background files
set hidden

" turn off swap files
set noswapfile
set nobackup
set nowb

" relative line numbers in normal mode, normal in insert
set rnu
autocmd InsertEnter * setl nu
autocmd InsertLeave * setl rnu

" highlight all search matches
set hlsearch

let g:netrw_dirhistmax=0

" some stuff to ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" indentation & whitespace
" ----------------------------------------------------
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" split to the right, not left
set splitright

" split to the bottom, not top
set splitbelow

" show invisibles as per below
set list!
set list listchars=tab:>-,trail:.,precedes:<,extends:>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" show matching () {} etc
set showmatch

" fold based on indent
set foldmethod=indent

" prevent folding by default
set foldlevelstart=20

autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead *.zsh-theme set filetype=zsh

" auto-strip trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" scrolling
" ----------------------------------------------------
set scrolloff=8
set sidescrolloff=15
set sidescroll=1


" mappings
" ----------------------------------------------------

" make w unesseassary in ctrl-w-hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" faster
nmap ; :

" edit file relative to current file
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>


" lead with ,
let mapleader = ","

" exit to normal mode with 'jj'
inoremap jj <ESC>

" use a bar-shaped cursor for insert mode, even through tmux.
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" replace current word
map <leader>rr :1,$s/\(<c-r>=expand("<cword>")<cr>\)/

" find current word
map <leader>f :Ack <c-r>=expand("<cword>")<cr><cr>

" Bind :Q to :q
command! Q q
command! Qall qall


" plugin settings
" ----------------------------------------------------

" zoom zomm
map <leader><leader> :ZoomWin<CR>

" ag - faster ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" ingore these when searching for files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(jpg|png|gif|psd)$',
  \ }

" don't autoload last session
let g:session_autoload = 'no'

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
