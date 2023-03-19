
--[[
    By: Cylix#2977
    About: Auto rainbow machine, auto use the rainbow machine
]]

_G.Start = false --# Auto use rainbow machine

local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network); local Fire, Invoke = Network.Fire, Network.Invoke; hookfunction(getupvalue(Fire, 1), function(...) return true end)
local library = require(game.ReplicatedStorage.Framework.Library)
local PetSave = library.Save.Get().Pets
local ConvertToRainbow = {} --# Do not edit!

while _G.Start do task.wait(1)
	for i,v in pairs(PetSave) do 
		local pet = library.Directory.Pets[v.id]
		if v.g and pet.name == "Clover Fairy" then --# g = golden (Change "Clover Fairy" to the pet you want)
			table.insert(ConvertToRainbow, v.uid)
		end
	end

	local Convert = {[1] = {[1] = ConvertToRainbow[1],[2] = ConvertToRainbow[2],[3] = ConvertToRainbow[3],[4] = ConvertToRainbow[4],[5] = ConvertToRainbow[5],[6] = ConvertToRainbow[6]}}

	Invoke("Use Rainbow Machine", unpack(Convert))
end
