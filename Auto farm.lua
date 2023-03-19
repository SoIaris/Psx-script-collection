--[[
    By: Cylix#2977
    About: Autofarm shit, this is kinda buddy but it does what its post to do
]]


_G.FarmSettings = {
    EnableFarm = true
}

-- Autofarm source
local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network); local Fire, Invoke = Network.Fire, Network.Invoke; hookfunction(getupvalue(Fire, 1), function(...) return true end)
local library = require(game.ReplicatedStorage.Framework.Library)
local PetCmds = require(game:GetService("ReplicatedStorage").Library.Client.PetCmds)

function FarmCoin(CoinID, PetID) -- Do not mess with anything if you don't know how to code
	local Jc = {[1] = CoinID, [2] = {[1] = PetID,}}
	local Fc = {[1] = CoinID, [2] = PetID,}
	Invoke("Join Coin", unpack(Jc))
	Fire("Farm Coin", unpack(Fc)) 
end

function GetEquippedPets()
	local EquippedPets = {}
	for i,v in pairs(PetCmds.GetEquipped()) do
		table.insert(EquippedPets, v.uid) 
	end    
	return EquippedPets
end

while _G.FarmSettings.EnableFarm do task.wait() -- Start farming if enables
	local nearest
	local NearestOne = 99999
	for i,v in pairs(game:GetService("Workspace")["__THINGS"].Coins:GetChildren()) do
		if (v.POS.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
			nearest = v
			NearestOne = (v.POS.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		end
	end
	local ohTable1 = {[1] = {}}
	for i,v in pairs(game.workspace['__THINGS'].Orbs:GetChildren()) do
		ohTable1[1][i] = v.Name
	end
	Fire("Claim Orbs", unpack(ohTable1))
	local cointhingy = nearest.Name
	local getpet = GetEquippedPets()
	for i = 1, #cointhingy do
		FarmCoin(cointhingy, getpet[i%#getpet+1])
	end
end