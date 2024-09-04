return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- ui plugins to make debugging simplier
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio"
    },

    config = function()
        -- gain access to the dap plugin and its functions
        local dap = require("dap")
        -- gain access to the dap ui plugin and its functions
        local dapui = require("dapui")

        -- Setup the dap ui with default configuration
        dapui.setup()

        -- Automatically open the UI when a new debug session is created.
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        -- set a vim motion for toggling a breakpoint at the line where the cursor is currently on
        -- F9 (Toggle breakpoint): This allows you to set or remove a breakpoint on the current line of code.
        vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })

        -- set a vim motion for starting the debugger and launch the debugging ui
        -- F8 (Resume execution): This allows you to continue executing the program without stopping debugging.
        vim.keymap.set("n", "<F8>", dap.continue, { desc = "[D]ebug [S]tart" })

        -- F5 (Step into): This allows you to enter debug mode.
        vim.keymap.set("n", "<F5>", dap.step_into, { desc = "[S]tep [I]nto" })

        -- F6 (Step over): This assists in moving to the next line without leaving debug mode.
        vim.keymap.set("n", "<F6>", dap.step_over, { desc = "[S]tep [O]ver" })

        -- F7 (Step out): This allows you to step out/return to the current method/caller in debug mode.
        vim.keymap.set("n", "<F7>", dap.step_out, { desc = "[S]tep [O]ut" })

        -- set a vim motion to close the debugging ui
        vim.keymap.set("n", "<leader>dc", dapui.close, {desc = "[D]ebug [C]lose"})

        -- Add dap configurations based on your language/adapter settings
        dap.configurations = {
            -- configurations for Java languages
            -- java = {
            --     {
            --         type = "java",
            --         name = "Debug",
            --         request = "launch",
            --         program = "${file}",
            --     },
            -- },

            -- configurations for other languages
        }

    end
}
