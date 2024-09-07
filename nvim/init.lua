-- [[                                                                       ]],
-- [[  ██████   █████                   █████   █████  ███                  ]],
-- [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
-- [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
-- [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
-- [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
-- [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
-- [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
-- [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],

-------------------------------------------------------------------------------
-- 󰢱 init.lua
-------------------------------------------------------------------------------

require('configs')

vim.cmd("let &shell = has('win32') ? 'powershell' : 'pwsh'")
vim.cmd("let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'")
vim.cmd("let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
vim.cmd("let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
vim.cmd("set shellquote= shellxquote=")

-- vim.opt.shell = "powershell"
-- vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
-- vim.opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
-- vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
-- vim.opt.shellquote = ""
-- vim.opt.shellxquote = ""


-- terminal settings
-- local powershell_options = {
--     shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
--     shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
--     shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
--     shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
--     shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
--     shellquote = "",
--     shellxquote = "",
-- }
-- 
-- for option, value in pairs(powershell_options) do
--   vim.opt[option] = value
-- end

