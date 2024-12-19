local M = {} -- The module to export

function M.greeting()
    print("configs.utils.lua with Hello World!")
end

-- Clear Register
function M.clearReg()
    vim.cmd [[
        let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
        for r in regs
            call setreg(r, [])
        endfor
    ]] 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--#region for Java
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create Maven New Project
function M.maven_new_project()

    -- Get Maven Project Info from User_Input
    local function get_maven_project_info(prompt, default_value)
       vim.fn.inputsave()
       local result = vim.fn.input(prompt, default_value)
       vim.fn.inputrestore()

       if result == "" then
           return result, true
       end

       return result, false
    end
    
    -- Initialize values for Maven New Project Info
    local chDir = ""
    local artifact_id, canceled_artifactId = get_maven_project_info("Do you want to create project here or enter another project name? ", "")
    if artifact_id == "" then
        chDir = "cd .."
        artifact_id = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t') 
    end

    local group_id, canceled_group = get_maven_project_info("Enter groupId: ", "com.example.app")
    if canceled_group then return end

    local archetype_artifact_id, canceled_archetype = get_maven_project_info("Enter archetypeArtifactId: ", "maven-archetype-quickstart")
    if canceled_archetype then return end

    local archetype_version, canceled_version = get_maven_project_info("Enter archetypeVersion: ", "1.5")
    if canceled_version then return end

    local interactive_mode, canceled_interactive = get_maven_project_info("Enter interactiveMode (true/false): ","false")
    if canceled_interactive then return end

    -- main format for commands execution from terminal
    local commands = string.format(
        [[mvn archetype:generate "-DgroupId=%s" "-DartifactId=%s" "-DarchetypeArtifactId=%s" "-DarchetypeVersion=%s" "-DinteractiveMode=%s"]],
        group_id,
        artifact_id,
        archetype_artifact_id,
        archetype_version,
        interactive_mode
    )

    -- Execute final_commands
    vim.cmd("new")
    vim.cmd("term " .. chDir .. ";" .. commands)
    vim.fn.feedkeys("a")

end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--#region for Java
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- START TESTING AREA
local function hello(name)
    print("Hello " .. name)
end

vim.keymap.set("n", "<leader>hl", 
    function ()
        local cmdName = vim.fn.input("Enter your name: ")
        vim.cmd("new")
        vim.cmd("term " .. "cd .." .. ";" .. cmdName)
        vim.fn.feedkeys("a")
    end

, { desc = 'How to call '})
-- END TESTING AREA
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



-- We want to be able to access utils in all our configuration files
-- so we add the module to the _G global variable.
_G.utils = M
return M --Export the module
