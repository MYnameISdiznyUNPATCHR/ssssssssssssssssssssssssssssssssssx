
--// FUNCTIONS, VARIABLES AND SCRIPTS //--
function GetPlayer(String)
	local Foundplr = {}
	local strl = String:lower()
	if strl == "all" then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			table.insert(Foundplr,v)
		end
	elseif strl == "others" then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name ~= game.Players.LocalPlayer.Name then
				table.insert(Foundplr,v)
			end
		end
	elseif strl == "me" then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name == game.Players.LocalPlayer.Name then
				table.insert(Foundplr,v)
			end
		end
	else
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.DisplayName:lower():sub(1, #String) == String:lower() or v.Name:lower():sub(1, #String) == String:lower() then
				table.insert(Foundplr,v)
			end
		end
	end
	return Foundplr
end

local RS
local LeftLeg
local RightLeg
local LeftFoot
local RightFoot
local Distance = 0
local DistanceTackle = 0
local DistanceReach = 0
local DistancePass = 0
local DistanceWalk = 0
local DistanceSide = 0
local DistanceJump = 0
local SaveDelay = 0
local Heartbeat
local HumanoidDied
local TouchedBallLoop
local RunStepped2
local RunStepBall
local AddBallA
local TouchedGKBallBox

local Player = game.Players.LocalPlayer
local RootPart = Player.Character.HumanoidRootPart

local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/MYnameISdiznyUNPATCHR/ddsq/main/d')()
local Window = library:CreateWindow("TPS: Street Soccer", "Version: 1.48", 10044538000)

local Tab = Window:CreateTab("Scripts")

local GKPage = Tab:CreateFrame("Goalkeeper")
local SPage = Tab:CreateFrame("Striker")
local MPage = Tab:CreateFrame("Miscellaneous")
local LPPage = Tab:CreateFrame("LocalPlayer")
local PPage = Tab:CreateFrame("Players")
local KPage = Tab:CreateFrame("Kicks")
local PWRPage = Tab:CreateFrame("Powers")
local BPage = Tab:CreateFrame("Ball")
local MRPage = Tab:CreateFrame("Mobile Reach")
local TPPage = Tab:CreateFrame("Teleports")
local CPage = Tab:CreateFrame("Celebrations")
local VPage = Tab:CreateFrame("Visuals")
local CRPage = Tab:CreateFrame("Credits")

GKPage:CreateLabel("Miscellaneous")

GKPage:CreateToggle("Allow Save Everywhere", "Allows You Save On The Field", function(arg)
if arg then
for i,v in pairs(game.Workspace.GKSystem:GetChildren()) do
    if v.Name == "Fix" then
       v.CanTouch = false
    end
end
    else
        for i,v in pairs(game.Workspace.GKSystem:GetChildren()) do
    if v.Name == "Fix" then
       v.CanTouch = true
    end
end
end
end)

GKPage:CreateToggle("Auto Save [Touched Method]", "Auto Save The Ball [Touched Method]", function(arg)
if arg then
TouchedGKBallBox = game.Workspace.TPSSystem.TPS.Touched:Connect(function(HRP)
    if HRP == game.Players.LocalPlayer.Character.HumanoidRootPart then
        for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
    AnimationId = "304581045"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
wait(SaveDelay)

local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game.Players.LocalPlayer.Character["Right Leg"]
local Event = game:GetService("Workspace").FE.Actions.SaveRL
Event:FireServer(A_1, A_2)

local Events2 = game:GetService("Workspace").FE.Kick.RemoteEvent2
Events2:FireServer()
else
AnimationId = "3008336125"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
wait(SaveDelay)

local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game.Players.LocalPlayer.Character["HumanoidRootPart"]
local Event = game:GetService("Workspace").FE.Actions.SaveT
Event:FireServer(A_1, A_2)

local Events3 = game:GetService("Workspace").FE.Kick.RemoteEvent2
Events3:FireServer()
end
end
end
end
end)
    else
TouchedGKBallBox:Disconnect()
end
end)

GKPage:CreateToggle("Auto Save [RemoteEvent Method]", "Auto Save The Ball [RemoteEvent Method]", function(arg)
if arg then
_G.GKS = true
    while _G.GKS do
    wait()
       for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= Distance then
    if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
    AnimationId = "304581045"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
wait(SaveDelay)

local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game.Players.LocalPlayer.Character["Right Leg"]
local Event = game:GetService("Workspace").FE.Actions.SaveRL
Event:FireServer(A_1, A_2)

local Events2 = game:GetService("Workspace").FE.Kick.RemoteEvent2
Events2:FireServer()
else
AnimationId = "3008336125"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
wait(SaveDelay)

local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game.Players.LocalPlayer.Character["HumanoidRootPart"]
local Event = game:GetService("Workspace").FE.Actions.SaveT
Event:FireServer(A_1, A_2)

local Events3 = game:GetService("Workspace").FE.Kick.RemoteEvent2
Events3:FireServer()
end
end
end
end
end
    else
if _G.GKS == true then
_G.GKS = false
else
_G.GKS = true
end
end
end)

GKPage:CreateToggle("Auto Jump", "Auto Jump For The Ball", function(arg)
if arg then
_G.JUMP = true
    while _G.JUMP do
    wait()
    
for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    local a = Vector3.new(0, v.Position.Y, 0)
    local b = Vector3.new(0, game.Players.LocalPlayer.Character.Head.Position.Y, 0)
    if (a - b).Magnitude >= 5 then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= DistanceJump then
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
end
end
end
end
    else
if _G.JUMP == true then
_G.JUMP = false
else
_G.JUMP = true
end
end
end)

GKPage:CreateToggle("Auto Walk Sideways [WalkToPoint Method]", "Auto Walk Sideways In Net When The Ball Is Near", function(arg)
if arg then
_G.SIDEW = true
    while _G.SIDEW do
    wait(0.8)
       for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= DistanceSide then
    if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright red") then
    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(9.488, 13.3, -126.9)
    wait(0.8)
    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(-9.697, 13.3, -126.49)
    else
    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(-8.878, 13.3, 129.295)
    wait(0.8)
    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(9.07, 13.3, 129.73)
end
end
end
end
end
    else
if _G.SIDEW == true then
_G.SIDEW = false
else
_G.SIDEW = true
end
end
end)

GKPage:CreateToggle("Auto Walk Sideways [MoveTo Method]", "Auto Walk Sideways In Net When The Ball Is Near", function(arg)
if arg then
_G.SIDEM = true
    while _G.SIDEM do
    wait(0.8)
       if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= DistanceSide then
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(game.Workspace.TPSSystem.TPS.Position.X, 0, 0))
wait(0.8)
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(-game.Workspace.TPSSystem.TPS.Position.X, 0, 0))
end
end
    else
