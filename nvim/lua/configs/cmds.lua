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

