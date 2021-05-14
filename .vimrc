"=NETRNewTabdrop
"
"
" By Eyal Karni
"
":let $PYTHONPATHCOC='/Users/eyalkarni/impacket/impacket;/usr/local/lib/python2.7/site-packages;/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages'
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
" Gdiffsplit! for merge!!!!
let g:on_ek_computer=(filewritable("/Users/ekarni")==2)
let g:on_vimr= ( $VIM=~# ".*VimR.*")

"silent !pyenv global 2.7
"g:vimloc is ~/.vim folder
let g:vimloc=split(&packpath,',')[0]

exe 'source' . g:vimloc . "/vimsettings.vim"


"let &shell='/usr/bin/bash --login'
"source ~/.vim2/autoload/repmo.vim
"
call plug#begin('~/.vim/plugged')
"match inner blocks and z% 
Plug 'andymass/vim-matchup'
"Plug 'scrooloose/nerdtree'
"match strings 
Plug 'airblade/vim-matchquote'
"Plug 'ggvgc/vim-fuzzysearch'
Plug 'benknoble/popsikey'
Plug 'jacob-ogre/vim-syncr'
Plug 'inkarkat/vim-SpellCheck'
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
Plug 'sjl/gundo.vim'

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
"Plug 'valloric/youcompleteme'

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
"Plug 'WolfgangMehner/bash-support'
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
" Plug 'AndrewRadev/undoquit.vim'
" Plug 'python-mode/python-mode', { 'branch': 'develop' }
" Plug 'artur-shaik/vim-javacomplete2'
" Plug 'fatih/vim-go'
" if has('gui_running')
" endif
" Plug 'severin-lemaignan/vim-minimap'


exe 'source' . g:vimloc . "/pluginSettings.vim"
exe 'source' . g:vimloc . "/hacks.vim"
exe 'source' . g:vimloc . "/helperfuncs.vim"

"include math mappings
if filereadable(g:vimloc . "/math.vim")
	exe 'source' . g:vimloc . "/math.vim"
endif

exe 'source' . g:vimloc . "/mappings.vim"


