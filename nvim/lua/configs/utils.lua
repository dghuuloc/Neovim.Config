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

-- Create Maven New Project
function M.maven_new_project()

    --[[
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
    --]]

    -- Initialize values for Maven New Project Info
    local chDir = ""
    local artifact_id, canceled_artifactId = get_maven_project_info("Enter project name: ", "")
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

-- Maven Run Project
function M.maven_run_project()
    local group_id = vim.fn.expand('%')
    group_id = group_id:gsub("\\", ".")
    group_id = group_id:gsub("src.main.java.", ""):gsub(vim.fn.expand('%:t'), "")

    local cmdRun = string.format(
        [[mvn -q exec:java "-Dexec.mainClass=%s%s"]],
        group_id,
        vim.fn.expand('%:t:r')

    )

    vim.cmd("new")
    vim.cmd("term " .. cmdRun)
    vim.fn.feedkeys("a")

end

-- Maven Run Project
function M.maven_task_project()
    local mvnTask = nil

    local taskMaster, canceled_task = get_maven_project_info("Enter Maven Task: ", "")
    
    if taskMaster == "tree" then
        mvnTask = "mvn dependency:tree"
    elseif taskMaster == "analyze" then
        mvnTask = "mvn dependency:analyze"
    elseif taskMaster == "validate" then
        mvnTask = "mvn clean validate"
    elseif taskMaster == "compile" then
        mvnTask = "mvn clean compile"
    elseif taskMaster == "test" then
        mvnTask = "mvn clean test"
    elseif taskMaster == "package" then
        mvnTask = "mvn clean package"
    elseif taskMaster == "verify" then
        mvnTask = "mvn clean verify"
    elseif taskMaster == "install" then
        mvnTask = "mvn clean install"
    else
        return mvnTask
    end

    vim.cmd("new")
    vim.cmd("term " .. mvnTask)
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
