if has('gui')
	colorscheme inkpot
	set background=dark
	set cursorline
	"set guioptions=agi
	"hi CursorLine guibg=#DEEFFF
	"hi CursorColumn guibg=#333333
	"hi CursorLine guibg=#332941
	"hi CursorColumn guibg=#273333
	winpos 0 0
	"set guifont=Fixedsys:h11:cANSI
	set guifont=DejaVu\ Sans\ Mono\ 12
	set lines=32
	set columns=126
endif

"Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

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

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
  autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal g`\"" |
\ endif

