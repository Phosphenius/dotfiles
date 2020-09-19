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
Plug 'tpope/vim-surround'

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
"set spell
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

" toggle NERD tree file explorer
"map <C-n> :NERDTreeToggle<CR>
map <C-n> :call ToggleNERDTree()<CR>

" FZF
map <C-p> :Files!<CR>

" use space as leader
map <space> \

" yank from cursor to end of line
map Y y$

" tab navigation via <TAB> key
nnoremap <TAB> gt
nnoremap <leader><TAB> gT

" insert empty line above/below
nnoremap <leader>n :norm mxo<ESC>`x
nnoremap <leader>p :norm mxO<ESC>`x

map <leader>x :call FormatFile()<CR>

function! ToggleNERDTree()
  NERDTreeToggle
  " Set NERDTree instances to be mirrored
  silent NERDTreeMirror
endfunction

function FormatFile()
  let l:lines="all"
  pyf /usr/share/clang/clang-format.py
endfunction

" Bind "//" to a fzf-powered buffer search
nmap // :BLines!<CR>

" Bind "??" to a fzf-powered project search
nmap ?? :Rg!<CR>

" toggle tagbar
nnoremap <leader>o :TagbarToggle<CR>

" fzf project files
nnoremap <leader>f :GFiles!<CR>

" fzf history
nnoremap <leader>b :History:<CR>

" fzf commands
nnoremap <leader>c :Commands<CR>

" fzf open buffers
nnoremap <leader>l :Buffers!<CR>

" disable highlighting
nnoremap <leader>h :noh<CR>

" write file
nnoremap <leader>w :w<CR>

" write session (probably don't really need that)
nnoremap <leader>z :mks!<CR>

" run make
nnoremap <leader>m :make -j5<CR><CR>

" some mappings for common git commands
nnoremap <leader>gl :! git log %:p<CR>
nnoremap <leader>gh :! git log -p %:p<CR>
nnoremap <leader>gd :! git diff %:p<CR>
nnoremap <leader>ga :! git add %:p<CR><CR>
nnoremap <leader>gr :! git restore %:p<CR><CR>
nnoremap <leader>gc :! git restore --staged %:p<CR><CR>
nnoremap <leader>gg :! git commit<CR>

" replace word under cursor
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" faster window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map jj to esc 
inoremap jj <ESC>

"disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

"insert TYPO3 var_dump function
command InsertT3Debug :normal i \TYPO3\CMS\Extbase\Utility\DebuggerUtility::var_dump(, __FILE__ . ':' . __LINE__);<ESC>T(i
