--[[
    By: Cylix#2977
    About: Visual partner, This can be used for scamming or for fun
]]

_G.Settings = {
    UnlockedBoards = {"Original","Flame","Bling"}
}

-- Visual Partner Script SOURCE
local library = require(game.ReplicatedStorage.Framework.Library)
local Save = library.Save.Get()
function PartnerSign()
    spawn(function()
        while true do
            task.wait(0.1)
            if game:GetService("Players").LocalPlayer.PlayerGui.Rename.Frame.SignInfo.Visible == false then
                game:GetService("Players").LocalPlayer.PlayerGui.Rename.Frame.SignInfo.Visible = true
            end
            local pets = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get().Pets
            local y = {}
            for i, v in pairs(pets) do
                y[v["uid"]] = false
            end
            for i, v in pairs(pets) do
                if v.nk == game.Players.LocalPlayer.Name and v.snk ~= true then
                    v.snk = true
                end
            end
        end
    end)
end

function UnlockPartnerHoverboard()
    game:GetService("Players").LocalPlayer.PlayerGui.Hoverboards.Frame.BuyGamepass.Visible = false  -- Removes Get a hoverboard now UI
	Save.Hoverboards = _G.Settings.UnlockedBoards
	getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Update()
	getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Equip = function(board)
		Save.EquippedHoverboard = board
		getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Update()
	end
end

UnlockPartnerHoverboard()
PartnerSign()