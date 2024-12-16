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

"---------------------------------------------------------------------------------------------------------------------------
highlight Normal                    guifg=#e0e2ea           guibg=#14161b           ctermfg=gray        ctermbg=black
highlight NormalFloat               guifg=#e0e2ea           guibg=#14161b           ctermfg=gray        ctermbg=black
highlight link NormalNC Normal
highlight StatusLine                guifg=#81a2be           guibg=#14161b           gui=italic
highlight StatusLineNC              guifg=#545454           guibg=#161616
highlight Cursor                    guifg=#1f1f1f           guibg=#f9e7c0
highlight CursorLine                guibg=#363636
highlight NonText                   guifg=#545454
highlight Directory                 guifg=#8cabff       

highlight FloatBorder               guifg=#f9e7c0           guibg=#1f1f1f
highlight FloatTitle                guifg=#938aa9           guibg=#161616           gui=bold            cterm=bold
highlight FloatFooter               guifg=#545454           guibg=#161616

highlight Visual                                            guibg=#4f5258           ctermfg=0           ctermbg=15
highlight link VisualNOS Visual

highlight LineNr                    guifg=#545454
highlight CursorLineNr              guifg=#ff9e3b           guibg=#2a2a2a           gui=bold            cterm=bold

highlight CurSearch                 guifg=#07080d           guibg=#fce094           gui=bold            cterm=bold
highlight Search                    guifg=#07080d           guibg=#fce094

highlight ErrorMsg                  guifg=#ffc0b9           ctermfg=9 
highlight MsgArea                   guifg=#e0e2ea

"---------------------------------------------------------------------------------------------------------------------------
highlight Comment                   guifg=#727169                                   gui=italic              cterm=italic
highlight Constant                  guifg=#ffaa44                                   
highlight String                    guifg=#99cc99
highlight link Character String
highlight Number                    guifg=#d27e99
highlight link Float Number
highlight Boolean                   guifg=#ffaa44       gui=bold        cterm=bold
highlight Identifier                guifg=#e0e2ea
highlight Function                  guifg=#8cabff   
highlight Statement                 guifg=#bfa3e6                                   gui=bold        cterm=bold
highlight Operator                  guifg=#c4746e
highlight Keyword                   guifg=#bfa3e6       gui=italic      cterm=italic
highlight Exception                 guifg=#e46876
highlight PreProc                   guifg=#e46876
highlight link Macro PreProc 
highlight Type                      guifg=#77bbdd
highlight link Structure Type
highlight link Typedef Type
highlight Special                   guifg=#7fc4ef
highlight Delimiter                 guifg=#9cabca
highlight Underlined                guifg=#7fc4ef       gui=underline   cterm=underline 
highlight Bold                                          gui=bold        cterm=bold
highlight Italic                                        gui=italic      cterm=italic
highlight link Ignore NonText
highlight Error                     guifg=#e82424
highlight Todo                      guifg=#322c47       guibg=#7fb4ca   gui=bold     cterm=bold 
highlight link qfLineNr LineNr
highlight link qfFileName Directory
highlight markdownCode              guifg=#98bb6c
highlight markdownCodeBlock         guifg=#98bb6c
highlight markdownEscape            guifg=NONE

"---------------------------------------------------------------------------------------------------------------------------
highlight link @function.builtin Special
" highlight @function.method    cterm=bold gui=bold guifg=#b8bb26
" highlight @function.member.call     cterm=bold gui=bold guifg=#b8bb26

" highlight @variable                 guifg=#f9e7c0
" highlight @variable                 guifg=#ebdbb2
highlight @variable                 guifg=#d5c4a1
highlight @variable.builtin         guifg=#e46876       gui=italic          cterm=italic
" highlight @variable.parameter       guifg=#bcacdb
" highlight @variable.parameter       guifg=#83a598
highlight @variable.parameter       guifg=#d5c4a1
" highlight @variable.member          guifg=#ffee99
highlight @variable.member          guifg=#77bbdd

highlight link @module Structure
highlight link @property Identifier
highlight link @constant Constant
highlight link @constant.builtin Special

highlight @string.regexp            guifg=#c0a36e
highlight @string.escape            guifg=#c0a36e       gui=bold            cterm=bold
highlight @string.special.symbol    guifg=#ffee99
highlight @string.special.url       guifg=#7fc4ef       gui=undercurl       cterm=undercurl

highlight link @attribute Constant
highlight @constructor              guifg=#7fc4ef
highlight @constructor.lua          guifg=#bfa3e6
highlight link @operator Operator

highlight @keyword.operator         guifg=#c0a36e       gui=bold            cterm=bold
highlight @keyword.return           guifg=#e46876       gui=italic          cterm=italic
highlight @keyword.exception        guifg=#e46876       gui=bold            cterm=bold
highlight @keyword.operator         guifg=#e46876       gui=bold            cterm=bold
highlight link @keyword.import PreProc       
highlight link @keyword.luap @string.regexp

highlight @punctuation.delimiter    guifg=#9cabca
highlight @punctuation.bracket      guifg=#9cabca
highlight @punctuation.special      guifg=#7fc4ef

