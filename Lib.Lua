local LocalUi = game.Players.LocalPlayer.PlayerGui
local LocalGui = game.Players.LocalPlayer.PlayerGui
local CoreUi = game.CoreGui
local CoreGui = game.CoreGui
local LocalBackpack = game.Players.LocalPlayer.Backpack
local LocalHumanoid = game.Players.LocalPlayer.Humanoid
local LocalH = game.Players.LocalPlayer.Humanoid
local LocalHumanoidRoot = game.Players.LocalPlayer.HumanoidRootPart
local LocalHR = game.Players.LocalPlayer.HumanoidRootPart
local LocalPlayer = game.Players.LocalPlayer
local LocalPlr = game.Players.LocalPlayer
local Lighting = game.Lighting
local ReplicatedStorage = game.ReplicatedStorage
local LocalChar = game.Players.LocalPlayer.Character

function Exit(Message)
	if Message == nil then
		LocalPlr:Kick("Default Lua P Undefined Kicking Reason")
	else
		LocalPlr:Kick(Message)
	end
end

function Thread(Script)
	local function Ignore()
		loadstring(Script)
	end
	
	task.spawn(Ignore())
end

function PlaySound(Id, Looped, Volume) -- plays a sound
	local SoundEffect = Instance.new("Sound", game.Workspace)
	if tonumber(Id) then
		SoundEffect.SoundId = "rbxassetid://" .. tostring(Id)
	else
		warn("Please only put the id in the box!")
	end
	
	if Looped == true then
		SoundEffect.Looped = true
	else
		wait(SoundEffect.TimeLength)
		SoundEffect:Destroy()
	end
	
	if tonumber(Volume) then
		SoundEffect.Volume = Volume
	else
		warn("Please only put a number for the volume!")
	end
	SoundEffect.Playing = true
end

function Loop(Script, Forever, Time) --Its like While True do but better
	if Forever == true then
		while true do
			task.wait()
			loadstring(Script)
		end
	elseif Forever == false then
		local Running = true
		game["Run Service"].RenderStepped:Connect(function()
			if Running == false then
				local Nothing = nil
			else
				loadstring(Script)
			end
		end)
		wait(Time)
		Running = false
	else
		warn("Didnt State If Loop Forever. Please State it next time. Look at the documents")
	end
end

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(15, 25, 63)
Frame.Position = UDim2.new(0.911958933, 0, 0.950617313, 0)
Frame.Size = UDim2.new(0, 120, 0, 40)

UICorner.Parent = Frame

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(0, 120, 0, 40)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "Lua P Loaded!"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.54, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradient.Rotation = 85
UIGradient.Parent = Frame

wait(5)
ScreenGui:Destroy()
