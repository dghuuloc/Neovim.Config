local utils = require("configs.utils")

-- Colorscheme
vim.cmd.colorscheme("gruvdosx")

-- Get h and l for moving over next lines or previous lines
vim.cmd([[set whichwrap+=<,>,[,],h,l]])

-- Terminal settings
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

vim.api.nvim_create_user_command('DelRegs', function()
    utils.clearReg()
end, {})

-- Create Maven New Project
vim.api.nvim_create_user_command(
    "MavenNewProject",
    utils.maven_new_project,
    {desc = "Create New Maven Project"}
)

-- Run Maven Project
vim.api.nvim_create_user_command(
    "MavenRun",
    utils.maven_run_project,
    {desc = "Run Maven Project"}
)

-- Execute Maven Task
vim.api.nvim_create_user_command(
    "MavenTask",
    utils.maven_task_project,
    {desc = "Execute Maven Task"}
)

-- Create Java Class 
vim.api.nvim_create_user_command(
    "MavenNewClass",
    utils.create_java_class,
    {desc = "Create Java Class"}
)

-- Create Java Interface 
vim.api.nvim_create_user_command(
    "MavenNewInterface",
    utils.create_java_interface,
    {desc = "Create Java Interface"}
)
