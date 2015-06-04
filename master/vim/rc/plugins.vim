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

""" IN USE """
Plugin 'gmarik/Vundle.vim'                      " let Vundle manage Vundle, required
Plugin 'airblade/vim-gitgutter'                 " Git in the sidebar!!!
Plugin 'altercation/vim-colors-solarized'       " Solarized
Plugin 'bling/vim-airline'                      " Airline.
Plugin 'Lokaltog/vim-easymotion'                " Easymotion
Plugin 'mhinz/vim-startify'                     " SUPER COOL Startup screen
Plugin 'Yggdroot/indentLine'                    " Lines on indends (with spaces)
Plugin 'powerline/fonts'                        " Powerline fonts for Airline
Plugin 'Raimondi/delimitMate'                   " Delimiter completion
Plugin 'scrooloose/nerdcommenter'               " Commenting.
Plugin 'tpope/vim-endwise'                      " Adds 'end' keywords for some languages
Plugin 'tpope/vim-surround'                     " ds, cs, ys
Plugin 'tpope/vim-vinegar'                      " Enhanse netrw

"""""" STUDIO """"""
Plugin 'nvie/vim-flake8'                        " Do pep8 stuff


""" IMPLEMENT """
" Snippets
" https://github.com/garbas/vim-snipmate
" https://github.com/honza/vim-snippets
" https://github.com/msanders/snipmate.vim
" https://github.com/Shougo/neosnippet.vim
" https://github.com/SirVer/ultisnips

" Completion
" Plugin 'Valloric/YouCompleteMe'                 " Code completion


""" TEST LATER? """
" Plugin 'itchyny/lightline.vim'                " Superior to Airline?
" Plugin 'rizzatti/dash.vim'                    " Maybe Dash.app will play nice?
" Plugin 'terryma/vim-multiple-cursors'         " Multiple cursors


""" FORMERLY USED and worth keeping around """
" Plugin 'bronson/vim-trailing-whitespace'      " Trailing whitespace
" Plugin 'flazz/vim-colorschemes'               " ALL THE COLORSCHEMES.
" Plugin 'jnurmine/Zenburn'                     " Already exists. Zenburn. Me gusta.
" Plugin 'kien/rainbow_parentheses'             " Rainbow parens
" Plugin 'nathanaelkane/vim-indent-guides'        " Indent guides
" Plugin 'tobiasgehring/ShowMarks'              " Based on vim-scripts/ShowMarks. Just don't use marks yet.


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
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1            " Adding tab line.
let g:airline_powerline_fonts=1                         " Be powerful.
set laststatus=2                                        " Keep that status bar around.


" DELIMITMATE
let g:delimitmat_expand_cr = 2                          " Expand all <CR>s
let g:delimitmat_expand_space = 1                       " Expand <SPACE>


" EASYMOTION
map Q <Plug>(easymotion-prefix)


" GITGUTTER
let g:gitgutter_realtime=1
let g:gitgutter_eager=1
let g:gitgutter_sign_column_always=1
let g:gitgutter_updatetime=500


" INDENTLINE
let g:indentLine_char = '│'
" let g:indentLine_color_term = 64                      " Can't find the right color


" NERDCOMMENTER
let g:NERDCustomDelimiters = { 'rml': { 'left': "<!--", 'right': "-->" } }


" VIM-FLAKE8
let g:flake8_show_in_file=0                             " SUPER annoying


" VIM-VINEGAR
let g:netrw_liststyle=3                                 " Makes 'tree' default netrw listing


""" NO LONGER IN USE """
"" INDENT GUIDES
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1
"vnoremap <leader>ig :<BS><BS><BS><BS><BS>IndentGuidesToggle<CR>
"vnoremap <leader>ig :call IndentGuidesToggle<CR>

