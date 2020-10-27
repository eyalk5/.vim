autocmd filetype tex let b:auto_save = 1

autocmd filetype tex setlocal spell spelllang=en_us
autocmd filetype tex setlocal wrap
autocmd filetype tex set iskeyword+={,}
autocmd filetype tex set iskeyword+=\
"autocmd filetype tex set iskeyword+=$
autocmd filetype tex let g:tex_fold_additional_envs = ['lem','proof','defn','thm','cor','claim','enumerate','rem','prop']
autocmd filetype tex nmap <buffer> K <leader>lv
"autocmd filetype tex nmap <buffer> <leader>inl i\leavevmode \newline <esc>
autocmd filetype tex nmap <buffer> <leader>inl ^i\medskip \medskip <esc>
autocmd filetype tex nmap <buffer> <leader>it ^i\item <esc>
autocmd filetype tex nmap <buffer> <leader>il A \\<esc>
autocmd filetype tex nmap <buffer> <leader>ll :exe ":!echo " . v:servername . " > /tmp/curserver "<CR><plug>(vimtex-compile)
autocmd filetype tex nmap <buffer> <leader>lm :exe ':!rm /tmp/builddir/' . expand('%:t:r') . '.*'<CR>
autocmd filetype tex nmap <buffer> TC <plug>(vimtex-cmd-toggle-star)                
autocmd filetype tex nmap <buffer> TE <plug>(vimtex-env-toggle-star)                
autocmd filetype tex nmap <buffer> TD <plug>(vimtex-delim-toggle-modifier)          
autocmd filetype tex nmap <buffer> Td <plug>(vimtex-delim-toggle-modifier-reverse)  
autocmd filetype tex nmap <buffer> <leader>MK ^i$<esc>$a$:s/ /\\ /g<esc>
autocmd filetype tex nmap <buffer> <leader>DM ^i\[<esc>$a\]:s/ /\\ /g<esc> 
"autocmd filetype tex vnoremap <buffer> <ESC> <ESC>:w<CR>
"autocmd filetype tex inoremap <buffer> <ESC> <ESC>:w<CR>
"autocmd filetype tex nnoremap <buffer> <ESC> :w<CR><ESC>
"start compiling immediately

"autocmd BufRead filetype tex if exists exe ":!echo " . v:servername . " > /tmp/curserver " <bar> VimtexCompile
"autocmd BufRead filetype tex exec ":echo 'a'"

autocmd filetype tex nmap <buffer> <leader>sT :let $PATH='/usr/local/texlive/2019/bin/x86_64-darwin:'.$PATH<CR>
autocmd filetype tex nmap <buffer> mk a$$<esc>ha
autocmd filetype tex nmap <buffer> dm ^a\[\]<esc>hha
"sorrounds with $
autocmd filetype tex nmap <buffer> Mk ^i$<esc>$a$<esc>
autocmd filetype tex nmap <buffer> Dm ^i\[<esc>$a\]<esc> 
autocmd filetype tex nmap <buffer> <leader>le :let g:tex_errors_only =1<CR><Plug>(vimtex-errors)
autocmd filetype tex nmap <buffer> <leader>lE :let g:tex_errors_only =0<CR><Plug>(vimtex-errors)
autocmd filetype tex nmap <buffer> <leader>ls :M begin\|end<CR>
autocmd filetype tex vmap <buffer> <leader>j$ "zd:call Joinmath2()<CR>"zp
autocmd filetype tex vmap <buffer> <leader>jD "zd:call Joinmath()<CR>"zp
autocmd filetype tex nmap <buffer> <leader>lm$ ysiW$
autocmd filetype tex nmap <buffer>  gc <plug>(vimtex-delim-close) 

function! SearchRepMath(pattern,replaceandflags)
	let k=JJSyntaxSearch(a:pattern, 'texMathZone') 
	while k
		let off=getcurpos()[2]-1
	exec "s/^\\(.".'\{-'.string(off).'}\)' .a:pattern."/\1".a:replaceandflags
	let k=JJSyntaxSearch(a:pattern, 'texMathZone') 
endwhile 
endfunction

function! JJSyntaxSearch(pattern, syntaxitem)
 while search(a:pattern, 'W') > 0
   for id in synstack(line("."),col("."))
	 if synIDattr(id,"name") =~? a:syntaxitem
	   return line(".")
	 endif
   endfor
 endwhile
 return 0
endfunc
"remember c-.
"JJSyntaxSearch \<e\> texMathZone
"
command! -nargs=* JJSyntaxSearch call JJSyntaxSearch(<f-args>) 
function! Finmath(nextstr)
	while 1
		"exec 'norm .'.a:nextstr 
		if search(a:nextstr)==0
			break
		endif
		if searchpairpos('\(', '','\)','n')!=[0,0]
			break
		endif
		if searchpairpos('\[', '','\]','n')!=[0,0]
			break
		endif
		let a = getcurpos() 
		if count(strpart(getline('.'),0,a[2]),'$')%2==1
			break
		endif 
	endwhile 
