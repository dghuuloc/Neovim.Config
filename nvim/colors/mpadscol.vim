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
" refer to scheme like Jetbrain --> https://github.com/doums/darcula/tree/master
" reference docs --> https://phoenixnap.com/kb/vim-color-schemes
" -----------------------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------------------
" set the background
set background=dark

highlight clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "mpadscol"
set t_Co=256
set cursorline

highlight Normal                    guifg=#e0e0e0 guibg=#111111	ctermfg=gray ctermbg=black
highlight Comment                   gui=italic cterm=italic
highlight Constant                  guifg=#de935f guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
highlight String                    guifg=#698b69 ctermfg=114 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
highlight Keyword                   guifg=#b294bb  guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
highlight Identifier                guifg=#e0e0e0 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
highlight Function                  guifg=#81a2be ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
