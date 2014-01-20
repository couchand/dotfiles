".vimrc

"vim settings

"line numbers
set nu
"expand tab key
set et
"four spaces per tab
set ts=4

"highlight searches
set hls
"incremental search
set is
"hit enter after search to clear highlight
nnoremap <CR> :noh<CR><CR>

"ignore case in searches
set ic
"but smart case
set scs

"highlight syntax from start
autocmd BufEnter * :syntax sync fromstart
