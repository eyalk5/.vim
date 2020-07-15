
"Vim settings
"includes autocmds and autocmds for file types and commands
"Should be indepdenent of plugins!

let ver=system('pyenv version')
if !ver
	if has('python3')
		command! -nargs=* -range PY <line1>,<line2>python3 <args>
	elseif has('python')
		command! -nargs=* -range PY <line1>,<line2>python <args>
	else
		echo 'no python'
	endif

else
let ver=matchlist(ver,'\(.*\)\s(.*$')[1]
let g:ver=ver
"allows ctrl-c I think
set allowrevins
if has('nvim')
	set inccommand=split
endif 
set noerrorbells visualbell t_vb=
set noeb vb t_vb=
autocmd GUIEnter * set visualbell t_vb=

if has('python_dynamic') "or(or(has('python_dynamic'),has('python')),has('python3')) it runs python when this command runs!!!
	if ver == "3.7"
		"echo 'using python 3.7'
		let g:pymode_python = 'python3'
		if g:on_ek_computer
		let $PYTHONPATH='/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/'
		let &pyxversion =3
	endif 
				command! -nargs=* -range PY <line1>,<line2>python3 <args>
	else
		"echo 'using python 2'
		if g:on_ek_computer
			let $PYTHONPATH='/usr/local/lib/python2.7/site-packages:/Users/eyalkarni/utils/jmpacket:/Users/eyalkarni/utils:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages'
		endif
		command! -nargs=* -range PY <line1>,<line2>python <args>
		let &pyxversion =2
	endif
	silent! PY 1
else
	if has('python3')

		if g:on_ek_computer
		let $PYTHONPATH='/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/'
	endif 
		command! -nargs=* -range PY <line1>,<line2>python3 <args>
		let &pyxversion =3
	elseif has('python')
		if g:on_ek_computer
			let $PYTHONPATH='/usr/local/lib/python2.7/site-packages:/Users/eyalkarni/utils/jmpacket:/Users/eyalkarni/utils:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages'
		endif
		command! -nargs=* -range PY <line1>,<line2>python <args>
		let &pyxversion =2
	else
		echo 'no python'
	endif
endif
endif

if g:on_ek_computer
	let $PYENV_ROOT="/Users/eyalkarni/.pyenv"
	let g:python_host_prog= "/Users/eyalkarni/.pyenv/shims/python"
	let g:python3_host_prog= "/Users/eyalkarni/.pyenv/shims/python3"
endif
"let g:yanktools_main_key = 'Z'
":20verbose
"message log
redi >> ~/.vim/vimlog.log

if or(or(has('python_dynamic'),has('python')),has('python3'))
	"set termguicolors "for vimr bug terminal
	set fillchars+=stl:\ ,stlnc:\
	set laststatus=2
	set showtabline=2
	set encoding=utf-8
	"set t_Co=256
	"set t_AB=^[[48;5;%dm
	"set t_AF=^[[38;5;%dm
	"set term=xterm-256color
	"set termencoding=utf-8
	" #set noshowmode
	set nowrap
	set number
	set completeopt=menu
	set completeopt+=noinsert 
    set mousemodel=popup
endif

"from shawn
"set relativenumber
set wildmenu
set cursorline
set nosplitright

set clipboard+=unnamed
"plus
"set paste
set go+=a "???
set cpoptions+=y
:noh

setlocal spell
set spellfile = "~/.vim/spell/en.utf-8.add"
set spelllang=en_us

set updatetime =3000

packadd! syntax-vim-ex
"autocmd filetype python :call PythonSetup()
" Defaults


syntax on
filetype plugin indent on

"
"set noswapfile
"for swap files
set directory=/users/eyalkarni/vimpy3/swap/
set shortmess=a  "added now
set shm+=A
set shortmess+=A
set cmdheight=2
set showcmd

set list
set listchars=tab:>~,trail:~
set tabstop=4 shiftwidth=4 expandtab

set splitbelow
set splitright


"for workspaces
set hidden
" history

set history=10000
" insert mode
set backspace=indent,eol,start
"set shiftwidth=4
"set expandtab
"
" line+
if has('gui_running') 
"set lines=75
set scrolloff=1
endif

" search
set noincsearch
:noh
set nohlsearch

augroup vimrc-noincsearch-highlight
  autocmd!
  autocmd CmdlineLeave / :set noincsearch | :noh
augroup END


if !isdirectory($HOME."/.vim")
	call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
	call mkdir($HOME."/.vim/undo", "", 0700)
endif

set undodir=~/.vim/undo
set undofile


autocmd FileChangedShell * echohl WarningMsg | echo "File changed: " . @% | echohl None
"exit window using esc
:autocmd CmdwinEnter * nnoremap <buffer> <ESC> <C-c><C-c>
"exec and leave open
:autocmd CmdwinEnter * nmap <buffer> <F5> <CR>q: 
":autocmd InsertLeave * :let g:EasyMotion_add_search_history=1
au VimEnter * nested call OnLoad()
au VimLeave * nested call OnEnd()
au ExitPre * nested call timer_stop(g:autosaveWS)
au ExitPre call StopTimerFunc() 

"Final autocmds for saving files
autocmd filetype vim let b:auto_save = 1
autocmd filetype python let b:auto_save = 1

"completing next function 
:autocmd FileType vim nnoremap <buffer> ]m /^\(\s\)*function<CR>
:autocmd FileType vim nnoremap <buffer> [m ?^\(\s\)*function<CR>
:autocmd FileType vim nnoremap <buffer> ]M /^\(\s\)*endfunction/b<CR>
:autocmd FileType vim nnoremap <buffer> [M ?^\(\s\)*endfunction/b<CR>

function! OnSwap()
	let swap_info = swapinfo(v:swapname)
	echo "Recovery exist " . strftime("%Y %b %d %X",swap_info['mtime']) 
	let v:swapcommand='e'
endfunction 

au SwapExists * nested call OnSwap() 


"commands
"
command! -nargs=* -complete=file C call CloseAllNR()<bar>:sleep 200m<bar>:vert topleft split <args>
command! -nargs=*  -complete=help Help vert :help <args>
