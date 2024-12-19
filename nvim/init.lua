require('configs')

-- Create Maven New Project
local function maven_new_project()
    -- Get Maven Project Info from User_Input
    local function get_maven_project_info(prompt, default_value)
       vim.fn.inputsave()
       local result = vim.fn.input(prompt, default_value)
       vim.fn.inputrestore()

       if result == "" then
           return result, true
       end

       -- print("\nTest user input: " .. result)
       return result, false
    end
    
    -- Setup values Temp for Maven New Project (TODO: changing later)
    local changeCwd = "cd .."
    local group_id = 'com.mycompany.app'
    local artifact_id = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local archetype_artifact_id = 'maven-archetype-quickstart'
    local archetype_version = '1.5'
    local interactive_mode = 'false'

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
    vim.cmd('new')
    vim.cmd('term ' .. changeCwd .. ';' .. commands)
    vim.fn.feedkeys('a')

end

vim.api.nvim_create_user_command("MavenNewProject", maven_new_project, {desc = "Create New Maven Project",})

-- Get Maven Project Info from User_Input
local function get_maven_project_info(prompt, default_value)
   vim.fn.inputsave()
   local result = vim.fn.input(prompt, default_value)
   vim.fn.inputrestore()

   if result == "" then
   print("\nresult is empty" .. result)
       return result, true
   end

   print("\nTest user input: " .. result)
   return result, false
end

vim.api.nvim_create_user_command("MavenInfo", get_maven_project_info("User Prompt: ", "value_default"), {desc = "Create New Maven Project",})


