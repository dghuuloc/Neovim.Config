-- Colorscheme
vim.cmd.colorscheme("mpadscol")

-- Get h and l for moving over next lines or previous lines
vim.cmd([[set whichwrap+=<,>,[,],h,l]])

-- Terminal
vim.cmd([[ 
    let &shell = has('win32') ? 'powershell' : 'pwsh'
    let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode' 
    let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    set shellquote = ""
    set shellxquote = ""
]])

-- Command for jdtls 
vim.cmd([[command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)]])
vim.cmd([[command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()]])
vim.cmd([[command! -buffer JdtBytecode lua require('jdtls').javap()]])
vim.cmd([[command! -buffer JdtJshell lua require('jdtls').jshell()]])

-- Prevent neovim commenting out next line after a comment line
vim.api.nvim_create_autocmd("FileType", {
    pattern ="*",
    callback =function()
        vim.opt_local.formatoptions:remove({ 'r', 'o' })
    end,
})

-- Disable all diagnostic
vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function(opt)
    vim.diagnostic.disable(opt.buf)
  end,
})

-- Clear Register
function ClearReg()
    vim.cmd [[
        let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
        for r in regs
            call setreg(r, [])
        endfor
    ]] 
end

vim.api.nvim_create_user_command('DelRegs', function()
  ClearReg()
end, {})

-- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
-- See more: https://github.com/nanotee/nvim-lsp-basics/blob/main/doc/lsp-basics.txt
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        local opts = { noremap=true, silent=true, buffer = event.buf }
        
        -- :LspDefinition - Jumps to the definition of the symbol under the cursor
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        -- :LspDeclaration - Jumps to the declaration of the symbol under the cursor
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        -- :LspHover - Displays hover information about the symbol under the cursor
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        -- :LspTypeDefinition - Jumps to the definition of the type of the symbol under the cursor
        vim.keymap.set('n', 'gbt', vim.lsp.buf.type_definition, opts)

        -- :LspRename {new_name} - Renames all references to the symbol under the cursor. If no {new_name} is given, prompts the user for one.
        vim.keymap.set("n", "gbn", vim.lsp.buf.rename, opts)

        -- :LspCodeAction - Prompts the user for a code action to execute (if one is available at the current cursor position)
        vim.keymap.set({"n","v"}, "gba", vim.lsp.buf.code_action, opts)

        -- :LspReferences - Gets all the references to the symbol under the cursor
        vim.keymap.set("n", "gbr", vim.lsp.buf.references, opts)

        -- :LspFormat[!] - Formats the current buffer. If [!] is used, the formatting is done synchronously
        vim.keymap.set({"n","x"}, "gbf", function()
            vim.lsp.buf.format { async = true }
        end, opts)

        -- :LspImplementation - Gets all the implementations for the symbol under the cursor
        vim.keymap.set('n', 'gbi', vim.lsp.buf.implementation, opts)

        -- :LspSignatureHelp - Displays signature help information about the symbol under the cursor
        vim.keymap.set("n", "gbs", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)

        -- :LspWorkspaceSymbol {query} - Gets all the symbols in the current workspace
        vim.keymap.set("n", "gws", function() vim.lsp.buf.workspace_symbol() end, opts)
        -- :LspDocumentSymbol - Gets all the symbols for the current buffer
        vim.keymap.set('n', 'gds', vim.lsp.buf.document_symbol, opts)

    end,
})
