--[[
    By: Cylix#2977
    About: Claims all easter eggs in your world
]]

local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network); local Fire, Invoke = Network.Fire, Network.Invoke; hookfunction(getupvalue(Fire, 1), function(...) return true end)
local Library = require(game.ReplicatedStorage.Framework.Library)
local EasterEggs = game:GetService("Workspace")["__MAP"].EasterEggs

for i,v in pairs(EasterEggs:GetChildren()) do
    if v:GetAttribute("TextureIDX") then
        Invoke("Easter Egg Hunt: Claim", v.Name, v:GetAttribute("TextureIDX"))
    end
end

