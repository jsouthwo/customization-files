" Unnecessary since I don't reach for <ESC> anyway??
"inoremap <ESC> <NOP>

" Currently failing. Idk why.
"set backupdir="~/.vim/backup,/tmp,~/scratch"

set splitbelow
set splitright

" From: http://stevelosh.com/blog/2010/09/coming-home-to-vim/ {{{
" Use Perl/Python regex by default
" ## Nope. Screws up things like =, |, etc.
"nnoremap / /\v
"nnoremap ? ?\v
"vnoremap / /\v
"vnoremap ? ?\v

set ignorecase
set smartcase

set showmatch                   " Shows matching delimiter for a sec after typing.

"set textwidth=79
"set formatoptions=qrn1
" set colorcolumn=80

" }}}

" Maybe doesn't work with airline.
"if has('cmdline_info')
"    set ruler                   " Show the ruler
"    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
"    set showcmd                 " Show partial commands in status line and
"                                " Selected characters/lines in visual mode
"endif

" Call pep8 when closing a python file.
autocmd BufWritePost *.py call Flake8()

" Works, but wonderfully and tremendously hacked.
nnoremap <leader>gitconfig :%s/\n[^[]/THISTEXTNOTINFILE/<CR>:sort<CR>/\[core\]<CR>ddggP/[remote<CR>VNxggp/\[branch "master"\]<CR>dd?[remote<CR>p:%s/THISTEXTNOTINFILE/\r\t<CR>

" Hiding files from netrw.
let g:netrw_list_hide = '
            \.*~$,
            \.*\.pyc$,
            \.*\.swp$
            \'

set lazyredraw

" Enable emacs-style editing of command-line mode {{{
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <Down>
cnoremap <C-P>      <Up>
cnoremap <C-D>      <Del>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>
cnoremap <ESC>d     <S-Right><Right><C-W>
cnoremap <C-U>      <C-E><C-U>
cnoremap <C-K>      <C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>

" }}}

    " Reorder tabs relatively, not absolutely {{
    " https://github.com/johntyree/dotfiles/blob/master/vimrc
        com! -nargs=1 -bar Tabm exe 'tabm ' . (tabpagenr() + <args> - 1)
        noremap <leader>gT :Tabm -1<CR>
        noremap <leader>gt :Tabm +1<CR>
    " }}
