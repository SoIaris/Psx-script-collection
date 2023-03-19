--[[
    By: Cylix#2977
    About: Rename all pets in inventory, take a little bit to rename all
]]

-- 1 line bypass
local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network); local Fire, Invoke = Network.Fire, Network.Invoke; hookfunction(getupvalue(Fire, 1), function(...) return true end)

local FrameworkLibrary = require(game.ReplicatedStorage.Framework.Library)
local savedPets = FrameworkLibrary.Save.Get().Pets

function RenameAllPets(petname)
for i,v in pairs(savedPets) do
   local args = {[1] = v.uid,[2] = petname}
       Invoke("Rename Pet", unpack(args))
       wait(1)
   end
end

RenameAllPets("nicr") -- chnage nicr to pet name