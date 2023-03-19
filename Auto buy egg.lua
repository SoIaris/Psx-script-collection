--[[
    By: Cylix#2977
    About: Auto buy egg, auto buy any egg if your near it, to 8 or 3 hatch edit the args
]]

_G.StartHatching = false
_G.Egg = "Golden Lucky Kingdom Egg"

local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network); local Fire, Invoke = Network.Fire, Network.Invoke; hookfunction(getupvalue(Fire, 1), function(...) return true end)
while _G.StartHatching do task.wait()
	local args = {
		[1] = _G.Egg,
		[2] = false, -- 3 hatch i think
		[3] = false -- 8 Hatch i think
	}

	Invoke("Buy Egg", unpack(args))
end