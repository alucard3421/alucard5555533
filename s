-- Get the Players service
local Players = game:GetService("Players")

-- Function to highlight a player's character
local function highlightPlayer(player)
    local character = player.Character
    if character then
        -- Create a Highlight object
        local highlight = Instance.new("Highlight")
        highlight.Parent = character
        highlight.FillTransparency = 0.5  -- Adjust transparency as needed
        highlight.OutlineTransparency = 0  -- Adjust outline transparency as needed
        highlight.FillColor = Color3.new(1, 0, 0)  -- Red color, change as needed
        highlight.OutlineColor = Color3.new(1, 1, 0)  -- Yellow outline, change as needed
    end
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
