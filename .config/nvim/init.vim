" SickanK Vim config
"
"
"Note: install vim-plug if not present
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif
  if !1 | finish | endif
  if has('vim_starting')
    set nocompatible
    call plug#begin()
  endif



" # General Configurations
"
"
"

" mappings
nnoremap <a-m> :noh<CR>


" colorscheme - colors
syntax on
set t_Co=256

" leader key
let mapleader      = ' '
noremap <space> <Nop>


" basic config
filetype plugin indent on


" enable folding
set foldmethod=indent


" python indents
au BufNewFile,BufRead *.py
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set relativenumber
set laststatus=2


" auto close brackets 
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>


" spaces instead of tabs
set expandtab


" tabs is spaces
:set smarttab


" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=2


" cursor
let &t_SI = "\e[3 q"
let &t_EI = "\e[1 q"


" timeout
set ttimeout
set ttimeoutlen=1


" different characters
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.


" faasst
set ttyfast


" treat all .md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown


" jsx/tsx correct filetype
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact



" # Mappings
"
"
"


" ## Windows
"

" move cursor
nnoremap <Leader>j <c-w>j
nnoremap <Leader>k <c-w>k
nnoremap <Leader>h <c-w>h
nnoremap <Leader>l <c-w>l

" move
nnoremap <a-J> <c-w>J
nnoremap <a-K> <c-w>K
nnoremap <a-H> <c-w>H
nnoremap <a-L> <c-w>L

" split and exit 
nnoremap <Leader>s <c-w>s
nnoremap <Leader>v <c-w>v
nnoremap <a-q> <c-w>q
 

" ## Folding
"

nnoremap <C-space> zA
nnoremap <Leader>w zR
nnoremap <Leader>e zM
nnoremap <a-u> zj
nnoremap <a-i> zk


" ## Resizing
"

" arrow keys
nnoremap <a-Up> :normal <c-r>=Resize('+')<CR><CR>
nnoremap <a-Down> :normal <c-r>=Resize('-')<CR><CR>
nnoremap <a-Left> :normal <c-r>=Resize('<')<CR><CR>
nnoremap <a-Right> :normal <c-r>=Resize('>')<CR><CR>

" hjkl keys
nnoremap <a-Up> :normal <c-r>=Resize('+')<CR><CR>
nnoremap <a-k> :normal <c-r>=Resize('+')<CR><CR>
nnoremap <a-j> :normal <c-r>=Resize('-')<CR><CR>
nnoremap <a-h> :normal <c-r>=Resize('<')<CR><CR>
nnoremap <a-l> :normal <c-r>=Resize('>')<CR><CR>



" # Packages 
"
"
"

call plug#begin('~/.config/nvim/plugged')    

" General
Plug 'neoclide/coc.nvim', {'branch': 'release'} " more packages
Plug 'junegunn/fzf' " search files

" Linting & Formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " general formatter 
Plug 'dense-analysis/ale' " linting and highlighting
Plug 'rust-lang/rust.vim' " rust.
Plug 'mattn/emmet-vim' " html snippets
Plug 'maxmellon/vim-jsx-pretty' " jsx & tsx syntax highlighting and indenting
Plug 'HerringtonDarkholme/yats.vim' " ts syntax highlighting

" Nerdtree
Plug 'preservim/nerdtree' " file explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " git status flags
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " syntax for nerdtree

" Text
Plug 'junegunn/goyo.vim' " distraction-free writing
Plug 'reedes/vim-pencil' " tweaks needed to smooth the path to writing prose
Plug 'junegunn/limelight.vim' " hyperfocus-writing

" Themes
Plug 'crusoexia/vim-monokai'


call plug#end()


" # Package configs 
"
"
"

" ## COLORSCHEME
"

colorscheme monokai

" ## COC
"

set hidden
set nobackup
set nowritebackup

set cmdheight=2
set updatetime=300
set shortmess+=c

" mappings
"Note: CocFix
nnoremap <M-f> :CocFix<CR>

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" ## FZF
"

" mappings
nnoremap <Leader>f :FZF<CR>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

autocmd BufEnter,InsertLeave,BufRead,BufNewFile * :filetype detect

" ## PRETTIER 
"
"

let g:prettier#config#use_tabs = 'false'
let g:prettier#config#tab_width = '2'
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync 

" ## ALE
"
"

" mappings
nmap <F10> :ALEFix<CR>

let g:ale_linters = {
      \   'python': ['flake11', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \   'typescript': ['eslint'],
      \}

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\    'python': ['yapf'],
\}

let g:ale_fix_on_save = 1

let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title


" ## RUST
"

let g:rustfmt_autosave = 1

packadd termdebug
let termdebugger="rust-gdb"
let g:termdebug_wide=1


" ## EMMET
"

let g:user_emmet_leader_key='a-TAB'
let g:user_emmet_mode='a' 
let g:user_emmet_install_global = 0
autocmd FileType html,css,tsx,jsx EmmetInstall

" ## NERDTREE
"

" mappings
map , :NERDTreeToggle<CR>

let NERDTreeShowBookmarks=1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']


" ## PENCIL
"

let g:pencil#wrapModeDefault = 'soft'
let g:pencil#textwidth = 74
let g:pencil#joinspaces = 0
let g:pencil#cursorwrap = 1
let g:pencil#conceallevel = 3
let g:pencil#concealcursor = 'c'
let g:pencil#softDetectSample = 20
let g:pencil#softDetectThreshold = 130



" # Functions
"
"
"

" resize windows
function! Resize(dir)
  let this = winnr()
  if '+' == a:dir || '-' == a:dir
    execute "normal <a-k>"
    let up = winnr()
    if up != this
      execute "normal <a-j>"
      let x = 'bottom'
    else
      let x = 'top'
    endif
  elseif '>' == a:dir || '<' == a:dir
    execute "normal <a-h>"
    let left = winnr()
    if left != this
      execute "normal <a-l>"
      let x = 'right'
    else
      let x = 'left'
    endif
  endif
  if ('+' == a:dir && 'bottom' == x) || ('-' == a:dir && 'top' == x)
    execute ":res -5"
  elseif ('-' == a:dir && 'bottom' == x) || ('+' == a:dir && 'top' == x)
    execute ":res +5"
  elseif ('<' == a:dir && 'left' == x) || ('>' == a:dir && 'right' == x)
    execute ":vertical resize -5"
  elseif ('>' == a:dir && 'left' == x) || ('<' == a:dir && 'right' == x)
    execute ":vertical resize +5"
  else
    echo "oops. check your ~/.vimrc"
    return ""
  endif
endfunction
