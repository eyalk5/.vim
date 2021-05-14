
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
	if ver == "3.8.5"
		echo 'using python 3.7'
		let g:pymode_python = 'python3'
		if g:on_ek_computer
		let $PYTHONPATH=''
		"let $PYTHONPATH='/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/'
		let &pyxversion =3
	endif 
				command! -nargs=* -range PY <line1>,<line2>python3 <args>
	else
		echo 'using python 2'
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
            "let $PYTHONPATH='/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/'
            let $PYTHONPATH=''
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
	let g:python_host_prog= "/Users/ekarni/.pyenv/versions/2.7.18/bin/python2.7"
	let g:python3_host_prog= "/Users/ekarni/.pyenv/versions/3.8.5/bin/python3"
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
	"set termencoding=utf-8 has
	" #set noshowmode
	set nowrap
	set number
	set completeopt=menuone
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
"
" default file /Users/eyalkarni/.local/share/nvim/shada/main.shada . save
" marks.
set shada=!,'100,<50,s10,h,f1,s100,%
"exec "set shadafile=".g:vimloc . "/shada"
set history=10000
" insert mode
set backspace=indent,eol,start
"set shiftwidth=4
"set expandtab
"
" line+
if has('gui_running') 
"set lines=75
    set scrolloff=3
endif



if !isdirectory($HOME."/.vim")
	call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
	call mkdir($HOME."/.vim/undo", "", 0700)
endif

set undodir=~/.vim/undo
set undofile

"important autocmds
"
autocmd FileChangedShell * echohl WarningMsg | echo "File changed: " . @% | echohl None
"exit window using esc
:autocmd CmdwinEnter * nnoremap <buffer> <ESC> <C-c><C-c>
"exec and leave open
:autocmd CmdwinEnter * nmap <buffer> <F5> <CR>q: 
":autocmd InsertLeave * :let g:EasyMotion_add_search_history=1

au SwapExists * nested call OnSwap() 
function! OnSwap()
	let swap_info = swapinfo(v:swapname)
	echo "Recovery exist " . strftime("%Y %b %d %X",swap_info['mtime']) 
	let v:swapcommand='e'
endfunction 


au VimEnter * nested call OnLoad()
au VimLeave * nested call OnEnd()
au ExitPre * nested call timer_stop(g:autosaveWS)
function! OnLoad()
    echom "onload"
":profile start /Users/eyalkarni/ab.log
":profile file /Users/eyalkarni/vimpy3/plugged/vim-ctrlspace/autoload/ctrlspace/workspaces.vim
"call ToggleVerbose() 
    "!cp /Users/eyalkarni/vimpy3/.git/cs_workspaces /tmp/onload 
