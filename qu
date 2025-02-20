-- HighlightPlayersScript.lua

-- Create a new Highlight instance for each player
local function createHighlight(player)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = player.Character
    highlight.FillColor = Color3.fromRGB(255, 255, 0)
    highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
    highlight.OutlineTransparency = 0
    highlight.FillTransparency = 0.5
    highlight.Parent = player.Character
end

-- Add highlight to all current players
local function highlightAllPlayers()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character then
            createHighlight(player)
        end
    end
end

-- Highlight new players that join the game
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        createHighlight(player)
    end)
end)

-- Remove highlight from players that leave the game
game.Players.PlayerRemoving:Connect(function(player)
    if player.Character then
        for _, child in pairs(player.Character:GetChildren()) do
            if child:IsA("Highlight") then
                child:Destroy()
            end
        end
    end
end)

-- Initial highlight for all players currently in the game
highlightAllPlayers()
