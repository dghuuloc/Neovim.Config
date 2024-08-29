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
-- vim.cmd("let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'")
-- vim.cmd("let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
-- vim.cmd("let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
-- vim.cmd("set shellquote= shellxquote=")

