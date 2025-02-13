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
                    "clangd",                   -- support for C, C++

                    -- FORMATTING
                    "lemminx",
                    "stylua",
                    "google_java_format",
                    "isort",
                    "black",
                    "prettier",
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

                    -- Lemminx Language Server Configuration
                    ["lemminx"] = function()
                        require("lspconfig").lemminx.setup {
                            capabilities = capabilities,
                        }
                    end,

                },
            })

            -- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
            -- See more: https://github.com/nanotee/nvim-lsp-basics/blob/main/doc/lsp-basics.txt
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

                    -- Buffer local mappings.
                    local opts = { noremap=true, silent=true, buffer = event.buf }
                    
                    -- :LspDefinition - Jumps to the definition of the symbol under the cursor
                    vim.keymap.set("n", "gbd", vim.lsp.buf.definition, opts)

                    -- :LspHover - Displays hover information about the symbol under the cursor
                    vim.keymap.set("n", "gbh", vim.lsp.buf.hover, opts)

                    -- :LspTypeDefinition - Jumps to the definition of the type of the symbol under the cursor
                    vim.keymap.set('n', 'gbt', vim.lsp.buf.type_definition, opts)

                    -- :LspRename {new_name} - Renames all references to the symbol under the cursor. If no {new_name} is given, prompts the user for one.
                    vim.keymap.set("n", "gbn", vim.lsp.buf.rename, opts)

                    -- :LspCodeAction - Prompts the user for a code action to execute (if one is available at the current cursor position)
                    vim.keymap.set({"n","v"}, "gba", vim.lsp.buf.code_action, opts)

                    -- :LspReferences - Gets all the references to the symbol under the cursor
                    vim.keymap.set("n", "gbr", vim.lsp.buf.references, opts)

                    -- :LspFormat[!] - Formats the current buffer. If [!] is used, the formatting is done synchronously
                    vim.keymap.set({"n","x"}, "gbf", function()
                        vim.lsp.buf.format { async = true }
                    end, opts)

                    -- :LspImplementation - Gets all the implementations for the symbol under the cursor
                    vim.keymap.set('n', 'gbi', vim.lsp.buf.implementation, opts)

                    -- :LspSignatureHelp - Displays signature help information about the symbol under the cursor
                    vim.keymap.set("n", "gbs", function() vim.lsp.buf.signature_help() end, opts)
                    vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)

                    -- :LspWorkspaceSymbol {query} - Gets all the symbols in the current workspace
                    vim.keymap.set("n", "gws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    -- :LspDocumentSymbol - Gets all the symbols for the current buffer
                    vim.keymap.set('n', 'gds', vim.lsp.buf.document_symbol, opts)

                end,
            })

            -- turn off Semantic Tokens
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(ev)
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    client.server_capabilities.semanticTokensProvider = nil
                end,
            })

        end
    },

    -- utility plugin for configuring the java language server for us
    {
        "mfussenegger/nvim-jdtls",
        event = "BufRead",
    },

}
