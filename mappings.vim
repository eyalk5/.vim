
"  Mappings!! of plugins as well
"
"


"tabs
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'tabn<CR>'
    let i = i + 1
endwhile


"mouse 
"nmap <MiddleMouse> :redraw<CR>
nmap <MiddleMouse> i
imap <MiddleMouse> <ESC>
"
"speical insert
nmap <RightMouse> <F12>
imap <RightMouse> <ESC>



"replace vanila
nnoremap <leader>& &
"get start of (next) string
"nmap <expr> & (getline('.')[col('.')-1]=='"' <bar><bar> getline('.')[col('.')-1]== "'") ? "%" : "viqo\<ESC>h"
"nmap <expr> z& (getline('.')[col('.')-1]=='"' <bar><bar> getline('.')[col('.')-1]== "'") ? "%" : "vilq\<ESC>l"

nmap <expr> <Plug>NextQ (getline('.')[col('.')-1]=='"' <bar><bar> getline('.')[col('.')-1]== "'") ? "viq\<ESC>llviqo\<ESC>h" : "viqo\<ESC>h"
nmap <expr> <Plug>PrevQ (getline('.')[col('.')-1]=='"' <bar><bar> getline('.')[col('.')-1]== "'") ? "viqo\<ESC>hhvilq\<ESC>l" : "vilq\<ESC>l"
nmap & <Plug>NextQ
nmap <c-7> <Plug>PrevQ
"next block 
nmap <c-5> z%
"nmap <c-7> <Plug>PrevQ

nnoremap ! `
nnoremap !! ``

"the most command marks are in 
nnoremap <leader>. `.
nnoremap <leader>' ``


"recall command
nmap ~ <c-a>c
noremap m? ?
nmap ? <Plug>(easymotion-sl)
nmap <D-/> <Plug>(easymotion-tl)


:nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
:nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>
"inserts one char (or more with count)
"nmap s :<C-U>call InsertBefore(v:count1)<CR>
"nnoremap F f
"nmap S :<C-U>call InsertAfter(v:count1)<CR>
nmap q <Plug>(easymotion-s)
"The <D-t> provides omni tl-search 

nmap <D-f> <Plug>(easymotion-s2)

"replacing default
nnoremap zq q
"nmap s <Plug>(easymotion-s)
"nmap S <Plug>(easymotion-s2)
"endif
"meaning u would be like search everywhere
vmap s <Plug>(easymotion-sl)
"omap U <Plug>(easymotion-bd-tl)
vmap u <Plug>(easymotion-bd-fl)
"vmap U <Plug>(easymotion-bd-tl)
vmap U <Plug>(easymotion-bd-tl)
vnoremap <leader>U U
"vnoremap <leader>U U
"we use t for saving
nmap <nowait> t :let g:init=1<CR>:w<CR>

" insert a single char
nnoremap <leader>` `
nnoremap m` `
"nnoremap <leader>t t
"we use m for multiple things as seconds leader
noremap <leader>z m
nnoremap <leader>F F
"
"end only until the end and not one more
vnoremap <end> $h

nnoremap , :Leaderf line --popup<CR>
"nnoremap <leader><c-t> <c-t>

"wroks with all letters but N
"nmap T <Plug>(easymotion-sl)

"
" _ mappings 
noremap _g :diffget<CR>
noremap _p :diffput<CR>
nmap _u :LastWindow<CR>

if g:on_ek_computer
    nmap _U :call fzf#vim#cust_history(reverse(copy(g:lastWindows)))<CR>
endif
nmap _. :cd ..<CR>
nmap _- :cd -<CR>
"previous window
nmap _P :wprevious<CR>
nmap _N :wnext<CR>

"do comment out
map __ <leader>Cc
"uncomment
map _+ <leader>Cu
"Alternative buffer
map _# :e #<CR>

"Previous and next visited buffer \<c-o> of course
"nmap <c-[> <bar><DOWN><CR>
"nmap <D-[> <bar><UP><CR>

nmap _t :exe "tabn ".g:lasttab<CR>
"Coc _ mappings 
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

"Grammerous M- mappings
imap <M-Down> <esc>
imap <M-Up> <esc>
imap <M-Left> <esc>
imap <M-Right> <esc>

