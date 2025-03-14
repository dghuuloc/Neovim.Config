--local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:h')

local jdtls_path = require("mason-registry").get_package("jdtls"):get_install_path()
local java_dap_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()

-- This bundles definition is the same as in the previous section (java-debug installation)
local bundles = {
    -- vim.fn.glob(vim.fn.stdpath("data") .. "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1),
    vim.fn.glob(java_dap_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
};

-- This is the new part
vim.list_extend(bundles, vim.split(vim.fn.glob(vim.fn.stdpath("data") .. "/vscode-java-test/server/*.jar", 1), "\n"))

local config = {
    -- Set the command that starts the JDTLS language server
    cmd = {
        "java",                                                                         -- or "C:\\Program Files\\Java\\jdk-17\\bin\\java" 
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-javaagent:" .. jdtls_path .. "/lombok.jar",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar", vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),       -- Eclipse jdtls location
        "-configuration", jdtls_path .. "/config_win",                                          -- for your OS (config_linux, config_mac, config_win, etc)
        "-data", workspace_dir,                                                                 -- to create .metatdata into workspace_dir
	},

    root_dir = vim.fs.dirname(
        -- vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]
        vim.fs.find({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }, { upward = true })[1]
    ),

    -- Configure settings in the JDTLS serve
    settings = {
        java = {
            -- Enabel downloading archives from eclipse automatically
            eclipse = {
                downloadSources = true,
            },

             -- If changes to the project will require the developer to update the projects configuration advise the developer before accepting the change
            configuration = {

                updateBuildConfiguration = "interactive",

                runtimes = {
                    {
                        name = "JavaSE-1.8",
                        path = "C:\\Program Files\\Java\\jdk-1.8",
                        default = true,
                    },
                    {
                        name = "JavaSE-11",
                        path = "C:\\Program Files\\Java\\jdk-11",
                    },
                    {
                        name = "JavaSE-17",
                        path = "C:\\Program Files\\Java\\jdk-17",

                    }
                }
            },

            -- specify the dependencies
            -- project = {
            -- 	referencedLibraries = {
            --         "lib/**/*.jar",
            -- 	},
            -- },

            -- Enable downloading archives from maven automatically
            maven = {
                downloadSources = true
            },

            -- implementationsCodeLens = {
            --     enabled = true,
            -- },

            -- enable code lens in the lsp
            referencesCodeLens = {
                enabled = true,
            },

            references = {
                includeDecompiledSources = true,
            },

            -- Use the fernflower decompiler when using the javap command to decompile byte code back to java code
            contentProvider = {
                preferred = 'fernflower'
            },

            -- Enable method signature help
            signatureHelp = {
                enabled = true,
            },

            -- enable inlay hints for parameter names,
            inlayHints = {
                parameterNames = {
                    enabled = "all", -- literals, all, none
                },
            },

            format = {
                enabled = false,
                -- Formatting works by default, but you can refer to a specific file/URL if you choose
                -- settings = {
                --       url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
                --       profile = "GoogleStyle",
                -- },
            },

            compile = {
                nullAnalysis = {
                    nonnull = {
                        "lombok.NonNull",
                        "javax.annotation.Nonnull",
                        "org.eclipse.jdt.annotation.NonNull",
                        "org.springframework.lang.NonNull",
                    },
                },
            },

            -- Customize completion options
            completion = {
                -- When using an unimported static method, how should the LSP rank possible places to import the static method from
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
                -- Try not to suggest imports from these packages in the code action window
                filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*",
                    "sun.*",
                },
                -- Set the order in which the language server should organize imports
                importOrder = {
                    "java",
                    "jakarta",
                    "javax",
                    "com",
                    "org",
                }
            },

            sources = {
                -- How many classes from a specific package should be imported before automatic imports combine them all into a single import
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            -- How should different pieces of code be generated?
            codeGeneration = {
                -- When generating toString use a json format
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                -- When generating hashCode and equals methods use the java 7 objects method
                hashCodeEquals = {
                    useJava7Objects = true
                },
                -- When generating code use code blocks
                useBlocks = true
            },

        },

    },

    -- Needed for auto-completion with method signatures and placeholders
    capabilities = require('cmp_nvim_lsp').default_capabilities(),

    -- Create a table called init_options to pass the bundles with debug and testing jar, along with the extended client capablies to the start or attach function of JDTLS
    init_options = {
        -- References the bundles defined above to support Debugging and Unit Testing
        bundles = bundles,

        -- https://github.com/eclipse/eclipse.jdt.ls/wiki/Language-Server-Settings-&-Capabilities#extended-client-capabilities
        extendedClientCapabilities = require("jdtls").extendedClientCapabilities,

    },

    -- Function that will be ran once the language server is attached
    on_attach = function()
        -- Set a Vim motion to extract imports
        vim.keymap.set('n', 'Jei', "<Cmd> lua require('jdtls').organize_imports()<CR>", { desc = "Java extract imports" })

        -- Setup the java debug adapter of the JDTLS server
        require('jdtls.dap').setup_dap()
        require('jdtls.dap').setup_dap_main_class_configs()

        -- Enable jdtls commands to be used in Neovim
        require('jdtls.setup').add_commands()

    end,

    -- flags = {
    --     allow_incremental_sync = true,
    -- },

}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`
require('jdtls').start_or_attach(config)

