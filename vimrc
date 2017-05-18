se enc=utf-8
se fencs=utf-8,cp932,euc-jp,iso-2022-jp,ucs-bom,ucs-2le,ucs-2

set statusline=%<%f%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']'}%=%l,%v%8P
set laststatus=2
set smartindent
set number
set expandtab

set modeline

syntax on
set tabstop=4
set shiftwidth=4

" Settings for dein BEGIN
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/SHougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
call dein#begin(s:dein_dir)

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('eagletmt/ghcmod-vim')
call dein#add('jvoorhis/coq.vim')
" call dein#add('eagletmt/coqtop-vim')

" You can specify revision/branch/tag.
"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()


" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" Settings for dein END



" Load settings for each location.
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

