return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- UI plugins to make debugging simplier
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",

        -- Adapter for the Neovim Lua language
        "jbyuki/one-small-step-for-vimkind",

        -- Adapter for Python language
        "mfussenegger/nvim-dap-python",
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
        vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "Debug Close" })

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

        -- set a vim motions to evaluate expression
        vim.keymap.set({ "n", "v" }, "<F2>", function()
            dapui.eval()
        end, { desc = "Evaluate" })

        -- set a vim motions to evaluate input expression
        vim.keymap.set("n", "<F3>", function()
            dapui.eval(vim.fn.input("Expression > "))
        end, { desc = "Evaluate Input" })

        -- set a vim motions to hover Variables
        vim.keymap.set("n", "<F4>", function()
            require("dap.ui.widgets").hover()
        end, { desc = "Hover Variables" })

        -- Adapter Lua Setup
        dap.adapters.nlua = function(callback, config)
            local adapter = {
                type = "server",
                host = config.host or "127.0.0.1",
                port = config.port or "8085",
            }
            if config.start_neovim then
                local dap_run = dap.run
                dap.run = function(c)
                    adapter.host = c.host
                    adapter.port = c.port
                end
                require("osv").run_this()
                dap.run = dap_run
            end
            callback(adapter)
        end

        -- Adapter Python Setup
        dap.adapters.python = {
            type = "executable",
            command = "python",
            args = { "-m", "debugpy.adapter" },
        }

        -- Adapter Javascript Setup
        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                -- Make sure to install js-debug-adapter using ( :MasonInstall js-debug-adapter ) command
                args = {
                    vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
                    "${port}",
                },
            },
        }

        dap.configurations = {
            -- Configurations for Java language
            java = {
                {
                    type = "java",
                    request = "attach",
                    name = "Attach to the process",
                    hostName = "localhost",
                    port = "8000",
                },
            },

            -- Configurations for Lua language
            lua = {
                {
                    type = "nlua",
                    request = "attach",
                    name = "Run current file",
                    start_neovim = {},
                    console = "integratedTerminal",
                },
                {
                    type = "nlua",
                    request = "attach",
                    name = "Attach to running Neovim instance",
                },
            },

            -- Configurations for Python language
            python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch a debugging session",
                    program = "${file}",
                    console = "integratedTerminal",
                    pythonPath = function()
                        return "python"
                    end,
                },
            },

            -- Configurations for Javascript languages
            javascript = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    console = "integratedTerminal",
                    cwd = "${workspaceFolder}",
                },
            },

            -- Configurations for other languages
        }
    end,
}
