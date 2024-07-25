""""":""""""""""""""""""""""
"   Vundle Configuration  "
"""""""""""""""""""""""""""
    set nocompatible			  " be iMproved, required
    filetype off				  " required
    
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')
    
    " let Vundle manage Vundle, required
      Plugin 'VundleVim/Vundle.vim'
    
    
    " The following are examples of different formats supported.
    " Keep Plugin commands between vundle#begin/end.
    " plugin on GitHub repo
    "Plugin 'tpope/vim-fugitive'
    " plugin from http://vim-scripts.org/vim/scripts.html
    "Plugin 'L9'
    " Git plugin not hosted on GitHub
    "Plugin 'git://git.wincent.com/command-t.git'
    " git repos on your local machine (i.e. when working on your own plugin)
    "Plugin 'file:///home/gmarik/path/to/plugin'
    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Avoid a name conflict with L9
    "Plugin 'user/L9', {'name': 'newL9'}
    
    Plugin 'tomasr/molokai'				   " molokai vim主题
    Plugin 'vim-airline/vim-airline'		  " airline状态栏美化
    Plugin 'vim-airline/vim-airline-themes'   " 状态栏主题包
    Plugin 'nathanaelkane/vim-indent-guides'  " 代码块竖线
    Plugin 'scrooloose/nerdtree'			  " 加入NERDTree
    Plugin 'scrooloose/nerdcommenter'		 " 代码注释
    Plugin 'godlygeek/tabular'				" 按符号自动对齐如: Tab \= , : Tab \|
    Plugin 'majutsushi/tagbar'				" tagbar显示文件大纲
    Plugin 'vhda/verilog_systemverilog.vim'   " Vim Syntax Plugin for Verilog and SystemVerilog
    Plugin 'ervandew/supertab'				" tab autocomplete
    Plugin 'Yggdroot/indentLine'			  " indentLine
    
    
    " All of your Plugins must be added before the following line
call vundle#end()			" required
filetype plugin indent on	" required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList	   - lists configured plugins
" :PluginInstall	- installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean	  - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""
" End of Vundle Configuration  "
"""""""""""""""""""""""""""

" Show title
set title

" This is allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Set syntax on
syntax on


" map switch between tabs
    map <C-l> :tabn<CR>
    map <C-h> :tabp<CR>
    map <C-n> :tabnew<CR>

" Spell check
    hi clear SpellBad
    hi SpellBad cterm=underline

" Automatically wrap left and right
" pressing left/right cursor keys, vim will move to the previous/next line
" after reaching first/last character int the line.
    set whichwrap+=<,>,h,l,[,]


" set smartcase, auto determine case sensitivity
    set smartcase

"Gnome terminal do not send <alt> key,
"this fix such problem
"let c='a'
"while c <= 'z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw
"set timeout ttimeoutlen=50

" vim-latex related configuration
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
    set grepprg=grep\ -nH\ $*
" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
"set sw=4
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
    set iskeyword+=:
    set winaltkeys=no

"let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_MultipleCompileFormats='pdf'

" type <F12> in normal mode to enable
" Vim-latex-live-preview
"nmap <F12> :LLPStartPreview<cr>


" enable in file vim command
    set modeline

" configure j k to move inline
    nnoremap <buffer> k gk
    nnoremap <buffer> j gj

    function! WC()
    	let filename = expand("%")
    	let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
    	let result = system(cmd)
    	echo result . " words"
    endfunction

    command WC call WC()

" Set encoding to UTF-8 by default
    set encoding=utf-8  " The encoding displayed.
    set fileencoding=utf-8  " The encoding written to file.


" Let vim recognize empty .tex file is a tex file rather than plaintex
    let g:tex_flavor='latex'

" 定义前缀键的前缀,即<Leader>
    let mapleader=";"
" 映射esc为jk
    inoremap jk <esc>


" 设置快捷键将选中文本块复制至系统剪贴板
    vnoremap <Leader>y "*y
" 设置快捷键将系统剪贴板内容粘贴至 vim
    nmap <Leader>p "*p
" 定义快捷键关闭当前分割窗口
    nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
    nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
    nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
    nmap <Leader>Q :qa!<CR>
" 在命令模式下非递归键盘映射 ESC 取消搜索高亮
    nnoremap <esc> :noh<return><esc>
" 开启实时搜索功能
    set incsearch
" 搜索时大小写不敏感
    set ignorecase
" vim 自身命令行模式智能补全
    set wildmenu
" 设置查看历史条数
    set history=200
" F2切换开启或者关闭行号
    nnoremap <F2> :set number!<CR>
" F3切换开启列高亮显示
    nnoremap <F3> :set cursorcolumn!<CR>
" F4开启indentLines
    nmap <F4> :IndentLinesToggle
" 开启/关闭taglist
    nmap <F8> :TagbarToggle<CR>
" 开启/关闭格式化粘贴
    set pastetoggle=<F9>
" 禁止光标闪烁
"    set gcr=a:block-blinkon0
" 禁止显示滚动条
    "set guioptions-=l
    "set guioptions-=L
    "set guioptions-=r
    "set guioptions-=R
" 禁止显示菜单和工具条
    "set guioptions-=m
    "set guioptions-=T
" 总是显示状态栏
    set laststatus=2
" 显示光标当前位置
    set ruler
