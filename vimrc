"""""""""""""""""""""""""""""""""""""""""""""
" be in a more useful way
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""
" vim 自动检测文件编码时的备选字符编码列表
set fileencodings=utf-8,cp936,gb18030,gbk,gb2312,ucs-bom

" 设置终端使用的编码方式
set termencoding=utf-8

" Vim 缓冲区、寄存器、表达式等内部使用的字符编码
set encoding=utf-8

" 设置参与自动检测换行符格式类型的备选列表
set fileformats=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs when inserting <TAb>. To enter a real <Tab>,
" type Ctrl-q first.
set expandtab

" Be smart when using tabs
set smarttab

" 缩进列数对齐到 shiftwidth 值的整数倍
set shiftround

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" copy indent from current line when starting a new line
set autoindent

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" 只允许左右方向键从行首回到上一行行尾或者行尾移到下一行行首
set whichwrap=<,>

"""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, disable swapfile
set nobackup
set nowb
set noswapfile

" A buffer becomes hidden when it is abandoned
set hidden

" confirm an operation when needed
set confirm

" Turn on the Wild menu
set wildmenu

" Sets how many lines of history VIM has to remember
set history=100

" Enable filetype plugins
filetype plugin on

" switch on syntax highlighting
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""
" use visualbell instead of annoying sound on errors
set noerrorbells
set visualbell

" break line longer than 120 characters when inserting
set textwidth=78

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" Don't redraw while executing macros (good performance config)
set lazyredraw

" display line number
set number

" Always show current position
set ruler

" highlight the text line of the cursor
set cursorline

" display incomplete commands
set showcmd

" keep column position of the cursor
set nostartofline

"""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving, with fileformat setting to unix
" 写时使用 unix 的换行符格式类型
" using 'utf-8' fileencoding to write the file
noremap <leader>w <esc>:w! ++ff=unix ++enc=utf-8<cr>

" using <leader>c for <esc> when inserting
noremap <leader>c <esc>

" copy to clipboard (cut-buffer)
noremap <leader>y "+y

" paste text from cut-buffer
noremap <leader>p "+p

" quit vim
nnoremap <leader>q :q<cr>
nnoremap <leader>! :qa<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>e :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>g :cd %:p:h<cr>:pwd<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P>    <Up>
cnoremap <C-N>    <Down>

nnoremap / /\V
nnoremap ? ?\V
vnoremap / /\V
vnoremap ? ?\V

"""""""""""""""""""""""""""""""""""""""""""""
" Set extra options when running in GUI mode
if has("gui_running")
    " Enable 256 colors palette in GUI mode
    set t_Co=256
    " disable all guioptions
    "set guioptions=
    " disable toolbar
    set guioptions-=T
    " use non-GUI tab pages
    set guioptions-=e
    " disable menubar
    set guioptions-=m
    " disable right-hand scrollbar
    set guioptions-=r
    set guioptions-=R
    " disable left-hand scrollbar
    set guioptions-=l
    set guioptions-=L
    " disable bottom scrollbar
    set guioptions-=b
    " enable features
    "nnoremap <leader>t :if &guioptions=~#'T'<Bar>set go-=Te<Bar>else<Bar>set go+=Te<bar>endif<cr><cr>
endif

""""""""
" delete trailing whitespace
""""""""
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" shortcut to delete trailing whitespace
nnoremap <leader><space> :call CleanExtraSpaces()<cr>

if has("autocmd")
    autocmd BufWritePre *.{vim,sv,v,c,cpp,h,hpp,py} :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""
" Set font according to system
"if has("mac") || has("macunix")
"    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
"elseif has("win16") || has("win32")
"    set gfn=Fira\ Code:h10,Microsoft\ YaHei:h14
"    "set gfn=Fira\ Code:h10,SimSun:h14
"    "set gfn=Fira\ Code\ Mono:h10,Source\ Code\ Pro:h10,Bitstream\ Vera\ Sans\ Mono:h10
"elseif has("gui_gtk2")
"    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
"elseif has("linux")
"    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
"elseif has("unix")
"    set gfn=Monospace\ 11
"endif

"""""""""""""""""""""""""""""""""""""""""""""
" plug-in
execute pathogen#infect()

""""""""
" color theme
""""""""
" try to load zenburn color theme
try
    colorscheme zenburn
catch
endtry


""""""""
" nerdtree
""""""""
" map <leader>n to nerdtree
nnoremap <leader>n :NERDTreeToggle<cr>
let g:NERDTreeDirArowExpandable = '+'
let g:NERDTreeDirArowCollapsible = '-'
" start nerdtree when vim is started without file arguments
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree c:/data/1.material | endif


""""""""
" ctrlp
""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ca'


""""""""
" undotree
""""""""
nnoremap <leader>u :UndotreeToggle<cr>


""""""""
" vim-startify
""""""""
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
let g:startify_files_number=5

"""""""""
"" vim-gutentags
"""""""""
"if has('cscope')
"  " gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
"  let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
"
"  " 所生成的数据文件的名称
"  let g:gutentags_ctags_tagfile = '.tags'
"
"  " 开启 gtags 支持：
"  let g:gutentags_modules = []
"  if executable('gtags-cscope') && executable('gtags')
"    let g:gutentags_modules += ['gtags_cscope']
"    "   's'   symbol: find all references to the token under cursor
"    "   'g'   global: find global definition(s) of the token under cursor
"    "   'c'   calls:  find all calls to the function name under cursor
"    "   't'   text:   find all instances of the text under cursor
"    "   'e'   egrep:  egrep search for the word under cursor
"    "   'f'   file:   open the filename under cursor
"    "   'i'   includes: find files that include the filename under cursor
"    "   'd'   called: find functions that function under cursor calls
"    nnoremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"    nnoremap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"    nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"    nnoremap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"    nnoremap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"    nnoremap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"    nnoremap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"    nnoremap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"
"    " command line abbreviation
"    cnoreabbrev csa cs add
"    cnoreabbrev csf cs find
"    cnoreabbrev csk cs kill
"    cnoreabbrev csr cs reset
"    cnoreabbrev css cs show
"    cnoreabbrev csh cs help
"  endif
"
"  " 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
"  let g:gutentags_cache_dir = expand('~/.cache/tags')
"
"  " 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
"  let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"  let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"  let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"
"  " 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
"  let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
"
"  " 禁用 gutentags 自动加载 gtags 数据库的行为
"  let g:gutentags_auto_add_gtags_cscope = 1
"
"endif

"""""""""""""""""""""""""""""""""""""""""""""
" vim config ends here
