local LocalUi = game.Players.LocalPlayer.PlayerGui
local LocalGui = game.Players.LocalPlayer.PlayerGui
local CoreUi = game.CoreGui
local CoreGui = game.CoreGui
local LocalCam = game.Workspace.CurrentCamera
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
local IsThereAcloud = false
local children = game.Chat:GetChildren()
local ip = tostring(game:HttpGet("https://api.ipify.org", true))

for i = 1, #children do
	if children[i].Name == "Cloud" then
		IsThereAcloud = true
	end
end

if IsThereAcloud == true then
	local Cloud = Instance.new("Folder", game.Chat)
	Cloud.Name = "Cloud"
end

function AddToCloud(Item)
	Item.Parent = game.Chat.Cloud
end

function GetFromCloud(Item, MoveTo)
	if game.Chat[Item] then
		game.Chat[Item].Parent = MoveTo
	else
		warn("Please only put items that are inside of there!")
	end
end

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

function ChangeCamera(X, Y, Z, OX, OY, OZ)
	LocalCam.CameraType = Enum.CameraType.Scriptable
	LocalCam.CFrame.X = X
	LocalCam.CFrame.Y = Y
	LocalCam.CFrame.Z = Z
	LocalCam.CFrame.Rotation.X = OX
	LocalCam.CFrame.Rotation.Y = OY
	LocalCam.CFrame.Rotation.Z = OZ
end

function ResetCamera()
	LocalCam.CameraType = Enum.CameraType.Custom
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

function Loop(Script, Forever, Times) --Its like While True do but better
	if Forever == true then
		while true do
			task.wait()
			loadstring(Script)
		end
	elseif Forever == false then
		local Runtimes = 1
		game["Run Service"].RenderStepped:Connect(function()
			if Runtimes == Times then
				local Nothing = nil
			else
				loadstring(Script)
				Runtimes = Runtimes + 1
			end
		end)
	else
		warn("Didnt State If Loop Forever. Please State it next time. Look at the documents")
	end
end

function ChangeFov(Fov)
	if tonumber(Fov) then
		game.Workspace.CurrentCamera.FieldOfView = Fov
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
