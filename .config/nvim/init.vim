set nocompatible "This fixes the problem where arrow keys do not function properly on some systems
syntax on  "Enables syntax highlighting for programming languages
"set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set showmatch "Highlights matching brackets in programming languages
set autoindent  "If you're indented, new lines will also be indented                                                                                                                                                      
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set backspace=2  "This makes the backspace key function like it does in other programs
set tabstop=4  "How much space Vim gives to a tab
set number  "Enables line numbering
nnoremap <F12> :set nonumber!<CR>
set smarttab  "Improves tabbing
set shiftwidth=4  "Assists code formatting
set ttyfast "Make Keyboard fast    
set timeout timeoutlen=1000 ttimeoutlen=50
set showmode "Always show what mode we're currently editing in
set nowrap "Don't wrap lines
set fileformats="unix,dos,mac"
set formatoptions+=1  " When wrapping paragraphs, don't end lines
                      "    with 1-letter words (looks stupid)
set autoread "Automatically reload files changed outside of Vim

filetype on                                                                                                                                                           
filetype indent on
filetype plugin on
set cul
"colorscheme darkblue  "Changes the color scheme. Change this to your liking. Lookin /usr/share/vim/vim61/colors/ for options
colorscheme torte
                                                                                                                                                                                                                          
hi clear CursorLine
"hi link CursorLine CursorColumn
"hi CursorLine term=none cterm=none ctermbg=3
hi CursorLine term=underline cterm=underline guibg=Grey40
"hi CursorLine cterm=underline ctermbg=none ctermfg=LightGrey guibg=darkred guifg=white
hi CursorLineNr term=bold cterm=underline ctermfg=11 gui=bold guifg=Green
                                                                                                                                                                                                                          
"set cursorcolumn

"autocmd! BufEnter,BufNewFile *.htm,*.html,*.php,*.css,*.js,*.sql,*.xml,*.py,*.rb,*.ru,*.erb,*.yaml,*.c,*.cpp colorscheme delek
"autocmd! BufLeave *.htm,*.html,*.php,*.css,*.js,*.sql,*.xml,*.py,*.rb,*.ru,*.erb,*.yaml,*.c,*.cpp colorscheme darkblue

"setlocal spell  "Enables spell checking (CURRENTLY DISABLED because it's kinda annoying). Make sure to uncomment the next line if you use this
"set spellfile=~/.vimwords.add  "The location of the spellcheck dictionary. Uncomment this line if you uncomment the previous line
set foldmethod=manual  "Lets you hide sections of code
set smartcase "Ignore case on search unless specified
set pastetoggle=<F3>
set clipboard+=unnamedplus

"--- The following commands make the navigation keys work like standard editors
"imap <silent> <Down> <C-o>gj
"imap <silent> <Up> <C-o>gk
"nmap <silent> <Down> gj
"nmap <silent> <Up> gk
"--- Ends navigation commands