if _G.SIDEM == true then
_G.SIDEM = false
else
_G.SIDEM = true
end
end
end)

local PartRedTouched
local PartBlueTouched

GKPage:CreateToggle("Auto Look At The Ball", "Auto Look At The Ball When In The Box. Switched Teams = Untoggle", function(arg)
if arg then
local PartB = game:GetService("Workspace").GKSystem.Fix2
local PartR = game:GetService("Workspace").GKSystem.Fix1

if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
PartBlueTouched = PartB.Touched:Connect(function()
    local touching = PartB:GetTouchingParts()
	for i=1,#touching do
		if touching[i] == game.Players.LocalPlayer.Character.HumanoidRootPart then
			repeat wait()
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude > 6 then
			game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = true
game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position,game.Workspace.TPSSystem.TPS.Position)
end

			until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= 4.5
end
end
end)
else
PartRedTouched = PartR.Touched:Connect(function()
    local touching = PartR:GetTouchingParts()
	for i=1,#touching do
		if touching[i] == game.Players.LocalPlayer.Character.HumanoidRootPart then
			repeat wait()
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude > 6 then
			game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = true
game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position,game.Workspace.TPSSystem.TPS.Position)
end

			until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= 4.5
end
end
end)
end
    else
    PartRedTouched:Disconnect()
    PartBlueTouched:Disconnect()
    wait(1)
    game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = false
end
end)

GKPage:CreateToggle("Auto Return", "Auto Return To Team Goal When You Died.", function(arg)
if arg then
HumanoidDied = game.Players.LocalPlayer.CharacterAdded:Connect(function()
       wait(0.5)
          if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright red") then
          game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(-2.114, 13.3, -118.341)
    else
          game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(0.512, 13.3, 122.121)
       end
    end)
    else
    HumanoidDied:Disconnect()
end
end)



