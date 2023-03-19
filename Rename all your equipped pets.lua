--[[
    By: Cylix#2977
    About: Rename all your equipped pets
]]

-- 1 line bypass
local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network); local Fire, Invoke = Network.Fire, Network.Invoke; hookfunction(getupvalue(Fire, 1), function(...) return true end)

local Client = game:GetService("ReplicatedStorage").Library.Client
local PetCmds = require(Client.PetCmds)


function RenameEquippedPets(petname)
for i,v in pairs(PetCmds.GetEquipped()) do
   local args = {[1] = v.uid,[2] = petname}
       Invoke("Rename Pet", unpack(args))
       wait(1)
   end
end

RenameEquippedPets('Thing') -- Change Thing to the name you want