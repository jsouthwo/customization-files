" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


" My stuff..."
inoremap fj <Esc>
inoremap <C-j> <Esc>
nnoremap fj :noh<return>

" Make Y act like C and D
nnoremap Y y$

" Tab changes tabs
nnoremap <TAB> gt
nnoremap <S-TAB> gT

" Toggle relativenumber and number
nnoremap <C-n> :call NumberToggle()<cr>

" Upcase a word
inoremap <C-u> <ESC>hehviwUea

" keep text highlighted after shifting
vnoremap < <gv
vnoremap > >gv

" Testing swapping ; and :
" nnoremap : ;
" vnoremap : ;
" nnoremap ; :
" vnoremap ; :
nnoremap <Space> :
vnoremap <Space> :

" Support for multi-line lines.
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
inoremap <silent> <Up> <C-o>gk
inoremap <silent> <Down> <C-o>gj
nnoremap 0 g0
vnoremap 0 g0
nnoremap ^ g^
vnoremap ^ g^
nnoremap $ g$
vnoremap $ g$
" And switch.
nnoremap gj j
vnoremap gj j
nnoremap gk k
vnoremap gk k
"inoremap <silent> <Up> <C-o>gk         " Not these
"inoremap <silent> <Down> <C-o>gj       " Not these
nnoremap g0 0
vnoremap g0 0
nnoremap g^ ^
vnoremap g^ ^
nnoremap g$ $
vnoremap g$ $

nnoremap <C-e> 2<C-e>
vnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
vnoremap <C-y> 2<C-y>

""""""""""""""""""""""""""""""""""""""""""""
" START leader stuff
""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","
nnoremap \ ,

" Toggle paste mode
nnoremap <leader>p :set paste!<CR>:set paste?<CR>

" Toggle wrap
nnoremap <leader>wr :set wrap!<CR>:set wrap?<CR>

" Make session
nnoremap <leader>m :mks!

" Source my rc (Kinda unnecessary cause autocmd
nnoremap <leader>\ :so ~/.vimrc<CR>

" Comment out ("\\" ) selected area.
vnoremap <leader>; :s/^/\/\/<CR>:noh<CR>

" Save from insert mode
inoremap <leader>w <ESC>:w<CR>a

" Toggle list
nnoremap <leader>l :set list!<CR>:set list?<CR>

" Toggle spell
nnoremap <leader>s :set spell!<CR>:set spell?<CR>

" Show word count
nnoremap <leader>wo :w !wc -w<CR>

""""""""""""""""""""""""""""""""""""""""""""
" END leader stuff
""""""""""""""""""""""""""""""""""""""""""""

