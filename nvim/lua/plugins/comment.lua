return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- plugin to allow us to automatically comment tsx elements with the comment plugin
		"JoosepAlviste/nvim-ts-context-commentstring",
        event = "VeryLazy",
	},
	config = function()
		-- Set a vim motion to <Ctrl> + / to comment the line under the cursor in normal mode
		vim.keymap.set("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment Line" })
		-- Set a vim motion to <Ctrl> + / to comment all the lines selected in visual mode
		vim.keymap.set("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment Selected" })

		-- gain access to tsx commenting plugins functions
		-- local ts_context_comment_string = require("ts_context_commentstring.integrations.comment_nvim")
        vim.g.skip_ts_context_commentstring_module = true
        ---@diagnostic disable: missing-fields
        require("ts_context_commentstring").setup {
            enable_autocmd = false,
        }

		-- setup the comment plugin to use ts_context_comment_string to check if we are attempting to comment out a tsx element
		-- if we are use ts_context_comment_string to comment it out
		require("Comment").setup({
            ---Add a space b/w comment and the line
            padding = true,
            ---Whether the cursor should stay at its position
            sticky = true,
            ---LHS of toggle mappings in NORMAL mode
            toggler = {
                ---Line-comment toggle keymap
                line = "gcc",
                ---Block-comment toggle keymap
                block = "gbc",
            },
            ---LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                ---Line-comment keymap
                line = "gc",
                ---Block-comment keymap
                block = "gb",
            },
            ---LHS of extra mappings
            extra = {
                ---Add comment on the line above
                above = "gcO",
                ---Add comment on the line below
                below = "gco",
                ---Add comment at the end of line
                eol = "gcA",
            },
            ---Enable keybindings
            ---NOTE: If given `false` then the plugin won't create any mappings
            mappings = {
                ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                basic = true,
                ---Extra mapping; `gco`, `gcO`, `gcA`
                extra = true,
            },

            -- Function to call before (un)comment 
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            -- Function to call after (un)comment
            -- post_hook = nil,
		})
	end,
}