MPage:CreateButton("Remove Map", "Removes Map For Less Lag", function()
   for i,v in pairs(game.Workspace:GetChildren()) do
       if v.Name == "Map" then
           v:Destroy()
       end
   end
end)

MPage:CreateButton("Secret BadgeAwarder", "Gives You Secret Badge", function()
   for i,v in pairs(game.Workspace:GetChildren()) do
       if v.Name == "BadgeAwarder" then
               v.Platform.CanCollide = false
               v.Platform.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
               v.Platform.Transparency = 1
               v.Platform.Decal.Transparency = 1
               wait(2)
               v.Platform.CanCollide = true
               v.Platform.Transparency = 0
               v.Platform.Decal.Transparency = 0
               v.Platform.CFrame = CFrame.new(-2, -0, 363, 1, 0, 0, 0, 1, 0, 0, 0, 1)
       end
   end
end)

MPage:CreateLabel("Scripts")

MPage:CreateToggle("Chat Log Spy", "Spying And Showing Hidden & Private Messages. It's Gray Color", function(arg)
if arg then
EnabledChatLogger = true
SpyOnMyself = true
IsPublic = false
IsPublicItalics = false
ChatMessageProperties = {
	Color = Color3.fromRGB(162,163,165); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
local SayMessageRequest = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local OnMessageDoneFiltering = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local InstanceNUM = (_G.ChatLogger or 0) + 1
_G.ChatLogger = InstanceNUM

local function onChatted(plr, msg)
	if _G.ChatLogger == InstanceNUM then
		if plr == Player then
			EnabledChatLogger = not EnabledChatLogger
		elseif EnabledChatLogger and SpyOnMyself == true or plr ~= Player then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local HiddenMSG = true
			local Connection = OnMessageDoneFiltering.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId == plr.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and IsPublic == false)) then
					HiddenMSG = false
				end
			end)
			wait(0.2)
			Connection:Disconnect()
			if HiddenMSG and EnabledChatLogger then
				if IsPublic then
					SayMessageRequest:FireServer((IsPublicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
				else
					ChatMessageProperties.Text = " [".. plr.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage", ChatMessageProperties)
				end
			end
		end
	end
end

for _,getplayers in ipairs(Players:GetPlayers()) do
	getplayers.Chatted:Connect(function(msg) 
	onChatted(getplayers, msg) 
	end)
end
Players.PlayerAdded:Connect(function(plradded)
	plradded.Chatted:Connect(function(msg) 
	onChatted(plradded, msg) 
	end)
end)
wait(3)
local ChatFrame = Player.PlayerGui.Chat.Frame
ChatFrame.ChatChannelParentFrame.Visible = true
ChatFrame.ChatBarParentFrame.Position = ChatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), ChatFrame.ChatChannelParentFrame.Size.Y)
    else
    EnabledChatLogger = false
end
end)

MPage:CreateButton("Infinite Yield Admin", "Executes The Admin Script. Use For Trolling", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

LPPage:CreateLabel("Miscellaneous")

local FireHeartbeat

LPPage:CreateToggle("Invisible [Fire Power Method]", "You Will Be Invisible When Someone Kills You With Fire", function(arg)
if arg then
FireHeartbeat = game:GetService("RunService").Heartbeat:Connect(function()
for i,v in pairs(game.Players:GetPlayers()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
        for i,b in pairs(v.Character.HumanoidRootPart:GetDescendants()) do
            if b.Name == "Fire" or b.Name == "HitScript" then
                b:Destroy()
            end
        end
end
end
end)
    else
    FireHeartbeat:Disconnect()
end
end)

LPPage:CreateButton("Invisible [R15]", "You Will Be Invisible. Dribbling & Kicking Are FE", function()
    --// REMOVE BILLBOARDGUI NAME, LEVEL AND INFORMATION --\\

for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
       if v:IsA("BillboardGui") then
           v:Destroy()
       end
   end
   
--// VARIABLES, SERVICES --\\

local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
local LT = game.Players.LocalPlayer.Character.LowerTorso
local OldCF = HRP.CFrame

--// SCRIPTING --\\
if game.Players.LocalPlayer.Character.PrimaryPart ~= HRP then
    game.Players.LocalPlayer.Character.PrimaryPart = HRP
end


local NewRootMotor6D = LT:FindFirstChild("Root"):Clone()
HRP.Parent = game.Workspace
game.Players.LocalPlayer.Character.PrimaryPart = HRP
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(OldCF.X, 9e9, OldCF.Z))
HRP.Parent = game.Players.LocalPlayer.Character
wait(0.45)
NewRootMotor6D.Parent = HRP
HRP.CFrame = OldCF
end)

LPPage:CreateButton("Fake Join Group", "Unlocks Black Trail For The Ball", function()
    local mt = getrawmetatable(game);
local nc = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod();
    if Method == 'IsInGroup' then
        return 5334925
    end
    return nc(self, ...)
end)
end)