nmap <M-Down> <Plug>(grammarous-move-to-next-error)	
nmap <M-Up> <Plug>(grammarous-move-to-previous-error)
nmap <M-Left> <Plug>(grammarous-open-info-window)	
nmap <M-Right> <Plug>(grammarous-fixit)	


"F keys
noremap <F1> :execute ":help " . expand('<cword>')<CR>
"execut under cursor
nnoremap <F2> :exe getline(".")<CR>
vnoremap <F2> "xy:@x<CR>

"nmap <leader><F5> q:i<esc>
noremap <S-F3> :call Goprev()<CR>
noremap <S-F4> :call Gonext()<CR>
nnoremap <S-F6> "xddkk"xp
nnoremap <S-F7> "xyy"xp
nnoremap <S-F8> "xdd"xp


nmap <F3>        <Plug>VimspectorStepOut
nmap <F4>        :call vimspector#Launch()<CR>
nmap <F6>         <Plug>VimspectorContinue
nmap <F7>        <Plug>VimspectorStepInto
nmap <F8>        <Plug>VimspectorStepOver
nmap <F9>         <Plug>VimspectorToggleBreakpoint
nmap <leader><F9> <Plug>VimspectorToggleConditionalBreakpoint
nmap _<F9>         <Plug>VimspectorAddFunctionBreakpoint


map <silent> <F5>         <Plug>(IPy-Run)
nmap <S-F5> <leader>rf
" or \rf

nmap <F13> :call StartSpecialInsert()<CR>i
nmap <F12> :call StartSpecialInsert()<CR>i
imap <F12> <c-o>
imap <F13> <ESC>



"call DisableKeys()


"ctrl commands
"

"faster
nnoremap <c-,> :Leaderf line --recall<CR>


nmap <C-=> <Plug>(easymotion-next)
nmap <C--> <Plug>(easymotion-prev)
nmap <c-_> :let g:EasyMotion_add_search_history=1<CR><Plug>(easymotion-sn)



"Ctrlspace 
"let g:CtrlSpaceDefaultMappingKey = ''
nmap <C-b> :CtrlSpace w<CR>
"windows on tab
nmap <c-U> <c-b>w

"if ($TERM=="xterm-256color")
	""only on nvim
	"nmap  <C-/> :let g:EasyMotion_add_search_history=1<CR><Plug>(easymotion-sn)
"endif
"map <C-CR> <F13>
"imap <C-CR> <F13>
"imap <S-CR> <c-o>
function! Teasy()
    if EasyMotion#SL(1,0,2)==0
        normal l
    endif 
endfunction

imap <D-f> <c-o><Plug>(easymotion-s2)
imap <c-.> <c-o><Plug>(easymotion-s)
imap <c-t> <c-o>:call Teasy()<CR>
"this is untill"
imap <D-t> <c-o><Plug>(easymotion-sl)
nmap <D-t> <Plug>(easymotion-bd-t)
nmap <c-t> <Plug>(easymotion-bd-tl)

"finds the best next item and complete up to it. in Vim!
":imap <c-,> <c-X><c-V>
"imap <c-,> <c-o><Plug>(easymotion-bd-t)




"Logical, since in normal we have s and S
imap <D-d> <c-o><Plug>(esymotion-bd-W)
nmap <D-d> <Plug>(easymotion-bd-W)
"
"beginning of words
"
imap <c-d> <c-o>:call EasyMotion#WBL(0,2)<CR>
nmap <c-d> <Plug>(easymotion-bd-wl)
"end of word 
imap <c-h> <c-o><Plug>(easymotion-bd-el)
nmap <c-h> <Plug>(easymotion-bd-el)
"imap <c-c> <c-o><Plug>(easymotion-lineanywhere) 
"nmap <c-c> <Plug>(easymotion-lineanywhere) 
"one line down
"nnoremap <c-t> <c-e>
"nnoremap <c-y> <c-u>
"nmap <c-t> <Plug>(easymotion-sl)


nmap <c-s> :let g:EasyMotion_add_search_history=1<CR><Plug>(easymotion-sn)
vmap <c-s> <Plug>(easymotion-s2)

"search help , lift saving
nmap <c-f> mH
nmap <c-g> :call CocActionAsync("doHover")<cr>

nmap <C-e> mn-

nmap <D-E> -mn+
nmap <D-e> -mn+

