" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'dense-analysis/ale'
Plugin 'Shougo/deoplete.nvim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'haya14busa/incsearch.vim'
Plugin 'morhetz/gruvbox'
Plugin 'mhinz/vim-signify'
Plugin 'rust-lang/rust.vim'
Plugin 'sebastianmarkow/deoplete-rust'
Plugin 'autozimu/languageclient-neovim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set number relativenumber
set nocompatible              " be iMproved, required
filetype off                  " required

set statusline+=%#warningmsg#
set statusline+=%*

" Some basic PSR code style rules
set tabstop=4           " Tab width
set softtabstop=4       " Soft tab width
set shiftwidth=4        " Shift width
set expandtab           " Use spaces instead of tabs

syntax on
colorscheme gruvbox
set background=dark

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

set clipboard+=unnamedplus

set hidden

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
            \ 'rust': ['LanguageClient'],
            \})
"let g:deoplete#sources#rust#racer_binary='/home/bigtor/.cargo/bin/racer'
"let g:deoplete#sources#rust#rust_source_path='/home/bigtor/.rustup/toolchains/nightly-i686-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:deoplete#sources#rust#disable_keymap=1
nmap <buffer> gx <plug>DeopleteRustGoToDefinitionVSplit

let g:LanguageClient_serverCommands = {
            \'rust': ['rls'],
            \}
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:ale_rust_rls_toolchain = "stable"
let g:ale_linters = {
            \ 'rust': ['rls', 'cargo'],
            \}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \ 'rust': ['rustfmt'],
            \}
