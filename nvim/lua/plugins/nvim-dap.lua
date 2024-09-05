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
        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        -- Automatically close the UI when a new debug session is created.
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end

        -- set a vim motion to toggle a breakpoint at the line where the cursor is currently on
        -- F9 (Toggle breakpoint): This allows you to set or remove a breakpoint on the current line of code.
        vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })

        -- set a vim motion to start the debugger and launch the debugging ui
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

        -- set a vim motions to clear all breakpoints
        vim.keymap.set("n", "<leader>dC", function()
            dap.clear_breakpoints()
        end, { desc = "Clear all Breakpoints" })

        -- set a vim motions to close debugger and clear breakpoints
        vim.keymap.set("n", "<leader>de", function()
        dap.clear_breakpoints()
        dapui.toggle({})
        dap.terminate()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) --
        end, { desc = "Close debugger and end debugging session" })

        -- Add dap configurations based on your language/adapter settings
        dap.configurations = {
            -- configurations for Java languages
            java = {
                {
                    type = "java",
                    name = "Debug",
                    request = "launch",
                    program = "${file}",
                },
            },

            -- configurations for other languages
        }

    end
}
