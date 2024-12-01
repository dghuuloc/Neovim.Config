return {
    -- LSP Configuration
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            -- used to enable autocompletion (assign to every lsp server config)
            local capabilities = vim.tbl_deep_extend(
                "force",
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities()
            )

            require("mason").setup()
            require("mason-lspconfig").setup({
                -- install language server_name
                ensure_installed = {
                    "jdtls",                    -- support for Java Language
                    "pyright",                  -- support for Python
                    "ts_ls",                    -- support for JavaScript, TypeScript and React
                    "lua_ls",                   -- support for Lua
                    "eslint",                   -- support for JavaScript and TypeScript files
                    "jsonls",                   -- support for Json file
                    "html",                     -- support for HTML file
                    "cssls",                    -- support for CSS file
                    "emmet_ls",                 -- support for HTML, CSS, Sass, SCSS and extended JavaScript files (JSX,TSX)
                    "clangd"                    -- support for C, C++
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

                    -- Lua Language Server Configuration
                    ["ts_ls"] = function()
                        require("lspconfig").ts_ls.setup {
                            capabilities = capabilities,
                            settings = {
                                completions = {
                                    completeFunctionCalls = true,
                                }

                            }
                        }
                    end,

                    -- Java Language Server Configuration
                    ["jdtls"] = function()
                        require("lspconfig").jdtls.setup {
                            capabilities = capabilities,
                        }
                    end,

                },

            })

        end
    },

    -- utility plugin for configuring the java language server for us
    {
        "mfussenegger/nvim-jdtls",
        event = "BufRead",
    },

}
