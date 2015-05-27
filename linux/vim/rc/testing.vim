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

