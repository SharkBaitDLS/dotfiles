if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

augroup vimrc_autocmds
   autocmd BufReadPost,BufNewFile * hi OverLength ctermbg=darkred ctermfg=gray
   autocmd BufReadPost,BufNewFile * match OverLength /\%81v.\+/
   autocmd BufReadPost,BufNewFile * set ff=unix
augroup END

hi VertSplit none
hi StatusLine cterm=none ctermbg=black ctermfg=green
hi StatusLineNC cterm=none ctermbg=black ctermfg=darkcyan
hi Folded ctermbg=none ctermfg=darkcyan
hi FoldColumn ctermbg=none ctermfg=darkcyan
hi LineNr ctermbg=none ctermfg=237
hi Visual cterm=reverse ctermbg=black

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
