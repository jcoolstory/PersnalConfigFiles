"================================================================================
" VIM RC
"
" 2003/06 
" 2008/06    : execute python 
" 2009/05    : comment with F3 in all extension 
"
" 2012/02    : vim-python
" 2012/03/05 : function! GetVisual() range 
" 2012/03/28 : C-F6 : make image file from clipboard
" 2012/04/06 : syntax highlighting for text file
" 2012/11/05 : change a lot, breakthroug in using vim 
" 2012/11/06 : reload mypy.py when <Leader>, is pressed for executing the testScript()
" 2012/11/07 : use tcomments, though use the S-F3 also
" 2012/11/10 : start shell and explorer 
" 2012/11/12 : move functions into myrc_sub.vim
"================================================================================
set nocompatible
filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
" filetype plugin indent on     


" get hostname
let hostname = substitute(system('hostname'), '\n', '', '')

let docroot = "c:/"
let myvimroot = docroot . 'vimsetting/'

" source library
" let sub_rcname = docroot . 'vimsetting/myrc_sub.vim'
" let sub_rcname = myvimroot . 'myrc_sub.vim'
" execute 'source' sub_rcname 

"====================================================================
" my setting
"======================================================================
set wildignore+=*.pyc,*.exe
set tabstop=4
set shiftwidth=4
set expandtab   " insert space instead of tab
set ai  " autoindent
set autoread 

" set noincsearch " no incremental search "
set incsearch
set hlsearch
set ignorecase
set number

set nowrap

set ssop=blank,buffers,curdir,folds,help,options,resize,winsize,winpos
set guioptions=mr
set foldmethod=marker

" change between \ and ,
let mapleader = ","
noremap \ ,

colorscheme darkblue

set nobackup
set noundofile
set noswapfile

" 1) encoding 은 화면에 보이는 것, 시스템이나 터미널에 관련되어 있지 파일 자체에는 관계 없다
" 2) fileencoding 은 파일에 저장되는 코드, encoding 과 fileencoding 이 같으면 (보통 euc-kr 이나 cp949?) 상관없고 이 둘이 다르면 파일을 읽거나 쓸 때 변환이 된다.
" 3) fileencodings 에는 여러 인코딩 룰을 적어주면 파일을 읽을 때 하나씩 검사해서 맞는 인코딩을 찾아내어 자동으로 fileencoding 을 세팅해준다.

set fileencodings=utf-8,euc-kr
set fileencoding=utf-8
" set bomb   " BOM mark on
set nobomb   " BOM mark off


"======================================================================
" vim-python script
"======================================================================

"======================================================================
" simple key mapping
"======================================================================
nmap <space> <nop>
" nnoremap ; :
" nnoremap <c-e> 15<c-e>

" 한글 전환
" inoremap <silent> <ESC> <ESC>:set imdisable<CR>
" nnoremap i :set noimd<CR>i
" nnoremap I :set noimd<CR>I
" nnoremap a :set noimd<CR>a
" nnoremap A :set noimd<CR>A
" nnoremap o :set noimd<CR>o
" nnoremap O :set noimd<CR>O


"================================================================================
" key Mapping
"================================================================================
" imap ;; <Esc>
" vmap ;; <Esc>


" increment number of visual selected columns
vnoremap <C-I> :call Incr()<CR>

map <C-T> :tabnew<CR>

" function key

" folding
map <F1> za
map zr zR    " open all fold
map zm zM    " close all fold

" vimexplorer
" map <S-F1> :VE expand("%:p:h") <cr>

" " hex view
map <C-F1> :%!xxd -g 1<CR>   

" 
map <F2> :update<CR>
imap <F2> <ESC>:update<CR>

" tagbar toggle
nmap <S-F2> :TagbarToggle<CR>

" comment : use tcomment plugin
" nmap <F3> <c-_><c-_>j
" vmap <F3> <c-_>b
nmap <F3> <c-_><c-_>j
vmap <F3> <c-_><c-_>


" window
map <F4> :q <CR>
map <F5> :vs <CR>
map <S-F5> :e %<CR>

" F6 
map <silent> <C-F6> :python mypy.clipboard2ImageFile() <cr>

" search 
nmap <silent> <F7> :python mypy.searchString() <cr>

map <F8> @a
vmap <S-F8> :normal @a<cr>
nmap <S-F8> @b
map <C-F8> j.
" map <M-F8> @@

" nnoremap <F10> :call SetTagFiles()<cr>
" reload
map <F10> :e %<CR>   

