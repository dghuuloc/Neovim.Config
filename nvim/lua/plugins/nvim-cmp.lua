return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            -- lua API
            "hrsh7th/cmp-nvim-lua",
            -- buffer based completion options
            "hrsh7th/cmp-buffer",
            -- path based completion options
            "hrsh7th/cmp-path",
            -- cmdline based completion options
            "hrsh7th/cmp-cmdline",

        },
        config = function()
            -- Gain access to the functions of the cmp plugin
            local cmp = require("cmp")

            cmp.setup({
                completion = {
                    -- menu: display options in a menu
                    -- menuone: automatically select the first option of the menu
                    -- preview: automatically display the completion candiate as you navigate the menu
                    -- noselect: prevent neovim from automatically selecting a completion option while navigating the menu
                    completeopt = "menu,menuone,preview,noselect",
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

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
                }),

                -- Where and how should cmp rank and find completions
                -- Order matters, cmp will provide lsp suggestions above all else
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua', option = { include_deprecated = true } },
                    { name = "buffer" },        -- text within current buffer
                    { name = "path" },          -- file system paths
                }),

                formatting = {
                    format = function(entry, vim_item)
                        vim_item.kind = string.format('%s', vim_item.kind)

                        -- Set a name for each source 
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[Lua]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]

                        -- Remove duplicates from the sources 
                        vim_item.dup = ({
                            nvim_lsp = 0,
                            nvim_lua = 0,
                            buffer = 0,
                            path = 0,
                        })[entry.source.name] or 0

                        return vim_item
                    end
                },
            })

            -- `/` cmdline setup
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

            -- `:` cmdline setup
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
    }
}
