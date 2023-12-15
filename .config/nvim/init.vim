lua require('init')

colorscheme peachpuff "or 'shine'

packadd! cfilter

set number cursorline

set smartindent copyindent

set expandtab shiftwidth=4 tabstop=4 softtabstop=4

set path+=**
set wildignorecase
set wildignore+=*/.git,**/node_modules/**,*.o

set showmatch

set ignorecase smartcase 

"let g:netrw_banner=0

au BufRead COMMIT_EDITMSG set textwidth=72

autocmd FileType c,cpp setlocal equalprg=clang-format | set fdm=syntax

" autocmd FileType make setlocal noexpandtab

" yank from cursor to end of line
map Y y$

inoremap jj <ESC>

" Map space to leader key
map <space> \

map <C-p> :FZF<CR>

nnoremap <leader>f :call fzf#run(fzf#wrap({'source': 'git ls-files', 'sink': 'e'}))<CR>

nnoremap <leader>l :ls<CR>:b<space>

" Insert empty line above/below
nnoremap <leader>n m`o<ESC>``
nnoremap <leader>p m`O<ESC>``

" disable highlighting
nnoremap <leader>k :noh<CR>

" write file
nnoremap <leader>s :w<CR>

" Run `make`
nnoremap <leader>m :make <CR><CR>

" some mappings for common git commands
nnoremap <leader>gl :! git log %:p<CR>
nnoremap <leader>gh :! git log -p %:p<CR>
nnoremap <leader>gd :! git diff %:p<CR>
nnoremap <leader>ga :! git add %:p<CR><CR>
nnoremap <leader>gr :! git restore %:p<CR><CR>
nnoremap <leader>gc :! git restore --staged %:p<CR><CR>
nnoremap <leader>gg :! git commit<CR>
nnoremap <leader>gb :! git blame %:p<CR><CR>

" replace word under cursor
nmap <leader>q :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
