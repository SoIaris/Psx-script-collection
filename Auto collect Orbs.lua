--[[
    By: Cylix#2977
    About: Auto collect orbs without owning the gamepass
]]

-- 1 line bypass
local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network); local Fire, Invoke = Network.Fire, Network.Invoke; hookfunction(getupvalue(Fire, 1), function(...) return true end)

getgenv().AutoCollectOrbs = true -- Basically magnet gamepass but better

while getgenv().AutoCollectOrbs == true do task.wait()
local ohTable1 = {[1] = {}}
    for i,v in pairs(game.workspace['__THINGS'].Orbs:GetChildren()) do
        ohTable1[1][i] = v.Name
    end
   Fire("Claim Orbs", unpack(ohTable1))
end