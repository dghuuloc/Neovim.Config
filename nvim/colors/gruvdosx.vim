" Name:         gruvdosx
" Description:  dark background colorscheme

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

set background=dark

highlight clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "gruvdosx"
set t_Co=256
set cursorline

highlight Normal                    guifg=#e0e2ea           guibg=#14161b           ctermfg=gray ctermbg=black

highlight StatusLine                guifg=#81a2be           guibg=#14161b           gui=italic
highlight Comment                   guifg=#9b9ea4                                   gui=italic              cterm=bold

highlight Statement                 guifg=#e0e2ea                                   gui=bold                cterm=bold

highlight Constant                  guifg=#de935f                                   gui=bold
highlight Operator                  guifg=#e0e2ea
highlight Keyword                   guifg=#87cefa
highlight Identifier                guifg=#e0e2ea
highlight Function                  guifg=#8cf8f7

highlight String                    guifg=#99cc99
highlight Boolean                   guifg=#de935f
highlight Number                    guifg=#de935f
highlight link Float Number

highlight Structure                 guifg=#87cefa
highlight Type                      guifg=#87cefa
highlight Special                   guifg=#8cf8f7                                   gui=bold
highlight Error                     guifg=#cc6666                                   gui=bold

highlight @variable.builtin         guifg=#f8fe7a