"repeat the move 
imap <c-;> <c-o>;
imap <c-\> <c-o><c-\>
"to map <c-;> in normal

imap <c-a> <c-o><c-a>
"inoremap ii
"complete just one char pumvisible()? " 
"x
"



imap <D-Right> <c-o>W
imap <D-Left> <c-o>B
imap <D-Up> <c-h>
imap <D-Down> <c-o><Plug>(easymotion-bd-wl)
"inoremap <c-k> <Cmd>call feedkeys("\<c-L>",'n')<CR>
"completes one char or  from dict 
imap <expr> <C-L>  pumvisible()? "<c-l>" : "<esc>:call RecallInserts()<CR>"
"complete from dict 
inoremap  <c-k> <c-x><c-k>
"does chars 
inoremap <m-c-k> <c-k>
inoremap <c-f> <c-x><c-n>
"imap <c-z> <c-f><up><down>
"imap <c-z> <c-r>=SuperTab('n')<CR>
"Greatness , completes the text with one type
"Greatness



"function! DoCz()
    "if pumvisible() 
        "if complete_info()['mode']=='keyword'
            "return complete_info()['selected'] ==-1 ?  feedkeys("\<c-r>SuperTab('n')") :  feedkeys("\<tab>\<s-tab>\<c-f>\<tab>") 
        "else 
            "return 0
            ""return complete_info()['selected'] ==-1 ?  feedkeys("\<c-f>\<tab>",'t') :  feedkeys("\<c-f>") 
        "endif 
    "else 
        "return  feedkeys("\<c-f>",'t')
    "endif 
"endfunction 

"inoremap <c-f> <c-x><c-n>
""imap <c-z> <c-f><up><down>
""imap <c-z> <CMD>call feedkeys("\<c-f>\<c-r>=SuperTab('n')<c-m>",'')<CR>
""Greatness , completes the text with one typ
""Greatness , completes
"requests
"return comple
function! DoCz()
    if pumvisible() 
        if complete_info()['mode']=='keyword'
            return complete_info()['selected'] ==-1 ? "\<c-r>=SuperTab('n')\<CR>" : "\<c-f>\<c-r>=SuperTab('n')\<CR>\<c-r>=SuperTab('p')\<CR>"
        else 
            return complete_info()['selected'] ==-1 ? "\<c-f>\<c-r>=SuperTab('n')\<CR>" : "\<c-f>\<c-r>=SuperTab('n')\<CR>"
        endif 
    else 
        return "\<c-f>"
    endif 
endfunction 

imap <c-z> <CMD>call DoCz()<CR> 
imap <expr> <c-z> DoCz() 
imap <M-Space> <c-o>
imap <S-CR> <c-o>
" D-mappings

"nmap <silent> <D-J> <Plug>(ale_previous_wrap)
"nmap <silent> <D-j> <Plug>(ale_previous_wrap)
"nmap <silent> <D-K> <Plug>(ale_next_wrap)
"nmap <silent> <D-k> <Plug>(ale_next_wrap) a\n/

imap <D-g> <Plug>(IPy-Complete)
nmap <D-k> <Plug>(IPy-WordObjInfo) 
nmap <D-r> :call IPyRun(input('enter python: ','','custom,IPyCompleteForInput'))<CR>
"nmap <D-r> :call IPyRun(input('enter python: '))<CR>
nmap <D-I> :let @z=input('enter text: ') <bar> norm "zp<CR>
nmap <D-i> :let @z=input('enter text: ') <bar> norm "zp<CR>


let g:neoterm_automap_keys="<plug>(aaaa)"

"imappings!!
"c-t c-d c-h same as bef


"imap <c-.> <c-o>.

"loofor 2 chars already S "imap <c-s> <c-o><Plug>(easymotion-sn)
" to handle bug of sear

"needed to be in onload
"imap <D-a> <c-x><c-o>
"imap <D-A> <c-x><c-o>
"inoremap ^] ^X^]
"inoremap ^L ^X^L
"go forward and back
"imap jk <ESC>l" : " 
"
" 
"nmap § :call StartSpecialInsert()<CR>i
"imap § <c-o>
inoremap § <c-l>

"imap <c-z> <c-f><c-r>=SuperTab('n')<CR> 
"

