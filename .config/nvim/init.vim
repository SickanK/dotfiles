  "Note: install vim-plug if not present
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif
"Note: Skip initialization for vim-tiny or vim-small.
  if !1 | finish | endif
  if has('vim_starting')
    set nocompatible               " Be iMproved
    " Required:
    call plug#begin()
  endif

"auto close 
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

call plug#begin('~/.config/nvim/plugged')    

" Buffer
noremap <a-Tab> <Nop>
nnoremap <a-Tab> gt

"set nohlsearch
set nocompatible              " be iMproved, required


" Leader
let mapleader      = ' '
noremap <space> <Nop>

" FZF Search
nnoremap <Leader>f :FZF<CR>
autocmd BufEnter,InsertLeave,BufRead,BufNewFile * :filetype detect

" Remove current search
nnoremap <a-m> :noh<CR>

" Enable folding with the spacebar
nnoremap <C-space> zA
nnoremap <Leader>w zR
nnoremap <Leader>e zM
nnoremap <a-u> zj
nnoremap <a-i> zk


"Remap  arrow keys in Insert mode and Command mode. Ctrl + hjkl
:inoremap <C-h> <Left>
:inoremap <C-j> <Down>
:inoremap <C-k> <Up>
:inoremap <C-l> <Right>
:cnoremap <C-h> <Left>
:cnoremap <C-j> <Down>
:cnoremap <C-k> <Up>
:cnoremap <C-l> <Right>
				
" Windows
" Move cursor
nnoremap <Leader>j <c-w>j
nnoremap <Leader>k <c-w>k
nnoremap <Leader>h <c-w>h
nnoremap <Leader>l <c-w>l
" Move
nnoremap <a-J> <c-w>J
nnoremap <a-K> <c-w>K
nnoremap <a-H> <c-w>H
nnoremap <a-L> <c-w>L
" Split and exit 
nnoremap <Leader>s <c-w>s
nnoremap <Leader>v <c-w>v
nnoremap <a-q> <c-w>q

vnoremap <a-j> <c-\><c-n><c-w>j
vnoremap <a-k> <c-\><c-n><c-w>k
vnoremap <a-h> <c-\><c-n><c-w>h
vnoremap <a-l> <c-\><c-n><c-w>l
inoremap <a-j> <c-\><c-n><c-w>j
inoremap <a-k> <c-\><c-n><c-w>k
inoremap <a-h> <c-\><c-n><c-w>h
inoremap <a-l> <c-\><c-n><c-w>l
cnoremap <a-j> <c-\><c-n><c-w>j
cnoremap <a-k> <c-\><c-n><c-w>k
cnoremap <a-h> <c-\><c-n><c-w>h
cnoremap <a-l> <c-\><c-n><c-w>l
if has('nvim')
  tnoremap <a-j> <c-\><c-n><c-w>j
  tnoremap <a-k> <c-\><c-n><c-w>k
  tnoremap <a-h> <c-\><c-n><c-w>h
  tnoremap <a-l> <c-\><c-n><c-w>l
  au WinEnter *pid:* call feedkeys('i')
endif

nnoremap <a-Up> :normal <c-r>=Resize('+')<CR><CR>
nnoremap <a-Down> :normal <c-r>=Resize('-')<CR><CR>
nnoremap <a-Left> :normal <c-r>=Resize('<')<CR><CR>
nnoremap <a-Right> :normal <c-r>=Resize('>')<CR><CR>

nnoremap <a-k> :normal <c-r>=Resize('+')<CR><CR>
nnoremap <a-j> :normal <c-r>=Resize('-')<CR><CR>
nnoremap <a-h> :normal <c-r>=Resize('<')<CR><CR>
nnoremap <a-l> :normal <c-r>=Resize('>')<CR><CR>

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
" /*}}}*/ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable foldin2
set foldmethod=indent


" Python indents
au BufNewFile,BufRead *.py
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

:set relativenumber
:set laststatus=2

" Other
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 


" Use spaces instead of tabs
:set expandtab

" Be smart when using tabs ;)
:set smarttab

" 1 tab == 4 spaces
:set shiftwidth=4
:set tabstop=2

" Cursor Line
" :autocmd InsertEnter * set cul
" :autocmd InsertLeave * set nocul

" Cursor
let &t_SI = "\e[3 q"
let &t_EI = "\e[1 q"

set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast



" Themes
Plug 'godlygeek/csapprox'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'lucasprag/simpleblack'
Plug 'crusoexia/vim-monokai'

" Style, Lint, Checking etc
Plug 'preservim/nerdcommenter' " Comment multiple lines
Plug 'dense-analysis/ale' " Linting and so much more
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'rust-lang/rust.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf'

call plug#end()

syntax enable
filetype plugin indent on

" Scheme
syntax on
set t_Co=256
:colorscheme monokai

" jsx/tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" FZF 

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

" Vim wiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"Emmet
let g:user_emmet_leader_key='a-TAB'
let g:user_emmet_mode='a' 
let g:user_emmet_install_global = 0
autocmd FileType html,css,tsx,jsx EmmetInstall

"Prettier 
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#tab_width = '2'
let g:prettier#config#parser = ""
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync

" Debug
packadd termdebug
let termdebugger="rust-gdb"
let g:termdebug_wide=1

" Rust
let g:rustfmt_autosave = 1


function! EndProseMode()
"    if executable('tmux') && strlen($TMUX)
"        silent !tmux set status on
"        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
"    endif
    set nospell showmode showcmd
    set scrolloff=5
    set bg=dark
    colorscheme base16-gruvbox-dark-pale
    execute 'q'
endfunction

command! ProseMode call ProseMode("dark")
nmap \p :ProseMode<CR>

command! EndProseMode call EndProseMode()
nmap \ep :EndProseMode <CR>

" ALE
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
\}

let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" Ligtline
set noshowmode "Remove Insert at bottom


autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction


 " Fx code :))
let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

" Shows errors
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

" Nerdtree
map , :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" sync open file with NERDTree
" " Check if NERDTree is open or active

"function! IsNERDTreeOpen()        
  "return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeIgnore = ['^node_modules$']

" The COC Configuration 
"
"
"
"
"
"
"
"
"
"
"
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>A  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>E  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>C  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>O  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>S  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>J  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>K  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>P  :<C-u>CocListResume<CR>
" CocFix
nnoremap <M-f> :CocFix<CR>


