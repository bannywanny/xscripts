--[[
works best if used on awp or wave
nukes pending hubs to ratelimit and ruin events
put in autoexec
DO NOT USE IF UR ON CODEX
--]]

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local PlaceId = game.PlaceId
local JobId = game.JobId
local player = Players.LocalPlayer

player.CharacterAdded:Wait()

while true do
    local g = Players:GetChildren()
    if #g >= 1 then
        player:Kick("v64")
        wait(1/10)
        TeleportService:Teleport(PlaceId, player)
    else
        TeleportService:TeleportToPlaceInstance(PlaceId, JobId, player)
    end
    
    wait(0.75)
end