" 开启行号显示
    set number
" 高亮显示当前行
    set cursorline
"    set cursorcolumn
" 高亮显示搜索结果
    set hlsearch
" 禁止折行
    set nowrap
" 将制表符扩展为空格
    set expandtab
" 设置编辑时制表符占用空格数
    set tabstop=4
" 设置格式化时制表符占用空格数
    set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
    set softtabstop=4
" 开启自动对齐
    set autoindent
" 开启智能对齐
    "set smartindent
" 删除空格数
"    set showtabline=1
    set backspace=2
" 设置空格与制表键显示样式
    set listchars=tab:>~,trail:.
"为不同的文件类型设置不同的空格数替换TAB
	autocmd FileType java,javascript,html,css,xml set ts=2
	autocmd FileType java,javascript,html,css,xml set shiftwidth=2
	autocmd FileType java,javascript,html,css,xml set softtabstop=2
	
	autocmd FileType python,shell,bash set ts=4
	autocmd FileType python,shell,bash set shiftwidth=4
	autocmd FileType python,shell,bash set softtabstop=4
	
	autocmd FileType tex set lbr
	autocmd FileType tex set ts=4
	autocmd FileType tex set shiftwidth=2
	autocmd FileType tex set softtabstop=2
	
	autocmd FileType verilog,systemverilog,verilog_systemverilog set tabstop=4
	autocmd FileType verilog,systemverilog,verilog_systemverilog set shiftwidth=4
	autocmd FileType verilog,systemverilog,verilog_systemverilog set softtabstop=-1
	autocmd FileType verilog,systemverilog,verilog_systemverilog set autoindent
    "autocmd FileType verilog,systemverilog,verilog_systemverilog set expandtab
	"autocmd FileType verilog,systemverilog,verilog_systemverilog retab

" 配色方案
    let g:molokai_original=1
    let g:rehash256=1
    colorscheme molokai
" 设置状态栏主题风格
    let g:airline_theme='bubblegum'
    let g:airline_powerline_fonts=1
    let g:airline#extensions#branch#enabled=1
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#buffer_nr_show=1

" NERDTree config
	map <leader>f :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() == "primary") | q | endif
	" 默认开启NERDTree
	"autocmd vimenter * NERDTree
	" 隐藏不需要显示的文件，如pyc
	let NERDTreeIgnore=['\.pyc$']

" Vim Verilog 设置
	nnoremap <leader>i :VerilogFollowInstance<CR>
	nnoremap <leader>I :VerilogFollowPort<CR>
	nnoremap <leader>u :VerilogGotoInstanceStart<CR>
	runtime macros/matchit.vim
	let g:SuperTabDefaultCompletionType = 'context'

" indentLine config
	" You can also use one of ¦, ┆, │, ⎸, or ▏ to display more beautiful lines. 
	" However, these characters will only work with files whose encoding is UTF-8.
	let g:indentLine_char_list = ['|', '¦', '┆', '┊']
	" Disable by default
	let g:indentLine_enabled = 0


" 映射切换buffer的键位
	nnoremap [b :bp<CR>
	nnoremap ]b :bn<CR>
" 映射<leader>num到num buffer
	map <leader>1 :b 1<CR>
	map <leader>2 :b 2<CR>
	map <leader>3 :b 3<CR>
	map <leader>4 :b 4<CR>
	map <leader>5 :b 5<CR>
	map <leader>6 :b 6<CR>
	map <leader>7 :b 7<CR>
	map <leader>8 :b 8<CR>
	map <leader>9 :b 9<CR>
 
set foldmethod=marker

"if has("gui_running")
"  " GUI is running or is about to start.
"  " Maximize gvim window (for an alternative on Windows, see simalt below).
"  set lines=999 columns=999
"else
"  " This is console Vim.
"  if exists("+lines")
"    set lines=50
"  endif
"  if exists("+columns")
"    set columns=100
"  endif
"endif
if has('unix') && ($TERM == 'xterm-256color' || $TERM == 'screen-256color')
    map <Esc>OP <F1>
    map <Esc>OQ <F2>
    map <Esc>OR <F3>
    map <Esc>OS <F4>
    map <Esc>[16~ <F5>
    map <Esc>[17~ <F6>
    map <Esc>[18~ <F7>
    map <Esc>[19~ <F8>
    map <Esc>[20~ <F9>
    map <Esc>[21~ <F10>
    map <Esc>[23~ <F11>
    map <Esc>[24~ <F12>
endif
" Fix Gnome-terminal Alt key
    let c='a'
    while c <= 'z'
      exec "set <A-".c.">=\e".c
      exec "imap \e".c." <A-".c.">"
      let c = nr2char(1+char2nr(c))
    endw
    set timeout ttimeoutlen=50

    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
    
    set guicursor=i:ver25-blinkwait700-blinkon640-blinkoff400
    set gfn=monospace\ 12
    winpos 460 175
    set wrap

    imap - _
    inoremap 9 (
    inoremap 0 )
    inoremap ( 9
    inoremap ) 0
    cmap - _
    cnoremap 9 (
    cnoremap 0 )
    cnoremap ( 9
    cnoremap ) 0

    nnoremap ; :

"    imap ( ()<ESC>i
"    imap [ []<ESC>i
"    imap { {}<ESC>i



