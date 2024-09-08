" Name:         mpadscol
" Description:  dark background colorscheme.

" -----------------------------------------------------------------------------------------
" Syntax example: highlight Normal ctermfg=grey  guifg=#bcbcbc ctermbg=80 guibg=#2b2b28
" The 'ctermfg' is the terminal foreground color.
" The 'guifg' is the foreground color for the GUI. 
" The 'ctermbg' is the terminal background color. 
" The 'guibg' is the background color.
" See ascii-code from --> https://www.ascii-code.com/html-color-names.php
" Generate your own vim colorscheme --> from https://vimcolors.org/
" -----------------------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------------------
" set the background
set background=dark

highlight clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "mpadscol"

" highlight Normal    guifg=#e0e0e0 guibg=#000000	ctermfg=gray ctermbg=black
