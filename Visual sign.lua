--[[
    By: Cylix#2977
    About: Visual sign, sign all your pets named "SignMe"
    Tutorial: Rename your pet you want sign to ("SignMe")
]]

local lib = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"));
local savedPets = lib.Save.Get().Pets

local SignN = "Cylix#2977" -- Change Cylix#2977 to anything (Example: SignN = "Preston Likes Money")

for i,v in pairs(savedPets) do
if v.nk == "SignMe" then
      v.nk = SignN
      v.snk = "ScriptMadeByCylix"-- It will not change this, this is just here to credit :>
   end
end
