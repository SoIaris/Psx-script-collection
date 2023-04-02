--[[
    By: Cylix#2977
    About: Autofarm coins, this is kinda shit and buggy but it does what its post to do
]]

_G.StartFarming = false

_G.FarmSettings = {
	["AutoOrbs"] = true, --# Auto claim orbs
	["AutoLootBags"] = true, --# Auto claim lootbags
	["MultiTarget"] = true, --# Put pets on multiable coins
	["Ignore"] = {"Coins"} --# Chests to skip
}

--# Autofarm source
local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network); local Fire, Invoke = Network.Fire, Network.Invoke; hookfunction(getupvalue(Fire, 1), function(...) return true end)
local library = require(game.ReplicatedStorage.Framework.Library)
local PetCmds = require(game:GetService("ReplicatedStorage").Library.Client.PetCmds)

function FarmCoin(CoinID, PetID) --# Do not mess with anything if you don't know how to code
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

function ClaimOrbs()
	local Orbs = {[1]={}}
	for i,v in pairs(game.workspace['__THINGS'].Orbs:GetChildren()) do 
		Orbs[1][i] = v.Name 
	end
	Fire("Claim Orbs", unpack(Orbs))
end


while _G.StartFarming do task.wait(1) --# Start farming if enabled
	local NearestCoin = 4000 or 5000

	function GetCoins()
		local Returntable = {}
		local ListCoins = Invoke("Get Coins", {})
		for i,v in pairs(ListCoins) do
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.p).Magnitude < NearestCoin then
				local Coin = v
				Coin["index"] = i
				table.insert(Returntable, Coin)
				NearestCoin = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.p).Magnitude
			end
		end

		return Returntable
	end


	local lp = game:GetService("Players").LocalPlayer
	if _G.FarmSettings.AutoOrbs == true then
		ClaimOrbs()
	end
	if _G.FarmSettings.AutoLootBags == true then
		for _,Bag in pairs(game:GetService("Workspace")["__THINGS"].Lootbags:GetChildren()) do
			Bag.CFrame = CFrame.new(lp.Character.HumanoidRootPart.Position)
		end
	end


	local cointhingy = GetCoins()
	local getpet = GetEquippedPets()


	if _G.FarmSettings.MultiTarget then
		for i = 1, #cointhingy do
			FarmCoin(cointhingy[i].index, getpet[i%#getpet+1])
		end
	end
end