LPPage:CreateButton("Rejoin The Server", "Rejoining To Same Server", function()
    local plr = game.Players.LocalPlayer

game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
end)

LPPage:CreateButton("Reset The Character", "Resetting Your Character", function()
    game.Players.LocalPlayer.Character:BreakJoints()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

LPPage:CreateLabel("Humanoid Properties")

LPPage:CreateSlider("WalkSpeed", 0, 1000,function(arg)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = arg
end)

LPPage:CreateSlider("JumpPower", 0, 500,function(arg)
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = arg
end)

LPPage:CreateSlider("HipHeight", 0, 15,function(arg)
   game.Players.LocalPlayer.Character.Humanoid.HipHeight = arg
end)

LPPage:CreateButton("Default WalkSpeed", "Set Custom WalkSpeed To Default (22)", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 22
end)

LPPage:CreateButton("Default JumpPower", "Set Custom JumpPower To Default (50)", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)

LPPage:CreateButton("Default HipHeight", "Set Custom HipHeight To Default (0)", function()
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
end)

LPPage:CreateLabel("Teams")

LPPage:CreateToggle("Fake Switch The Blue Team", "Shows A Blue Circle Above Your Head", function(arg)
if arg then
_G.FB = true
    while _G.FB do
    wait()
    game.Workspace.FE.PlayerTeam.RemoteEventB:FireServer()  
    end
    else
    _G.FB = false
end
end)

LPPage:CreateToggle("Fake Switch The Red Team", "Shows A Red Circle Above Your Head", function(arg)
if arg then
_G.FR = true
    while _G.FR do
    wait()
    game.Workspace.FE.PlayerTeam.RemoteEventR:FireServer()  
    end
    else
    _G.FR = false
end
end)

LPPage:CreateButton("Join The Blue Team", "You Will Join The Blue Team", function()
    local Event = game:GetService("Workspace").FE.CTeamColor.RemoteEventB
Event:FireServer()
end)

LPPage:CreateButton("Join The Red Team", "You Will Join The Red Team", function()
    local Event = game:GetService("Workspace").FE.CTeamColor.RemoteEventR
Event:FireServer()
end)

LPPage:CreateButton("Join The Waiting Team", "You Will Join The Waiting Team", function()
    local Event = game:GetService("Workspace").FE.CTeamColor.RemoteEvent
Event:FireServer()
end)

LPPage:CreateLabel("Reach")
local RunStepped

LPPage:CreateToggle("Reach", "Enables Reach", function(arg)
if arg then
RunStepped = game:GetService("RunService").RenderStepped:Connect(function()
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= DistanceReach then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 1 then
firetouchinterest(game.Players.LocalPlayer.Character["Right Leg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["Right Leg"], game.Workspace.TPSSystem.TPS, 1)
elseif game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
firetouchinterest(game.Players.LocalPlayer.Character["Left Leg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["Left Leg"], game.Workspace.TPSSystem.TPS, 1)

end
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= DistanceReach then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 1 then
firetouchinterest(game.Players.LocalPlayer.Character["RightLowerLeg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["RightLowerLeg"], game.Workspace.TPSSystem.TPS, 1)
elseif game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
firetouchinterest(game.Players.LocalPlayer.Character["LeftLowerLeg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["LeftLowerLeg"], game.Workspace.TPSSystem.TPS, 1)
			end
			end
			end
end)
else
RunStepped:Disconnect()
end
end)

LPPage:CreateSlider("Reach Distance", 0, 100,function(arg)
   DistanceReach = arg
end)

LPPage:CreateLabel("Reach Leg")
LPPage:CreateLabel("Customize Reach Size And Transparency. After Use Fake Leg")

LPPage:CreateButton("Fake Leg [R6]", "Creates Fake Leg For Better View", function()
    if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
    game.Players.LocalPlayer.Character["Left Leg"].Massless = true
   LeftLeg = Instance.new("Part", game.Players.LocalPlayer.Character)
LeftLeg.Name = "Left Leg"
LeftLeg.CanCollide = false
LeftLeg.Color = game.Players.LocalPlayer.Character["Left Leg"].Color
LeftLeg.Size = Vector3.new(1, 2, 1)
LeftLeg.Locked = true
LeftLeg.Position = game.Players.LocalPlayer.Character["Left Leg"].Position

local Attachment = Instance.new("Attachment", LeftLeg)
Attachment.Name = "LeftFootAttachment"
Attachment.Position = Vector3.new(0, -1, 0)

local MotorHip = Instance.new("Motor6D", game.Players.LocalPlayer.Character.Torso)
MotorHip.Name = "Fake Left Hip"
MotorHip.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
MotorHip.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
MotorHip.CurrentAngle = 0
MotorHip.DesiredAngle = 0
MotorHip.MaxVelocity = 0.1
MotorHip.Part0 = game.Players.LocalPlayer.Character.Torso
MotorHip.Part1 = LeftLeg
elseif game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 1 then
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
   RightLeg = Instance.new("Part", game.Players.LocalPlayer.Character)
RightLeg.Name = "Right Leg"
RightLeg.CanCollide = false
RightLeg.Color = game.Players.LocalPlayer.Character["Right Leg"].Color
RightLeg.Size = Vector3.new(1, 2, 1)
RightLeg.Locked = true
RightLeg.Position = game.Players.LocalPlayer.Character["Right Leg"].Position

local Attachment = Instance.new("Attachment", RightLeg)
Attachment.Name = "RightFootAttachment"
Attachment.Position = Vector3.new(0, -1, 0)

local MotorHip = Instance.new("Motor6D", game.Players.LocalPlayer.Character.Torso)
MotorHip.Name = "Fake Right Hip"
MotorHip.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
MotorHip.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
MotorHip.CurrentAngle = 0
MotorHip.DesiredAngle = 0
MotorHip.MaxVelocity = 0.1
MotorHip.Part0 = game.Players.LocalPlayer.Character.Torso
MotorHip.Part1 = RightLeg
end
end)

LPPage:CreateButton("Remove Fake Leg [R6]", "Removes Fake Leg", function()
    if LeftLeg ~= nil then
LeftLeg:Destroy()
elseif RightLeg ~= nil then
RightLeg:Destroy()
elseif LeftFoot ~= nil then
LeftFoot:Destroy()
elseif RightFoot ~= nil then
RightFoot:Destroy()
end
for i,z in pairs(game.Players.LocalPlayer.Character.Torso:GetDescendants()) do
        if z.Name == "Fake Left Hip" or z.Name == "Fake Right Hip" then
            z:Destroy()
        end
    end
end)

LPPage:CreateSlider("Reach Leg Size", 1, 100,function(arg)
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(arg, 2, arg)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(arg, 2, arg)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(arg, 2, arg)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(arg, 2, arg)
end
end
end)

LPPage:CreateBox("Reach Leg Transparency", 10044538000, function(arg)
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Transparency = tonumber(arg)
else
game.Players.LocalPlayer.Character["Right Leg"].Transparency = tonumber(arg)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Transparency = tonumber(arg)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Transparency = tonumber(arg)
end
end
end)

LPPage:CreateLabel("Settings")

LPPage:CreateBox("Replication Lag-Ping [Use 0.01 or 0.02 For Tricks]", 10044538000, function(arg)
settings():GetService("NetworkSettings").IncomingReplicationLag = tonumber(arg)
end)

LPPage:CreateToggle("Vibration", "Turning Off/On Vibration", function(arg)
if arg then
require(game:GetService("Players").LocalPlayer.PlayerGui.Start.Settings.Options.Module).Vibration(2)
    else
    require(game:GetService("Players").LocalPlayer.PlayerGui.Start.Settings.Options.Module).Vibration(1)
end
end)


LPPage:CreateLabel("Level Spoofer")

LPPage:CreateBox("Level", 10044538000, function(arg)
local Targets
	Targets = tonumber(arg)
	wait(0.1)
	local mt = getrawmetatable(game);
setreadonly(mt, false);
local old_index = mt.__index;
mt.__index = function(a, b)
    if tostring(a) == "PPLevel" or tostring(a) == "Level" then
        if tostring(b) == "Value" then
            return Targets;
        end
    end
    return old_index(a, b);
end
end)

LPPage:CreateBox("XP", 10044538000, function(arg)
local Targetz
	Targetz = tonumber(arg)
	wait(0.1)
	local mt = getrawmetatable(game);
setreadonly(mt, false);
local old_index = mt.__index;
mt.__index = function(a, b)
    if tostring(a) == "XP" then
        if tostring(b) == "Value" then
            return Targetz;
        end
    end
    return old_index(a, b);
end
end)

LPPage:CreateLabel("Power Shot")

LPPage:CreateToggle("Always Power Ready", "Each Time You Press 'Z', Power Will Be Ready/Activated", function(arg)
if arg then
_G.READY = true
    while _G.READY do
    wait()
    for i,v in pairs(game.Players.LocalPlayer:GetDescendants()) do
        if v.Name == "PowerReady" and v:IsA("BoolValue") then
        v.Value = true
end
end
end
    else
    _G.READY = false
end
end)

LPPage:CreateButton("Activate Power", "Power Will Be Activated", function()
    game.Players.LocalPlayer.Backpack.PowerActive.Value = true
end)

LPPage:CreateSlider("Power Cooldown", 0, 60,function(arg)
   for i,v in pairs(game.Players.LocalPlayer:GetDescendants()) do
    if v.Name == "PowerValue" and v:IsA("NumberValue") then
    v.Value = arg
end
end
end)


LPPage:CreateLabel("Gamepasses")

LPPage:CreateButton("Enable GamepassController", "Probably Allows You To Use Gamepasses From Players", function()
    local mt = getrawmetatable(game);
setreadonly(mt, false);
local old_index = mt.__index;
mt.__index = function(a, b)
    if tostring(a) == "GamePassController" or tostring(a) == "GamePassControllerFix" or tostring(a) == "GamePassC" then
        if tostring(b) == "Enabled" then
            return true;
            elseif tostring(b) == "Disabled" then
            return false;
        end
    end
    return old_index(a, b);
end

wait(.5)
game:GetService("Workspace").FE.Store.Check:FireServer()
end)



LPPage:CreateToggle("Blue Flame", "Flame Color Effect Will Be Blue Now.", function(arg)
if arg then
game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.BlueFlame.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.BlueFlame.BlueFlame.Style = "RobloxRoundButton"
        game:GetService("Players").LocalPlayer.PlayerGui.Start.PowerShot.Image = "rbxassetid://5366457711"
        game:GetService("Players").LocalPlayer.Backpack.FValue.Value = 2
    else
        game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.BlueFlame.Tick.Visible = false
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.BlueFlame.BlueFlame.Style = "RobloxRoundDefaultButton"
        game:GetService("Players").LocalPlayer.PlayerGui.Start.PowerShot.Image = "rbxassetid://1595877615"
       game:GetService("Players").LocalPlayer.Backpack.FValue.Value = 1
    end
end)

local AnimationCurveLoop

LPPage:CreateToggle("More Curve", "The Ball Curves More", function(arg)
if arg then
game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.WoodenFloor.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.WoodenFloor.WoodenFloor.Style = "RobloxRoundButton"

local Humanoid = game.Players.LocalPlayer.Character.Humanoid

AnimationCurveLoop = Humanoid.AnimationPlayed:Connect(function(AnimationTrack)
    if AnimationTrack.Name == "OldMKickL" or AnimationTrack.Name == "OldMKick" or AnimationTrack.Name == "OldLKickL" or AnimationTrack.Name == "OldLKick" or AnimationTrack.Name == "MKickL" or AnimationTrack.Name == "MKick" or AnimationTrack.Name == "LKickL" or AnimationTrack.Name == "LKick" or AnimationTrack.Name == "OldDribbleL" or AnimationTrack.Name == "OldDribble" or AnimationTrack.Name == "DribbleL" or AnimationTrack.Name == "Dribble" then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude < 3.45 then
        if game.Players.LocalPlayer.Backpack.Curving.Value == 2 then
        wait(0.1)
                local A_1T = game:GetService("Workspace").TPSSystem.TPS
local A_2T = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local EventT = game:GetService("Workspace").FE.Actions.KickC1
EventT:FireServer(A_1T, A_2T)
wait(0.2)
EventT:FireServer(A_1T, A_2T)

elseif game.Players.LocalPlayer.Backpack.Curving.Value == 1 then
wait(0.1)
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.KickC2
Event:FireServer(A_1, A_2)
wait(0.2)
Event:FireServer(A_1, A_2)

            end
        end
    end
end)
    else
        AnimationCurveLoop:Disconnect()
        game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.WoodenFloor.Tick.Visible = false
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.WoodenFloor.WoodenFloor.Style = "RobloxRoundDefaultButton"
    end
end)

LPPage:CreateToggle("Frozen Ball", "Freezes The Flame Ball When It Touched You. Ice Is NON-FE", function(arg)
if arg then
game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Frozen.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Frozen.Frozen.Style = "RobloxRoundButton"
    
_G.FROZEN = true
    while _G.FROZEN do
    wait()
        game:GetService("Players").LocalPlayer.Backpack.Frozen.Value = true
        for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 5 then
    if v.Fire.Enabled == true or v.FireB.Enabled == true then
       v.BrickColor = BrickColor.new("Cyan")
       local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 0
local A_4 = Vector3.new(4000000, 300, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
wait(.1)
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 0
local A_4 = Vector3.new(4000000, 300, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
wait(2.4)
v.BrickColor = BrickColor.new("Institutional white")
    end
    end
    end
    end
    end
    else
     game:GetService("Players").LocalPlayer.Backpack.Frozen.Value = false
     _G.FROZEN = false
     game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Frozen.Tick.Visible = false
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Frozen.Frozen.Style = "RobloxRoundDefaultButton"
    end
end)

LPPage:CreateToggle("Faster Cooldown", "Reduces The Power Show Cooldown By 50% (30)", function(arg)
if arg then
game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Cooldown.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Cooldown.Cooldown.Style = "RobloxRoundButton"
        game:GetService("Players").LocalPlayer.PlayerGui.Start.PowerShot.PowerValue.Value = 30
    else
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Cooldown.Cooldown.Style = "RobloxRoundDefaultButton"
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Cooldown.Tick.Visible = false
       game:GetService("Players").LocalPlayer.PlayerGui.Start.PowerShot.PowerValue.Value = 60
    end
end)

local AnimationTackleLoop

LPPage:CreateToggle("Powerful Tackle [BUGGY]", "Your Tackle Will Be Powerful. Very Buggy - Don't Recommend To Use", function(arg)
if arg then
game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.RandomWeather.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.RandomWeather.RandomWeather.Style = "RobloxRoundButton"
        game:GetService("Players").LocalPlayer.PlayerGui.Start.TackleGamePass.Value = true
        
        local Humanoid = game.Players.LocalPlayer.Character.Humanoid

AnimationTackleLoop = Humanoid.AnimationPlayed:Connect(function(AnimationTrack)
    if AnimationTrack.Name == "TackleL" or AnimationTrack.Name == "Tackle" or AnimationTrack.Name == "OldTackleL" or AnimationTrack.Name == "OldTackle" then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude < 4.87 then
        wait(0.8)
                local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 30
local A_4 = Vector3.new(4000000, 700, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)

        end
    end
end)
    else
      game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.RandomWeather.Tick.Visible = false
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.RandomWeather.RandomWeather.Style = "RobloxRoundDefaultButton"
      game:GetService("Players").LocalPlayer.PlayerGui.Start.TackleGamePass.Value = false
      AnimationTackleLoop:Disconnect()
    end
end)