endfunction
function! NG()
    call Noutmath("call grammarous#move_to_next_error(getpos('.')[1 : 2], b:grammarous_result)")
endfunction 
function! Noutmath(nextstr)
	let l=line('.')
	let b=0 
	while 1
		exec a:nextstr 
		let ll=line('.')
		if ll<l
			break
		endif
		if searchpairpos('\(', '','\)','n')!=[0,0]
			continue 
		endif
		if searchpairpos('\[', '','\]','n')!=[0,0]
			continue 
		endif
		let a = getcurpos() 
		if count(strpart(getline('.'),0,a[2]),'$')%2==0
			break
		endif 
	endwhile 
endfunction
function! Foutmath(nextstr)
	while 1
		"exec 'norm .'.a:nextstr 
		if search(a:nextstr)==0
			break
		endif

		if searchpairpos('\(', '','\)','n')!=[0,0]
			continue 
		endif
		if searchpairpos('\[', '','\]','n')!=[0,0]
			continue 
		endif
		let a = getcurpos() 
		if count(strpart(getline('.'),0,a[2]),'$')%2==0
			break
		endif 
	endwhile 
endfunction

"find next aaa( in text
nmap <leader>fb :call Foutmath('\w(')<CR>l` 

command! -nargs=1 Fo call Foutmath(<f-args>)
command! -nargs=1 Fi call Finmath(<f-args>)
"we replaced \l so this is for it
autocmd filetype tex nmap <buffer> ml \l
"autocmd filetype tex nunmap tsD
"autocmd filetype tex nunmap tsd
"autocmd filetype tex nunmap tsc
"autocmd filetype tex nunmap tse
autocmd filetype tex let b:surround_92 = "\\{ \r \\}"
autocmd filetype tex nmap <buffer> <leader>$ cs$\[<CR>
autocmd filetype tex nmap <buffer> <leader>[ cs$$<CR>
autocmd filetype tex nmap <buffer> <c-h>h \sb
autocmd filetype tex nmap <buffer> <c-h>d dsb
autocmd filetype tex nmap <buffer> <c-h>c csb
autocmd filetype tex nmap <buffer> <c-h>v vi{
autocmd filetype tex nmap <buffer> <c-h>( csb(
autocmd filetype tex nmap <buffer> <c-h>{ csb{
autocmd filetype tex nmap <buffer> <c-h>n \inl




"%s/\^(\(.\{-}\))/{\1}/g
"%s/_\(\d\d\)/_\\{\1\\}/g
"%s/_\([ijk'][ijk']\+\)/_{\1}/g
"
" changes { to \{
"%s/\(\w\)  \(\w\)/\1 \2
" turns aa  aa to aa aa

autocmd filetype tex nmap <buffer> \sb csB\
function! Joinmath2()
	"split and keep $
	let gg=split(@z,"\\$.\\{-}\\$\\zs")
	let fs="$"
	for k in gg
		let pos=match(k,"\\$.\\{-}\\$")
		let va=k[:pos-1] "arg regul 
		let vb=k[pos:] "arg $ 
		if pos>0 && len(k)>0
			let fs.= "\\text{" . va . "}" 
		endif 
		let fs.= vb[1:-2]
		"if len(vb)>2
			"let fs.= substitute(vb[1:-2]," ","\\\\ ","g")
		"endif
	endfor 
	let fs.="$"
	let @z=fs
endfunction 
function! Joinmath()
	"split and keep $
	let gg=split(@z,"\\$.\\{-}\\$\\zs")
	let fs="$"
	for k in gg
		let pos=match(k,"\\$.\\{-}\\$")
		let va=k[:pos-1] "arg regul 
		let vb=k[pos:] "arg $ 
		if pos>0 && len(k)>0
			let fs.= "\\text{" . va . "}" 
		endif 
		if len(vb)>2
			let fs.= substitute(vb[1:-2]," ","\\\\ ","g")
		endif
	endfor 
	let fs.="$"
	let @z=fs
endfunction 


autocmd filetype tex nmap <buffer> <leader>st :set filetype=tex<CR>:w<CR>itemplate<TAB>a<esc>:VimtexToggleMain<CR>
autocmd filetype tex nmap <buffer> <leader>so :let tt=expand('%:t')<CR>:VimtexCompileOutput<CR>:exe ":MC ". tt . ":"<CR>

autocmd filetype tex imap <buffer> <D-d>s sec<c-g>
autocmd filetype tex imap <buffer> <D-d>f /<c-g>
autocmd filetype tex imap <buffer> <D-d>c cap<c-g>


autocmd filetype tex imap <buffer> <D-d>f \frac
autocmd filetype tex imap <buffer> <D-d>s sq<c-g>
autocmd filetype tex imap <buffer> <D-d>x _
autocmd filetype tex imap <buffer> <D-d>e ^
autocmd filetype tex imap <buffer> <D-d>u sum<c-g>
autocmd filetype tex imap <buffer> <D-d>i dint<c-g>

autocmd filetype tex imap <buffer> <D-e> mk<c-g>

autocmd filetype tex imap <buffer> <D-d>m mk<c-g>
autocmd filetype tex imap <buffer> <D-d>d dm<c-g>
autocmd filetype tex imap <buffer> <D-d>y \oint
autocmd filetype tex imap <buffer> <D-d>p part<c-g>
autocmd filetype tex imap <buffer> <D-d>r \root
autocmd filetype tex imap <buffer> <D-d>l lim<c-g>
"autocmd filetype tex imap <buffer> <D-d>* \<c-g>


autocmd filetype tex imap <buffer> <D-d>8 \infty


autocmd filetype tex imap <buffer> <D-d>h hat<c-g>
autocmd filetype tex imap <buffer> <D-d>^ bar<c-g>
autocmd filetype tex imap <buffer> <D-d>. **<c-g>
autocmd filetype tex imap <buffer> <D-d>v \vec
autocmd filetype tex imap <buffer> <D-d>_ \underbar

autocmd filetype tex imap <buffer> <D-d>b \overline

autocmd filetype tex imap <buffer> <D-d>( lr<c-g>
autocmd filetype tex imap <buffer> <D-d>[ lr[<c-g>
autocmd filetype tex imap <buffer> <D-d>{ lr{<c-g>
autocmd filetype tex imap <buffer> <D-d>< lr<<c-g>
autocmd filetype tex imap <buffer> <D-d><bar> lr<bar><c-g>

autocmd filetype tex imap <buffer> <D-d>+ \pm
autocmd filetype tex imap <buffer> <D-d>! \neq
autocmd filetype tex imap <buffer> <D-b>a \alpha
autocmd filetype tex imap <buffer> <D-b>b \beta
autocmd filetype tex imap <buffer> <D-b>c \chi
autocmd filetype tex imap <buffer> <D-b>d \delta
autocmd filetype tex imap <buffer> <D-b>e \epsilon
autocmd filetype tex imap <buffer> <D-b>f \phi
autocmd filetype tex imap <buffer> <D-b>g \gamma
autocmd filetype tex imap <buffer> <D-b>h \eta
autocmd filetype tex imap <buffer> <D-b>i \iota
autocmd filetype tex imap <buffer> <D-b>j \varphi
autocmd filetype tex imap <buffer> <D-b>k \kappa
autocmd filetype tex imap <buffer> <D-b>l \lambda
autocmd filetype tex imap <buffer> <D-b>m \mu
autocmd filetype tex imap <buffer> <D-b>n \nu
autocmd filetype tex imap <buffer> <D-b>o \omega
autocmd filetype tex imap <buffer> <D-b>p \pi
autocmd filetype tex imap <buffer> <D-b>q \vartheta
autocmd filetype tex imap <buffer> <D-b>r \rho
autocmd filetype tex imap <buffer> <D-b>s \sigma
autocmd filetype tex imap <buffer> <D-b>t \tau
autocmd filetype tex imap <buffer> <D-b>u \upsilon
autocmd filetype tex imap <buffer> <D-b>v \theta
autocmd filetype tex imap <buffer> <D-b>w \omega
autocmd filetype tex imap <buffer> <D-b>x \xi
autocmd filetype tex imap <buffer> <D-b>y \psi
autocmd filetype tex imap <buffer> <D-b>z \zeta
autocmd filetype tex imap <buffer> <D-S-b>d \Delta
autocmd filetype tex imap <buffer> <D-S-b>e \varepsilon
autocmd filetype tex imap <buffer> <D-S-b>f \Phi
autocmd filetype tex imap <buffer> <D-S-b>g \Gamma
autocmd filetype tex imap <buffer> <D-S-b>i \iota
autocmd filetype tex imap <buffer> <D-S-b>j \epsilon
autocmd filetype tex imap <buffer> <D-S-b>l \Lambda
autocmd filetype tex imap <buffer> <D-s-b>O \Omega
autocmd filetype tex imap <buffer> <D-S-b>p \Pi
autocmd filetype tex imap <buffer> <D-S-b>q \vartheta
autocmd filetype tex imap <buffer> <D-S-b>r \varrho
autocmd filetype tex imap <buffer> <D-S-b>s \Sigma
autocmd filetype tex imap <buffer> <D-S-b>t \varsigma
autocmd filetype tex imap <buffer> <D-S-b>v \Theta
autocmd filetype tex imap <buffer> <D-S-b>w \Omega
autocmd filetype tex imap <buffer> <D-S-b>x \Xi
autocmd filetype tex imap <buffer> <D-S-b>y \Psi

autocmd filetype tex nmap <buffer> <D-d> a<D-d>
autocmd filetype tex nmap <buffer> <D-s-d> a<D-s-d>
autocmd filetype tex nmap <buffer> <D-b> a<D-b>
autocmd filetype tex nmap <buffer> <D-s-b> a<D-s-b>


"autocmd filetype tex nmap <buffer> <D-p-0>		Part
autocmd filetype tex nmap <buffer> <D-P>1 cha<c-g>
autocmd filetype tex nmap <buffer> <D-P>2 sec<c-g>
autocmd filetype tex nmap <buffer> <D-P>3 sub<c-g>
autocmd filetype tex nmap <buffer> <D-P>4 ssub<c-g>
autocmd filetype tex nmap <buffer> <D-P>5 par<c-g>
autocmd filetype tex nmap <buffer> <D-P>6 subp<c-g>
"autocmd filetype tex nmap <buffer> <d-s-p-0> part*<c-g>
autocmd filetype tex nmap <buffer> <D-s-p-1> cha<c-g>
autocmd filetype tex nmap <buffer> <D-s-p-2>	sec<c-g>
autocmd filetype tex nmap <buffer> <D-s-p-3>	sub<c-g>
autocmd filetype tex nmap <buffer> <D-s-p-4>	ssub<c-g>
autocmd filetype tex nmap <buffer> <D-s-p-5>	par<c-g>
autocmd filetype tex nmap <buffer> <D-s-p-6>	subp<c-g>
"\bind "M-p a"			"layout Abstract"
"\bind "M-p S-A"			"layout Author"
"\bind "M-p M-a"			"layout Address"
"\bind "M-p C-a"			"layout Right_Address"
"\bind "M-p b"			"layout Itemize"	# bulleted list
"\bind "M-p S-B"			"layout Bibliography"
"\bind "M-p c"			"layout LyX-Code"
"\bind "M-p S-C"			"layout Comment"
"\bind "M-p d"			"layout Description"
"\bind "M-p S-D"			"layout Date"
"\bind "M-p e"			"layout Enumerate"	# numbered list
"\bind "M-p f"			"layout ShortFoilhead"	# Foils!!
"\bind "M-p S-F"			"layout Foilhead"	# Foils!!
"\bind "M-p i"			"layout Itemize"	# bulleted list
"\bind "M-p l"			"layout List"
"\bind "M-p S-L"			"layout LaTeX"
"\bind "M-p n"			"layout Enumerate"	# numbered list
"\bind "M-p q"			"layout Quote"
"\bind "M-p S-Q"			"layout Quotation"
"\bind "M-p r"			"layout ShortRotatefoilhead"	# Foils!!
"\bind "M-p S-R"			"layout Rotatefoilhead"	# Foils!!
"\bind "M-p s"			"layout Standard"
"\bind "M-p t"			"layout Title"
"\bind "M-p space"		"drop-layouts-choice"
"\bind "M-p v"			"layout Verse"

    let g:vimtex_quickfix_latexlog = {
          \ 'default' : 1,
          \ 'ignore_filters' : ['.*Warning.*'],
          \ 'general' : 1,
          \ 'references' : 1,
          \ 'overfull' : 1,
          \ 'underfull' : 1,
          \ 'font' : 1,
          \ 'packages' : {
          \   'default' : 1,
          \   'general' : 1,
          \   'babel' : 1,
          \   'biblatex' : 1,
          \   'fixltx2e' : 1,
          \   'hyperref' : 1,
          \   'natbib' : 1,
          \   'scrreprt' : 1,
          \   'titlesec' : 1,
          \ },
          \}
"autocmd filetype tex nmap <buffer> ]]  <plug>(vimtex-]])
"autocmd filetype tex nmap <buffer> ][  <plug>(vimtex-][)
"autocmd filetype tex nmap <buffer> []  <plug>(vimtex-[])
"autocmd filetype tex nmap <buffer> <nowait> [[  <plug>(vimtex-[[)
"autocmd filetype tex nmap <buffer> ]m  <plug>(vimtex-]m)
"autocmd filetype tex nmap <buffer> ]M  <plug>(vimtex-]M)
"autocmd filetype tex nmap <buffer> [m  <plug>(vimtex-[m)
"autocmd filetype tex nmap <buffer> [M  <plug>(vimtex-[M)
	