" make folding
" map <F11> o<ESC>ki}}}<ESC>?^== <cr>0i{{{ <ESC>
" Due to delimiter Plugin, delete }}} manually
map <F11> o<ESC>ki}}}<ESC>?^== <cr>0i{{{ <ESC>
map <C-F11> o<ESC>ki}}}<ESC>?^=== <cr>0i{{{ <ESC>

map <F12> :BufExplorer<CR>    " open buffer explorer window

"map <C-F12> :vs . <cr>
"map <M-F12> :e . <cr>
" nmap <C-F12> :python mypy.browse_currLine() <cr>
" map <M-F12> :python mypy.explorer_currLine() <cr>

" nmap <Tab> <C-W>w
nmap <Tab> <C-W><C-W>
imap <S-Tab> <C-y>,

"================================================================================
" utility
"================================================================================
" calculator
" :command! -nargs=+ Calc :py print <args>
:command! -nargs=+ C :py print <args>

"-------------------------------------------------------------------------------- 
" plugin mapping
"-------------------------------------------------------------------------------- 

" tcomment plugin for vhdl
"call tcomment#DefineType('vhdl',              '-- %s'            )
"call tcomment#DefineType('ps1',               '# %s'            )
"call tcomment#DefineType('ucf',               '# %s'            )
"call tcomment#DefineType('kv',               '# %s'            )
"call tcomment#DefineType('dart',              '// %s'            )
"call tcomment#DefineType('pde',              '// %s'            )
"call tcomment#DefineType('antlr3',              '// %s'            )
"call tcomment#DefineType('m',              '% %s'            )


" vimexplorer - not used anymore
" let g:VEConf_favorite = "ve_favorite"
" let g:VEConf_treePanelHotkey.switchPanel = '<tab>'

" tabularize for alignment
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>

" vhdl <=
nmap <Leader>a< :Tabularize /<=<CR>
vmap <Leader>a< :Tabularize /<=<CR>


" align table automatically
" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
" function! s:align()
"   let p = '^\s*|\s.*\s|\s*$'
"   if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"     let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"     let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"     Tabularize/|/l1
"     normal! 0
"     call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"   endif
" endfunction
" 
" " ragtag
" " imap     <C-/>    <C-X> /   " don't work
"  
" 
" " map <Leader>n <ESC>:NERDTree<CR>
" 
" " start shell command
" map <Leader>c <ESC>:!start cmd.exe /k "vsvars32"<cr>
" 
" map <Leader>e <ESC>:e .<CR>
" 
" " git
" map <Leader>gd <ESC>:Gdiff<CR>
" map <Leader>gD <ESC>:Gdiff --cached<CR>
" map <Leader>gs <ESC>:Gstatus<CR>
" 
" 
" " buffer explorer
" map <Leader>l <ESC>:BufExplorer<CR>
" 
" " copy directory to clipboard
" function! CopyPath()
"     let @*=expand('%:p:h')
"     echo @*
" endfunction
" 
" function! SetOutliner()
"     if &filetype == 'markdown'
"         execute "Voom markdown"
"     elseif &filetype == 'python'
"         execute "Voom python"
"     elseif &filetype == 'html'
"         execute "Voom html"
"     endif
" endfunction
" 
" 
" map <Leader>o <ESC>:call SetOutliner() <cr>
" map <Leader>p <ESC>:call CopyPath() <cr>
" map <Leader>q <ESC>:q<cr>
" " map <Leader>r <F6>
" map <Leader>r <ESC>:update<CR><F6>
" 
" " search string
" map <Leader>s <ESC>:python mypy.searchString() <cr>
" 
" " tab
" " new , move to next(tabn) , tab only (tabo)
" map <Leader>t <ESC>:tabnew <cr>
" map <Leader>tn <ESC>:tabn <cr> 
" map <Leader>to <ESC>:tabo <cr> 
" 
" " default : cp949 <-> utf-8
" let g:encoding_flag = 0
" function! EncodingToggle()
"     if g:encoding_flag == 0
"         set encoding=utf-8
"         let g:encoding_flag = 1
"     else
"         set encoding=cp949
"         let g:encoding_flag = 0
"     endif
" endfunction
" map <Leader>u <ESC>:call EncodingToggle()<cr>
" 
" 
" 
" " window
" " v : vs, vv : new, vo : only
" " map <Leader>v <ESC>:vs<cr>
" " map <Leader>vs <ESC>:vs<cr>
" " map <Leader>vh <ESC>:new<cr>
" " map <Leader>vo <ESC>:only<cr>
" map <Leader>v <ESC>:new<cr><ESC>:e .<cr>
" 
" " save file 
" map <Leader>w <ESC>:update<CR>
" 
" " start explorer with current directory and copy path to clipboard
" map <Leader>x <ESC>:echo system('explorer ' . getcwd()) <ESC> :call CopyPath()<CR>
" 
" " python script test
" map <Leader>z <ESC>:python reload(mypy)<cr>:python mypy.testScript()<CR>
" 
" 
" 
" " clear highligted search word
" nmap <silent> <Leader>/ :nohlsearch<CR>
" 
" 
" "-------------------------------------------------------------------------------- 
" "  autocommand (autocmd, au)
" "-------------------------------------------------------------------------------- 
" au BufRead,BufNewFile *.txt set filetype=text 
" au BufRead,BufNewFile *.boo set filetype=boo 
" au BufRead,BufNewFile *.ps1 set filetype=ps1 
" au BufRead,BufNewFile *.ucf set filetype=ucf 
" au BufRead,BufNewFile *.pde set filetype=pde 
" au BufRead,BufNewFile *.vhx set filetype=python 
" au BufRead,BufNewFile *.pyvhx set filetype=python 
" au BufRead,BufNewFile *.s2lab set filetype=python 
" au BufRead,BufNewFile *.pyoc set filetype=python 
" au BufRead,BufNewFile *.slab set filetype=groovy 
" au BufRead,BufNewFile *.gy set filetype=groovy 
" " au BufRead,BufNewFile *.m set filetype=cpp 
" au BufRead,BufNewFile *.g4 set filetype=antlr3 
" au BufRead,BufNewFile *.java set filetype=groovy 
" au BufRead,BufNewFile *.sc set filetype=cpp 
" au BufRead,BufNewFile *.sh set filetype=cpp 
" 
" 
" 
" autocmd! BufNewFile * silent! 0r c:/vimsetting/tmpl.%:e
" 
" au BufNewFile,BufRead *.md  set filetype=markdown
" au BufNewFile,BufRead *.coffee  set filetype=coffee
" 
" 
" "-------------------------------------------------------------------------------- 
" autocmd VimEnter * call Vim_enter()
" autocmd VimLeave * call Vim_leave()
" 
" "
" autocmd BufEnter * call BUFFER_ENTER() 
" 
" 
"
augroup filetype
        au! BufRead,BufNewFile *.ts    set filetype=javascript
augroup END
