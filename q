-- Get the Players service
local Players = game:GetService("Players")

-- Function to highlight a player's character and add a nametag
local function highlightPlayer(player)
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- Create a Highlight object
    local highlight = Instance.new("Highlight")
    highlight.Parent = character
    highlight.FillTransparency = 0.5 -- Adjust transparency as needed
    highlight.OutlineTransparency = 0 -- Adjust outline transparency as needed
    highlight.FillColor = Color3.new(0, 1, 0) -- Green fill color, change as needed
    highlight.OutlineColor = Color3.new(1, 1, 0) -- Yellow outline, change as needed

    -- Create a BillboardGui for the nametag
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = character:FindFirstChild("Head") -- Attach to the player's head
    billboardGui.Size = UDim2.new(0, 200, 0, 50) -- Size of the GUI
    billboardGui.StudsOffset = Vector3.new(0, 2.5, 0) -- Position above the head
    billboardGui.AlwaysOnTop = true -- Ensure it's always visible
    billboardGui.LightInfluence = 0 -- Unaffected by lighting
    billboardGui.Parent = character

    -- Create a TextLabel for the nametag
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = player.Name -- Set the text to the player's name
    textLabel.Size = UDim2.new(1, 0, 1, 0) -- Fill the entire BillboardGui
    textLabel.TextColor3 = Color3.new(1, 1, 1) -- White text
    textLabel.BackgroundTransparency = 1 -- Transparent background
    textLabel.Font = Enum.Font.SourceSansBold -- Bold font
    textLabel.TextSize = 20 -- Font size
    textLabel.Parent = billboardGui
end

-- Function to handle when a player's character is added
local function onCharacterAdded(player)
    highlightPlayer(player)
end

-- Loop through all players and highlight their characters
for _, player in ipairs(Players:GetPlayers()) do
    highlightPlayer(player)
    player.CharacterAdded:Connect(function()
        onCharacterAdded(player)
    end)
end

-- Handle new players joining the game
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        onCharacterAdded(player)
    end)
end)
