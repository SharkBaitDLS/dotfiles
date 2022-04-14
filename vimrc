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
set encoding=utf8
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
hi StatusLine cterm=bold ctermbg=none ctermfg=none
hi StatusLineNC cterm=none ctermfg=darkcyan ctermbg=none
hi Folded ctermbg=none ctermfg=darkcyan
hi LineNr ctermfg=238
hi FoldColumn ctermfg=darkcyan ctermbg=none
hi Todo cterm=none ctermfg=021 ctermbg=none
hi DiffAdd cterm=reverse ctermbg=black ctermfg=green
hi DiffChange cterm=reverse ctermbg=black ctermfg=cyan
hi DiffDelete cterm=reverse ctermbg=black ctermfg=red
hi DiffText cterm=reverse ctermbg=black ctermfg=yellow

syntax on

filetype plugin on
