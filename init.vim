syntax on  
set autoread
set nocompatible 
set relativenumber
set noswapfile
set background=dark 
set number
colorscheme darcula
call plug#begin("~/.local/share/nvim/plugged")  
Plug 'Shougo/echodoc.vim'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'vimwiki/vimwiki'
Plug 'OrangeT/vim-csharp'
Plug 'othree/html5.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'} 
Plug 'sheerun/vim-polyglot' 
Plug 'autozimu/LanguageClient-neovim', { 
    \ 'branch': 'next', 
    \ 'do': 'bash install.sh', 
    \ } 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
call plug#end() 
let g:OmniSharp_server_use_mono = 1
set tabstop=4 " Tabs are 4 spaces 
set autoindent 
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" 
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>" 
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>" 
autocmd FileType java setlocal omnifunc=javacomplete#Complete 
filetype plugin on
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls']
	\}
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }


" Customize fzf colors to match your color scheme
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
  \}

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:deoplete#enable_at_startup = 1 
set completeopt-=preview