vmap <c-t> :Trans<CR>
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
"com
"completion by fuzzing of anything
imap <c-'> <CMD>:call CompleteInf()<CR>
imap <D-K> <plug>(fzf-complete-word)
imap <D-k> <plug>(fzf-complete-word)
"imap <D-F> <plug>(fzf-complete-path)
"imap <D-f> <plug>(fzf-complete-path)
imap <D-J> <plug>(fzf-complete-file-ag)
imap <D-j> <plug>(fzf-complete-file-ag)
imap <D-L> <plug>(fzf-complete-line)
imap <D-l> <plug>(fzf-complete-line)



"let g:targets_pairs = '() {} [] <>'
"let g:textobj#anyblock#blocks = ['(', '{', '[', '<']

"this very dangerous and also quit diff<D-x>






" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"map <leader>l <Plug>(easymotion-bd-jk)
"nmap <leader>L <Plug>(easymotion-overwin-line)
"nmap <leader>w <Plug>(easymotion-overwin-w)
"nmap <leader>f <Plug>(easymotion-bd-fl)
"if has('nvim')


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
"map <expr><buffer> ]M repmo#Key('<plug>(PythonsenseEndOfPythonFunction)', '<plug>(PythonsenseEndOfPreviousPythonFunction)')|sunmap <buffer> ]M
"map <expr><buffer> [M repmo#Key('<plug>(PythonsenseEndOfPreviousPythonFunction)', '<plug>(PythonsenseEndOfPythonFunction)')|sunmap <buffer> [M
""" m mappings


nnoremap mb iimport ipdb;ipdb.set_trace()<ESC>
" jump to current path
nmap mC :call CopyPath()<CR>
noremap mc :cd %:p:h<CR>
nnoremap md :diffupdate<CR>
nnoremap mf :!open %:p:h<CR>
nnoremap mF :exec '!open '.getcwd()<CR>
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

nnoremap mn o<ESC>D
noremap H ~
noremap \H H
noremap \L L
"nnoremap <leader>H H
"H is available
"great!
nnoremap <leader>M M
nmap mL <Plug>(easymotion-lineanywhere)

function! MPf()
	let @+ =substitute(@+,"\<NL>$","",'')
	let @+ =substitute(@+,"^[ \t]*","",'')
	exec "norm \"+]P"
endfunction

"paste new line
"remove indent
"
nnoremap mp o<esc>:s/[^ \t]//ge<CR>:call MPf()<CR>
nnoremap <expr> ]p @+ =~ ".*\n$" ?  "]p==" : "o<C-R>+<ESC>"
nnoremap <expr> ]P @+ =~ ".*\n$" ?  "]P==" : "O<C-R>+<ESC>"

"Move line to terminal
nmap mz yy:T "


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

vnoremap mP :call Domp()<CR>"zp
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

nmap m, :LeaderfLineCword<CR>
nmap TT m,
vnoremap T "xy:call feedkeys( ":LeaderfLine\<lt>CR>". @x ,'t')<CR>
function! SpecialFindLeader(type)
  let &selection = "inclusive"
	exec 'normal! `[v`]"xy'
    :call feedkeys( ":LeaderfLine\<CR>". @x ,'t')
	"call Matches(@x)
endfunction

function! SpecialFind(type)
  let &selection = "inclusive"
	exec 'normal! `[v`]"xy'
	call Matches(@x)
endfunction

nnoremap M :set opfunc=SpecialFind<CR>g@
nnoremap T :set opfunc=SpecialFindLeader<CR>g@
"vmap T 
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
nnoremap <M-Space> q:i

"nmap m~ q:i<esc><c-s>
"just opens
nnoremap mq q:i<esc>


"nmap <leader>bh :split <bar> :e ~/.bash_history<CR>,
"nmap <leader>bh :call fzf#run({'source':"cat ~/.bash_history \<bar> sort \<bar> uniq",'sink': function('BH')})<CR>
function! CompleteCommand(arg)
	call fzf#run({'source': GetCommands(),'sink': function('HandleCommand'),'options': '-m --query "'.a:arg.'"'} ) 
endfunction 

nnoremap <leader>R R

"this function maps all registers so that we know what we have in each
"c-q for insert mode%. R for other modes.
func! MapR()
	let lst=['+','*','.','=','%']
    imap <D--> <CMD>:echo getreg("+")<CR>
    imap <D--> <CMD>:echo getreg("+")<CR>
    imap <D-=> <CMD>:echo getreg("=")<CR>
    imap <D-=> <CMD>:echo getreg("=")<CR>
	for i in range(10)
		call add(lst,string(i))
		exec 'map <D-'. string(i) .'> <CMD>:echo getreg("'.string(i) .'")<CR>'
		exec 'imap <D-'. string(i) .'> <CMD>:echo getreg("'.string(i) .'")<CR>'
		"exec 'vmap <D-'. string(i) .'> <CMD>:echo getreg("'.string(i) .'")<CR>'
	endfor
	let k=char2nr('a')
	for j in range(26)
		call add(lst,nr2char(k+j))
	endfor 
for i in lst 
		exec 'nmap R'. i .' :echo getreg("'.i .'")<CR>'
		exec 'vmap R'. i .' <CMD>:echo getreg("'.i .'")<CR>'
		"exec 'imap <D-'. i .'> <CMD>:echo getreg("'.(i) .'")<CR>'
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
"nnoremap <c-a>f :CtrlPCurWD<CR>
nnoremap <silent> <C-a>f :exe ":LeaderfFile ".getcwd()<CR>
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
"does diff of all files (could be vs version) 
nmap <leader>GD Git! diff<CR>
nnoremap <leader>Gs :Gstatus<CR>
nnoremap <leader>Gc :Gcommit -v -q<CR>
nnoremap <leader>Ga :Gcommit --amend<CR>
nnoremap <leader>Gt :Gcommit -v -q %<CR>
nnoremap <leader>Gd :Gdiff<CR>
nnoremap <leader>Ge :Gedit<CR>
nnoremap <leader>Gr :Gread<CR>
nnoremap <leader>Gw :Gwrite<CR>
nnoremap <leader>Gl :silent! Glog<CR>
nnoremap <leader>Gp :Ggrep<Space>
nnoremap <leader>Gm :Gmove<Space>
nnoremap <leader>Gb :Git branch<Space>
nnoremap <leader>Go :Git checkout<Space>
nnoremap <leader>Gps :Dispatch! git push<CR>
nnoremap <leader>Gpl :Dispatch! git pull<CR>


map <silent> <leader>? <Plug>(IPy-WordObjInfo)
" opens terminal in new window
"
noremap  <leader>od :exec ":vs " . getcwd()<CR>
nnoremap <leader>em :call Exec("messages")<CR>
"enable save
nnoremap <leader>es :let b:auto_save = !b:auto_save<CR>:echo "it is now ". b:auto_save<CR>
nnoremap <leader>as :let b:save_inserts= !b:save_inserts<CR>:echo "it is now ". b:save_inserts<CR>
nmap     <leader>at :AutoSaveToggle<CR>

nnoremap <leader>do :diffoff<CR>
nnoremap <leader>du :diffupdate<CR>
nnoremap <leader>dt :diffthis<CR>

nmap <leader>rf  :exec ":call IPyRun(\"%run '". expand('%:p') . "\'\")"<CR>
map <silent> <leader>rb <Plug>(IPy-Interrupt)
nmap <leader>rt <Plug>(IPy-Terminate)
map <leader>rc <Plug>(IPy-RunCell)
"redraw
nnoremap <leader>rd <c-L>

"todo FZF
nnoremap <leader>oc :copen<CR>
"opens file
nmap <leader>of :vsp<CR>ml<D-Bslash>
nmap <leader>OF :vsp<CR>mm
"open python
nmap <leader>op :sp <bar> :exec ':'. bufnr('\[jupyter\]') .'buffer'<CR><c-w>k
nmap <leader>upd \ttupama

nnoremap <leader>oi :call RecallInserts2()<CR>
nnoremap <leader>ol :lopen<CR>
nnoremap <leader>ov :TN ~/vimpy3/.vimrc<CR>
nnoremap <leader>oE :!

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

"open terminal in new tab
nnoremap <leader>ot :tabnew <bar> :call TermO()<CR>:call feedkeys("i")<CR>
"open terminal in new window
nmap <leader>tt :call TermOV(0)<CR>li
nmap <leader>Tt :call TermOV(1)<CR>li

nnoremap <leader>vL :TN ~/.vim/vimlog.log<CR>
nmap <leader>vs         <Plug>VimspectorStop
nmap <leader>vR         <Plug>VimspectorRestart
nmap <leader>vp         <Plug>VimspectorPause
nmap <leader>vl        :call vimspector#Launch()<CR>
nmap <leader>vr        :call vimspector#Reset()<CR>
"sets python 2/3
nmap <leader>S2 :let $PYTHONPATH='/Users/eyalkarni/utils/jmpacket:/Users/eyalkarni/utils:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages'<CR>
nmap <leader>S3 :let $PYTHONPATH='/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/'<CR>
"TODO:: to add site-packages
nmap <leader>s3  :call coc#config('python', {'jediEnabled': v:true, 'pythonPath': '/Users/eyalkarni/.pyenv/shims/python'})<CR>:CocRestart<CR>
nmap <leader>s2  :call coc#config('python', {'jediEnabled': v:true, 'pythonPath': '/Library/Frameworks/Python.framework/Versions/2.7/bin/python'})<CR>:CocRestart<CR>
"

"start TeX
nmap <leader>st :set filetype=tex<CR>:w<CR>itemplate<TAB>a<esc>:VimtexToggleMain<CR>
nmap <leader>so :let tt=expand('%:t')<CR>:VimtexCompileOutput<CR>:exe ":MC ". tt . ":"<CR>

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

"to use ml mj mk 
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>m :tabnext<CR>
nnoremap <leader>n :tabprevious<CR>

nmap ml <leader>l
nmap mj <leader>j
nmap mk <leader>k
nmap mh :wincmd h<CR>

autocmd  FileType * nnoremap <nowait> <buffer> <leader>h :wincmd h<CR>

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
		exec ":normal a"."\<c-r>=nr2char(".t.")\<ESC>"
    else
		exec ":normal i"."\<c-r>=nr2char(".t.")\<ESC>"
		"exec ":normal i"."\<c-r>='".nr2char(t)."'"."\<ESC>"
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
		exec ":normal a"."\<c-r>=nr2char(".t.")\<ESC>"
		"redraw
	endfor 
endfunction

nmap ` i
imap ` <ESC>
inoremap <c-]> `
imap <c-`> <c-O>
nmap <c-`> <esc>
"duplicate in onload because of mapping
"
"nnoremap m= =
"nmap ` :exec "normal i".nr2char(getchar())."\e"<CR>
"appends one char
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
nnoremap <leader>C cc 

nnoremap c "zc
"vnoremap cc "zcc
vnoremap c "zc

"to the dfs not  on pasting visual " would still be as
"usual. Z  it 
vnoremap p p:let @z=@"<CR>:let @*=@0<CR>:let @"=@0<CR>
vnoremap c "zdi

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
"nmap ci, dv?[\,(]?e+1<CR>cv/[\,)]/s-1<CR>
"nmap di, dv?[\,(]?e+1<CR>dv/[\,)]/s-1<CR>


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


"translates
nmap <leader><c-t> vaw:Trans<CR>
vmap <leader>t :Trans<CR>

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
nmap gC  <Plug>(coc-fix-current)
nmap gA  <Plug>(coc-codeaction)
nmap gR <Plug>(coc-rename)

function! Show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    :ALEDetail<CR>
  endif
endfunction

nmap <BS> call Show_documentation()<CR>
"map <silent> <C-c> <Plug>(coc-cursors-position)
"nmap <silent> <C-d> <Plug>(coc-cursors-word)*

"nmap <silent> <C-d> <Plug>(coc-cursors-word)
"xmap <silent> <C-d> <Plug>(coc-cursors-range)

"silent! call repeat#set("H", -1)


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
"au filetype c nnoremap K :YcmCompleter GetDoc<CR>
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

nmap <M-C-Q> :qa!

"nnoremap , :BLines<CR>
"nmap <c-,> :BLines<CR><C-P>
"
"let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
" I did the switch in code manager.py
"
":inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
":inoremap <S-b> <C-R>=STab_Or_Complete()<CR>



"motion sickness
"
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

let g:sickness#field#use_default_maps = 1
"omap iFb <plug>(textobj-sickness-field-parenthesis-i)
"vmap iFb <plug>(textobj-sickness-field-parenthesis-i)
"omap aFb <plug>(textobj-sickness-field-parenthesis-a)
"vmap aFb <plug>(textobj-sickness-field-parenthesis-a)

"omap iFB <plug>(textobj-sickness-field-brace-i)
"vmap iFB <plug>(textobj-sickness-field-brace-i)
"omap aFB <plug>(textobj-sickness-field-brace-a)
"vmap aFB <plug>(textobj-sickness-field-brace-a)

"omap iFr <plug>(textobj-sickness-field-bracket-i)
"vmap iFr <plug>(textobj-sickness-field-bracket-i)
"omap aFr <plug>(textobj-sickness-field-bracket-a)
"vmap aFr <plug>(textobj-sickness-field-bracket-a)

"omap iFa <plug>(textobj-sickness-field-chevron-i)
"vmap iFa <plug>(textobj-sickness-field-chevron-i)
"omap aFa <plug>(textobj-sickness-field-chevron-a)
"vmap aFa <plug>(textobj-sickness-field-chevron-a)
let g:sick_symbol_default_mappings =0

"textobj-function
autocmd  FileType * vmap <nowait> <buffer> aF <Plug>(textobj-function-A)

vmap	aF	<Plug>(textobj-function-a)
vmap	iF	<Plug>(textobj-function-i)
"call popsikey#register('<leader>g', [
        "\ #{key: 'g', info: 'status', action: ":Gstatus\<CR>", flags: 'n'},
        "\ #{key: 'c', info: 'commit', action: ":Gcommit\<CR>", flags: 'n'},
        "\ ],
        "\ {})
"call popsikey#register('<leader>g', [ {'key': 'g', 'info': 'status', 'action': ":Gstatus\<CR>", 'flags': 'n'}], {})

"to call at the end
function! DefineMapping()
map <expr> ; repmo#LastKey(';') | sunmap ;
"map <expr> <C-\> repmo#LastRevKey(',') worked
nmap <expr> <C-\> repmo#LastRevKey(',')
" Still repeat fFtT (now with counts):
noremap <expr> f repmo#ZapKey('f',1)|sunmap f
noremap <expr> F repmo#ZapKey('F',1) | sunmap F
"snoremap <expr> t repmo#ZapKey('t',1)|sunmap t
"snoremap <expr> T repmo#ZapKey('T',1)|sunmap T
nnoremap <expr> <leader>T repmo#ZapKey('T',1)
nnoremap <expr> <leader>t repmo#ZapKey('t',1)
nnoremap <expr> <leader>t repmo#ZapKey('t',1)

for keys in [[']E','[E'],[']a','[a'],[']e','[e'],[']h','[h'],['&','z&']]
    call RepRemap(keys[0],keys[1])
endfor
" Now following can also be repeated with `,` and `;`:
"
"for keys in [['l','h'],['k','j'], ['[[', ']]'], ['[]', ']['], [']m', '[m'], [']M', '[M'], [']c', '[c'] ,  [ 'w','b' ] ,[ 'W','B' ] ,[ 'e','ge' ] ,[ 'E','gE' ], ['<F4>','<F3>'],['<D-K>','<D-J>'],['{','}'],['(',')']]
"Not to mess with vim-tex [']]','[[']
for keys in [['[]', ']['], [']m', '[m'], [']M', '[M'],['l','h'],['k','j'], [']=','[='], [']+','[+'], [']-','[-'],  [']c', '[c'] , [ 'w','b' ] ,[ 'W','B' ] ,[ 'e','ge' ] ,[ 'E','gE' ], ['<F4>','<F3>'],['<D-K>','<D-J>'],['{','}'],['(',')']]
    execute 'silent noremap <expr> '.keys[0]." repmo#Key('".keys[0]."', '".keys[1]."') |sunmap ".keys[0]
    execute 'silent noremap <expr> '.keys[1]." repmo#Key('".keys[1]."', '".keys[0]."') |sunmap ".keys[1] 
    "execute 'noremap <expr> '.keys[0]." repmo#Key('".keys[0]."', '".keys[1]."')|sunmap ".keys[0]
    "execute 'noremap <expr> '.keys[1]." repmo#Key('".keys[1]."', '".keys[0]."')|sunmap ".keys[1]
endfor
endfunction

call DefineMapping()
