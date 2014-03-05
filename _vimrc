"Plugin installé: matchit, VSTreeExplorer, latex-mik

"General"
set nocompatible
filetype on
set history=1000
set cf  "Error file
set ffs=unix,mac,dos
filetype plugin on
set viminfo+=!
set magic
set suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar,.pdf
set hid "Change de buffer sans sauver
set nobackup
set showmatch
set tabstop=4
set shiftwidth=4

"Auto color urdf
au BufNewFile,BufRead *.urdf set filetype=xml

"Auto color Kuka script 
au BufNewFile,BufRead *.dat set filetype=krl
au BufNewFile,BufRead *.src set filetype=krl

"Latex
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'

"Enable folding, I find it very useful
set nofen
set fdl=0

"Theme/color"
"Maximise la fenêtre au démarrage sous windows Anglais
"if has("gui_win32")
"	autocmd GUIEnter * :simalt ~x
"endif

syntax on  "Coloration syntaxique

if has('gui')
	colorscheme default
	set background=light
	set cursorline
	set guioptions-=T
	hi CursorLine guibg=#DEEFFF
	hi CursorColumn guibg=#333333
	"hi CursorLine guibg=#333666
	"hi CursorColumn guibg=#333333
	winpos 0 0
	"set guifont=Fixedsys:h11:cANSI
	"set guifont=Monospace:h10:cANSI
endif

"UI"
set linespace=0
set ruler
set wildmenu
set number
"set shortmess=atI
set report=0
set noerrorbells
set backspace=2
set mouse=a

"Visual"
set showmatch
set mat=5
set hlsearch
"set lines=80
"set columns=160
set novisualbell
set so=4 "scroll off: curseur à 12 lignes du bord

"Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"Text formating"
set expandtab
set smartindent
set smarttab
set autoindent
set cindent
set virtualedit=all
set incsearch
set showmatch
set cindent
" set wrapmargin=6

" Supprime les espaces en fin de ligne avant de sauver
" autocmd BufWrite * silent! %s/[\r \t]\+$//

"Completion
"setlocal omnifunc=syntaxcomplete#Complete

"set completeopt=longest,menuone
"Change la touche entrer lors de la selection dans le menu de completion
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"

" Remap TAB to keyword completion
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    elseif "forward" == a:direction
        return "\<c-n>"
    else
        return "\<c-x>\<c-k>"
    endif
endfunction

inoremap <Tab> <C-R>=CleverTab()<CR>

inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>
inoremap <c-tab> <c-r>=InsertTabWrapper ("startkey")<cr>
inoremap <c-x><c-tab> <c-r>=InsertTabWrapper ("omni")<cr>