". '~/vimpy3/'
:exe ":silent CtrlSpaceAddProjectRoot ". g:vimloc
	if !has('nvim')
		return
	endif 
	call MakeItFaster(0)
	if g:on_ek_computer
		let g:SessionFile = '/Users/eyalkarni/vimpy3/sess2'
		if exists('g:GuiLoaded') || ( g:on_vimr) || exists(':GonvimWorkspaceNew')
			let g:ctrlspaceWorkspace = '/Users/eyalkarni/vimpy3/.git/cs_workspaces'
		else
			let g:ctrlspaceWorkspace = '/Users/eyalkarni/vimpy3/.git/cs_workspacesCMD'
		endif 
		let g:overrideCWD=1
	endif
	
	 "Find the current process, the process parent, and use ps ax to obtain the path. Meant to work in mac. in Linux, it is easier with `/proc/XXX/cmdline'. 
	if argc()==0
		PY import vim
		PY import os
		PY pid=os.getpid()
		PY kk=os.popen('ps -o ppid= -p ' + str(pid)).read()
		PY kk=kk.replace('\n','')
		PY tt=("let uu=system('ps ax | grep \""+kk + "\" | grep -v grep')")
		PY vim.command(tt)
		let uuA=substitute(uu,"^.\\{-}\/","",'g')
		let uu="bash"
		PY kk=os.popen('ps -o ppid= -p ' + str(kk)).read()
		PY kk=kk.replace('\n','')
		"if it is 1 then fail 
		PY if kk!=1: tt=("let uu=system('ps ax | grep \""+kk + "\" | grep -v grep')")
		PY vim.command(tt)
		let uu=substitute(uu,"^.\\{-}\/","",'g')
		if (uu=~".*bash.*")
			"too much indentation
			let uu=uuA
		endif

 
		"echom 'cmdline: '.uu
		
		"for neovim-qt
		let uu=substitute(uu," -psn.\\{-}$","",'g')
		PY vim.command('let uu='+str(vim.eval('uu').replace('\n','').find(' ')))

		if uu==-1
			"echom "loading"
			":CocDisable
			":CtrlSpaceLoadWorkspace default
		endif
	endif
	"if exists('g:GuiLoaded') || ( g:on_vimr)
		"imap <c-s> <esc>:let g:EasyMotion_add_search_history=0<CR>i<c-o><Plug>(easymotion-sn)
	"endif 
	if exists('g:GuiLoaded') || exists(':GonvimWorkspaceNew') || ( g:on_vimr) 
		imap <c-s> <esc>:let g:EasyMotion_add_search_history=0<CR>i<c-o><Plug>(easymotion-sn)
	else
		nnoremap <c-s> :w<CR>
	endif
	"nvimQT
	
	if exists('g:GuiLoaded') || exists(':GonvimWorkspaceNew')
		"set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline:h12
        set guifont=Inconsolata-dz\ for\ powerline:h14
		if !exists(':GonvimWorkspaceNew')
			:GuiTabline 0
			"source /users/eyalkarni/nvim-osx64/share/nvim/runtime/macmap.vim
			"it started to act normal
			imap <M-ß> :w<CR>
			nmap <D-W> :q<CR>
			nmap <D-w> :q<CR>
			nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
			inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
			vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
			if g:on_ek_computer
                source /Users/eyalkarni/neovim-0.4.2/runtime/macmap.vim 
				"nmap <leader>rv mwd:sleep 1<CR>:!osascript -e 'tell application "System Events" to keystroke "v" using {control down, shift down}'<CR>:qa!<CR>
				"nmap <leader>RV mwd:sleep 1<CR>:!osascript -e 'tell application "System Events" to keystroke "v" using {command down, shift down}'<CR>:qa!<CR> 
				"nmap <leader>Rv mwd:!osascript -e 'do shell script "sh /users/eyalkarni/vimpy3/vimqt2.sh <bar><bar> exit"'<CR>
			endif
		else
			"~/nvimMACfiles/macmap042.vim
            if g:on_ek_computer
                source /Users/eyalkarni/neovim-0.4.2/runtime/macmap.vim 
            endif
			"set guifont=Fira\ Code:h14
		endif 
        "override
        nmap <D-f> <Plug>(easymotion-s2) 

        imap <D-v> <c-o>P
        nnoremap <Home> ^
        vnoremap <Home> ^
		"set guifont=Meslo\ LG\ S\ for\ Powerline:h14
"		set guifont=Monaco\ for\ Powerline:h12 
		set mouse+=a
		"nmap <D-S> :w<CR>
		"nmap <D-s> :w<CR>
		nmap <D-v> p
		"nmap <D-v> p
		"imap <D-V> 
		"imap <D-v> 
		"vmap <D-V> p
		"vmap <D-v> p
		"vmap <D-C> y
		"vmap <D-c> y
		"vmap <D-X> d
		"vmap <D-x> d
		"cmap <D-V> <c-r>+
		"cmap <D-v> <c-r>+
	else

		if g:on_ek_computer
			nmap <leader>rv mwd:!osascript -e 'do shell script "sh /users/eyalkarni/vimpy3/vimr.sh"'<CR>
		endif
	endif
	"echom "ignore this no such mapping"
if getcwd()=='/'
    cd ~
    "normal \ov
endif
	if !exists('g:dirs')
		call LoadDir()
		let g:lastdir=''
	endif
:GitGutterEnable
let g:autosaveWS=timer_start(10000,'TimerFunc',{'repeat':-1})
let g:autoreg=timer_start(2000,'GetLine',{'repeat':-1})
let g:autosaveInserts = timer_start(20000,'SaveInsertsFunc',{'repeat':-1})
"for solving ctags bug
au! GonvimAu OptionSet
endfunction

function! OnEnd()
	 "call ctrlspace#workspaces#SaveWorkspace("default")
endfunction
"autocmd VimEnter * call RestoreSession()
"function! RestoreSession()
	"if argc() == 0 && filereadable(eval('g:ses')) "vim called without arguments
		"execute "source " . g:ses
	"endif
"endfunction

" autocmds for  file types
autocmd filetype vim let b:auto_save = 1
autocmd filetype python let b:auto_save = 1

"completing next function 
:autocmd FileType vim nnoremap <buffer> ]m /^\(\s\)*function<CR>
:autocmd FileType vim nnoremap <buffer> [m ?^\(\s\)*function<CR>
:autocmd FileType vim nnoremap <buffer> ]M /^\(\s\)*endfunction/b<CR>
:autocmd FileType vim nnoremap <buffer> [M ?^\(\s\)*endfunction/b<CR>



"autocmd! TermEnter * :startinsert

"commands
"
command! -nargs=* -complete=file C call CloseAllNR()<bar>:sleep 200m<bar>:vert topleft split <args>
command! -nargs=*  -complete=help Help vert :help <args>

" search
set noincsearch
:noh
set nohlsearch

augroup vimrc-noincsearch-highlight
  autocmd!
  autocmd CmdlineLeave / :set noincsearch | :noh
augroup END
