augroup vimrc_autocmds
   autocmd BufReadPost,BufNewFile * hi OverLength ctermbg=darkred ctermfg=gray
   autocmd BufReadPost,BufNewFile * match OverLength /\%81v.\+/
   autocmd BufReadPost,BufNewFile * set ff=unix
   autocmd BufReadPost,BufNewFile * normal zx
augroup END

hi VertSplit none
hi OverLength none
hi Visual cterm=reverse ctermbg=black
hi StatusLine cterm=bold ctermbg=232 ctermfg=green
hi StatusLineNC cterm=reverse ctermfg=232 ctermbg=cyan
hi Folded ctermbg=none ctermfg=darkcyan
hi LineNr ctermfg=238
hi FoldColumn ctermfg=darkcyan ctermbg=none
hi Todo cterm=none ctermfg=021 ctermbg=none

set t_Co=256
set fcs+=vert:│
set nocompatible
set bs=indent,eol,start
set viminfo='20,\"50
set history=50
set ruler
set expandtab
set shiftwidth=3
set softtabstop=3
set cindent
set laststatus=1
set foldmethod=syntax
set foldlevel=10
set foldcolumn=2
set number

aug NoInsertFolding
   au! 
   au InsertEnter * let b:oldfdm = &l:fdm | setl fdm=manual
   au InsertLeave * let &l:fdm = b:oldfdm
aug END

syntax on

filetype plugin on
