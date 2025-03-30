-- Load the key system script
local KeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/OopssSorry/LuaU-Free-Key-System-UI/main/source.lua"))()


-- Flag to indicate whether the key is valid
local KeyValid = false


-- Initialize the key system
local response = KeySystem:Init({
    Debug = false,  -- Whether to print debug messages to the console
    Title = "Snare | Key System",  -- Title for the key system window
    Description = "Copy the link and paste into your browser to get the key",  -- Optional description (can be set to nil if not needed)
    Link = "https://lootdest.org/s?KVHeUU78",  -- Link to get the key (can be left empty if not required)
    Discord = "https://discord.gg/v2QAwMZHHG",  -- Discord server link (can be set to nil if not required)
    SaveKey = false,  -- Option to save the key automatically (set to true if desired)
   
    -- Function to verify if the entered key is valid
    Verify = function(key)
        if key == "supersnare" then
            KeyValid = true
            return true
        else
            return false
        end
    end,


    -- Where the GUI should be parented in the game
    GuiParent = game.CoreGui,  -- Can be set to another object if necessary
})


-- If initialization failed or the key is invalid, terminate the script
if not response or not KeyValid then
    return  -- Exit the script if the key is not valid
end


-- Once the key is validated, execute the next part of the script


-- Print a message indicating the key was validated
print("Key validated! Proceeding to load the script...")


-- Load the next script dynamically after key validation
local scriptUrl = "https://raw.githubusercontent.com/SnareScripts/Projects/refs/heads/main/SnarePremStart"
local loadedScript = loadstring(game:HttpGet(scriptUrl, true))()  -- This loads and executes the script from the given URL


-- If the script is successfully loaded and executed, you can add further logic here
print("The script has been successfully loaded.")


-- Add a logo next to the "Snare | Key System" title
local tabHeader = response.GuiParent:FindFirstChild("TabHeader")  -- Adjust based on where the title is placed
if tabHeader then
    local titleLogo = Instance.new("ImageLabel", tabHeader)
    titleLogo.Size = UDim2.new(0, 30, 0, 30)  -- Adjust logo size
    titleLogo.Position = UDim2.new(0, 150, 0, 0)  -- Position the logo inside the header, next to the title
    titleLogo.Image = "https://i.imgur.com/IxiynGo.png"  -- Replace with your Imgur image URL
    titleLogo.BackgroundTransparency = 1  -- Make sure the logo has no background
end


-- Add a logo next to the Discord link
local discordButton = response.GuiParent:FindFirstChild("DiscordButton")  -- Adjust based on where the Discord link button is located
if discordButton then
    local discordLogo = Instance.new("ImageLabel", discordButton)
    discordLogo.Size = UDim2.new(0, 20, 0, 20)  -- Adjust logo size
    discordLogo.Position = UDim2.new(0, 100, 0, 0)  -- Position the logo next to the Discord link/button
    discordLogo.Image = "https://i.imgur.com/abChBOU.png"  -- Replace with your Imgur image URL
    discordLogo.BackgroundTransparency = 1  -- Make sure the logo has no background
end


-- Add a logo next to the "Get Key" button
local getKeyButton = response.GuiParent:FindFirstChild("GetKeyButton")  -- Adjust based on where the Get Key button is located
if getKeyButton then
    local getKeyLogo = Instance.new("ImageLabel", getKeyButton)
    getKeyLogo.Size = UDim2.new(0, 20, 0, 20)  -- Adjust logo size
    getKeyLogo.Position = UDim2.new(0, 100, 0, 0)  -- Position the logo next to the "Get Key" button
    getKeyLogo.Image = "https://i.imgur.com/whYBgEZ.gif"  -- Replace with your Imgur image URL
    getKeyLogo.BackgroundTransparency = 1  -- Make sure the logo has no background
end


-- Show the GUI
response.GuiParent.Parent = game.CoreGui
