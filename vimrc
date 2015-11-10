set t_Co=256
set nocompatible
set bs=indent,eol,start
set viminfo='20,\"50
set history=50
set ruler
set expandtab
set cindent
set laststatus=1
set noignorecase
set foldmethod=syntax
set fcs+=vert:│
set number
set foldlevel=20
set foldcolumn=2
set noshowmatch
set softtabstop=3
set shiftwidth=3
set tw=0

aug NoInsertFolding
   au!
   au InsertEnter * let b:oldfdm = &l:fdm | setl fdm=manual
   au InsertLeave * let &l:fdm = b:oldfdm
aug END

augroup vimrc_autocmds
   autocmd BufReadPost,BufNewFile * set ff=unix
   autocmd BufReadPost,BufNewFile * normal zx
augroup END

hi VertSplit none
hi Visual cterm=reverse ctermbg=black
hi StatusLine cterm=bold ctermbg=232 ctermfg=green
hi StatusLineNC cterm=reverse ctermfg=232 ctermbg=cyan
hi Folded ctermbg=none ctermfg=darkcyan
hi LineNr ctermfg=238
hi FoldColumn ctermfg=darkcyan ctermbg=black
hi Todo cterm=none ctermfg=021 ctermbg=none

syntax on

filetype plugin on
