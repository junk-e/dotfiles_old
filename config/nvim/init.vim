"-------------------------------------------------------------------------------
"  _         _  _            _
" (_) _ __  (_)| |_  __   __(_) _ __ ___
" | || '_ \ | || __| \ \ / /| || '_ ` _ \
" | || | | || || |_  _\ V / | || | | | | |
" |_||_| |_||_| \__|(_)\_/  |_||_| |_| |_|
"
"-------------------------------------------------------------------------------

" Required
filetype plugin indent off
syntax off
if &compatible
    set nocompatible
endif

" Dein.vim "{{{
"-------------------------------------------------------------------------------

" Set dein paths
let s:config_home = expand('~/.config')
let s:nvimdir = s:config_home . '/nvim'
let s:cache_home = expand('~/.cache')
let s:dein_dir = s:cache_home . '/dein'
let s:dein_github = s:dein_dir . '/repos/github.com'
let s:dein_repo_name = 'Shougo/dein.vim'
let s:dein_repo_dir = s:dein_github . '/' . s:dein_repo_name

" Check dein has been installed or not.
if !isdirectory(s:dein_repo_dir)
    let s:git = system("which git")
    if strlen(s:git) != 0
        echo 'dein is not installed, install now.'
        let s:dein_repo = 'https://github.com' . '/' .  s:dein_repo_name
        echo 'git clone ' . s:dein_repo . ' ' . s:dein_repo_dir
        call system('git clone ' . s:dein_repo . ' ' . s:dein_repo_dir)
    endif
endif

" Add the dein installation directory into runtimepath
let &runtimepath = &runtimepath . ',' . s:dein_repo_dir

" Begin plugin installation
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
        let s:toml = s:nvimdir . '/dein.toml'
        let s:lazy_toml = s:nvimdir . '/dein_lazy.toml'
        call dein#load_toml(s:toml, {'lazy': 0})
        call dein#load_toml(s:lazy_toml, {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

" Required
filetype plugin indent on
syntax enable

" Installation check
if dein#check_install()
    call dein#install()
endif

"}}}

" System settings "{{{
"-------------------------------------------------------------------------------

" Assign line feed code as unix
set fileformats=unix
" Assign and convert all file encodings to UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Disable backup
set nowritebackup
set nobackup
"set backupdir-=.
" Disable undofile
set noundofile
" Enable swapfile
set swapfile
" swap directory
set directory=~/.cache/nvim/swap

" Use vim backspace
set backspace=2

" Enable clipboard
" https://pocke.hatenablog.com/entry/2014/10/26/145646
set clipboard&
set clipboard^=unnamedplus

" auto comment off
" https://cloudpack.media/10353
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

" Storing cursor position
augroup storing_cursor
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \     exe "normal! g'\"" |
        \ endif
augroup END

"}}}

" Search / Replace "{{{
"-------------------------------------------------------------------------------

" Ignore capital & small letter
set ignorecase
" But recognize capital when including capital
set smartcase
" Assign g option by default at replacement
set gdefault

"}}}

" Display settings "{{{
"-------------------------------------------------------------------------------

" Show linenumbers
set number

" Tab Settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" Display invisible characters
set list
set listchars=trail:-,nbsp:%

" Settings of brackets
set matchpairs& matchpairs+=<:>
set showmatch
set matchtime=1

" Conceal
set conceallevel=2 concealcursor=niv

" Overwriting textwidth (Default:78)
augroup no_wrapping
    autocmd!
    autocmd BufEnter * set textwidth=0
augroup END

"}}}

" Key mappings "{{{
"-------------------------------------------------------------------------------

nnoremap ZX :w<CR>
inoremap ZX <ESC>:w<CR>
nnoremap <silent> <ESC><ESC> :nohl<CR>

nnoremap j gj
nnoremap k gk

nnoremap <F1> <Nop>
inoremap <F1> <Nop>
nnoremap q <Nop>
nnoremap Q <Nop>
nnoremap s <Nop>

"}}}

" Others "{{{
"-------------------------------------------------------------------------------

"}}}
