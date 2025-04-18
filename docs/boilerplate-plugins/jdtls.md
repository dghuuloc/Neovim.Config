```lua
-------------------------------------------------------------------------------------------------
-- #REGION FOR CUSTOMIZE JDTLS LANGUAGE SERVER 
-------------------------------------------------------------------------------------------------

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:h")
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local java_dap_path = vim.fn.stdpath("data") .. "/mason/packages/java-debug-adapter"

local config = {
    cmd = {
        "java",
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
        "-jar", vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration", jdtls_path .. "/config_win",
        "-data", workspace_dir,
    },

    root_dir = vim.fs.dirname(
        vim.fs.find({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }, { upward = true })[1]
    ),

    settings = {
        java = {
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
                runtimes = {
                    {
                        name = "JavaSE-21",
                        path = "C:\\Program Files\\Java\\jdk-21",
                    },
                    {
                        name = "JavaSE-17",
                        path = "C:\\Program Files\\Java\\jdk-17",
                    },
                    {
                        name = "JavaSE-11",
                        path = "C:\\Program Files\\Java\\jdk-11",
                    },
                },
            },
            maven = {
                downloadSources = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            contentProvider = {
                preferred = "fernflower",
            },
            signatureHelp = {
                enabled = true,
            },
            inlayHints = {
                parameterNames = {
                    enabled = "all",
                },
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
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
                filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*",
                    "sun.*",
                },
                importOrder = {
                    "java",
                    "jakarta",
                    "javax",
                    "com",
                    "org",
                },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                hashCodeEquals = {
                    useJava7Objects = true,
                },
                useBlocks = true,
            },
        },
    },

    init_options = {
        bundles = {
            vim.fn.glob(java_dap_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", 1)
        }
    },

    on_attach = function()
        -- Setup the java debug adapter of the JDTLS server
        require("jdtls.dap").setup_dap()
        require("jdtls.dap").setup_dap_main_class_configs()
        require("jdtls.setup").add_commands()
    end,
}

-- require("jdtls").start_or_attach(config)

vim.api.nvim_create_user_command("JdtStart",
    function()
        local status_ok, jdtls_result = pcall(require("jdtls").start_or_attach, config)
        if status_ok then
           print("Calling Java Language Server")
        else
           print("Error starting Jdtls: " .. tostring(jdtls_result))
        end 

    end,
    
   { desc = "Start or Attatch Java Language Server" }
)
```
