# .vim

Has many improvements/adjustement over the original.

* better shortcuts

* fuzzyness all around! 

see tip here: 
https://vim.fandom.com/wiki/Fuzzy_mappings_of_everything%
(or the fuzzy mapping section below)
or here:
https://vim.fandom.com/wiki/Fuzzy_insert_mode_completion_(using_FZF)

* Many snippetes for latex  with skim. Works with vimtex. 

* Some unique functions for math. 
 

 General
 ==
 * <kbd>m</kbd> is kind of leader2 , with many options (\z does the original m ) 
     * <kbd>mu</kbd> for mundo
     * <kbd>mp</kbd> for pasting on new line 
     * many more
     
 * <kbd>,</kbd> to search in fuzzy way (leaderF now)
 * <kbd>Q</kbd> to quit things (:c)
 * <kbd>~</kbd> to open command line (<kbd>esc</kbd> works normally)
 
 * <kbd>c-/</kbd> to search easy-motion
 * <kbd>:M</kbd> keyword(or visual and then Y) to search in current doc and display all matches.
    * also <kbd>M\<motion\></kbd> in normal mode
 * <kbd>C-a</kbd> for fast searching using FZF
    *  <kbd><c-a>m</kbd> search mappings
    *  <kbd><c-a>d</kbd> search last directories
    *  <kbd><c-a>c</kbd> search last commands 
 * <kbd>SHIFT-L</kbd> to display last paste registers
 * <kbd>CTRL-L</kbd> to recall last inserted text in insert mode or <kbd>\oi</kbd> in normal
 * <kbd>:GL</kbd> to look for pattern and execute python code
 *  <kbd>F</kbd>  , <kbd>H</kbd> , <kbd>CTRL-F</kbd> <kbd>CTRL-H</kbd> to execute python/bash code on visual selection
 * <kbd>\c</kbd> to close all other windows in cur tab <kbd>\q</kbd> to quit all other buffers
 * <kbd>F13</kbd> for special insert mode (turns off automatically)
 * <kbd>`</kbd> to insert a single letter
 * <kbd>s</kbd> for easy-motion
 * <kbd>|</kbd> navigate between buffers
 * <kbd>c-f</kbd> in insert mode recall
 * <kbd>c-b</kbd> in insert mode search easy-motion 1 char
 * <kbd>c-c</kbd> in insert mode search easy-motion 2 chars
 * <kbd>c-a</kbd> to complete command in commandline using last commands
 * <kbd>c-b</kbd> to go to command line windows
 * <kbd>c-e</kbd> for new line (normal)
 * :Tailf for tail -f 
 * :C to open folder 
 * <kbd>TN</kbd> for new tab
 * <kbd>t</kbd> for save in normal (\t does t in normal)
 * <kbd>\ \<num\></kbd> to tab number \<num\>
  
 Math
 ==
  
  * vim-tex supports. 
  * math snippets taken from https://castel.dev/post/lecture-notes-1/
  * <kbd>~</kbd>+<kbd>letter</kbd> for greek letters 
    * <kbd>~a</kbd> for alpha
  * <kbd>@</kbd> for mathoperators
    * <kbd>@c</kbd> for \mathcal{ }
  * <kbd>cmd</kbd>+<kbd>d</kbd> for math functions , same as lyX bindings (in insert or normal mode)
  * <kbd>cmd</kbd>+<kbd>b</kbd> for letters
  
  (make sure your vim gui supports \<d- \> for cmd)
  
  Fuzzy mappings
  ==
  
* <kbd>ctrl</kbd>+<kbd>a</kbd><kbd>c</kbd> List of last executed commands (:) - it goes to the searched command in the command window 
 * <kbd>ctrl</kbd>+<kbd>a</kbd><kbd>C</kbd> defined commands in vim 
 * <kbd>ctrl</kbd>+<kbd>a</kbd><kbd>m</kbd> all the customly defined key mapping(:map) - search by shortcutkey 
 * <kbd>ctrl</kbd>+<kbd>a</kbd><kbd>M</kbd> all mappings - by full text 
 * <kbd>ctrl</kbd>+<kbd>a</kbd><kbd>b</kbd> (or |) buffers - navigate to buffers.   
 * <kbd>ctrl</kbd>+<kbd>a</kbd><kbd>d</kbd> visted folders(useful) - <CR> does cd to the folder  
 * <kbd>ctrl</kbd>+<kbd>a</kbd><kbd>g</kbd> text in files in the current working folder 
 * <kbd>ctrl</kbd>+<kbd>a</kbd><kbd>l</kbd> text in any open file in vim  
 * <kbd>ctrl</kbd>+<kbd>a</kbd><kbd>H</kbd> bash history 
 * <kbd>alt</kbd><kbd>Bslash</kbd> titles of open windows in vim - navigate to windows.   
 * <kbd>ctrl</kbd>+<kbd>a</kbd><kbd>s</kbd> snippets - mainly by ultisnip. 
 

  
 Plugins
 ==
 * coc for syntax (tex,vim and more)
 * vim-visual-multi for multiple cursors
 * net-ranger with some shortcuts (better than NERDTree)
   * <kbd>alt</kbd><kbd>-></kbd> to search and enter dirs repeatedly 
   * cd to go to dir
   * opens in split screen mode 
 
 * vim-ctrl-space handles all the workspaces in single file(to fork)
 [saves workspace every couple of seconds]
 
 * leaderf with preview. I switched \<up\> \<c-k\> in code(to fork) . so <kbd>c-,</kbd> will look odd (last search basically).
 
 * nvim-ip - ipython support with <kbd>cmd</kbd><kbd>R</kbd> to run a python line 
 
  
 
Let me know if something is not working. 
Haven't really tested it on other enivornments other than mine.
