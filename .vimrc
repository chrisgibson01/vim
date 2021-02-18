set number

set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " an hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

set belloff=all

set nobackup
set nowritebackup
set noswapfile

inoremap jk <esc>

set autoread

colorscheme ron
syntax on

set foldenable
set foldmethod=manual

if has("autocmd")
    filetype on
    autocmd FileType python setlocal foldmethod=indent
endif

set path+=/usr/include/c++/7.4.0

"set tags+=./tags;,tags; " see file-searching
"set tags+=/root/???/tags " see file-searching
"set tags+=/root/???/tags " see file-searching
"set tags+=./tags;???/**1,tags; " see file-searching

set cscopetag
set cscoperelative 
"set cscope add /root/city_vision_servers_trunk 
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
	set cscopequickfix=s-,c-,d-,i-,t-,e-
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

" clang-format
map <C-K> :py3f /usr/share/clang/clang-format-10/clang-format.py<cr>
imap <C-K> <c-o>:py3f /usr/share/clang/clang-format-10/clang-format.py<cr>

function! Formatonsave()
  let l:formatdiff = 1
  py3f /usr/share/clang/clang-format-10/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

"set makeprg=ninja\ -C\ <path to cmake dir> $*

set path+=/root/sv/src
set path+=/root/sdk_libraries/src
