
```lua
return {
    "lervag/vimtex",
    lazy = false,     -- lazy-loading will disable inverse search

    init = function()
        -- PDF viewer settings
        -- vim.g.vimtex_view_method = 'okular'
        vim.g.vimtex_view_general_viewer = 'okular'
        vim.g.vimtex_context_pdf_viewer = 'okular'
        -- vim.g.vimtex_view_general_options = "--unique file:@pdf\#src:@line@tex"

        -- Do not open pdfviwer on compile
        vim.g.vimtex_view_automatic = 1

        -- Syntax Settings
        vim.g.vimtex_syntax_enabled = 0
        vim.g.vimtex_indent_enabled = false            -- Disable auto-indent from Vimtex
        vim.g.tex_indent_items = false                 -- Disable indent for enumerate
        vim.g.tex_indent_brace = false                 -- Disable brace indent

        -- Compiler Settings
        -- vim.g.vimtex_compiler_method = 'latexmk'
        -- vim.g.vimtex_compiler_engine = 'lualatex'
        vim.g.vimtex_compiler_latexmk_engines = {["_"] = "-lualatex -shell-escape"}
        -- vim.g.vimtex_compiler_latexrun_engines = {["_"] = "lualatex -shell-escape"}
        vim.g.matchup_override_vimtex = 1
        -- vim.g.vimtex_compiler_latexmk = {
        --     executable = 'latexmk',
        --     options = {
        --         '-lualatex',                         -- Specifies the use of 'lualatex' or 'xelatex'
        --         '-file-line-error',
        --         '-synctex=1',
        --         '-interaction=nonstopmode',
        --     },
        --     build_dir = 'livepreview',
        -- }
        -- vim.g.vimtex_latexmk_options = '-lualatex -shell-escape -synctex=1 -src-specials -interaction=nonstopmode'


        -- Suppression settings
        vim.g.vimtex_quickfix_mode = 0                 -- Suppress quickfix on save/build
        vim.g.vimtex_log_ignore = {                    -- Suppress specific log messages
          'Underfull',
          'Overfull',
          'specifier changed to',
          'Token not allowed in a PDF string',
        }

        -- Other settings
        vim.g.vimtex_mappings_enabled = false          -- Disable default mappings
        vim.g.tex_flavor = 'latex'                     -- Set file type for TeX files

        -- vim.g.vimtex_syntax_conceal = {		-- enable or disable specific conceals
        --     accents = 1,
        --     ligatures = 1,
        --     cites = 1,
        --     fancy = 1,
        --     spacing = 0,			-- default: 1
        --     greek = 1,
        --     math_bounds = 1,
        --     math_delimiters = 1,
        --     math_fracs = 1,
        --     math_super_sub = 1,
        --     math_symbols = 1,
        --     sections = 0,
        --     styles = 1,
        -- }

    end

}
```
