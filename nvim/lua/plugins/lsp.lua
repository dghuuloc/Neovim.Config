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
            -- (not in youtube nvim video)
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

            vim.diagnostic.config({
                -- update_in_insert = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })

        end
    },

    --[[
    {

        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            -- buffer based completion options
            "hrsh7th/cmp-buffer",
            -- path based completion options
            "hrsh7th/cmp-path",
            -- lua snippet suggestions to cmp
            {
                "L3MON4D3/LuaSnip",
                -- follow latest release.
                version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                -- install jsregexp (optional!).
                build = "make install_jsregexp",

            },
            -- feed luasnip suggestions to cmp
            "saadparwaiz1/cmp_luasnip",
            -- lua API
            "hrsh7th/cmp-nvim-lua",
            -- provide vscode like snippets to cmp
            "rafamadriz/friendly-snippets",
            -- cmdline based completion options
            "hrsh7th/cmp-cmdline",
            -- Adds vscode-like pictograms
            "onsails/lspkind.nvim",
        },
        config = function()
            -- Gain access to the functions of the cmp plugin
            local cmp = require("cmp")

            -- Lazily load the vscode like snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            local kind_icons = {
                Text = "",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰇽",
                Variable = "󰂡",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "󰅲",
            }

            -- local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                completion = {
                    -- menu: display options in a menu
                    -- menuone: automatically select the first option of the menu
                    -- preview: automatically display the completion candiate as you navigate the menu
                    -- noselect: prevent neovim from automatically selecting a completion option while navigating the menu
                    completeopt = "menu,menuone,preview,noselect",
                },

                -- setup snippet support based on the active lsp and the current text of the file
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                -- setup how we interact with completion menus and options
                -- mapping = cmp.mapping.preset.insert({
                --     -- previous suggestion
                --     ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
                --     -- next suggestion
                --     ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
                --     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                --     ["<C-f>"] = cmp.mapping.scroll_docs(4),
                --     -- show completion suggestions
                --     ["<C-Space"] = cmp.mapping.complete(),
                --     -- close completion window
                --     ["<C-e>"] = cmp.mapping.abort(),
                --     -- confirm completion, only when you explicitly selected an option
                --     ["<CR>"] = cmp.mapping.confirm({
                --         -- behavior = cmp.ConfirmBehavior.Replace,
                --         select = true,
                --         -- select = false
                --     })
                -- }),

                mapping = cmp.mapping.preset.insert({
                    ["<C-j>"] = cmp.mapping.select_next_item(),         -- next suggestion
                    ["<C-k>"] = cmp.mapping.select_prev_item(),         -- previous suggestion
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete({}),           -- show completion suggestions
                    ["<C-e>"] = cmp.mapping.abort(),                    -- close completion window
                    ["<CR>"] = cmp.mapping.confirm({
                        -- behavior = cmp.ConfirmBehavior.Replace,
                        select = true,                                  -- Accept currently selected item.
                    }),
                    -- ["<Tab>"] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then
                    --         cmp.select_next_item()
                    --     elseif require('luasnip').expand_or_locally_jumpable() then
                    --         require('luasnip').expand_or_jump()
                    --     else
                    --         fallback()
                    --     end
                    -- end, { "i", "s" }),
                    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then
                    --         cmp.select_prev_item()
                    --     elseif require('luasnip').locally_jumpable(-1) then
                    --         require('luasnip').jump(-1)
                    --     else
                    --         fallback()
                    --     end
                    -- end, { "i", "s" }),
                }),

                -- Where and how should cmp rank and find completions
                -- Order matters, cmp will provide lsp suggestions above all else
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua', option = { include_deprecated = true } },
                    { name = "luasnip" },       -- snippets
                    { name = "buffer" },        -- text within current buffer
                    { name = "path" },          -- file system paths
                    -- { name = 'cmdline' },
                }),

                formatting = {
                    -- format = function (entry, vim_item)
                    --     local lspkind_ok, lspkind = pcall(require, "lspkind")
                    --
                    --     if not lspkind_ok then
                    --         -- From kind_icons array
                    --         vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                    --
                    --         -- Source
                    --         vim_item.menu = ({
                    --             nvim_lsp = "[LSP]",
                    --             nvim_lua = "[Lua]",
                    --             luasnip = "[LuaSnip]",
                    --             buffer = "[Buffer]",
                    --         })[entry.source.name]
                    --         return vim_item
                    --     else
                    --         -- From lspkind
                    --         return lspkind.cmp_format()(entry, vim_item)
                    --     end
                    -- end

                    format = function(entry, vim_item)
                        -- remove duplicate
                        -- vim_item.dup = { buffer = 1, path = 1, nvim_lsp = 0 }
                        -- Kind icons
                        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                        -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                        -- Source
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[Lua]",
                            luasnip = "[LuaSnip]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item

                    end

                }
            })

            -- `/` cmdline setup.
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline({
                    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
                    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
                    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item()),
                    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                }),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- `:` cmdline setup.
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline({
                    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
                    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
                    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item()),
                    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                }),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { 'Man', '!' }
                        }
                    }
                })
            })

        end
    },
    -- ]]

    -- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed, mason-lspconfig will not automatically install debug adapters for us
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            -- ensure the java debug adapter is installed
            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug-adapter", "java-test" }
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
