--!strict

--[[
KYOUKASUIGETSU SHIKAI V1
Created by D3M0NG0D Clan member(s): banovion, XPLTACY
TankAmp script made with a reach method not many have thought of
Not streamproof nor will ever be streamproof
--]]


--// Variables \\--

local RunService: RunService = game:GetService("RunService");
local Players: Players = game:GetService("Players");
local Player: Player = Players.LocalPlayer;
local character = Player.Character or Player.CharacterAdded:Wait();
local humanoid: Humanoid = character:WaitForChild("Humanoid");

--// How long has it been since i've awoken... How long will it be until I get blessed with eternal slumber... \\--

local D3M0NTARG3TGR1P = CFrame.new(
    5, 5, 5,
    0.577350318, 0.577350259, -0.577350318,
    0.577350318, 0.577350259, -0.577350318,
    0.577350318, 0.577350259, -0.577350318
)

--// My life is a boundless asylum, years feel like days and days feel as though the world simply passes me by as I watch in hopeless despair... \\--

RunService.Heartbeat:Connect(function()
    for ACCURSED, ANGELIC_MUST_KILL in ipairs(Players:GetPlayers()) do
        if ANGELIC_MUST_KILL ~= Player then
            local Angelsmustdie = ANGELIC_MUST_KILL.Character;
            if Angelsmustdie then
                local BodyofAngel = Angelsmustdie:FindFirstChildOfClass("Humanoid");
                if BodyofAngel and BodyofAngel.Health > 0 then
                    local RightarmOfAngel = Angelsmustdie:FindFirstChild("Right Arm");
                    if RightarmOfAngel then
                        local EXECUTIONPHASEBEGIN = RightarmOfAngel:FindFirstChild("RightGrip");
                        if EXECUTIONPHASEBEGIN then
                            EXECUTIONPHASEBEGIN.C0 = D3M0NTARG3TGR1P;
                        end
                    end
                end
            end
        end
    end
end)

--// above is the tank below is the amp \\--

RunService.Heartbeat:Connect(function()
    for BLASPHEMOUS, MUSTDIE in ipairs(Players:GetPlayers()) do
        if MUSTDIE ~= Player and MUSTDIE.Character then
            local MUSTDIETORSO = MUSTDIE.Character:FindFirstChild("Torso")
            if MUSTDIETORSO then
                local WEAKPOINTS = {
                    MUSTDIETORSO:FindFirstChild("Left Shoulder"),
                    MUSTDIETORSO:FindFirstChild("Left Hip"),
                    MUSTDIETORSO:FindFirstChild("Right Hip"),
                    MUSTDIETORSO:FindFirstChild("Neck") -- if you want a stronger amp you can add torso:FindFirstChild("Right Shoulder"), it can cause bugs so i didnt
                }

                for BASTARD, RAVAGE in ipairs(WEAKPOINTS) do
                    if RAVAGE and RAVAGE:IsA("Motor6D") then
                        local lv = CFrame.Angles(
                            math.rad(math.random(-60, 60)), -- another way to make the amp stronger is decreasing and increasing both args respectively, the min/max is -360/360
                            math.rad(math.random(-60, 60)),
                            math.rad(math.random(-60, 60))
                        )
                        
                        RAVAGE.C0 *= lv
                    end
                end
            end
        end
    end
end)

--// The only thing now that can give meaning to my life in this wretched world is the D3M0NG0D CLAN, as for the highest realms of the heavens shall be overtaken by the CLAN \\--
