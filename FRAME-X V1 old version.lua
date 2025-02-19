--[[
UNFINISHED VERSION
FRAME-X V1|made by banovion|@banov on discord
requires some coding knowledge + being intelligent to use
a 2nd person with a executor may be required
--]]

local frametarget = "LudiZaboodi" -- change this to ur targets username, theyre who you're framing
local frametargetdisplayname = "LudiZaboodi" -- change this to ur targets display name
local frametargetuserid = 196865605 -- put frame targets userid here
local framehelper = "banovion" -- change to the alt/friend helping you frame your target, they must be ingame

getgenv().frameconfig = {
    ["changedisplayname"] = true,
    ["change_escmenu"] = true,
    ["loopscript"] = true, -- loop executes instead of only executing once
    ["fakechat"] = true, -- fakes their name in chat
  --["changeleaderstats"] = true,
  --["changeappearance"] = false,
  --["changecoreguiplayers"] = false 
}

local Players: Players = cloneref(game:GetService("Players"))
local RunService: RunService = cloneref(game:GetService("RunService"))
local Coregui: CoreGui = cloneref(game:GetService("CoreGui"))

for i, v in pairs(Players:GetChildren()) do
    if v.Name == framehelper then
        helperuserid = v.UserId
        if v.DisplayName ~= v.Name then
        framehelperdisplayname = v.DisplayName
        break
        end
    end
end

local function changedisplay()
if frameconfig["changedisplayname"] then
    for i, v in pairs(Players:GetChildren()) do 
        if v.Name == framehelper then
        v.Character:FindFirstChild("Humanoid").DisplayName = frametarget
        end
    end
end
end

local function runescmenu()
pcall(function()
if frameconfig["change_escmenu"] then
    for egg, roll in pairs(Players:GetChildren()) do
        if roll.Name == framehelper then
            for i, v in pairs(Coregui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame.Players:GetChildren()) do
                if v:IsA("ImageLabel") and v.Name:split("PlayerLabel")[2] == framehelper then
                v:FindFirstChild("DisplayNameLabel").Text = frametargetdisplayname
                v:FindFirstChild("NameLabel").Text = "@" .. frametarget
                local icon = v:FindFirstChild("Icon")
                local image = icon.Image
                local s1 = image:split("&id=")
                    if #s1 > 1 then
                    local s2 = s1[2]:split("&w=")[1]
                    local new = "rbxthumb://type=Avatar&id=" .. frametargetuserid .. "&w=100&h=100"
                    icon.Image = new
                    end
                end
            end
        end
    end
    end
    end)
end

local function fakechat()
    if frameconfig["fakechat"] then
        for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller:GetChildren()) do
            if v:IsA("Frame") then
                for i2, v2 in pairs(v:FindFirstChild("TextLabel"):GetChildren()) do
                    if v2:IsA("TextButton") then
                        local parts = string.split(v2.Text, "[")
                        if #parts >= 2 then
                            local parts2 = string.split(parts[2], "]")[1]
                                if parts2 and (parts2 == framehelper or parts2 == framehelperdisplayname) then
                                local name1 = "[" .. frametarget .. "]:"
                                v2.Text = name1
                            end
                        end
                    end
                end
            end
        end
    end
end

task.spawn(function()
if not frameconfig["loopscript"] then
    runescmenu()
    elseif frameconfig["loopscript"] then
    repeat runescmenu() task.wait(1/20) until not frameconfig["loopscript"]
end
end)

task.spawn(function()
if not frameconfig["loopscript"] then
    fakechat()
    elseif frameconfig["loopscript"] then
    repeat fakechat() task.wait(1/60) until not frameconfig["loopscript"]
end
end)

task.spawn(function()
if not frameconfig["loopscript"] then
    changedisplay()
    elseif frameconfig["loopscript"] then
    repeat changedisplay() task.wait(1/25) until not frameconfig["loopscript"]
end
end)
