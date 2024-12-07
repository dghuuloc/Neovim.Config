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

        -- define Dap-Breakpoint sign
        vim.cmd("hi DapBreakpointColor guifg=#fa4848")
        vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointColor", linehl = "", numhl = "" })
        --vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointColor", linehl = "", numhl = "" })

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

        -- (Step into): This allows you to enter debug mode.
        vim.keymap.set("n", "<F5>", dap.step_into, { desc = "Step Into" })

        -- (Step over): This assists in moving to the next line without leaving debug mode.
        vim.keymap.set("n", "<F6>", dap.step_over, { desc = "Step Over" })

        -- (Step out): This allows you to step out/return to the current method/caller in debug mode.
        vim.keymap.set("n", "<F7>", dap.step_out, { desc = "Step Out" })

        -- set a vim motion to start the debugger and launch the debugging ui
        -- (Resume execution): This allows you to continue executing the program without stopping debugging.
        vim.keymap.set("n", "<F8>", dap.continue, { desc = "Debug Start" })

        -- set a vim motion to toggle a breakpoint at the line where the cursor is currently on
        -- (Toggle breakpoint): This allows you to set or remove a breakpoint on the current line of code.
        vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Debug Toggle Breakpoint" })

        -- set a vim motion to close the debugging ui
        vim.keymap.set("n", "<leader>dc", dapui.close, {desc = "Debug Close"})

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

        dap.configurations = {
            -- Configurations for Java languages
            java = {
                {
                    type = "java",
                    request = "attach",
                    name = "Attach to the process",
                    hostName = "localhost",
                    port = "8000"
                }
            },
            -- Configurations for other languages
        }
    end
}
