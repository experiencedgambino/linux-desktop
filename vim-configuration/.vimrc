" turn on numbering
set number

" map the left and right arrows to previous and next tab
map <left> :tabp<CR>
map <right> :tabn<CR>

" expandtab uses spaces instead of tabs
set expandtab
" tabstop is the number of spaces associated with a single tab character
set tabstop=4
" shiftwidth allows proper indentation of code, config files, etc
set shiftwidth=4
" stoptabstop definitely does something....
set softtabstop=4

" good default colorscheme to avoid annoying deep blue shades
colorscheme desert

" ensure that syntax is highlighted, because why are you using this if you are not writing code
syntax on
