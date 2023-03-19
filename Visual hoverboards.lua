--[[
    By: Cylix#2977
    About: Be able to ride any hoverboard (This won't save and people won't see it)
]]

local tabel = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get()
  tabel.Hoverboards = {}
for i,v in pairs(game:GetService("ReplicatedStorage")["__DIRECTORY"].Hoverboards:GetChildren())do
    if v:IsA("Folder") then
     table.insert(tabel.Hoverboards, v.Name)
    end
end
getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Update()
    getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Equip = function(board)
      tabel.EquippedHoverboard = board
    getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Update()
end