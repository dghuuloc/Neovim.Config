```vim
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
" ------- EDITOR
highlight Normal                    guifg=#e0e2ea           guibg=#14161b           ctermfg=gray ctermbg=black
" highlight StatusLine                guifg=#c8c093           guibg=#14161b           gui=italic
highlight StatusLine                guifg=#81a2be           guibg=#14161b           gui=italic
highlight Cursor                    guifg=#1f1f1f       guibg=#f9e7c0
highlight CursorLine                guibg=#363636
highlight NonText                   guifg=#545454
highlight Directory                 guifg=#8cabff       
" highlight LineNr                    guifg=#545454           guibg=#2a2a2a
highlight LineNr                    guifg=#545454
"---------------------------------------------------------------------------------------------------------------------------
" ------- SYNTAX
" highlight Comment                   guifg=#9b9ea4                                   gui=italic              cterm=italic
highlight Comment                   guifg=#727169                                   gui=italic              cterm=italic
" highlight Constant                  guifg=#de935f                                   gui=bold
highlight Constant                  guifg=#ffaa44                                   
" highlight String                    guifg=#98bb6c
highlight String                    guifg=#99cc99
highlight link Character String
" highlight Number                    guifg=#de935f
highlight Number                    guifg=#d27e99
highlight link Float Number
" highlight Boolean                   guifg=#de935f
highlight Boolean                   guifg=#ffaa44       gui=bold        cterm=bold
" highlight Identifier                guifg=#ffee99
highlight Identifier                guifg=#e0e2ea
" highlight Function                  guifg=#8cf8f7
highlight Function                  guifg=#8cabff   
" highlight Statement                 guifg=#e0e2ea                                   gui=bold                cterm=bold
highlight Statement                 guifg=#bfa3e6                                   gui=bold        cterm=bold
" highlight Operator                  guifg=#e0e2ea
highlight Operator                  guifg=#c0a36e
" highlight Keyword                   guifg=#87cefa
highlight Keyword                   guifg=#bfa3e6       gui=italic      cterm=italic
highlight Exception                 guifg=#e46876
highlight PreProc                   guifg=#e46876
highlight link Macro PreProc 
" highlight Type                      guifg=#87cefa
highlight Type                      guifg=#77bbdd
highlight link Structure Type
highlight link Typedef Type
" highlight Special                   guifg=#8cf8f7                                   gui=bold
highlight Special                   guifg=#7fc4ef
highlight Delimiter                 guifg=#9cabca
highlight Underlined                guifg=#7fc4ef       gui=underline   cterm=underline 
highlight Bold                                          gui=bold        cterm=bold
highlight Italic                                        gui=italic      cterm=italic
highlight link Ignore NonText
" highlight Error                     guifg=#cc6666                                   gui=bold
highlight Error                     guifg=#e82424
highlight Todo                      guifg=#322c47       guibg=#7fb4ca   gui=bold     cterm=bold 
highlight link qfLineNr LineNr
highlight link qfFileName Directory
highlight markdownCode              guifg=#98bb6c
highlight markdownCodeBlock         guifg=#98bb6c
highlight markdownEscape            guifg=NONE
" ------- TREESITTER
highlight @variable                 guifg=#f9e7c0
highlight link @module Structure
highlight link @property Identifier
" highlight @variable.builtin         guifg=#f8fe7a
highlight @variable.builtin         guifg=#e46876       gui=italic          cterm=italic
highlight @variable.parameter       guifg=#bcacdb
highlight @variable.member          guifg=#ffee99
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
highlight link @keyword.import PreProc       
highlight @keyword.return           guifg=#ff5d62       gui=italic          cterm=italic
highlight @keyword.exception        guifg=#ff5d62       gui=bold            cterm=bold
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
highlight link @function.builtin Special
" ------- LSP
" highlight link @lsp.type.class Structure
" highlight link @lsp.type.decorator Function
" highlight link @lsp.type.enum Structure
" highlight link @lsp.type.enumMember Constant
" highlight link @lsp.type.function Function
" highlight link @lsp.type.interface Structure
highlight link @lsp.type.macro Macro
highlight link @lsp.type.method @function.method
highlight link @lsp.type.namespace @module
highlight link @lsp.type.parameter @variable.parameter 
" highlight link @lsp.type.property Identifier
" highlight link @lsp.type.struct Structure
" highlight link @lsp.type.type Type
" highlight link @lsp.type.typeParameter Typedef
highlight @lsp.type.variable                        guifg=NONE
highlight @lsp.type.comment                         guifg=NONE
highlight link @lsp.type.const Constant 
highlight link @lsp.type.comparison Operator 
highlight link @lsp.type.bitwise Operator 
highlight link @lsp.type.punctuation Delimiter
highlight link @lsp.type.selfParameter @variable.builtin 
highlight link @lsp.type.builtinConstant @constant.builtin
highlight link @lsp.type.magicFunction @function.builtin
highlight link @lsp.mod.readonly Constant
highlight link @lsp.mod.typeHint Type
" highlight link @lsp.mod.defaultLibrary Special
" highlight link @lsp.mod.builtin Special
highlight link @lsp.typemod.operator.controlFlow @keyword.exception
highlight link @lsp.typemod.keyword.documentation Special 
highlight link @lsp.typemod.variable.global Constant 
highlight link @lsp.typemod.variable.static Constant
highlight link @lsp.typemod.variable.defaultLibrary Special
highlight link @lsp.typemod.function.builtin @function.builtin
highlight link @lsp.typemod.function.defaultLibrary @function.builtin
highlight link @lsp.typemod.method.defaultLibrary @function.builtin
highlight link @lsp.typemod.variable.injected @variable
highlight @lsp.typemod.function.readonly                guifg=#8cabff       gui=bold    cterm=bold
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
" highlight CmpDocumentation
" highlight CmpDocumentationBorder
" highlight CmpCompletion
" highlight CmpCompletionSel
" highlight CmpCompletionBorder
" highlight CmpCompletionThumb
" highlight CmpCompletionSbar
" highlight CmpItemAbbr
" highlight CmpItemAbbrDeprecated
" highlight CmpItemAbbrMatch
" highlight CmpItemAbbrMatchFuzzy
" highlight CmpItemKindDefault
" highlight CmpItemMenu
highlight CmpItemKindText                                           guifg=#f9e7c0
highlight link CmpItemKindMethod @function.method
highlight link CmpItemKindFunction Function
highlight link CmpItemKindConstructor @constructor
highlight link CmpItemKindField @variable.member
highlight CmpItemKindVariable                                       guifg=#c8c093
highlight link CmpItemKindClass Type
highlight link CmpItemKindInterface Type
highlight link CmpItemKindModule @module
highlight link CmpItemKindProperty @property
highlight link CmpItemKindUnit Number
highlight link CmpItemKindValue String
highlight link CmpItemKindEnum Type
highlight link CmpItemKindKeyword Keyword
highlight link CmpItemKindSnippet Special
highlight link CmpItemKindColor Special
highlight link CmpItemKindFile Directory
highlight link CmpItemKindReference Special
highlight link CmpItemKindFolder Directory
highlight link CmpItemKindEnumMember Constant
highlight link CmpItemKindConstant Constant
highlight link CmpItemKindStruct Type
highlight link CmpItemKindEvent Type
highlight link CmpItemKindOperator Operator
highlight link CmpItemKindTypeParameter Type
highlight link CmpItemKindCopilot String
" for Dap-UI
" highlight link DapUIVariable Normal
highlight link DapUIScope Special
highlight link DapUIType Type
" highlight link DapUIValue Normal
highlight DapUIModifiedValue                                guifg=#7fc4ef       gui=bold        cterm=bold
highlight DapUIDecoration                                   guifg=#545454
highlight DapUIThread                                       guifg=#ffee99
highlight DapUIStoppedThread                                guifg=#7fc4ef
" highlight link DapUIFrameName Normal
highlight DapUISource                                       guifg=#e46876
highlight DapUILineNumber                                   guifg=#7fc4ef
highlight DapUIFloatBorder                                  guifg=#545454
highlight DapUIWatchesEmpty                                 guifg=#e82424
highlight DapUIWatchesValue                                 guifg=#ffee99
highlight DapUIWatchesError                                 guifg=#e82424
highlight link DapUIBreakpointsPath Directory
highlight DapUIBreakpointsInfo                              guifg=#7fb4ca
highlight DapUIBreakpointsCurrentLine                       guifg=#ffee99       gui=bold        cterm=bold
" highlight link DapUIBreakpointsLine DapUILineNumber
highlight link DapUIBreakpointsDisabledLine Comment
" highlight link DapUICurrentFrameName DapUIBreakpointsCurrentLine
highlight DapUIStepOver                                     guifg=#7fc4ef
highlight DapUIStepInto                                     guifg=#7fc4ef
highlight DapUIStepBack                                     guifg=#7fc4ef
highlight DapUIStepOut                                      guifg=#7fc4ef
highlight DapUIStop                                         guifg=#e82424
highlight DapUIPlayPause                                    guifg=#98bb6c
highlight DapUIRestart                                      guifg=#98bb6c
highlight DapUIUnavailable                                  guifg=#727169
```
---
## Reference colorscheme [gruvbox themes](https://github.com/morhetz/gruvbox/blob/master/colors/gruvbox.vim)
```vim
" fill it with absolute colors
let s:gb.dark0_hard  = ['#1d2021', 234]     " 29-32-33
let s:gb.dark0       = ['#282828', 235]     " 40-40-40
let s:gb.dark0_soft  = ['#32302f', 236]     " 50-48-47
let s:gb.dark1       = ['#3c3836', 237]     " 60-56-54
let s:gb.dark2       = ['#504945', 239]     " 80-73-69
let s:gb.dark3       = ['#665c54', 241]     " 102-92-84
let s:gb.dark4       = ['#7c6f64', 243]     " 124-111-100
let s:gb.dark4_256   = ['#7c6f64', 243]     " 124-111-100

let s:gb.gray_245    = ['#928374', 245]     " 146-131-116
let s:gb.gray_244    = ['#928374', 244]     " 146-131-116

let s:gb.light0_hard = ['#f9f5d7', 230]     " 249-245-215
let s:gb.light0      = ['#fbf1c7', 229]     " 253-244-193
let s:gb.light0_soft = ['#f2e5bc', 228]     " 242-229-188
let s:gb.light1      = ['#ebdbb2', 223]     " 235-219-178
let s:gb.light2      = ['#d5c4a1', 250]     " 213-196-161
let s:gb.light3      = ['#bdae93', 248]     " 189-174-147
let s:gb.light4      = ['#a89984', 246]     " 168-153-132
let s:gb.light4_256  = ['#a89984', 246]     " 168-153-132

let s:gb.bright_red     = ['#fb4934', 167]     " 251-73-52
let s:gb.bright_green   = ['#b8bb26', 142]     " 184-187-38
let s:gb.bright_yellow  = ['#fabd2f', 214]     " 250-189-47
let s:gb.bright_blue    = ['#83a598', 109]     " 131-165-152
let s:gb.bright_purple  = ['#d3869b', 175]     " 211-134-155
let s:gb.bright_aqua    = ['#8ec07c', 108]     " 142-192-124
let s:gb.bright_orange  = ['#fe8019', 208]     " 254-128-25

let s:gb.neutral_red    = ['#cc241d', 124]     " 204-36-29
let s:gb.neutral_green  = ['#98971a', 106]     " 152-151-26
let s:gb.neutral_yellow = ['#d79921', 172]     " 215-153-33
let s:gb.neutral_blue   = ['#458588', 66]      " 69-133-136
let s:gb.neutral_purple = ['#b16286', 132]     " 177-98-134
let s:gb.neutral_aqua   = ['#689d6a', 72]      " 104-157-106
let s:gb.neutral_orange = ['#d65d0e', 166]     " 214-93-14

let s:gb.faded_red      = ['#9d0006', 88]      " 157-0-6
let s:gb.faded_green    = ['#79740e', 100]     " 121-116-14
let s:gb.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:gb.faded_blue     = ['#076678', 24]      " 7-102-120
let s:gb.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:gb.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:gb.faded_orange   = ['#af3a03', 130]     " 175-58-3
```
