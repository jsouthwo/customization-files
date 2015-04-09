""" VUNDLE """ {{{
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible              " be iMproved, required for Vundle
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'                      " let Vundle manage Vundle, required
Plugin 'bling/vim-airline'                      " Airline.
" Plugin 'itchyny/lightline.vim'                " Superior to Airline?
" Plugin 'flazz/vim-colorschemes'                   " ALL THE COLORSCHEMES.
Plugin 'airblade/vim-gitgutter'                 " Git in the sidebar!!!
Plugin 'Lokaltog/vim-easymotion'                " Easymotion
" Plugin 'jnurmine/Zenburn'                     " Already exists. Zenburn. Me gusta.
Plugin 'altercation/vim-colors-solarized'     " Already exists. Solarized
Plugin 'tpope/vim-endwise'                      " ?
" Completion
" Plugin 'Valloric/YouCompleteMe'                 " Completion
" https://github.com/garbas/vim-snipmate
" https://github.com/SirVer/ultisnips
" https://github.com/honza/vim-snippets
" https://github.com/Shougo/neosnippet.vim
" https://github.com/msanders/snipmate.vim

Plugin 'nathanaelkane/vim-indent-guides'        " Indent guides
Plugin 'Raimondi/delimitMate'                   " Delimiter completion
Plugin 'mhinz/vim-startify'                     " SUPER COOL Startup screen
" Plugin 'rizzatti/dash.vim'                    " Maybe Dash.app will play nice?
Plugin 'scrooloose/nerdcommenter'               " Commenting.
" Plugin 'bronson/vim-trailing-whitespace'      " Trailing whitespace
" Plugin 'terryma/vim-multiple-cursors'         " Multiple cursors
" Plugin 'kien/rainbow_parentheses'             " Rainbow parens
" https://github.com/Shougo/vimshell.vim        " Shell in vim
Plugin 'tobiasgehring/ShowMarks'                " Based on vim-scripts/ShowMarks


""" EXAMPLES """
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

call vundle#end()
filetype plugin indent on    " required for Vundle
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""" }}}

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif


" AIRLINE...
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1            " Adding tab line.
set laststatus=2 " Makes the status bar always exist for airline.


" GITGUTTER
let g:gitgutter_realtime=1
let g:gitgutter_eager=1
let g:gitgutter_sign_column_always=1
let g:gitgutter_updatetime=500


" INDENT GUIDES
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
vnoremap <leader>ig :IndentGuidesToggle

map <Leader>. <Plug>(easymotion-prefix)

