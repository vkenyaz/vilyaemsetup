""VILYAEMS VIMRC
"tinier vimrc 80 line limit
filetype plugin on
set autoindent
set backspace=indent,eol,start
set encoding=utf-8
set et
set lazyredraw
set list
set listchars=tab:>.
set mouse=a
set nocompatible
set noswapfile
set number relativenumber
"set omnifunc=syntaxcomplete#Complete
set spelllang=en_gb
set sw=2
set viminfo=""
"syntax enable
"syntax spell toplevel

" System clipboard usage
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
inoremap <Leader>y <Esc>"+y
inoremap <Leader>p <Esc>"+p

" Color column
nnoremap <Leader>co :set colorcolumn=80<cr>
nnoremap <Leader>nc :set colorcolumn-=80<cr>

"whitespace removal
"nnoremap <leader>cw :%s/\s\+$//<CR>:noh<CR>

"indent file
"nnoremap <leader>ind gg=G``
"inoremap <leader>ind <Esc>gg=G``I

"code completion
"inoremap <leader>1 <C-x><C-o>

"easy search and replace
nnoremap S :%s///g<Left><Left>

"easy save
nnoremap W :w<cr>

" c h soy++
"desc gen
function FileHeading()
  let s:line=line(".")
  call setline(s:line,"/*********************************************")
  call append(s:line,"* Description - ")
  call append(s:line+1,"* Author - Vilyaem")
  call append(s:line+2,"* *******************************************/")
  unlet s:line
endfunction
imap <F4> <Esc>mz:execute FileHeading()<Enter>g;kkA

"section
imap <F3> <Esc>I/*----------!----------*/<Esc>/!<Enter>?<Enter>xi

"bulid
imap <F5> <Esc>:w<Enter>:!./c.sh<Enter>
nnoremap <F5> <Esc>:w<Enter>:!./c.sh<Enter>
"comments
inoremap <leader>oc /*
inoremap <leader>cc */
inoremap <leader>cl <Esc>I/*<Esc>A*/
nnoremap <leader>cl <Esc>I/*<Esc>A*/

"syntax off
