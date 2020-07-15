
"  Mappings!! of plugins as well
"
nmap <MiddleMouse> :redraw<CR>
"nmap <MiddleMouse> i
"imap <MiddleMouse> <ESC>
"
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



"
"autocmd VimEnter * call RestoreSession()
"function! RestoreSession()
	"if argc() == 0 && filereadable(eval('g:ses')) "vim called without arguments
		"execute "source " . g:ses
	"endif
"endfunction


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

"call DisableKeys()


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
"xzt
"autocmd CmdlineLeave / FileType nerdtree  :call HandleNERD()
"
"easymotion
"map <leader><leader>j <Plug>(easymotion-j)
"for coc


nnoremap , :Leaderf line --popup<CR>
"faster
nnoremap <c-,> :Leaderf line --recall<CR>

":Leaderf line --popup<CR><C-K>
"let g:Lf_CacheDirectory = ""

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
 



function! Domp()
	let @z=substitute(@+,"\<NL>","","g")
endfunction
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
au filetype neoterm :tnoremap <buffer> <C-BS> <ESC>
"make Y act like M



"map NT :NERDTree
nnoremap TN :tabnew<CR>

runtime ftplugin/man.vim " adds Man command



"let cmd=['export PYTHONPATH="$PYTHONPATH;/Users/eyalkarni/utils/jmpacket"']
":CtrlSpaceLoadWorkspace default
"call ctrlspace#workspaces#LoadWorkspace(0,'default')


"COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-refactor)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)


nmap <BS> :ALEDetail<CR>
nmap <c-g> :call CocActionAsync("doHover")<cr>
"map <silent> <C-c> <Plug>(coc-cursors-position)
"nmap <silent> <C-d> <Plug>(coc-cursors-word)*

"nmap <silent> <C-d> <Plug>(coc-cursors-word)
"xmap <silent> <C-d> <Plug>(coc-cursors-range)

"silent! call repeat#set("H", -1)

 "let g:UltiSnipsJumpForwardTrigger = '<tab>'
 "let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
 "

":call UltiSnips#ExpandSnippet()<CR>
"strange that I have to change this
"function! ChangeOrder()
"envdebug_keymap
"endfunction
" }}}
"



""Ycm
"let g:jedi#goto_definitions_command = "<leader>gd"
"let g:jedi#goto_command = "<leader>gg"
"let g:jedi#usages_command = "<leader>gn"
"let g:jedi#completions_command = "<C-b>"

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

"function! SetupPython()
	":CocCommand python.setInterpreter
	":sleep 5
	":call feedkeys('5')
"endfunction

nmap  :qa!
