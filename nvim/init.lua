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

local set = vim.opt_local

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0

    vim.bo.filetype = "terminal"
  end,
})

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", ",st", function()
  vim.cmd.new()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)

-- Keep window around when terminal closes
vim.api.nvim_create_autocmd("TermClose", {
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", ":Bdelete<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(
			buf,
			"t",
			"<Esc>",
			vim.api.nvim_replace_termcodes("<C-\\><C-N>:Bdelete<CR>", true, true, true),
			{ noremap = true, silent = true }
		)
	end,
})


