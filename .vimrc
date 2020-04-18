set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
"Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'	
"Plugin 'itchyny/lightline.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'dracula/vim', { 'name': 'dracula' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.pandoc = ['@']

let g:ycm_filetype_blacklist = {}


let g:pandoc#filetypes#handled = ["pandoc", "markdown"]  
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#modules#enabled = ["bibliographies", "completion", "toc"]  
let g:pandoc#biblio#use_bibtool = 1
let g:pandoc#completion#bib#use_preview = 1

:set incsearch
:set hlsearch
:set number
:set keymap=greek_utf-8 
:set iminsert=0 "not greek as default"
:set imsearch=-1 "not greek as default"

" needed for powerline to work
"set laststatus=2
"set noshowmode

""""""""""""""""""""""""""""
" Settings for python
""""""""""""""""""""""""""""
"https://realpython.com/vim-and-python-a-match-made-in-heaven/#vim-extensions
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

set encoding=utf-8

" make python code look pretty
let python_highlight_all=1
syntax on

" make syntastic spell-check for python3
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']

" zotero integration
" https://retorque.re/zotero-better-bibtex/citing/cayw/
function! ZoteroCite()
  " pick a format based on the filetype (customize at will)
  let format = &filetype =~ '.*tex' ? 'citep' : 'pandoc'
  let api_call = 'http://127.0.0.1:23119/better-bibtex/cayw?format='.format.'&brackets=1'
  let ref = system('curl -s '.shellescape(api_call))
  return ref
endfunction

noremap <leader>z "=ZoteroCite()<CR>p
inoremap <C-z> <C-r>=ZoteroCite()<CR>