highlight @comment.error            guifg=#f9e7c0       guibg=#e82424       gui=bold        cterm=bold
highlight @comment.warning          guifg=#322c47       guibg=#ff9e3b       gui=bold        cterm=bold 
highlight @comment.note             guifg=#322c47       guibg=#7e9cd8       gui=bold        cterm=bold 

highlight @markup.strong                                                    gui=bold        cterm=bold
highlight @markup.italic                                                    gui=italic      cterm=italic
highlight @markup.strikethrough                                             gui=strikethrough           cterm=strikethrough
highlight @markup.underline                                                 gui=underline               cterm=underline

highlight link @markup.heading Function
highlight link @markup.quote @variable.parameter
highlight link @markup.math Constant
highlight link @markup.environment Keyword
highlight link @markup.link.url @string.special.url
highlight link @markup.raw String

highlight @diff.plus                guifg=#76a56a
highlight @diff.minus               guifg=#c34043
highlight @diff.delta               guifg=#dca561
highlight @tag.attribute            guifg=#ffee99
highlight @tag.delimiter            guifg=#9cabca
highlight link @tag.builtin Special

" ------- PLUGINS
" for NeoVim
highlight healthError                       guifg=#e82424
highlight healthSuccess                     guifg=#98bb6c
highlight healthWarning                     guifg=#ff9e3b

" for Trouble
highligh TroubleIndent                      guifg=#545454
highligh TroublePos                         guifg=#938aa9

" for Floaterm
highlight FloatermBorder                    guifg=#545454           guibg=#1f1f1f

" for cmp
highlight CmpItemKindText                                           guifg=#f9e7c0
highlight CmpItemKindVariable                                       guifg=#c8c093

highlight link CmpItemKindMethod                                    CmpItemKindText                                    
highlight link CmpItemKindFunction                                  CmpItemKindText
highlight link CmpItemKindConstructor                               CmpItemKindText
highlight link CmpItemKindField                                     CmpItemKindText
highlight link CmpItemKindClass                                     CmpItemKindText
highlight link CmpItemKindInterface                                 CmpItemKindText
highlight link CmpItemKindModule                                    CmpItemKindText
highlight link CmpItemKindProperty                                  CmpItemKindText
highlight link CmpItemKindUnit                                      CmpItemKindText
highlight link CmpItemKindValue                                     CmpItemKindText
highlight link CmpItemKindEnum                                      CmpItemKindText
highlight link CmpItemKindKeyword                                   CmpItemKindText
highlight link CmpItemKindSnippet                                   CmpItemKindText
highlight link CmpItemKindColor                                     CmpItemKindText
highlight link CmpItemKindFile                                      CmpItemKindText
highlight link CmpItemKindReference                                 CmpItemKindText
highlight link CmpItemKindFolder                                    CmpItemKindText
highlight link CmpItemKindEnumMember                                CmpItemKindText
highlight link CmpItemKindConstant                                  CmpItemKindText
highlight link CmpItemKindStruct                                    CmpItemKindText
highlight link CmpItemKindEvent                                     CmpItemKindText
highlight link CmpItemKindOperator                                  CmpItemKindText
highlight link CmpItemKindTypeParameter                             CmpItemKindText

" for Dap-UI
 highlight link DapUIScope Special
 highlight link DapUIType Type
 highlight link DapUIValue Normal
 highlight DapUIModifiedValue                                guifg=#7fc4ef       gui=bold        cterm=bold
 highlight DapUIDecoration                                   guifg=#545454
 highlight DapUIThread                                       guifg=#ffee99
 highlight DapUIStoppedThread                                guifg=#7fc4ef
 highlight link DapUIFrameName Normal
 highlight DapUISource                                       guifg=#e46876
 highlight DapUILineNumber                                   guifg=#7fc4ef
 highlight DapUIFloatBorder                                  guifg=#545454
 highlight DapUIWatchesEmpty                                 guifg=#e82424
 highlight DapUIWatchesValue                                 guifg=#ffee99
 highlight DapUIWatchesError                                 guifg=#e82424
 highlight link DapUIBreakpointsPath Directory
 highlight DapUIBreakpointsInfo                              guifg=#7fb4ca
 highlight DapUIBreakpointsCurrentLine                       guifg=#ffee99       gui=bold        cterm=bold
 highlight link DapUIBreakpointsLine DapUILineNumber
 highlight link DapUIBreakpointsDisabledLine Comment
 highlight link DapUICurrentFrameName DapUIBreakpointsCurrentLine
 highlight DapUIStepOver                                     guifg=#7fc4ef
 highlight DapUIStepInto                                     guifg=#7fc4ef
 highlight DapUIStepBack                                     guifg=#7fc4ef
 highlight DapUIStepOut                                      guifg=#7fc4ef
 highlight DapUIStop                                         guifg=#e82424
 highlight DapUIPlayPause                                    guifg=#98bb6c
 highlight DapUIRestart                                      guifg=#98bb6c
 highlight DapUIUnavailable                                  guifg=#727169

" for NvimTree
highlight NvimTreeRootFolder                                guifg=#bfa3e6       gui=bold      cterm=bold
highlight NvimTreeFolderIcon                                guifg=#8cabff

