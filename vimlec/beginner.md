Joy of Painting
=
    "**" are my tricks
Modality
===

	Insert  - Brush is on the canvas
	Normal  - Brush is off the canvas
	Command - Mixing your pallette

Starting Vim
===

	vim <file> / MacVim
	ZQ quit and don't save
        ZZ to quit and save 
Commands 
====
    :e file - edits file
    :tabnew file - options new tab with file
    :w Writes (Hey , also <CMD-S> in MacVim)
    :q Quits

Scanning the canvas
===

	    k
	    ^
	h <   > l
	    v
	    j
Help
===
    :help
    **F1** - Documentation of current word 
 

Navigate help
===
    Ctrl-] in (or just click)

    Ctrl-O prev place

    Ctrl-I next place
(as a side note)
    TAB/CTRL-I in command mode - completion

    Up in command mode - last thing you typed 
Pen to the page
===

	i - Enter insert mode at cursor
	a - Enter insert mode _after_ cursor

(skip over these)
	I - Enter insert mode at first non-blank character
	A - Enter insert mode at the end of the line
	o - Enter insert mode on the next line
	O - enter insert mode on the above line
	C - Delete from cursor to end of line and begin insert

    This is a test sentence

Changes
=
    u - Undo
    CTRL-R -  Redo
    . - Repeat change (advanced)


Picking up the brush
===

	ESC


Getting from a to b: Motions
===
Basics: wWbBeE

	w - Forward to the beginning of next word
	W - Forward to the beginning of the next WORD
	b - Backward to the next beginning of a word
	B - Backward to the next beginning of a WORD
	e - Forward to the next end of word
	E - Forward to the next end of WORD
dfgdfgd/dsfgsdfgs fgdfg

Slightly less basic: fFtT
All follow [(n)um]<verb><n(o)un> syntax

	[n]f<o> - Forward until (nth) (o)  (Inclusive)
	[n]F<o> - Backward until (nth) (o) (Inclusive)
	[n]t<o> - Forward until (nth) (o)  (Exclusive)
	[n]T<o> - Backward until (nth) (o) (Exclusive)

	abcdefg, abcdefg, abcdefg

Adv Nav
===
    ; - Repeat
    G - end of file
    gg - beginning of file

    0 - Start 
    ^ - Real start
    $ - End 
    
    ) - next sentance 
    } - next pharagraph  

Code Tips
===
    % - The next (,{,[
    ]m - The beginning of next method
    ]M - the end of next method
    [m - The previous
 
Searching
===

	/  - Forward
	?  - Backward
	*  - Word under cursor - forward  (bounded)
	g* - Word under cursor - forward  (unbounded)
	#  - Word under cursor - backward (bounded)
	g# - Word under cursor - backward (unbounded)
	n  - Next result, forward
	N  - Next result, backward
    **Y** - My trick

(Note here to explain what bounded/unbounded mean)

Search/Range
====
How does range looks like n , %  

    $ Last Line in file
    . Current line 
    \c incase sensitive 
    **:M** something - looks for 

Clipboard 
===

	y - Yank. Example: yw (yank word)
	p - Paste after cursor
	P - Paste before cursor
    d - Delete

Change In Normal 
=
    c - Change
    r - Replace char  
More Motions
===
    i[something] - delete inside something
    **s[something] - surround 

(sdsdfs) 


Visual mode?
===