"Map auto complete of (, ", ', [
"inoremap $( ()<esc>:let leavechar=")"<cr>i
"inoremap $[ []<esc>:let leavechar="]"<cr>i
"inoremap $4 {<esc>o}<esc>:let leavechar="}"<cr>O
"inoremap ${ {}<esc>:let leavechar="}"<cr>i
"inoremap $' ''<esc>:let leavechar="'"<cr>i
"inoremap $" ""<esc>:let leavechar='"'<cr>i
inoremap {<CR>  {<CR>}<Esc>O
"inoremap () ()<ESC>i
"inoremap [] []<ESC>i
"inoremap {} {}<ESC>i
"inoremap <> <><ESC>i

"Tree Explorer
let treeExplVertical = 1
let treeExplWinSize = 30
let treeExplHidden  = 0
imap <F3> <ESC>:VSTreeExplore<CR>
nmap <F3> :VSTreeExplore<CR>\
imap <S-F3> <ESC>:VTreeExplore<CR>
nmap <S-F3> :VTreeExplore<CR>

au FileType tex call FonctionLatex()
au FileType cpp call FonctionCpp()

"Minibuffer"
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

imap <C-F3> <ESC>:close<CR>
nmap <C-F3> :close<CR>
"map <C-F12> :!ctags -Ra --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <C-F12> :!ctags --recurse --language-force=c++ --extra=+q --fields=+iaS *.cpp *.h
"set tags+=$VIM\tags\stl.tags
"set tags+=$VIM\tags\vctags
"set tags+=$VIM\tags\VNL.tags

inoremap <Home> <c-o>:call <SID>HomeLikeVCpp()<cr>
nnoremap <Home> :call <SID>HomeLikeVCpp()<cr>
"
"
function! s:HomeLikeVCpp()
  let ll = strpart(getline('.'), -1, col('.'))
  if ll =~ '^\s\+$' | normal! 0
  else              | normal! ^
  endif
endfunction


" Spell checking
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"set spl=fr spell
"set spelllang=fr
"map <F2> :set spell<CR>
"map <S-F2> :set nospell<CR>

"Tab configuration
"map <leader>tn :tabnew %<cr>
"map <leader>te :tabedit
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove

map <leader>to <C-W>gf

imap <C-up> <ESC>:bnext<CR>i
imap <C-down> <ESC>:bprevious<CR>i
imap <C-left> <ESC>gTi
imap <C-right> <ESC>gti

nmap <C-k> :bnext<CR>
nmap <C-j> :bprevious<CR>
nmap <C-h> gT
nmap <C-l> gt

nmap <M-up> <C-w><up>
nmap <M-down> <C-w><down>
nmap <M-left> <C-w><left>
nmap <M-right> <C-w><right>

"map <F3> :w!<CR>:!aspell --lang=fr_FR --encoding=iso-8859-1 -c %<CR>:e! %<CR>

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
"  autocmd BufReadPost *
"\ if line("'\"") > 0 && line("'\"") <= line("$") |
"\ exe "normal g`\"" |
"\ endif

"Abbreviation
iabbrev cad c'est-à-dire
iabbrev Cad C'est-à-dire

function FonctionLatex()

	"Map"
	map <F5> :call ExeLatex()<CR>
	map <C-F5> :call Exedvipdfm()<CR>
	map <F6> :call ExeBibtex()<CR>
	map <C-F4> :call ExeAcroread()<CR>
	map <F4> :call ExeYap()<CR>
	map <S-F5> :call ExePDFLaTeX()<CR>

	imap ,a \alpha
	imap ,b \beta
	imap ,c \chi
	imap ,d \delta
	imap ,e \varepsilon
	imap ,f \varphi
	imap ,g \gamma
	imap ,h \eta
	imap ,i \infty
	imap ,k \kappa
	imap ,l \lambda
	imap ,m \mu
	imap ,n \nu
	imap ,o \omega
	imap ,p \pi
	imap ,q \theta
	imap ,r \rho
	imap ,s \sigma
	imap ,t \tau
	imap ,u \upsilon
	imap ,v \vee
	imap ,w \wedge
	imap ,x \xi
	imap ,y \psi
	imap ,z \zeta
	imap ,D \Delta
	imap ,I \int_{}^{}<Esc>F}i
	imap ,F \Phi
	imap ,G \Gamma
	imap ,L \Lambda
	imap ,N \nabla
	imap ,O \Omega
	imap ,Q \Theta
	imap ,R \varrho
	imap ,S \sum_{}^{}<Esc>F}i
	imap ,U \Upsilon
	imap ,X \Xi
	imap ,Y \Psi
	imap ,0 \emptyset
	imap ,1 \left
	imap ,2 \right
	imap ,3 \Big
	imap ,6 \partial
	imap ,8 \infty
	imap ,/ \frac{}{}<Esc>F}i

	"imap $$ $$<ESC>i
	"imap {} {}<ESC>i
	"imap () ()<ESC>i
	"imap [] []<ESC>i

	vmap ,$ di$<ESC>pa$
endfunction

function FonctionCpp()

	"Map"
	imap <F5> /*! \brief<CR> \param<CR>\return<CR>/
	map ,d o/*! \brief<CR> \param<CR>\return<CR>/<CR><ESC>ddkkkk
	map ,D O/*! \brief<CR> \param<CR>\return<CR>/<CR><ESC>ddkkkk

	vmap ,c :s:^://<CR>
endfunction

" Python
let g:pyflakes_use_quickfix = 1

