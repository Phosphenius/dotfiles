set nocompatible
filetype off

"set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'

"navigation, searching, finding
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"VCS
Plug 'airblade/vim-gitgutter'

"editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

"file types & syntax
Plug 'elmar-hinz/vim.typoscript'
Plug 'mipmip/vim-fluid'
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'

" slow af
"Plug 'othree/javascript-libraries-syntax.vim'

"cosmetic
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'

"debugging
"Plug 'vim-vdebug/vdebug'

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
let g:NERDTreeIgnore=['\~$', '\.o']
set copyindent
set showmatch
set ignorecase
set smartcase
" set smarttab
set hlsearch
set incsearch

set termguicolors
" let g:gruvbox_italic=1
"let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_contrast_light='hard'
set background=light

" colorscheme gruvbox
" colorscheme solarized
colorscheme solarized8
set ttimeoutlen=25
"set spelllang=en,de
"set spell
set splitbelow splitright

let g:airline_theme='solarized'

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
map <C-p> :Files<CR>

" use space as leader
map <space> \

" yank from cursor to end of line
map Y y$

" insert empty line above/below
"nnoremap <leader>n :norm mxo<ESC>`x
"nnoremap <leader>p :norm mxO<ESC>`x


nnoremap <leader>n m`o<ESC>``
nnoremap <leader>p m`O<ESC>``

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
nmap // :BLines<CR>

" Bind "??" to a fzf-powered project search
nmap ?? :Rg<CR>

" toggle tagbar
nnoremap <leader>o :TagbarToggle<CR>

" fzf project files
nnoremap <leader>f :GFiles<CR>

" fzf history
nnoremap <leader>b :History:<CR>

" fzf git changed files 
nnoremap <leader>j :GFiles?<CR>

" fzf open buffers
nnoremap <leader>l :Buffers<CR>

" disable highlighting
nnoremap <leader>k :noh<CR>

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
nnoremap <leader>gb :! git blame %:p<CR><CR>

nnoremap <leader>q :conf qa<CR>

" replace word under cursor
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" faster window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" TODO: Replace with custom toggle function
" Disabled because of collision with vdebug  
"noremap <silent> <F3> :set bg=dark<CR>
"noremap <silent> <F4> :set bg=light<CR>

" map jj to esc 
inoremap jj <ESC>

"disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>


"insert TYPO3 var_dump function
command InsertT3Debug :normal i \TYPO3\CMS\Extbase\Utility\DebuggerUtility::var_dump(, __FILE__ . ':' . __LINE__);<ESC>T(i

iabbrev t3debug \TYPO3\CMS\Extbase\Utility\DebuggerUtility::var_dump(, __FILE__ . ':' . __LINE__);

iabbrev ccopy Copyright (C) 2020 Luca Kredel

iabbrev gplhead /*
            \<CR>* <one line to give the program's name and a brief idea of what it does.>
            \<CR>* Copyright (C) 2020 Luca Kredel
            \<CR>*
            \<CR>* This program is free software: you can redistribute it and/or modify
            \<CR>* it under the terms of the GNU General Public License as published by
            \<CR>* the Free Software Foundation, either version 3 of the License, or
            \<CR>* (at your option) any later version.
            \<CR>*
            \<CR>* This program is distributed in the hope that it will be useful,
            \<CR>* but WITHOUT ANY WARRANTY; without even the implied warranty of
            \<CR>* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
            \<CR>* GNU General Public License for more details.
            \<CR>*
            \<CR>* You should have received a copy of the GNU General Public License
            \<CR>* along with this program.  If not, see <http://www.gnu.org/licenses/>.
            \<CR>*/
