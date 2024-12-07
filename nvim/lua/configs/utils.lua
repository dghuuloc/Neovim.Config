local M = {} -- The module to export

function M.greeting()
    print("configs.utils.lua with Hello World!")
end

-- Clear Register
function M.clearReg()
    vim.cmd [[
        let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
        for r in regs
            call setreg(r, [])
        endfor
    ]] 
end

-- We want to be able to access utils in all our configuration files
-- so we add the module to the _G global variable.
_G.utils = M
return M --Export the module


--[[
local utils = require("configs.utils")
vim.keymap.set("n", "<leader>hl", utils.greeting, { desc = 'How to call configs.utils' })
--]]
