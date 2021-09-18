" A simple default configuration for beginner Vim usage.
"
" If you have any questions about this file, send an email to
" edvth289@student.liu.se, made with <3 by LiTHe kod.

" This is strictly for Vim, not the ancient Vi.
set nocompatible

" Keep the undo history, lets you close the buffer and
" still undo.
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" Gives space around the cursor when scrolling.
set scrolloff=10

" Show where 80 characters is,
" it's not recommended to go over this.
set colorcolumn=80

" Indents your code 'correctly'.
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Line numbers, can be useful.
set number

" This command can change your color scheme,
" it has tab-completion if you run it from
" command mode. :D
colorscheme default

" Ctrl-s to save in both normal mode and insert mode.
" According to me it's a real lifesaver.
nnoremap <C-s> :update<CR>
inoremap <C-s> <ESC>:update<CR>i

" Syntax highlighting is nice...
syntax on

" These commands are only enabled for python files.
augroup python
    " Ctrl-g now lets you write a grep command to search all python files.
    nnoremap <C-g> <ESC>:copen <BAR> grep  *.py<LEFT><LEFT><LEFT><LEFT><LEFT>

    " TIP: To work even more effectively, try running the ':copen' command
    " after pressing <F5> and the program didn't run. It's pretty cool!
    " (':cn' and ':cp' will help you here!)
    "
    " Say that we're using python scripts here.
    set makeprg=python3
    " Jumps you to the errors, it's pretty speedy.
    compiler pyunit
    " Save and run the python script with <F5>, it's pretty cool.
    nnoremap <F5> :w <BAR> :make %<CR>
    " Make sure Vim gets the memo about syntax.
    set syntax=python
augroup END
