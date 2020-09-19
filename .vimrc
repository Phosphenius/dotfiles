set nocompatible
filetype off

"set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'

"navigation, searching, finding
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf.vim'

"VCS
Plug 'airblade/vim-gitgutter'

"editing
Plug 'scrooloose/nerdcommenter'

"file types & syntax
Plug 'elmar-hinz/vim.typoscript'
Plug 'mipmip/vim-fluid'
Plug 'othree/javascript-libraries-syntax.vim'

"cosmetic
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'
Plug 'xuyuanp/nerdtree-git-plugin'

call plug#end()

filetype plugin indent on

syntax on
set showcmd
set shortmess-=S
set updatetime=500 "refresh every 500ms
set encoding=utf-8
set t_Co=256
"filetype indent on
set autoindent
set tabstop=2
set shiftwidth=4
set expandtab
set softtabstop=2
set number
set relativenumber
set cursorline
set scrolloff=5
set sidescrolloff=15
set laststatus=2
set ruler
set path+=**
set autoread
set wildmenu
set wildignore=*~,*.pyc,*/.git/*,**/node_modules/**,**/_processed_/**,**/vendor/**,**/_temp_/**,**/typo3temp/**,**/var/**,**/sysext/**,**/fileadmin/**,**/vendor/**,*.d
set wildignorecase
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:NERDTreeIgnore=['\~$', '\.d', '\.o']
set copyindent
set showmatch
set ignorecase
set smartcase
" set smarttab
set hlsearch
set incsearch
set background=dark
set ttimeoutlen=25
"set spelllang=en,de
set spell
set splitbelow splitright

set noswapfile
set nowritebackup
set nobackup

au BufNewFile,BufRead *.py
    \ set foldlevel=99 |
    \ set foldmethod=indent |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

au BufRead COMMIT_EDITMSG set textwidth=72

au BufLeave,FocusLost,InsertEnter * set nornu
au BufEnter,FocusGained,InsertLeave * set rnu

autocmd FileType c,cpp setlocal equalprg=clang-format | set fdm=syntax

map <C-n> :NERDTreeToggle<CR>
map <space> \
map Y y$
nnoremap <TAB> gt
nnoremap <leader><TAB> gT
nnoremap <leader>n :norm mxo<ESC>`x
nnoremap <leader>p :norm mxO<ESC>`x
map <leader>c :pyf /usr/share/clang/clang-format.py<cr>
nnoremap <leader>l :ls<CR>:b<space>
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *
nnoremap <leader>h :noh<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>z :mks!<CR>
nnoremap <leader>m :make -j5<CR><CR>
nnoremap <leader>r :! $(find . -maxdepth 1 -executable -type f)<CR><CR>
nnoremap <leader>d :! gdb $(find . -maxdepth 1 -executable -type f)<CR><CR>
nnoremap <leader>o :make -j5<CR><CR> : ! $(find . -maxdepth 1 -executable -type f)<CR><CR>
nnoremap <leader>gl :! git log %:p<CR>
nnoremap <leader>gh :! git log -p %:p<CR>
nnoremap <leader>gd :! git diff %:p<CR>
nnoremap <leader>ga :! git add %:p<CR><CR>
nnoremap <leader>gr :! git restore %:p<CR><CR>
nnoremap <leader>gc :! git restore --staged %:p<CR><CR>
nnoremap <leader>gg :! git commit<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap jj <ESC>

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

command Insvd :normal i \TYPO3\CMS\Extbase\Utility\DebuggerUtility::var_dump(, __FILE__ . ':' . __LINE__);<ESC>T(i
