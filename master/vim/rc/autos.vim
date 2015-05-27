au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red ctermfg=white guifg=white
au BufEnter    * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" A little too crazy for group git development...
" autocmd FileType c,cpp,java,php,ruby,python,html autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()"

" Set autoindent and spell check for text files, because notes or hw.
au BufRead,BufNewFile *.txt     setfiletype text
autocmd FileType text set ai spell

" Source dotfiles after saving.
if has("autocmd")
    augroup myvimrchooks
        au!
        autocmd bufwritepost .vimrc,~/.vim/rc/* source %
    augroup END
endif

