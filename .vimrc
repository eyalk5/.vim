"=NETRNewTabdrop
"
"
" By Eyal Karni
"
":let $PYTHONPATHCOC='/Users/eyalkarni/impacket/impacket;/usr/local/lib/python2.7/site-packages;/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages'
" 
" I will be applying some adaptations on my computer. That is only if the folder exists.
" some tips : remember commenter \Cc , remember <c-u>  and <M-Bslash> windows , remember \C
" close NR 
"
"ctrl-x ctrl-k directory  (ctrl-v guess)
" Search workspace symbols
"nnoremap <silent> _s  :<C-u>CocList -I symbols<cr>
" remember m-space to enter command and ~ to search and of course ` to enter
" and exit mode. and c-F to search (c-- c-= next back). but of course, c-` is c-o (btw alt-` is
" windows switcher). To print just this ` we have c-]).
" TODO: use set for inserts.
" ctrl-d ctrl-h ctrl-t for inside line search.
" g; is a very nice command to iterate through changes. (g, older)
" also 'I and `I made to work.
" let us remember that ! is `
let g:on_ek_computer=(filewritable("/Users/eyalkarni")==2)
let g:on_vimr= ( $VIM=~# ".*VimR.*")



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
let g:vimloc=split(&packpath,',')[0]
"let g:yanktools_main_key = 'Z'
":20verbose
"message log
redi >> ~/.vim/vimlog.log
"let &shell='/usr/bin/bash --login'
"source ~/.vim2/autoload/repmo.vim
call plug#begin('~/.vim/plugged')
Plug 'echuraev/translate-shell.vim', { 'do': 'wget -O ~/.vim/trans git.io/trans && chmod +x ~/.vim/trans' }
Plug 'rbtnn/vim-vimscript_lasterror'
"Plug 'mg979/vim-yanktools'
Plug 'matze/vim-tex-fold' 
":if !has('nvim')
	Plug 'puremourning/vimspector'
"endif
 "Plug 'jlanzarotta/bufexplorer'

"Plug 'AndrewRadev/undoquit.vim'
"Plug 'Shougo/denite.nvim'
Plug 'Yggdroot/LeaderF', { 'do': '.\install.sh' }
Plug 'simnalamburt/vim-mundo'

Plug 'scrooloose/nerdcommenter'
Plug 'rhysd/vim-grammarous'
Plug '907th/vim-auto-save'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
"switch tabs
Plug 'viniciusarcanjo/fzf-tabs.nvim'
Plug 'airblade/vim-gitgutter'
"needed? yes, just a collection of snippets
Plug 'honza/vim-snippets'
"tab completion 
Plug 'ervandew/supertab'
"we dont need it right now
"Plug 'rafi/awesome-vim-colorschemes'
"backward search
Plug 'mhinz/neovim-remote'
Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'
Plug 'tpope/vim-repeat'

"Plug 'Shougo/neco-vim'
"completion for vim
"causes it to crash, vim syntax file
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'kassio/neoterm'

"motion 
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'hgiesel/vim-motion-sickness'
Plug 'easymotion/vim-easymotion'
Plug 'bfredl/nvim-ipy'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vim-ctrlspace/vim-ctrlspace'
" 
Plug 'yegappan/mru'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive' " Git
Plug 'joshdick/onedark.vim'
Plug 'dense-analysis/ale'
"syntax highlight
Plug 'slim-template/vim-slim'

if or(or(has('python_dynamic'),has('python')),has('python3'))

Plug 'tpope/vim-surround'
Plug 'tmhedberg/SimpylFold'
"common
Plug 'inkarkat/vim-ingo-library'
endif
Plug 'octol/vim-cpp-enhanced-highlight' "additional vim c++ syntax highlighting
Plug 'valloric/youcompleteme'

Plug 'vim-scripts/EnhancedJumps'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jeetsukumaran/vim-indentwise'
Plug  'mg979/vim-visual-multi'
Plug 'ipod825/vim-netranger'

Plug 'jeetsukumaran/vim-pythonsense'
if !has('nvim')
	Plug 'powerline/powerline'
else
	Plug 'vim-airline/vim-airline-themes'
	Plug 'vim-airline/vim-airline'
endif
Plug 'eiginn/netrw'
Plug 'WolfgangMehner/bash-support'
"Plug 'Shougo/deoplete.nvim' , { 'do': ':UpdateRemotePlugins' }
call plug#end()
"Plug 'ivanov/vim-ipython'
"Plug 'vim-scripts/mru.vim'
"Plug 'kchmck/vim-coffee-script'
if !has('nvim')
 "use old vim session tools
"Plug 'thaerkh/vim-workspace'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'
endif 
":CocInstall coc-vimlsp
"if ver == "3.7"
"Plug 'vim-vdebug/vdebug'
"
"else
"
"Plug 'vim-vdebug/vdebug', {'tag':'v1.5.2'}
"endi

"Plug 'valloric/youcompleteme'
"Plug 'tpope/vim-sleuth'
  "Plug 'roxma/vim-hug-neovim-rpc'
  "Plug 'roxma/nvim-yarp'
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'tpope/vim-repeat'
"Plug 'rbgrouleff/bclose.vim'
"Plug 'francoiscabrol/ranger.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'davidhalter/jedi-vim' " Python autocomplete
"Plug 'Houl/vim-repmo' "repeat moves
"Plug 'sjl/gundo.vim'
"Plug 'w0rp/ale' " lint
"Plug 'IngoHeimbach/neco-vim'
"Plug 'inkarkat/vim-mark'
"Plug 'powerman/vim-plugin-AnsiEsc'
"Plug 'iamcco/vim-language-server'
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"Plug 'vim-jp/syntax-vim-ex'
"Plug 'neoclide/coc-python'
"Plug 'xavierd/clang_complete'
if has('nvim')
else
endif
let g:vimsyn_folding='f'

packadd! syntax-vim-ex
if has('nvim')
	let g:airline#extensions#tabline#enabled = 1
	"let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file', 'conflicts' ]
	let g:airline#extensions#whitespace#checks = [ 'indent', 'conflicts' ]
	" add the current folder to the display
	let g:airline_section_c= '%<%{tabpagenr()} %<%{getcwd()} | %f%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
	if !exists('g:gui_oni')
		let g:airline_powerline_fonts = 1
		set t_Co=256
	endif
endif
" Plug 'AndrewRadev/undoquit.vim'
" Plug 'python-mode/python-mode', { 'branch': 'develop' }
" Plug 'artur-shaik/vim-javacomplete2'
" Plug 'fatih/vim-go'
" if has('gui_running')
" endif
" Plug 'severin-lemaignan/vim-minimap'
nmap <MiddleMouse> :redraw<CR>
if or(or(has('python_dynamic'),has('python')),has('python3'))
	" powerline
	if !has('nvim')
		PY from powerline.vim import setup as powerline_setup
		PY powerline_setup()
		PY del powerline_setup
		set guifont=Inconsolata\ for\ Powerline:h14
		let g:Powerline_symbols = 'fancy'
	endif
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
"asdad
"set relativenumber
set wildmenu
set cursorline

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


if !isdirectory($HOME."/.vim")
	call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
	call mkdir($HOME."/.vim/undo", "", 0700)
endif

set undodir=~/.vim/undo
set undofile

" Theme

colorscheme onedark
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/usr/lib/llvm-gcc/4.2.1/'
"let g:session_autosave='yes'
let g:EnhancedJumps_CaptureJumpMessages = 0
let g:gruvbox_contrast_dark = 'hard'
" let g:pymode_python = 'PY'

"let g:multi_cursor_select_all_key      = '<C-L>'

" Plugin configurations
set wildignore+=/node_modules/*,*/.eggs/*
let g:ctrlp_match_window = 'max:20'
let g:ctrlp_show_hidden = 1


let g:plug_url_format = 'https://github.com/%s.git'


"autocompleting
set wildmode=list:longest,list:full
" File type patches

""autocmd FileType java setlocal omnifunc=javacomplete#Complete
"au BufNewFile,BufRead *.jbuilder setf ruby
"au BufNewFile,BufRead *.json.jbuilder setf ruby
"au BufNewFile,BufRead *.json setf javascript
"au BufNewFile,BufRead *.slim setf slim
"au BufNewFile,BufRead *.html.slim setf slim

    let g:trans_directions_list = [
        \['en', 'he'],
        \['he', 'en'],
    \]
let g:trans_bin = "~/.vim"
" Lint
let g:ale_cursor_detail =0
let g:ale_close_preview_on_insert =1
let g:ale_completion_enabled = 0
let g:ale_linters_explicit = 1
"let g:ale_enabled = 0

let g:ale_linters = {'tex': 'all'}
"autocmd FileType tex let &l:ale_enabled=1
"let g:ale_linters = {
			"\ 'javascript':       ['eslint'],
			"\ 'latex'     :       ['chktex','lacheck','proselint','textlint','latexindent'],
			"\ 'tex'       :       ['chktex','lacheck','proselint','textlint','latexindent','texlab','vale','writegood'],
			"\ 'python'    :       ['black']
			"\ }
"let g:ale_fixers = {'*' :[
			"\  'textlint' , 'latexindent','prettier.vim','mix_format','generic','autopep8','bibclean','black','brittany','clangformat','clangtidy','cmakeformat','dartfmt','dfmt','elm_format','eslint', 
			"\ 'fecs','fixjson','floskell','generic','generic_python','gnatpp','gofmt','goimports','gomod','google_java_form','hackfmt','help','hfmt','hindent','hlint','importjs','isort','jq','ktlint','latexindent','mix_format',
			"\ 'ocamlformat','ocp_indent','perltidy','pgformatter','php_cs_fixer','phpcbf','prettier','prettier_eslint','prettier_standar','puppetlint','qmlfmt','refmt','reorder_python_i','rubocop','rufo','rustfmt','scalafmt',
			"\ 'shfmt','sorbet','sqlfmt','sqlformat','standard','standardrb','stylelint','styler','stylish_haskell','swiftformat','terraform','textlint','tidy','tslint','uncrustify','xmllint','xo','yapf'] }
let g:ale_fixers = { 'python' : ['black'],'tex':['latexindent','textlint'],'text':['textlint']}
" E501: line too long
" W503: line ending before operator
" E261: two spaces before inline comment
" E241: multiple spaces after ':' (formatted dict)
" E272: multiple spaces before keyword (formatted dict)
let g:ale_python_flake8_args="--ignore=E501,W503,E261,E241,E272"


let g:SimpylFold_docstring_preview = 1
if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
  endif
  let g:deoplete#omni#input_patterns.tex = '\\(?:'
        \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
        \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
        \ . '|hyperref\s*\[[^]]*'
        \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
        \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
        \ .')'

let g:auto_save_events = ["InsertLeave", "TextChanged","CursorHold"]
  
"if exists('g:deoplete#enable_at_startup')
let g:deoplete#enable_at_startup = 1
"call deoplete#custom#source('buffer', 'filetypes', ['tex','vim'])
":CocDisable
"endif
" Language configuration
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#show_call_signatures = 1
"let g:jedi#smart_auto_mappings = 0 " disable 'from X ' automatically typing 'import'

let g:JavaComplete_ImportSortType = 'packageName'

let g:ale_ruby_rubocop_options="--except "
  + "Metrics/BlockLength,"
  + "Metrics/LineLength,"
  + "Style/MutableConstant,"
  + "Style/NegatedIf,"
  + "Style/Not,"
  + "Style/StringLiterals,"
  + "Style/TrailingCommaInLiteral,"
  + "Style/WordArray"
  "disable categories of refcatoring and comment
let g:ale_python_pylint_options = '--disable=C,R'
let g:ale_javascript_eslint_options="--config ".$HOME."/.vim/.eslintrc.yml"
if has('nvim')
	let g:session_menu = 0 "disable session menu for vim-session
endif
let g:session_lock_enabled=0
let MRU_File = $HOME . '/.vim/vim_mru'

set foldmethod=syntax
set foldnestmax=99

let g:is_pythonsense_suppress_motion_keymaps = 0

let NERDTreeShowHidden=1
let g:ctrlp_max_filescs_workspaces=20000
let g:ctrlp_max_depth=40
"for ctrlspace . don't delete
"here we check that it is not a terminal
let g:lastWindows= []
let g:lastWinName = ""

function! SaveLastWindow()

if &bt == '' || &bt == 'help' || &ft == 'netranger' "|| &bt == 'nofile'
	let cur= expand( '<afile>' )
	"let cur = expand('%:p')

	if cur == g:lastWinName || cur ==""
		return
	endif 

	call add(g:lastWindows,cur) 

	let g:lastWinName=cur
endif

endfunction 
augroup bufclosetrack
  au!
  autocmd BufWinLeave * call SaveLastWindow()
"  autocmd BufHidden * call SaveLastWindow()
augroup END
"" arglist : [ cwd ]
"" change window local working directory
"function! Tapi_lcd(cwd)
  "let winid = bufwinid('%')
  "if winid == -1 || empty(a:cwd)
    "return
  "endif
  "exe ':'.winid.'windo lcd '. a:cwd
"endfunction

function! LastWindow()
  exe "vsplit " . g:lastWinName
endfunction

command! -nargs=0 LastWindow call LastWindow()

" _ mapping 
noremap _g :diffget<CR>
noremap _p :diffput<CR>
nmap _u :LastWindow<CR>

if g:on_ek_computer
    nmap _U :call fzf#vim#cust_history(reverse(copy(g:lastWindows)))<CR>
endif
nmap _. :cd ..<CR>
nmap _- :cd -<CR>
"previous file
nmap _P :wprevious<CR>
nmap _N :wnext<CR>
"do comment out
map __ <leader>Cc

if !exists('g:lasttab')
  let g:lasttab = 1
endif

nmap _t :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

imap <M-Down> <esc>
imap <M-Up> <esc>
imap <M-Left> <esc>
imap <M-Right> <esc>

nmap <nowait> t :let g:init=1<CR>:w<CR>
nnoremap \t t
nmap <M-Down> <Plug>(grammarous-move-to-next-error)	
nmap <M-Up> <Plug>(grammarous-move-to-previous-error)
nmap <M-Left> <Plug>(grammarous-open-info-window)	
nmap <M-Right> <Plug>(grammarous-fixit)	
"let g:CtrlSpaceDefaultMappingKey = ''
nmap <C-b> :CtrlSpace w<CR>
"windows on tab
nmap <c-U> <c-b>w
"if !exists('g:gui_oni')
let g:CtrlSpaceLoadLastWorkspaceOnStart = 0
"endif
let g:CtrlSpaceSaveWorkspaceOnSwitch = 0
let g:CtrlSpaceSaveWorkspaceOnExit = 0
"let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
"display registers in the status bar



let g:CtrlSpaceUseArrowsInTerm = 1



"if ver != "3.7"
    "let g:vdebug_keymap = { "run" : "<C-F5>","run_to_cursor" : "<C-F9>","step_over" : "<C-F2>","step_into" : "<C-F3>","step_out" : "<C-F4>","close" : "<C-F6>","detach" : "<C-F7>","set_breakpoint" : "<F10>","get_context" : "<C-F11>","eval_under_cursor" : "<C-F12>","eval_visual" : "<Leader>e"}
"endif
" clipboard (system)
set clipboard+=unnamed
"plus
"set paste
set go+=a "???
set cpoptions+=y
:noh
""
""auto commands
":CocConfig 
"/Users/eyalkarni/.pyenv/versions/2.7/bin/python"

"autocmd filetype python :call PythonSetup()
augroup vimrc-noincsearch-highlight
  autocmd!
  autocmd CmdlineLeave / :set noincsearch | :noh
augroup END
"
"autocmd VimEnter * call RestoreSession()
autocmd FileChangedShell * echohl WarningMsg | echo "File changed: " . @% | echohl None
"exit window using esc
:autocmd CmdwinEnter * nnoremap <buffer> <ESC> <C-c><C-c>
"exec and leave open
:autocmd CmdwinEnter * nmap <buffer> <F5> <CR>q: 
if has('nvim')
:autocmd InsertLeave * call SaveLastInsert()
:autocmd TextYankPost * call SaveLastCopy()
:autocmd BufRead * call LoadInsertsForBuf()
":autocmd BufNewFile if !exists('b:inserts') <bar> let b:inserts=[]  dsfsdf

:autocmd DirChanged * call SaveLastDir()
endif
":autocmd InsertLeave * :let g:EasyMotion_add_search_history=1
au VimEnter * nested call OnLoad()
au VimLeave * nested call OnEnd()
au ExitPre * nested call timer_stop(g:autosaveWS)
au SwapExists * nested call OnSwap() 
au ExitPre call StopTimerFunc() 

"Final autocmds for saving files
autocmd filetype vim let b:auto_save = 1
autocmd filetype python let b:auto_save = 1

function! OnSwap()
	let swap_info = swapinfo(v:swapname)
	echo "Recovery exist " . strftime("%Y %b %d %X",swap_info['mtime']) 
	let v:swapcommand='e'
endfunction 
"
"functions
""
function! GetLine(timer)
	if !exists('g:reg_tog')
		return 
	endif
	if g:reg_tog==0 
		return
	endif 
	if (getreg('0')==getreg('*'))
		let regs=['+','1','2','3','x','z','4','5']
	else
		let regs=['*','0','1','2','x','z','4','5']
	endif 

	let tot=0
	let wid=winwidth(0)
	let s=""
	let tl=0
	let avg=0

	let countmore=0
	let lenlessthan=0
	let lenmore=0

	for it in regs
		let t=printf('%s',getreg(it))
		let t=substitute(t,"\<NL>","^M","g")
		let t=substitute(t,"\t","    ","g")
		let l= len(t) 

		if l<(wid-25)/(len(regs)+1)
			let lenlessthan+=l
		else
			let lenmore+=l 
			let countmore+=1
		endif 
	endfor 

	let neededavg = ((wid-25-(3*countmore)) - lenlessthan + 0.01) / (countmore+ 0.01)



	for it in regs
		let t=printf('%s',getreg(it))
		let t=substitute(t,"\<NL>","","g")
		let t=substitute(t,"\t","    ","g")
		let l= len(t) 
		if  l>=(wid-25)/(len(regs)+1) 
			let ll=min([len(t),float2nr(floor(neededavg))])
		else
			let ll=len(t)
		endif 
		if ll>0
			if (len(s)+ll<wid-25)
				if ll<l
					let s=s . printf('%s',it) . ': ' . t[0:ll] .'..| '
				else
					let s=s . printf('%s',it) . ': ' . t[0:ll] .' | '
				endif 
			endif
		endif
	endfor
	let g:line=s
endfunction

function! RegsToggle()
	if !exists('g:reg_tog')
		let g:reg_tog=0
	endif


	let g:reg_tog=!(g:reg_tog)
	if g:reg_tog
		let g:airline_section_a_temp= g:airline_section_a
		let g:airline_section_a=""
		let g:airline_section_x_temp= g:airline_section_x
		let g:airline_section_x=""
		let g:airline_section_y_temp= g:airline_section_y
		let g:airline_section_y=""
		let g:airline_section_z_temp= g:airline_section_z
		let g:airline_section_z=""
		let g:airline_section_c= "%{g:line}"
		"*=  %-0.40{printf('%s',getreg('*'))}  0=  %-0.40{printf('%s',getreg(0))}  1= %-0.40{printf('%s',getreg(1))}  2= %-0.40{printf('%s',getreg(2))} 3= %-0.40{printf('%s',getreg(3))} x= %-0.40{printf('%s',getreg('x'))}"
		let g:airline_section_error_temp= g:airline_section_error
		let g:airline_section_error=""
		let g:airline_section_warning_temp= g:airline_section_warning
		let g:airline_section_warning=""
	else
		let g:airline_section_error= g:airline_section_error_temp
		let g:airline_section_warning = g:airline_section_warning_temp
		let g:airline_section_a= g:airline_section_a_temp
		let g:airline_section_x= g:airline_section_x_temp
		let g:airline_section_y= g:airline_section_y_temp
		let g:airline_section_z= g:airline_section_z_temp
		let g:airline_section_c= '%<%{tabpagenr()} %<%{getcwd()} | %f%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
	endif
	:AirlineRefresh
	"call airline#extensions#tabline#buflist#invalidate()
	":redraw!
endfunction


function! DebugIt(interval)
	for i in range(1,line('$'), a:interval)
		exe ":" . i
		exe "normal! Oecho 'In ' . line('.')\<CR>"
	endfor
endfunction

function! ToggleVerbose()
    if !&verbose
        :!rm ~/.vim/verbose.log
		:!touch ~/.vim/verbose.log
        set verbosefile=~/.vim/verbose.log
        set verbose=15
    else
        set verbose=0
        set verbosefile=
    endif
endfunction

function! My(a,b,c,d)
	echo ''. a:a . ' ' . a:b . ' ' . a:c . ' ' . a:d
endfunction

function! DefineMapping()
map <expr> ; repmo#LastKey(';') | sunmap ;
"map <expr> <C-\> repmo#LastRevKey(',') worked
noremap <expr> <C-\> repmo#LastRevKey(',')
" Still repeat fFtT (now with counts):
noremap <expr> f repmo#ZapKey('f',1)|sunmap f
noremap <expr> F repmo#ZapKey('F',1)|sunmap F
snoremap <expr> t repmo#ZapKey('t',1)|sunmap t
snoremap <expr> T repmo#ZapKey('T',1)|sunmap T

" Now following can also be repeated with `,` and `;`:
"
"for keys in [['l','h'],['k','j'], ['[[', ']]'], ['[]', ']['], [']m', '[m'], [']M', '[M'], [']c', '[c'] ,  [ 'w','b' ] ,[ 'W','B' ] ,[ 'e','ge' ] ,[ 'E','gE' ], ['<F4>','<F3>'],['<D-K>','<D-J>'],['{','}'],['(',')']]
"Not to mess with vim-tex
for keys in [['l','h'],['k','j'],  [']c', '[c'] , [']h', '[h'], [ 'w','b' ] ,[ 'W','B' ] ,[ 'e','ge' ] ,[ 'E','gE' ], ['<F4>','<F3>'],['<D-K>','<D-J>'],['{','}'],['(',')']]
    execute 'noremap <expr> '.keys[0]." repmo#Key('".keys[0]."', '".keys[1]."')|sunmap ".keys[0]
    execute 'noremap <expr> '.keys[1]." repmo#Key('".keys[1]."', '".keys[0]."')|sunmap ".keys[1]
endfor
endfunction

call DefineMapping()

function! RunPython2(match,run)
PY << EOF
import vim
try:
	match=vim.eval("a:match")
	retval=eval(vim.eval("a:run"),globals())
except Exception as e:
	import traceback
	exp=traceback.format_exc()
	retval=None
	try:
		vim.command("echom \"" + str(exp).replace("\"","\\\"") + "\"")
	except:
		pass

if retval==None: retval=match
vim.command("let retInVim=\"" + str(retval).replace("\"","\\\"") + "\"")
EOF
return retInVim
endfunction

function! RunPython(match,run)
PY << EOF
import vim
try:
	match=vim.eval("a:match")
	vim.command(' exec "PY " . a:run')
except Exception as e:
	import traceback
	exp=traceback.format_exc()
	try:
		vim.command("echom \"" + str(exp).replace("\"","\\\"") + "\"")
	except:
		pass
EOF
return ""
endfunction

function! GL(arg) range
	let lst=matchlist(a:arg,'/\(.\{-\}\)/\(.\{-}\) \(.*\)$')
"	echo lst
	if lst[2]==#"rpy"
		exec a:firstline. "," . a:lastline . ":s\/" . lst[1] . "/\\=RunPython2(submatch(1),\"". escape(lst[3],"\"//") . "\")"
	elseif lst[2]==#"py"
		exec a:firstline. "," . a:lastline . ":s\/" . lst[1] . "/\\=submatch(0) . RunPython(submatch(1),\"". escape(lst[3],"\"//") . "\")"
	endif
endfunction

"	echo "firstline ".a:firstline." lastline ".a:lastline."arg ".a:arg
" 	exec a:firstline. "," . a:lastline . ":s\/" . lst[1] . "/\\=substitute(submatch(0),\"" . lst[1] . "\",RunPython2(submatch(1),'". lst[3] . "') ,\"\")"

function! GetVisualSelection() abort
  let [lineSelection, colSelection] = getpos('v')[1:2]
  let [lineCursor, colCursor]       = getpos('.')[1:2]

  " Swap line numbers if selection starts at cursor
  let [lineStart, lineEnd]          = (lineSelection <= lineCursor) ? [lineSelection, lineCursor] : [lineCursor, lineSelection]

  let lines = getline(lineStart, lineEnd)

  let mode = mode()
  if mode is# "\<C-v>"
    let mode = 'v'
    if lineStart < lineEnd
      echoerr 'block-wise selection unsupported, assuming character-wise selection'
    endif
  endif
  if mode is# 'v'
    " Swap column numbers if selection starts at cursor
    let [colStart, colEnd] = (colSelection <= colCursor) ? [colSelection, colCursor] : [colCursor, colSelection]
    let lines[-1] = lines[-1][:colEnd - (&selection is# 'inclusive' ? 1 : 2)]
    let lines[0]  = lines[0][colStart - 1:]
  endif
  " if mode is# 'V'

  if &l:fileformat is# 'dos'
    let ending = "\<CR>\<NL>"
  elseif &l:fileformat is# 'mac'
    let ending = "\<CR>"
  else " if is# 'unix'
    let ending = "\<NL>"
  endif

  return join(lines, ending)
endfunction

function! Matches(pat)
	let buffer=bufnr("") "current buffer number
	let b:lines=[]
	"the right way to escape!!
	execute ":%g/\\V" . escape(a:pat,'/\?') . "/let b:lines+=[{'bufnr':" . 'buffer' . ", 'lnum':" . "line('.')" . ", 'text': escape(getline('.'),'\"')}]"
    "call setloclist(0, [], ' ', {'items': b:lines})
    "call setloclist(0,b:lines)
	call setqflist(b:lines)
	copen
endfunction
function! MatchesF(pat)
	let buffer=bufnr("") "current buffer number
	let b:lines=[]
	"no escape!!
	execute ":%g/" . a:pat . "/let b:lines+=[{'bufnr':" . 'buffer' . ", 'lnum':" . "line('.')" . ", 'text': escape(getline('.'),'\"')}]"
    "call setloclist(0, [], ' ', {'items': b:lines})
  "  call setloclist(0,b:lines)
	"lopen
	call setqflist(b:lines)
	copen
endfunction
function! Matches2(a,...)
	let where=get(a:,1,'**/*')
	:set eventignore=all
    execute ":vimgrep " . '/\V'.escape(a:a,'/\?') . "/j ". where
	:set eventignore=
    copen
endfunction

function! CloseAllBuffersButCurrent()
	%bd
	e#
endfunction
"Closes the other buffers but Nerdtree. Unless only 2 buffers left. In this
"case, closes nerdtree.
function! CloseAllWindowsButCurrent()
	let tabnr= tabpagenr()
	let tabinfo=gettabinfo(tabnr)
	let windows=tabinfo[0]['windows']
	let last2=(len(windows)==2)

	for winid in windows
		let curwin=winnr() "could change
		let winnr=win_id2win(winid)
        let ft= getbufvar(winbufnr(winnr), '&filetype')
		if and(winnr!=curwin,or((ft!~'netranger'),last2))
			execute ':'.winnr.'close!'
		endif
	endfor
endfunction

function! CloseAllNR()
	let tabnr= tabpagenr()
	let tabinfo=gettabinfo(tabnr)
	let windows=tabinfo[0]['windows']
	let last2=(len(windows)==2)
	for winid in windows
		let curwin=winnr() "could change
		let winnr=win_id2win(winid)
        let ft= getbufvar(winbufnr(winnr), '&filetype')
		if (ft=~'netranger')
			execute ':'.winnr.'q!'
		endif
	endfor
endfunction
function! RestoreSession()
	if argc() == 0 && filereadable(eval('g:ses')) "vim called without arguments
		execute "source " . g:ses
	endif
endfunction

function! Goprev()
    exec 'redir @a | silent ls | redir END'
    if match(@a,'"\[Location List\]"') >= 0
            lprev
    elseif match(@a,'"\[Quickfix List\]"') >= 0
            cprev
    else
            exec 'echo "Neither Location or Quicklist found!"'
    endif
endfunction

"executes command, return lines as string
function! MinExec(cmd)
	redir @a
	exec printf('silent %s',a:cmd)
	redir END
	return @a
endfunction

"executes command , opens in new tab all the lines. useful in cases of :map
function! Exec(cmd)
	redir @a
	exec printf('silent %s',a:cmd)
	redir END
    tabnew
	norm "ap
endfunction

function! LoadInsertsForBuf()
	"echo 'loading inserts'
if exists('b:inserts')
	if len(b:inserts)>0
		"echo('exit')
		return 
	endif 
endif 
py3 << EOF
import vim
import pickle
try:
	input = open(vim.eval('g:vimloc')+'/inserts.cache', 'rb')
	inserts=pickle.load(input)
	input.close()
except:
	inserts={}
bufn=vim.eval('expand("%:p")')
if bufn in inserts:
	dic=inserts[bufn]
	if type(dic)==dict:
		if '' in dic:
			dic.pop('')
		else:
			pass
	else:
		dic={}
else:
	dic={}
EOF
"echo 'loading inserts2'
let b:inserts = py3eval("dic")
if len(b:inserts)==0
	let b:inserts={}
endif
endfunction

function! LoadDir()
PY << EOF
import vim
import pickle
try:
	input = open(vim.eval('g:vimloc')+'/dirs.cache', 'rb')
	dirs=pickle.load(input)
	input.close()
except:
	dirs=[]
vim.command("let g:dirs = " + str(dirs))
EOF
endfunction

function! SaveLastDir()
	if !exists('g:dirs')
		call LoadDir()
		let g:lastdir=''
	endif

	let reg=getcwd()
	if reg==g:lastdir
		return
	endif
	call add(g:dirs,reg)
PY << EOF
import vim
import pickle
output = open(vim.eval('g:vimloc')+'/dirs.cache', 'wb')
dirs=vim.eval('g:dirs')
dirs=list(set(dirs))
pickle.dump(dirs ,output)
output.close()
EOF
	let g:lastdir=reg
endfunction

function! SaveLastInsert()
	if !exists("b:save_inserts")
		let b:save_inserts=1
	endif 
 if !(b:save_inserts==1)
	return 
 endif 
	if mode()=='c'
		return
	endif

	call AddInsert(@.)
	"endif
endfunction

function! SaveLastCopy()
	let reg= v:event['regname']
	"echo v:event['regcontents']
	if !exists("b:save_inserts")
		let b:save_inserts=1
	endif 
	 if (b:save_inserts==0)
		 return 
	 endif 
	call AddInsert(getreg(reg))
endfunction

function! AddInsert(str)
	if len(a:str)>1000
		return
	endif
	if !exists('b:inserts')
		let b:inserts={}
		let b:lastinsert=''
	endif

	for k in split(a:str,'\n')
		call AddInsertInternal(k)
	endfor 

endfunction

function! AddInsertInternal(str)
	"for now
	if len(b:inserts)>1000
		"enters the start and removes from end
		let n=keys(b:inserts) 
		call remove(b:inserts,n[1000])
	endif 

	let ok=0
	let stills=1  
	let stindex=0
	let str=""
	let strt = substitute(a:str,"\<BS>",'\n','g')
	for i in range(len(strt))
		if match(strt[i],'\s')!=0
			let stills=0
		else 
			if stills
				"let stindex+=1 
				continue
			endif 
		endif 

		if match(strt[i],'\n')==0
			if len(str)>0
				let str=str[:-2]
				continue
			endif 
		endif 
		if match(strt[i],'\w')==0
			let ok+=1
		endif
		if match(strt[i],'\p')==0
			let str.=strt[i]
		endif 
	endfor
	if ok<3
		return
	endif
	"if match(a:str,'^[\x20-\x7E\x09\x0A]*$')==0
	
	"let t=a:str[stindex:]
	let b:inserts[str]='a'

	
endf	

function! PInsert2(item)
	let @z=a:item
	norm "zp
	call feedkeys('a')
endfunction

function! PInsert(item)
	let @z=a:item
	norm "zp
endfunction

function! RecallInserts2()
	if !exists('b:inserts')
		return
	endif 
	:call fzf#run({'source': uniq(keys(b:inserts)),'sink':function('PInsert'),'options': '-m'})
endfunction
"ctrl l
"sdfsfs
"0770
"
"0

function! RecallInserts()
	if !exists('b:inserts')
		return
	endif 
	:call fzf#run({'source': uniq(keys(b:inserts)),'sink':function('PInsert2'),'options': '-m'})
endfunction

function! Gonext()
    exec 'redir @a | silent ls | redir END'
    if match(@a,'"\[Location List\]"') >= 0
            lnext
    elseif match(@a,'"\[Quickfix List\]"') >= 0
            cnext
    else
            "exec 'echo "Neither Location or Quicklist found!"'
			copen
    endif
endfunction

function! ExportC()
python << EOF
x=vim.eval("@x").replace('\n','').replace(" ","")
if len(x)%2!=0:
	print 'bad x'
else:
	st='unsigned char bytes[] ={'
	st+=','.join(['0x'+x[i:i+2]  for i in xrange(0,len(x),2)])
	st+='};'
	vim.command("let sInVim = '%s'"% st)
	vim.command("let @+=sInVim")
EOF
endfunction

function! Search()
	:M @x
endfunction

function! HandleCJ()
	let func=input('type cmd to execute (calls execute funct). @x is match')
	echo "\<CR>"
	execute func
endfunction

function! HandleCH()
	let func=input('type cmd to eval vim command (@x is arg)/ExportC()/Search())')
	echo "\<CR>"
	echo eval(func)
endfunction


function! HandleH()
	let func=input('Enter python to execute(match is the input):	')
	echo "\<CR>"
	let retInVim=RunPython(@x,func)
endfunction

function! HandleCF()
	let func=input('Enter "cmd" to eval vim cmd(@x is arg): 	')
	" echo "\<CR>"
	return eval(func)
endfunction


function! HandleF()
	let func=input("Enter python to eval(match is the input,@x is arg): ")
	" echo "\<CR>"
	let retInVim=RunPython2(@x,func)
	return retInVim
endfunction

function! CopyPath()
	let @+=expand('%:p')
endfunction

function! DisableKeys()
	noremap <Up> <Nop>
	noremap <Down> <Nop>
	noremap <Left> <Nop>
	noremap <Right> <Nop>
endfunction
"call DisableKeys()
" let g:vdebug_keymap['run'] = '<C-s>'
function! Wolfram()
	:g/Out\[/d
	:%s/In\[.*\]:=//g
endfunction

call ctrlspace#init#Init()
let g:defRoot= g:vimloc
function! OnLoad()
    echom "onload"
":profile start /Users/eyalkarni/ab.log
":profile file /Users/eyalkarni/vimpy3/plugged/vim-ctrlspace/autoload/ctrlspace/workspaces.vim
"call ToggleVerbose() 
    !cp /Users/eyalkarni/vimpy3/.git/cs_workspaces /tmp/onload 
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
				nmap <leader>rv mwd:sleep 1<CR>:!osascript -e 'tell application "System Events" to keystroke "v" using {control down, shift down}'<CR>:qa!<CR>
				nmap <leader>RV mwd:sleep 1<CR>:!osascript -e 'tell application "System Events" to keystroke "v" using {command down, shift down}'<CR>:qa!<CR> 
				nmap <leader>Rv mwd:!osascript -e 'do shell script "sh /users/eyalkarni/vimpy3/vimqt2.sh <bar><bar> exit"'<CR>
			endif
		else
			"~/nvimMACfiles/macmap042.vim
            if g:on_ek_computer
                source /Users/eyalkarni/neovim-0.4.2/runtime/macmap.vim 
            endif
			"set guifont=Fira\ Code:h14
		endif 
		"set guifont=Meslo\ LG\ S\ for\ Powerline:h14
		"<D-d>
"		set guifont=Monaco\ for\ Powerline:h12 
		set mouse+=a
		"nmap <D-S> :w<CR>
		"nmap <D-s> :w<CR>
		"nmap <D-V> p
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
"insert commands
"
"end only until the end and not one more
nmap <MiddleMouse> i
imap <MiddleMouse> <ESC>
vnoremap <end> $h
":inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
":inoremap <S-b> <C-R>=STab_Or_Complete()<CR>
"<C-CR>:
"< C -S-uuLeft>
nmap <RightMouse> <F12>
imap <RightMouse> <ESC>
map <C-CR> <F13>
imap <C-CR> <F13>
imap <S-CR> <c-o>
nmap § :call StartSpecialInsert()<CR>i
nmap <F13> :call StartSpecialInsert()<CR>i
nmap <F12> :call StartSpecialInsert()<CR>i
imap <F12> <c-o>
imap <F13> <ESC>
"imap jk <ESC>l
imap § <c-o>
imap <c-a> <c-o><c-a>

"let g:EasyMotion_leader_key= 'F'
nnoremap <leader>F F
nnoremap <leader>t t
let g:EasyMotion_do_mapping =1

let g:EasyMotion_smartcase = 1

" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1
"Logical, since in normal we have s and S
imap <c-b> <c-o><Plug>(easymotion-s2)
imap <c-\> <c-o><Plug>(easymotion-s)
"beginning of words
imap <c-d> <c-o><Plug>(easymotion-bd-w)
nmap <c-d> <Plug>(easymotion-bd-w)
"end of word 
imap <c-h> <c-o><Plug>(easymotion-bd-e)
nmap <c-h> <Plug>(easymotion-bd-e)
"imap <c-c> <c-o><Plug>(easymotion-lineanywhere) 
"nmap <c-c> <Plug>(easymotion-lineanywhere) 
imap <c-t> <c-o><Plug>(easymotion-sl)
nmap <c-t> <Plug>(easymotion-sl)
"go forward and back
imap <c-;> <c-o>;
imap <c-.> <c-o><c-\>
"imap <c-.> <c-o>.

"wroks with all but N
nmap T <Plug>(easymotion-sl)
nnoremap <leader><c-t> <c-t>
"loofor 2 chars already S "imap <c-s> <c-o><Plug>(easymotion-sn)
" to handle bug of sear

"needed to be in onload
"imap <D-a> <c-x><c-o>
"imap <D-A> <c-x><c-o>
"inoremap ^] ^X^]
"inoremap ^L ^X^L
inoremap <c-k> <c-x><c-n>
inoremap <c-f> <c-x><c-p>
imap <c-z> <c-f><tab>
"imap <c-i> <c-f><S-Tab>


function! CompleteInf()
	let pre= '\(\\ref{\zs\k*$\|\\cite{\zs\k*$\|\k*$\)'
	let nl=[]
	let l=complete_info()
	for k in l['items']
		call add(nl, k['word']. ' : ' .k['info'] . ' '. k['menu'] )
	endfor 
	call fzf#vim#complete(fzf#wrap({ 'source': nl,'prefix':pre, 'reducer': { lines -> split(lines[0], '\zs :')[0] },'sink':function('PInsert2')}))
endfunction 

"completion by fuzzing of anything
imap <c-'> <CMD>:call CompleteInf()<CR>
imap <D-K> <plug>(fzf-complete-word)
imap <D-k> <plug>(fzf-complete-word)
imap <D-F> <plug>(fzf-complete-path)
imap <D-f> <plug>(fzf-complete-path)
imap <D-J> <plug>(fzf-complete-file-ag)
imap <D-j> <plug>(fzf-complete-file-ag)
imap <D-L> <plug>(fzf-complete-line)
imap <D-l> <plug>(fzf-complete-line)

let  g:UltiSnipsJumpForwardTrigger   =     '<c-j>'
let  g:UltiSnipsJumpBackwardTrigger  =     '<c-k>'
"let g:targets_pairs = '() {} [] <>'
"let g:textobj#anyblock#blocks = ['(', '{', '[', '<']

"this very dangerous and also quit diff<D-x>

"finds the best next item and complete up to it. in Vim!
:imap <c-,> <c-X><c-V>

"
"
""nerdtree mappings
"
"
set nosplitright
function! NERDDoClose()
	let node = g:NERDTreeFileNode.GetSelected()
	if !(node.path.isDirectory)
		execute "norm x"
	elseif node.path.isDirectory && (node.isOpen==1)
		execute "norm \<CR>zt"
	endif
endfunction

function! NERDDoOpen()
	let node = g:NERDTreeFileNode.GetSelected()
	if node.path.isDirectory && (node.isOpen==0)
		execute "norm \<CR>ztj"
	endif
endfunction
function! DoClose()
PY<<EOF
import vim
nod=netranger.api.NETRApi.ranger.cur_node
cur_ind=int(vim.eval("line('.')")) - 1
for i in range(cur_ind,0,-1):
	nod=netranger.api.NETRApi.ranger.cur_buf.nodes[i]
	if nod.is_DIR:
		if (nod.expanded):
			netranger.api.NETRApi.ranger.cur_buf.set_clineno_by_node(nod)
			netranger.api.NETRApi.ranger.cur_buf.clineNo=i
			netranger.api.NETRApi.ranger.NETRToggleExpand()
			break
EOF
endfunction

function! DoOpen()
PY<<EOF
import vim
nod=netranger.api.NETRApi.ranger.cur_node
if nod.is_DIR:
	if not (nod.expanded):
		netranger.api.NETRApi.ranger.NETRToggleExpand()
		vim.command("norm kztjj")
EOF
endfunction

function! Duplicate(dst)
	PY dst=vim.eval('a:dst')
	PY import os
	PY di=vim.eval('getcwd()')
	PY nod=netranger.api.NETRApi.ranger.cur_node
	PY fil=nod.name
	PY import fs_server
	PY fs_server.cp(os.path.join(di,fil),os.path.join(di,dst))
endfunction
" other
let g:NETRMinFileNumToLoadInParallel=9999999999
"To use for consecutive searches. Saves the need to enter search seperately
"each time. TODO: only on file xzt
"let g:NETRIgnore=[]
"
function! ShowHid()
if !exists('g:showhid')
	PY netranger.api.NETRApi.ranger.NETRToggleShowHidden()
	let g:showhid=1
endif
endfunction

"let g:NETRDefaultMapSkip = ['l']
"let g:NETRBufPanelOpen = ['l']
let g:NETROpenCmd="edit"
let g:NETRPreviewDefaultOn=0
" NETRANGER autocmds
"let g:NETRAutochdir="a"
" sort by modified
:autocmd FileType netranger setlocal noswapfile
:autocmd FileType netranger nmap <buffer> R SM
:autocmd FileType netranger nmap <buffer> <space> za
:autocmd FileType netranger nmap <buffer> <M-Right> :call DoOpen()<CR>Y
:autocmd FileType netranger cmap <buffer> <M-Right> <CR>:call DoOpen()<CR>Y
:autocmd FileType netranger nmap <buffer> <M-left> :call DoClose()<CR>
:autocmd FileType netranger cmap <buffer> <M-left> :call DoClose()<CR>
:autocmd FileType netranger nmap <buffer> <C-K> :call DoOpen()<CR>Y
:autocmd FileType netranger cmap <buffer> <C-K> <CR>:call DoOpen()<CR>Y
:autocmd FileType netranger nmap <buffer> <C-N> :call DoClose()<CR>
:autocmd FileType netranger cmap <buffer> <C-N> :call DoClose()<CR>
:autocmd FileType netranger nnoremap <buffer> cd :PY netranger.api.NETRApi.ranger.NETRVimCD()<CR>
:autocmd FileType netranger nnoremap <buffer> CD :exe "edit ". getcwd()<CR>
":autocmd FileType netranger nnoremap <buffer> <CR>  :call feedkeys("ep")<CR>
:autocmd FileType netranger command! -nargs=* DF call Duplicate(<f-args>)

":autocmd FileType nerdtree cmap <buffer> <M-Right> <CR>:call DoOpen2()<CR>Y
:autocmd FileType nerdtree cmap <buffer> <M-Right> <CR>:call DoOpen()<CR>Y
:autocmd FileType nerdtree cmap <buffer> <M-left> <CR>x
:autocmd FileType nerdtree nmap <buffer> <M-Right> :call DoOpen()<CR>Y
"<CR>ztj,
:autocmd FileType nerdtree nmap <buffer> <M-left> x
"completing next function 
:autocmd FileType vim nnoremap <buffer> ]m /^\(\s\)*function<CR>
:autocmd FileType vim nnoremap <buffer> [m ?^\(\s\)*function<CR>
:autocmd FileType vim nnoremap <buffer> ]M /^\(\s\)*endfunction/b<CR>
:autocmd FileType vim nnoremap <buffer> [M ?^\(\s\)*endfunction/b<CR>

"xzt
"autocmd CmdlineLeave / FileType nerdtree  :call HandleNERD()
"
"easymotion
"map <leader><leader>j <Plug>(easymotion-j)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_off_screen_search = 1
"for coc
  "python.autoComplete.extraPaths" :
  "["/usr/local/lib/python2.7/site-packages","/Users/eyalkarni/utils/jmpacket","/Users/eyalkarni/utils","/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-package"]
  "
"command! -bang -nargs=* LinesWithPreview call fzf#vim#grep( 'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --no-sort'}, 'up:50%', '?'), 1)
"let g:Lf_PreviewInPopup = 0 "causes bug 417
let g:Lf_PreviewResult = {
			\ 'File': 0,
			\ 'Buffer': 0,
			\ 'Mru': 0,
			\ 'Tag': 0,
			\ 'BufTag': 1,
			\ 'Function': 1,
			\ 'Line': 1,
			\ 'Colorscheme': 0,
			\ 'Rg' : 1
			\}
"When you go to normal mode , doing I inserts the line
"call win_execute(%d, "exec 'norm! %yy'")""" % (self._preview_winid, line_nr))
			"\'Line':[['I','"zyy:exec g:Lf_py "lineExplManager.quit()"<CR>"zp']],

"			\'Line':[['I','exec g:Lf_py "call win_execute(%d, "exec ''norm! "zyy''")" % (lineExplManager._preview_winid)<CR>:exec g:Lf_py "lineExplManager.quit()"<CR>"zp']],
let g:Lf_NormalMap ={ 
			\ 'Line':[['I','"zyy:exec g:Lf_py "lineExplManager.quit()"<CR>"zp']],
			\ 'File':[['I','"zyy:exec g:Lf_py "lineExplManager.quit()"<CR>"zp']],
		\ 'History' :[['I','"zyy:exec g:Lf_py "lineExplManager.quit()"<CR>"zp']]
			\} 


let g:Lf_MruMaxFiles=100000
let g:Lf_ShowHidden  = 1
let g:Lf_MaxCount = 50000
let g:Lf_PreviewInPopup =1

let g:Lf_PopupHeight =0.5
let g:Lf_PopupWidth =0.9
let g:Lf_WindowPosition = 'popup'

""ideally would be called each time
let g:Lf_PopupPosition=[max([float2nr(&lines * 0.4),10]),1]


nnoremap , :Leaderf line --popup<CR>
"faster
nnoremap <c-,> :Leaderf line --recall<CR>

":Leaderf line --popup<CR><C-K>
"let g:Lf_CacheDirectory = ""
let g:Lf_CacheDirectory = "/users/eyalkarni/vimpy3/ll"
let g:Lf_IndexTimeLimit =7
let g:Lf_RgConfig = [ "--max-columns=150"]
let g:Lf_WorkingDirectoryMode = 'c'
"nnoremap , :BLines<CR>
"nmap <c-,> :BLines<CR><C-P>
"let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
" I did the switch in code manager.py
nnoremap <leader>rd <c-L>

nmap <c-_> :let g:EasyMotion_add_search_history=1<CR><Plug>(easymotion-sn)
nmap <c-s> :let g:EasyMotion_add_search_history=1<CR><Plug>(easymotion-sn)

"nmap  y
if ($TERM=="xterm-256color")
	"only on nvim
	nmap  <C-/> :let g:EasyMotion_add_search_history=1<CR><Plug>(easymotion-sn)
endif
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'tabn<CR>'
    let i = i + 1
endwhile

nmap <c-f> :let g:EasyMotion_add_search_history=1<CR><Plug>(easymotion-sn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"map <leader>l <Plug>(easymotion-bd-jk)
"nmap <leader>L <Plug>(easymotion-overwin-line)
"nmap <leader>w <Plug>(easymotion-overwin-w)
"nmap <leader>f <Plug>(easymotion-bd-fl)
"if has('nvim')
nmap s <Plug>(easymotion-s)
nmap S <Plug>(easymotion-s2)
"endif
"meaning u would be like search everywhere

"omap U <Plug>(easymotion-bd-tl)
vmap u <Plug>(easymotion-bd-fl)
"vmap U <Plug>(easymotion-bd-tl)
vmap , <Plug>(easymotion-bd-tl)
"vnoremap <leader>U U
vmap <c-s> <Plug>(easymotion-s2)


nnoremap <silent> _a  :<C-u>CocList actions<cr>
" Manage extensions
nnoremap <silent> _e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> _c  :<C-u>CocList commands<cr>
nnoremap <silent> _d  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> _o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> _s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> _j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> _k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> _p  :<C-u>CocListResume<CR>
noremap _b :bnext<CR>
noremap _B :bprev<CR>
"let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
"cmd shortcuts
"m shokjknaaartcuts
"nnoremap <m-s> :w<CR>
"inoremap <m-s> <esc>:w<CR>
function! Domp()
	let @z=substitute(@+,"\<NL>","","g")
endfunction

nmap [a :ALEPrevious<CR>
nmap ]a :ALENext<CR>
nmap ]E <Plug>(coc-diagnostic-next)
nmap [E <Plug>(coc-diagnostic-prev)
nmap ]e <Plug>(coc-diagnostic-next-error)
nmap [e <Plug>(coc-diagnostic-prev-error)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)
nnoremap mb iimport ipdb;ipdb.set_trace()<ESC>
" jump to current path
nmap mC :call CopyPath()<CR>
noremap mc :cd %:p:h<CR>
nnoremap md :diffupdate<CR>
nnoremap mf :!open %:p:h<CR>
nmap mF vaF<F2>


"go to the current selection in rg"xy:call feedkeys("\<C-a>g" . @x)<CR>

vmap mg <C-Y>

"exact 
vnoremap mge "xy:exe ":FzfRg -e" . @x<CR>
"current folder lookup word
nmap mg viWmg
"current file lookup word
nmap MG viWY
nnoremap MH :Help 
nnoremap Mh :help 
nnoremap mH :LeaderfHelp<CR>
noremap mm :LeaderfMru<CR>
"this is by order and not fuzzy
noremap mM :Mru<CR>

"newline

map mn o<ESC>D
nmap <C-e> mn-
nmap <D-E> -mn+
nmap <D-e> -mn+
noremap H ~
noremap \H H
noremap \L L
"nnoremap <leader>H H
"H is available
"great!
nmap <C-=> <Plug>(easymotion-next)
nmap <C--> <Plug>(easymotion-prev)
nnoremap <leader>M M
nmap mL <Plug>(easymotion-lineanywhere)

"paste new line
function! MPf()
	let @+ =substitute(@+,"\<NL>$","",'')
	let @+ =substitute(@+,"^[ \t]*","",'')
	exec "norm \"+]P"
endfunction
nnoremap mp o <esc>:s/[^ \t]//ge<CR>:call MPf()<CR> 
"nnoremap <silent> mp :call Putline("]p")<CR>

"function! Putline(how)
	 "let l:type = getregtype(v:register)
	 "call setreg(getreg(v:register), "V")
	 "execute 'normal! "' . v:register . a:how
	 "call setreg(getreg(v:register), l:type)
 "endfunction 
"norm \"+
 



nnoremap mP :call Domp()<CR>"zp
nnoremap MP :call Domp()<CR>"zP
"convert from WINDOWS style <CR> 
nmap mwin :s/\<lf>CR>//g<CR>
"remove empty spaces and lines
nnoremap memp :%s/\s\+$//e<CR>:g/^$/d<CR>
"remove multi space in current line
nnoremap mss :s/\s\+/ /g<CR>
"remove empty lines
nnoremap msl :%s/\s\+$//e<CR>
"open cur folder 
noremap mt :call CloseAllNR()<CR>:sleep 200m<CR>:exec ":vert topleft split " . getcwd()<CR>
noremap mT :call CloseAllNR()<CR>:sleep 200m<CR>:exe ":tabnew ".expand("%:p:h")<CR>
"open cur file's folder
noremap MT :call CloseAllNR()<CR>:sleep 200m<CR>:exe ":vert topleft split ".expand("%:p:h")<CR>
"noremap mt :NERDTreeFind<CR>

nnoremap mu :UndotreeToggle<CR>
"nnoremap mu :MundoShow<CR>

nnoremap mws :CtrlSpaceSaveWorkspace<CR>
nnoremap mwd :let g:overrideCWD=0<CR>:CtrlSpaceSaveWorkspace default<CR>let g:overrideCWD=1<CR>

function! SpecialFind(type)
  let &selection = "inclusive"
	exec 'normal! `[v`]"xy'
	call Matches(@x)
endfunction

nnoremap M :set opfunc=SpecialFind<CR>g@
nmap Mm Miw
nmap MM MiW

function! SpecialFindRg(type)
  let &selection = "inclusive"
	exec 'normal! `[v`]"xy'
    :call feedkeys( ":LeaderfRgInteractive\<CR>". @x . "\<CR>\<CR>") 
endfunction

nnoremap L :set opfunc=SpecialFindRg<CR>g@
vmap L <C-Y>
nmap Ll Liw
nmap LL LiW
"make it seach the current zone
vnoremap RR "xy/=escape(@x,'\/')<CR><CR>
"look in the current file for all matches
vnoremap Y "xy:call Matches(@x)<CR>
vmap M Y
"to find small word
"coc#config
"copy entire line no new line
nnoremap my yy:let @+=@+[:len(@+)-2]<CR>
"nnoremap <C-P> :CtrlPCurWD<CR>
nmap m, :LeaderfLineCword<CR>
vmap m, "xy:exec ":LeaderfLinePattern ". escape(@z,'"')<CR>
vnoremap m, "xy:call feedkeys( ":LeaderfLine\<lt>CR>". @x ,'t')<CR>
nmap m' ysiW'
nmap m{ ysiW{
nmap m[ ysiW[
nmap m( ysiW(

nnoremap M, :CtrlP<CR>
nnoremap m. :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap mj :set nohlsearch<CR>
nnoremap mr :if &relativenumber <bar> :set norelativenumber <bar> else <bar> :set relativenumber <bar> endif<CR>
" \y is copy to another register
"don't use it to cut
noremap x "_x
"open command and search
nnoremap m~ ~
nnoremap <leader>~ ~
nmap <M-Space> q:i
nmap m~ q:i<esc><c-s>
nmap ~ <c-a>c
"just opens
nnoremap mq q:i<esc>
"nmap <leader><F5> q:i<esc>
noremap <S-F3> :call Goprev()<CR>
noremap <S-F4> :call Gonext()<CR>
nnoremap <S-F6> "xddkk"xp
nnoremap <S-F7> "xyy"xp
nnoremap <S-F8> "xdd"xp

nmap <leader>vs         <Plug>VimspectorStop
nmap <leader>vR         <Plug>VimspectorRestart
nmap <leader>vp           <Plug>VimspectorPause
nmap <F3>        <Plug>VimspectorStepOut
nmap <F4>        :call vimspector#Launch()<CR>
nmap <F6>         <Plug>VimspectorContinue
nmap <F7>        <Plug>VimspectorStepInto
nmap <F8>        <Plug>VimspectorStepOver
nmap <F9>         <Plug>VimspectorToggleBreakpoint
nmap <leader><F9> <Plug>VimspectorToggleConditionalBreakpoint
nmap _<F9>         <Plug>VimspectorAddFunctionBreakpoint
nmap <leader>vl        :call vimspector#Launch()<CR>
nmap <leader>vr        :call vimspector#Reset()<CR>
function! FZFOpen(command_str)
  if (expand('%') =~# '^N:.*' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

command! -bang -nargs=* FzfRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* FzfRgDir
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case "" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

let g:fzf_action = {'ctrl-o' : '!open'}
let g:fzf_history= "~/.fzf/history"
let $FZF_DEFAULT_OPTS="--history=" . $HOME . "/.fzf/history_file"

function! GetMappings()
	let lines=MinExec('map')
	let lines=split(lines,'\n')
	return lines
endfunction

function! GetCommands()
	let lines=[]
	let nu=histnr("cmd")
	for i in range(1,nu)
		let lines+=[histget("cmd",i)]
	endfor
	return lines
endfunction

function! CdDir(item)
	:exe "cd ".a:item
endfunction

function! HandleCommand(item)
	call feedkeys("q:")
	call feedkeys("G?\\V".escape(a:item,'\/?')."\<CR>")
endfunction

function! BH(item)
	exe ":T " . a:item
endfunction

"nmap <leader>bh :split <bar> :e ~/.bash_history<CR>,
"nmap <leader>bh :call fzf#run({'source':"cat ~/.bash_history \<bar> sort \<bar> uniq",'sink': function('BH')})<CR>
function! CompleteCommand(arg)
	call fzf#run({'source': GetCommands(),'sink': function('HandleCommand'),'options': '-m --query "'.a:arg.'"'} ) 
endfunction 

nnoremap <leader>R R

"this function maps all registers so that we know what we have in each
"c-q for insert mode%. R for other modes.
func! MapR()
	let lst=['+','*','.','=','/','%']
	for i in range(10)
		call add(lst,string(i))
	endfor
	let k=char2nr('a')
	for j in range(26)
		call add(lst,nr2char(k+j))
	endfor 
for i in lst 
		exec 'nmap R'. i .' :echo getreg("'.i .'")<CR>'
		exec 'vmap R'. i .' <CMD>:echo getreg("'.i .'")<CR>'
		exec 'imap <c-q>'. i .' <CMD>:echo getreg("'.i .'")<CR>'
endfor 
endf

call MapR()

"complete the command using recent commands 
:cmap <expr> <c-a> &cedit.'^"xy$'."<esc><esc>:call CompleteCommand(@x)<CR>"
"edit command in command window
:cmap <expr> <c-b> &cedit."i"


nnoremap <silent> <C-a>c :call fzf#run({'source': GetCommands(),'sink': function('HandleCommand'),'options': '-m'} )<CR>
"search only for the mapping key
nnoremap <silent> <C-a>m :call fzf#run({'source': GetMappings(),'options': '-m -n 2'} )<CR>
"search in mapping description as well
nnoremap <silent> <C-a>M :call fzf#run({'source': GetMappings(),'options': '-m'} )<CR>
nnoremap <leader><bar> <bar>
"nnoremap <silent> <bar> :call FZFOpen(':Buffers')<CR>
"<D-Bslash>
"<D-Bslash>
nmap <D-Bslash> :let g:Lf_JumpToExistingWindow = 0<CR>:Leaderf --popup buffer<CR>
nnoremap <silent> <bar> :let g:Lf_JumpToExistingWindow = 1<CR>:Leaderf --popup buffer<CR>
nnoremap <silent> <C-a>b :call FZFOpen(':Buffers')<CR>
"nnoremap <silent> <C-z> :call FZFOpen(':Buffers')<CR>

nnoremap <silent> <C-a>g :LeaderfRgInteractive<CR>
"nnoremap <silent> <C-a>g :call FZFOpen(':FzfRg!')<CR>
nnoremap <silent> <C-a>G :LeaderfRgInteractive<CR><CR><CR>
"for exact
"nnoremap <silent> <C-a>G :call FZFOpen(':FzfRg! -e')<CR>
nnoremap <silent> <C-a>C :call FZFOpen(':Commands')<CR>
"nnoremap <silent> <C-a>l :call FZFOpen(':BLines')<CR>
"c-l is lines in insert mode
nnoremap <silent> <C-a>l :call fzf#vim#buffer_lines(sink=function('PInsert'))<CR>
nnoremap <silent> <C-a>L m':LeaderfLineAll<CR>
nnoremap <silent> <C-a>r :LeaderfRgRecall<CR>
"files current dir
"nnoremap <silent> <C-a>f :call FZFOpen(':Files')<CR>
nnoremap <c-a>f :CtrlPCurWD<CR>
"nnoremap <silent> <C-a>f :exe ":LeaderfFile ".getcwd()<CR>
"files current file
"66444
nnoremap <silent> <C-a>F :exe ":LeaderfFile " . expand('%:p:h')<CR>
nnoremap <silent> <C-a>h :call FZFOpen(':History')<CR>
nmap <silent> <C-a>H :call fzf#run({'source':"cat ~/.bash_history \<bar> sort \<bar> uniq",'sink': function('BH')})<CR>
nnoremap <silent> <C-a>a :call FZFOpen(':Ag')<CR>
nnoremap <silent> <C-a>d :call fzf#run({'source': uniq(sort(g:dirs)),'sink':function('CdDir'),'options': '-m'})<CR>
nnoremap <silent> <C-a>w :call FZFOpen(':Windows')<CR>
nnoremap <silent> <M-Bslash> :call FZFOpen(':Windows')<CR>
nnoremap <silent> <C-a>s :call FZFOpen(':Snippets')<CR>
"use it to increase
nnoremap <silent> <C-a><C-a> <C-a>

  " open FZF in
  " current file's2 directory
  "
"execut under cursor
nnoremap <F2> :exe getline(".")<CR>
vnoremap <F2> "xy:@x<CR>

noremap <F1> :execute ":help " . expand('<cword>')<CR>






function! TermO()
	let k=g:neoterm.last_id+1
	Tnew

	exe k."T . /etc/bashrc"
	exe k."T . ~/.bash_profile"
	exe k."T set -o emacs"
	if g:on_ek_computer
	exe k."T bind '\"\\C-r\": \"\\C-ahstr -- \\C-j\"'"
	endif
	exe k."Tclear"
endfunction

function! TermOV(use_file_dir)
	set splitright
	let k=g:neoterm.last_id+1
	vertical Tnew
	exe k."T . /etc/bashrc"
	exe k."T . ~/.bash_profile"
	if a:use_file_dir
		exe k."T cd " . expand('%:p:h')
	else
		exe k."T hookvim" 
	endif  
		exe k."T set -o emacs"
	if g:on_ek_computer
		exe k."T bind '\"\\C-r\": \"\\C-ahstr -- \\C-j\"'"
	endif

	exe k."Tclear"
endfunction

noremap <leader>od :exec ":vs " . getcwd()<CR>
nmap <leader>at :AutoSaveToggle<CR>
nnoremap <leader>em :call Exec("messages")<CR>
"enable save
nnoremap <leader>es :let b:auto_save = 1<CR>

nnoremap <leader>do :diffoff<CR>
nnoremap <leader>du :diffupdate<CR>
nnoremap <leader>dt :diffthis<CR>
" opens terminal in new window
"todo FZF
nnoremap <leader>oc :copen<CR>
"opens file
nmap <leader>of :vsp<CR>ml<D-Bslash>
nnoremap <leader>oi :call RecallInserts2()<CR>
nnoremap <leader>ol :lopen<CR>
nnoremap <leader>ov :TN ~/vimpy3/.vimrc<CR>
nnoremap <leader>vl :TN ~/.vim/vimlog.log<CR>
nnoremap <leader>oE :!
"open terminal in new tab
nnoremap <leader>ot :tabnew <bar> :call TermO()<CR>:call feedkeys("i")<CR>
"open terminal in new window
nmap <leader>tt :call TermOV(0)<CR>li
nmap <leader>Tt :call TermOV(1)<CR>li
"sets python 2/3
"nmap <leader>s2 :let $PYTHONPATH='/usr/local/lib/python2.7/site-packages:/Users/eyalkarni/utils/jmpacket:/Users/eyalkarni/utils:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages'<CR>:CocCommand python.setInterpreter<CR>
"'/Users/Library/Frameworks/Python.framework/Versions/2.7/bin/python
"nmap <leader>s3 :let $PYTHONPATH='/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/'<CR>:CocCommand python.setInterpreter<CR>
"TODO:: to add site-packages
nmap <leader>s3  :call coc#config('python', {'jediEnabled': v:false, 'pythonPath': '/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'})<CR>:CocRestart<CR>
nmap <leader>s2  :call coc#config('python', {'jediEnabled': v:false, 'pythonPath': '/Library/Frameworks/Python.framework/Versions/2.7/bin/python'})<CR>:CocRestart<CR>
"

"start TeX
nmap <leader>st :set filetype=tex<CR>:w<CR>itemplate<TAB>a<esc>:VimtexToggleMain<CR>
nmap <leader>so :let tt=expand('%:t')<CR>:VimtexCompileOutput<CR>:exe ":MC ". tt . ":"<CR>

noremap <leader>z m
"nnoremap <leader>c :only<CR>
""closes other tabs
"noremap Q :call SaveLastWindow()<CR> :close<CR>
noremap Q :close<CR>
nnoremap <leader>q :tabo!<CR>:call CloseAllBuffersButCurrent()<CR>
nnoremap <leader>Q :q!<CR>
"closes other buffer same tab
nnoremap <nowait> <leader>c :call CloseAllWindowsButCurrent()<CR>
nnoremap <nowait> <leader>C :call CloseAllNR()<CR>
 
nnoremap ZB :call CloseAllBuffersButCurrent()<CR>

nnoremap <silent> <Leader>= :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2)/3<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>l :wincmd l<CR>
nmap ml <leader>l
nmap mj <leader>j
nmap mk <leader>k
nmap mh :wincmd h<CR>
autocmd  FileType * vmap <nowait> <buffer> aF <Plug>(textobj-function-A)
autocmd  FileType * nnoremap <nowait> <buffer> <leader>h :wincmd h<CR>
nnoremap <leader>m :tabnext<CR>
nnoremap <leader>n :tabprevious<CR>

" insert a single char
nnoremap <leader>` `
nnoremap m` `
"avabnnoremap2 <leader>s :exec "normal i".nr2chaar(getchar())."\e"<CR>
function! InsertBefore(count) range
	if a:count==0
		let l=1
	else
		let l=a:count
	endif
	for j in range(l)
		let t=getchar()
		if t==27
			break
		endif
        let @z= t
        ":normal "zp
        if l>1
		exec ":normal a"."\<c-r>='".nr2char(t)."'"."\<ESC>"
    else
		exec ":normal i"."\<c-r>='".nr2char(t)."'"."\<ESC>"
    endif
		"redraw
	endfor 
endfunction
function! InsertAfter(count) range
	if a:count==0
		let l=1
	else
		let l=a:count
	endif
	for j in range(l)
		let t=getchar()
		if t==27
			break
		endif
        let @z= t
        ":normal "zp
		exec ":normal a"."\<c-r>='".nr2char(t)."'"."\<ESC>"
		"redraw
	endfor 
endfunction
function! Vv() range
	if v:count==0
		let l=1
	else
		let l=v:count
	endif
	for j in range(l)
		let t=getchar()
		if t==27
			break
		endif
		if j==0 
		exec "normal i"."\<c-r>='".nr2char(t)."'"."\<ESC>"
		else
		exec "normal a"."\<c-r>='".nr2char(t)."'"."\<ESC>"
	endif 
		redraw
	endfor 
endfunction
nmap ` i
imap ` <ESC>
inoremap <c-]> `
imap <c-`> <c-O>
nmap <c-`> <esc>
"inserts one char (or more with count)
nmap F :<C-U>call InsertBefore(v:count1)<CR>
nmap <C-F> :<C-U>call InsertAfter(v:count1)<CR>
"nnoremap m= =
"nmap ` :exec "normal i".nr2char(getchar())."\e"<CR>
"appends one char
"nmap ! :call Vu()<CR>
"nmap \! 10:call Vu()<CR>
"nmap \` 10:call Vu()<CR>
nnoremap ! `
nnoremap !! ``
"nthis isnoremap <leader>S :exec "normal a".nr2char(getchar())."\e"<CR>
nmap <leader>i -o

noremap <leader>dd "zdd
noremap <leader>d "zd

noremap D di
nnoremap X "zdi

noremap <leader>D D
"delete without effect of clipboard
command! -range D <line1>,<line2>d z
"delete without leaving trace
vnoremap D "zd
nnoremap DD "zdd

"C to ci
nnoremap C :call StartSpecialInsert()<CR>ci
nnoremap cc C
nnoremap \C cc 

nnoremap c "zc
"vnoremap cc "zcc
vnoremap c "zc
"to have the clipboard not changed on pasting visual " would still be as usual
vnoremap p p:let @+=@0<CR>
"cnnoremap <leader>. @:
nnoremap <C-.> @:


vnoremap <leader>p "zp
nnoremap <leader>p "zp
nnoremap <leader>P "zpi

" \y is copy to another register
noremap <leader>yy "zyy
noremap <leader>y "zy
noremap <leader>Y "zyi
"let g:jedi#completions_command='<leader>a'
"let g:jedi#usages_command='<leader>gn'

"Bare mappings
"changes current argument
"omap i, ?[\,(]?e+1<CR>cv/[\,)]/s-1<CR>
nmap ci, dv?[\,(]?e+1<CR>cv/[\,)]/s-1<CR>
"nmap di, dv?[\,(]?e+1<CR>dv/[\,)]/s-1<CR>
imap <C-L> <esc>:call RecallInserts()<CR>

" for ansi keyboard
"nnoremap ± :set incsearch<CR>/
nnoremap Y :set incsearch<CR>/\c
"nnoremap , :set incsearch<CR>/\c
"nnoremap <C-[> :set incsearch<CR>/\c
"vnoremap <nowait> af <Plug>(textobj-function-a) 
"execute a function based on the current visual selection
vnoremap F "xd"=HandleF()<CR>P
vnoremap <C-F> "xd"=HandleCF()<CR>p

"execute a function based on the current visual selection but replace content of selection
vnoremap H "xy:call HandleH()<CR>
vnoremap <C-H> "xy:call HandleCH()<CR>
vnoremap <C-J> "xy:call HandleCJ()<CR>
"look in files for a match
vnoremap <C-Y> "xy:exe ":FzfRg " . @x<CR>
"xy:call feedkeys("\<C-a>g" . @x)<CR> 
vnoremap <C-Y> "xy:call feedkeys( ":LeaderfRgInteractive\<lt>CR>". @x . "\<lt>CR>\<lt>CR>")<CR>

nnoremap <C-L> :call RegsToggle()<CR>
vnoremap <C-L> <CMD>:call RegsToggle()<CR>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf


"ctrl maps

nmap <silent> <D-J> <Plug>(ale_previous_wrap)
nmap <silent> <D-j> <Plug>(ale_previous_wrap)
nmap <silent> <D-K> <Plug>(ale_next_wrap)
nmap <silent> <D-k> <Plug>(ale_next_wrap)
"nvim-ipy stuff
let g:nvim_ipy_perform_mappings=0

nmap <leader>rf  :exec ":call IPyRun(\"%run '". expand('%:p') . "\'\")"<CR>
map <silent> <F5>         <Plug>(IPy-Run)
map <silent> <leader>rb <Plug>(IPy-Interrupt)
nmap <leader>rt <Plug>(IPy-Terminate)
map <leader>rc <Plug>(IPy-RunCell)
imap <silent> <D-J> <Plug>(IPy-Complete)
imap <silent> <D-j> <Plug>(IPy-Complete)
map <silent> <leader>? <Plug>(IPy-WordObjInfo)
nmap <D-R> :call IPyRun(input('enter python: '))<CR>
nmap <D-r> :call IPyRun(input('enter python: '))<CR>
nmap <D-I> :let @z=input('enter text: ') <bar> norm "zp<CR>
nmap <D-i> :let @z=input('enter text: ') <bar> norm "zp<CR>
" terminal mappings
if has('vim')
	:tnoremap <C-V> <C-W>"+
	:tnoremap <C-l> <C-W>N
	:tnoremap <C-Y> <C-W>Nyyi
	:tnoremap <C-X> <C-W>NT$ly$i " copy line from $
	:tnoremap <C-Z> <C-W>Nyi
else
	
	:tnoremap <C-v> <C-\><c-N>pi
	:tnoremap <C-y> <C-\><c-N>yyi
	:tnoremap <C-X> <C-\><c-N>T$ly$i
	:tnoremap <C-l> <C-\><c-N>
	:tnoremap <C-d> cd <C-\><c-N>"=getcwd()<CR>pi<CR>
	:tnoremap <C-e> cd <C-\><c-N>"=expand("#:p:h")<CR>pi<CR>
	"quits
	:tmap <C-q> <C-l>Q
	" copy line from $
endif
"esc only in neoterm
au filetype neoterm :tnoremap <buffer> <Esc> <C-\><C-n>
command! Tailf call Tailf()<CR>
function! Tailf()
	"Press C-c to stop tailing
	while 1
		e
		normal G
		redraw
		sleep 1
	endwhile
endfunction
"make Y act like M
ca Y M

command! -nargs=1 MESC call Matches(<f-args>)
command! -nargs=1 MC call MatchesF(<f-args>)
command! -nargs=1 MW call MatchesF('\<'.<f-args>.'\>')
command! -nargs=1 M call MatchesF('\c'.<f-args>)
command! -nargs=* VG call Matches2(<f-args>)
"make new file
function! Ff()
exe 'norm "zy'
:echo @z
endfunction
command! -nargs=* -complete=file C call CloseAllNR()<bar>:sleep 200m<bar>:vert topleft split <args>
command! -nargs=1 -range GL <line1>,<line2>call GL(<f-args>)
command! -nargs=*  -complete=help Help vert :help <args>
"map NT :NERDTree
nnoremap TN :tabnew<CR>
command! -nargs=* -complete=file TN if HandleTN(<q-args>) <bar>  :let tab=WhichTab(<f-args>) <bar> if tab==0 <bar> :tabnew <args> <bar> :else <bar> :exe  'norm '.tab.'gt' <bar> endif <bar> endif

function! HandleTN(...)
if a:000==['']
		tabnew 
		return 0
endif 
return 1
endfunction

runtime ftplugin/man.vim " adds Man command



let cmd=['export PYTHONPATH="$PYTHONPATH;/Users/eyalkarni/utils/jmpacket"']
":CtrlSpaceLoadWorkspace default
"call ctrlspace#workspaces#LoadWorkspace(0,'default')

"let g:sickness#expression#preferred_shortcut_map = 'opendelim'  " uses {i,a}{(,{,[,<} for expression text objects
"let g:sickness#expression#preferred_shortcut_map = 'closedelim' " uses {i,a}{),},],>} for expression text objects
let g:sickness#expression#preferred_shortcut_map = 'char'       " uses {i,a}{b,B,r,a} for expression text objects

" or if you want to set your own mappings
"let g:sickness#expression#use_default_maps = 0
xmap iit <cmd>call sickness#textobj#indentation#motion(v:false, 't')<CR>
omap iit <cmd>call sickness#textobj#indentation#motion(v:false, 't')<CR>
""letvmap iit <plug>(textobj-sickness-indentation-top-i)
"omap ait <plug>(textobj-sickness-indentation-top-a)
"vmap ait <plug>(textobj-sickness-indentation-top-a)
"omap ieb <plug>(textobj-sickness-expression-parenthesis-i)
"xmap ieb <plug>(textobj-sickness-expression-parenthesis-i)
"omap aeb <plug>(textobj-sickness-expression-parenthesis-a)
"xmap aeb <plug>(textobj-sickness-expression-parenthesis-a)

"omap ieB <plug>(textobj-sickness-expression-brace-i)
"xmap ieB <plug>(textobj-sickness-expression-brace-i)
"omap aeB <plug>(textobj-sickness-expression-brace-a)
"xmap aeB <plug>(textobj-sickness-expression-brace-a)

"omap ier <plug>(textobj-sickness-expression-bracket-i)
"xmap ier <plug>(textobj-sickness-expression-bracket-i)
"omap aer <plug>(textobj-sickness-expression-bracket-a)
"xmap aer <plug>(textobj-sickness-expression-bracket-a)

"omap iea <plug>(textobj-sickness-expression-chevron-i)
"xmap iea <plug>(textobj-sickness-expression-chevron-i)
"omap aea <plug>(textobj-sickness-expression-chevron-a)
"xmap aea <plug>(textobj-sickness-expression-chevron-a)
let g:sickness#line#use_default_maps = 0

 omap iL <plug>(textobj-sickness-line-i)
 xmap iL <plug>(textobj-sickness-line-i)
 omap aL <plug>(textobj-sickness-line-a)
 xmap aL <plug>(textobj-sickness-line-a) 

let g:sickness#field#use_default_maps = 0
omap iFb <plug>(textobj-sickness-field-parenthesis-i)
vmap iFb <plug>(textobj-sickness-field-parenthesis-i)
omap aFb <plug>(textobj-sickness-field-parenthesis-a)
vmap aFb <plug>(textobj-sickness-field-parenthesis-a)

omap iFB <plug>(textobj-sickness-field-brace-i)
vmap iFB <plug>(textobj-sickness-field-brace-i)
omap aFB <plug>(textobj-sickness-field-brace-a)
vmap aFB <plug>(textobj-sickness-field-brace-a)

omap iFr <plug>(textobj-sickness-field-bracket-i)
vmap iFr <plug>(textobj-sickness-field-bracket-i)
omap aFr <plug>(textobj-sickness-field-bracket-a)
vmap aFr <plug>(textobj-sickness-field-bracket-a)

omap iFa <plug>(textobj-sickness-field-chevron-i)
vmap iFa <plug>(textobj-sickness-field-chevron-i)
omap aFa <plug>(textobj-sickness-field-chevron-a)
vmap aFa <plug>(textobj-sickness-field-chevron-a)
"COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-refactor)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

nmap <BS> :ALEDetail<CR>
nmap <c-g> :call CocActionAsync("doHover")<cr>
let g:sick_symbol_default_mappings =0
"map <silent> <C-c> <Plug>(coc-cursors-position)
"nmap <silent> <C-d> <Plug>(coc-cursors-word)*

"nmap <silent> <C-d> <Plug>(coc-cursors-word)
"xmap <silent> <C-d> <Plug>(coc-cursors-range)
let g:VM_mouse_mappings=1

"silent! call repeat#set("H", -1)
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abmg'  "'abdmg'
let g:vimtex_enabled=1

let g:vimtex_mappings_disable = {
	\ 'n': ['tse', 'tsd','tsD','tsc'],
	\ 'x': ['tsd','tsD','tsc']
	\}
setlocal spell
set spellfile = "~/.vim/spell/en.utf-8.add"
set spelllang=en_us
let g:vimtex_complete_recursive_bib=1
"let g:vimtex_fold_manual=1
let g:vimtex_fold_enabled =1
"autocmd BufEnter *.tex set foldmethod=expr
"autocmd BufEnter *.tex set foldexpr=vimtex#fold#level(v:lnum)
"autocmd BufEnter *.tex set foldtext=vimtex#fold#text()
"
let g:vimtex_view_method = 'skim'
"let g:vimtex_view_method = 'mupdf'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'background' : 1,
    \ 'build_dir' : '/tmp/builddir',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
	\  '-pvc',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

 let g:UltiSnipsExpandTrigger = '<c-g>'
 "let g:UltiSnipsJumpForwardTrigger = '<tab>'
 "let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
 let g:mathshortcuts = ''
":call UltiSnips#ExpandSnippet()<CR>
"strange that I have to change this
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>" 
"function! ChangeOrder()
"envdebug_keymap
"endfunction
" }}}
let g:inactivity_limit = 1  " max Insert mode inactivity before fail, in seconds
let g:check_frequency = 200   "seconds between checks
let g:special_insert = 0

set updatetime =3000

function! CheckSpecialInsert()
	if g:special_insert
		au monitor CursorHoldI * call feedkeys(':echo "Insert timed out"')
	endif
endfunction

function! StartSpecialInsert()
	let g:special_insert=1
endfunction

function! EndSpecialInsert()
	if g:special_insert
		au! monitor CursorHoldI
	endif
	let g:special_insert=0
endfunction


augroup monitor
    au!
    " when vim starts kick off the infinitely repeating calls to the monitor function
    au InsertEnter * call CheckSpecialInsert()
	au InsertLeave * call EndSpecialInsert()    " when cursor moves in Insert mode update the last activity time
augroup END
"""INSERT MODE SAVE
let g:detect_mod_reg_state = -1
function! DetectRegChangeAndUpdateMark()
    let current_small_register = getreg('"-')
    let current_mod_register = getreg('""')
    if g:detect_mod_reg_state != current_small_register || 
                \ g:detect_mod_reg_state != current_mod_register
        normal! mM
        let g:detect_mod_reg_state = current_small_register
    endif
endfunction

" Mark I at the position where the last Insert mode occured across the buffer
autocmd InsertLeave * execute 'normal! mI'

" Mark M at the position when any modification happened in the Normal or Insert mode
autocmd CursorMoved * call DetectRegChangeAndUpdateMark()
autocmd InsertLeave * execute 'normal! mM'

"include math mappings
if filereadable(g:vimloc . "/math.vim")
	exe 'source' . g:vimloc . "/math.vim"
endif
""Ycm
"let g:jedi#goto_definitions_command = "<leader>gd"
"let g:jedi#goto_command = "<leader>gg"
"let g:jedi#usages_command = "<leader>gn"
"let g:jedi#completions_command = "<C-b>"
let g:ycm_filetype_whitelist = {'c': 1,'cpp':1} "'tex':1

if g:on_ek_computer
"JDevlieghere/dotfiles
	let g:ycm_global_ycm_extra_conf= '~/vimpy3/globalycm.py'
endif

nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gD :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gI :YcmCompleter GoToInclude<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gT :YcmCompleter GetType<CR>
"
au filetype c nnoremap K :YcmCompleter GetDoc<CR>
noremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"let g:ycm_key_invoke_completion="<C-b>" "ctrl i ?
"let g:ycm_key_detailed_diagnostics='<leader>wd'
" let g:ycm_server_python_interpreter="PY
" ""
"
" " Called once right before you start selecting multiple cursors
" "
" "function! Multiple_cursors_before()
" "    call youcompleteme#DisableCursorMovedAutocommands()
" "endfunction
"
" "" Called once only when the multiple selection is canceled (default <Esc>)
" "function! Multiple_cursors_after()
" "    call youcompleteme#EnableCursorMovedAutocommands()
" "endfunction
"
"set runtimepath^=~/vimpy3/plugged/coc-pythom

function! MakeItFaster(adv)
	if (a:adv)
		:let g:airline_extensions = []
		:CocDisable
		:ALEDisable
		:NoMatchParen
	:autocmd! InsertLeave *
	:autocmd! TextYankPost *
    ":syntax disable
	augroup fugitive
		autocmd! BufWriteCmd *
		autocmd! FileWriteCmd *
	augroup END
	endif
	":GitGutterDisable
	"autocmd! BufReadPre //*
	":Fugitive?
	":autocmd! BufWritePre *
	":autocmd! BufWritePost *
	":autocmd! BufWrite *
endfunction

function! WhichTab(filename)
    " Try to determine whether file is open in any tab.  
    " Return number of tab it's open in
    let buffername = bufname(a:filename)
    if buffername == ""
        return 0
    endif
    let buffernumber = bufnr(buffername)

    " tabdo will loop through pages and leave you on the last one;
    " this is to make sure we don't leave the current page
    let currenttab = tabpagenr()
    let tab_arr = []
    tabdo let tab_arr += tabpagebuflist()

    " return to current page
    exec "tabnext ".currenttab

    " Start checking tab numbers for matches
    let i = 0
    for tnum in tab_arr
        let i += 1
        if tnum == buffernumber
            return i
        endif
    endfor

endfunction
function! StopTimerFunc()
	call timer_stop(g:autosaveWS)
endfunction

let g:last_copied=""
let g:init=0
function! TimerFunc(a)
    let minbu=MinExec(':buffers')
    "echom minbu
    "echo "called"
	"multiple instances of neovim cause trouble when tried to save. I verify
	"that only in the neovim-qt (and make sure only 1 is opened), it will save
	""exists('g:GuiLoaded') ||
    "if g:init==0
        "!cp /Users/eyalkarni/vimpy3/.git/cs_workspaces /tmp/befrep 
        "echom "replacing"
        "call ctrlspace#workspaces#DeleteWorkspaceEx('defaultOld')
        "!cp /Users/eyalkarni/vimpy3/.git/cs_workspaces /tmp/afterdel 
        "call ctrlspace#workspaces#RenameWorkspaceEx('default','defaultOld')
        "!cp /Users/eyalkarni/vimpy3/.git/cs_workspaces /tmp/afterrep 
    "endif 
"call ctrlspace#workspaces#SetActiveWorkspaceName('default')
    "Remember not to run in parallel
    if g:init==1
	if exists(':GonvimWorkspaceNew')==2 || exists('g:GuiLoaded')
		:silent :CtrlSpaceSaveWorkspace default
	endif
    "if g:init==0
        "let g:init=1
        "call ToggleVerbose() 
    endif

        ":profile stop
	"keep track of external clipboard using registers.
	if g:last_copied!=@+ && @+!=@"
		"from o to w
		for i in range(char2nr('v'),char2nr('o'),-1)
			exe "let @".nr2char(i+1)." = @". nr2char(i) 
		endfor
		let @o=@+
		let g:last_copied=@+
	endif
endfunction


function! SaveInsertsFunc(a)
	PY dic={}
	PY import os
	let lastbuf=bufnr('$')
	for i in range(lastbuf)
		let bufn=bufname(i)

		if bufn!=''
			let t=getbufvar(i,'inserts')
			PY key=vim.eval('expand("#'+str(vim.eval('i'))+':p")')
			PY dic[key]=vim.eval('t')
		endif
endfor
PY << EOF
import vim
import pickle
output = open(vim.eval('g:vimloc')+'/inserts.cache', 'wb')
pickle.dump(dic ,output)
output.close()
EOF
endfunction

let g:line=''
 "//"languageserver": {
 "//   "ccls": {
 "//     "command": "ccls",
 "//     "filetypes": ["c", "cpp", "objc", "objcpp"],
 "//     "rootPatterns": [".ccls", "compile_commands.json", ".vim/", ".git/", ".hg/"],
 "//     "initializationOptions": {
 "//        "cache": {
 "//          "directory": "/tmp/ccls"
 "//        }
 "//      }
 "//   }
 " } ,
"to replace multiple lines in another windows copy to reg first 
 function! Dorep()
	 let aa=split(getreg('c'),'\n')
	 for k in aa
		 exe "g/".k."/norm I\/\/U"
	 endfor 
 endfunction 
if g:on_ek_computer 
     source ~/vimpy3/secfunc.vim
endif

function! ReplaceRPC()
%s/\[.\{-}in.\{-}\]//g
%s/\[.\{-}out.\{-}\]//g
endfunction 

function! MakeJson(...)
	if a:0 > 0
	 let override = a:1
   else
	 let override = 0
   end 
PY << EOF
import os
import json
uu=(not os.path.exists('.vimspector.json')) or vim.eval('override')
if uu==1:
    print('making')
    dir=vim.eval('expand("%:h")')
    prog= vim.eval('expand("%:p")')
    name= vim.eval('expand("%:t")').replace('.py','')
    data={
      "configurations": {
        "genhash: Launch": {
          "adapter": "debugpy",
          "configuration": {
            "name": name+": Launch",
            "type": "python",
            "request": "launch",
            "python": "/Library/Frameworks/Python.framework/Versions/3.7/bin/python3" ,
            "cwd": dir,
            "stopOnEntry": "true",
            "console": "externalTerminal",
            "debugOptions": [],
            "justMyCode":"true",
            "program": prog,
            "args":[],
            "env" :
            {"PYTHONPATH":"/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/"}
          }
        }
      }
    }
    with open('.vimspector.json', 'w') as outfile:
        json.dump(data, outfile,sort_keys=True,indent=4, separators=(',', ': '))
else:
    print('already exists')
EOF
endfunction

function! MakeJson2(...)
	if a:0 > 0
	 let override = a:1
   else
	 let override = 0
   end 
PY << EOF
import os
import json
uu=(not os.path.exists('.vimspector.json')) or vim.eval('override')
if uu==1:
    print('making')
    dir=vim.eval('expand("%:h")')
    prog= vim.eval('expand("%:p")')
    name= vim.eval('expand("%:t")').replace('.py','')
    data={
      "configurations": {
        "genhash: Launch": {
          "adapter": "debugpy",
          "configuration": {
            "name": name+": Launch",
            "type": "python",
            "request": "launch",
            "python": "/Library/Frameworks/Python.framework/Versions/3.7/bin/python3" ,
            "cwd": dir,
            "stopOnEntry": "true",
            "console": "externalTerminal",
            "debugOptions": [],
            "justMyCode":"true",
            "program": prog,
            "args":[],
            "env" :
            {"PYTHONPATH":"/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/"}
          }
        }
      }
    }
    with open('.vimspector.json', 'w') as outfile:
        json.dump(data, outfile,sort_keys=True,indent=4, separators=(',', ': '))
else:
    print('already exists')
EOF
endfunction

function! SSHAgent()
	:!eval "$(ssh-agent -s)"
	:!ssh-add 
endfunction 

function! SetupPython()
	:CocCommand python.setInterpreter
	:sleep 5
	:call feedkeys('5')
endfunction

nmap  :qa!

let $NVIM_COC_LOG_LEVEL = 'debug'
"that is a patch in coc that remove some files
let g:coc_files=' *.py,*.tex,*.vimrc '
"let g:coc_files=' * '
"function! STab_Or_Complete()
  "if mode(1)=='ic'||mode(1)=='ix'
    "return "\<C-P>"
  "else
    "return "\<S-Tab>"
  "endif
"endfunction

"function! Tab_Or_Complete()
  "if mode(1)=='ic'||mode(1)=='ix'
    "return "\<C-N>"
  "else
    "return "\<Tab>"
  "endif
"endfunction
func! ToggleHebrew()
  if &rl
    set norl
    set keymap=
  else
    set rl
    set keymap=hebrew
  end
endfunc
