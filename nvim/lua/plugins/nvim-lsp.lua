return {
    -- LSP Configuration
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "j-hui/fidget.nvim",
        },

        config = function()
            -- used to enable autocompletion (assign to every lsp server config)
            local capabilities = vim.tbl_deep_extend(
                "force",
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities()
            )

            -- Change the Diagnostic symbols in the sign column (gutter)
            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            require("fidget").setup({})
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            require("mason-lspconfig").setup({
                -- install language server_name
                ensure_installed = {
                    "jdtls",            -- support for Java Language
                    "pyright",          -- support for Python
                    "tsserver",         -- support for JavaScript, TypeScript and React
                    "lua_ls",           -- support for Lua
                    "eslint",           -- lints JavaScript and TypeScript files
                    "jsonls",           -- support for Json file
                    "html",             -- support for HTML file
                    "cssls",            -- support for CSS file
                    "emmet_ls"          -- support for HTML, CSS, Sass, SCSS and extended JavaScript files (JSX,TSX)
                },

                handlers = {
                    -- default handler (optional)
                    function(server_name)
                        require("lspconfig")[server_name].setup {
                            capabilities = capabilities
                        }
                    end,

                    -- Lua Language Server Configuration
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup {
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    runtime = { version = "Lua 5.1" },
                                    diagnostics = {
                                        globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                    }
                                }
                            }
                        }
                    end,

                    -- Java Language Server Configuration
                    ["jdtls"] = function()
                        require("lspconfig").jdtls.setup {
                            capabilities = capabilities
                        }
                    end,

                },

            })

            -- vim.diagnostic.config({
            --     float = {
            --         focusable = false,
            --         style = "minimal",
            --         border = "rounded",
            --         source = "always",
            --         header = "",
            --         prefix = "",
            --     },
            -- })

        end
    },

    -- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed, mason-lspconfig will not automatically install debug adapters for us
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            -- ensure the java debug adapter is installed
            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug", "vscode-java-test", "java-test" }
            })
        end
    },

    -- utility plugin for configuring the java language server for us
    {
        "mfussenegger/nvim-jdtls",
        event = "BufRead",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },

    },

}
