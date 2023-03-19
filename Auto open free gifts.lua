--[[
    By: Cylix#2977
    About: Auto open gifts
]]

-- 1 line bypass
local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network); local Fire, Invoke = Network.Fire, Network.Invoke; hookfunction(getupvalue(Fire, 1), function(...) return true end)

getgenv().AutoFGiftOpen = true -- Auto open free gifts

while getgenv().AutoFGiftOpen == true do task.wait()
 pcall(function()
  local args = {
    [1] = math.random(1, 12)
  }
  Invoke("Redeem Free Gift", unpack(args))
 end)
end