local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("32")
local DataStoreCoins = DataStoreService:GetDataStore("33COINS")
local DataStoreWins = DataStoreService:GetDataStore("YoDaWinner23Wins")

local function plrToStage(plr)
	repeat wait() until plr.Character.HumanoidRootPart
	local stagePart = game.Workspace.Stages:FindFirstChild(tostring(plr.leaderstats.Stage.Value))

	plr.Character.HumanoidRootPart.CFrame = stagePart.CFrame + Vector3.new(0, 2.5, 0)
end

SOUND = game.SoundService["When U Coming Back - NoVocals"]
SOUND2 = game.SoundService["Uplifting Synths"]

game.Players.PlayerAdded:Connect(function(player)
	
	player.CharacterAdded:Connect(function()
		local plr = player
		plrToStage(plr)
	end)

	local leaderstats = Instance.new("Folder", player)
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local Stage = Instance.new("IntValue", leaderstats)
	Stage.Name = "Stage"
	Stage.Parent = leaderstats

	local Coins = Instance.new("NumberValue", leaderstats)
	Coins.Name = "Coins"
	Coins.Parent = leaderstats
	
	local Wins = Instance.new("IntValue", leaderstats)
	Wins.Name = "Wins"
	Wins.Parent = leaderstats 
	
	
	if player.Character then
		player.PlayerGui.ScreenGui.StageFrame.StageNumber.Text = Stage.Value
		player.PlayerGui.ScreenGui.CoinsFrame.TextLabel.Text = Coins.Value
		player.PlayerGui.ScreenGui.WinsFrame.TextLabel.Text = Wins.Value 
	end
	
	local success, errorMsg = pcall(function()
		Stage.Value = DataStore:GetAsync(player.UserId)
		Coins.Value = DataStoreCoins:GetAsync(player.UserId)
		Wins.Value = DataStoreWins:GetAsync(player.UserId)
	end)

	if success then
		print("ITS AWESOME, "..player.Name)
	else 
		warn(errorMsg)
		print("There is an error here")
	end  
	
	if Stage.Value == 0 then
		player.leaderstats.Stage.Value = 0
	end

	while true do
		SOUND.Looped = false
		SOUND:Play()
		SOUND2.Looped = false
		SOUND:Play()
	end       
end)


game.Players.PlayerRemoving:Connect(function(player)

	local success, errorMsg = pcall(function()
		DataStore:SetAsync(player.UserId, player.leaderstats.Stage.Value)
		DataStoreCoins:SetAsync(player.UserId, player.leaderstats.Coins.Value)
		DataStoreWins:SetAsync(player.UserId, player.leaderstats.Wins.Value)
	end)

	if success then
		print("STAGE HAS SAVED, "..player.Name)
	else
		warn(errorMsg)
		print("There is an error here")
	end
end)

local sound = game.SoundService["Level Complete"]

for _, checkpoint in pairs(game.Workspace.Stages:GetChildren()) do 
	checkpoint.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChildWhichIsA("Humanoid") then
			local player = game.Players:GetPlayerFromCharacter(hit.Parent)
			local checkpointNumber = tonumber(checkpoint.Name) 
			if hit.Parent:FindFirstChildWhichIsA("Humanoid").Health == 100 then	
				player.PlayerGui.ScreenGui.CoinsFrame.TextLabel.Text = player.leaderstats.Coins.Value
				player.PlayerGui.ScreenGui.WinsFrame.TextLabel.Text = player.leaderstats.Wins.Value
			end
			if player.leaderstats.Stage.Value == checkpointNumber then
				if not checkpoint:GetAttribute("Touched") then
					player.leaderstats.Stage.Value = tonumber(checkpoint.Name)
					player.PlayerGui.ScreenGui.StageFrame.StageNumber.Text = player.leaderstats.Stage.Value
					checkpoint:SetAttribute("Touched", true)
					sound.Looped = false
					sound.Volume = 0.5
					sound:Play()
					player.leaderstats.Stage.Value = checkpoint.Name
					player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 4
					player.PlayerGui.ScreenGui.CoinsFrame.TextLabel.Text = player.leaderstats.Coins.Value
					task.wait(6)
					checkpoint:SetAttribute("Touched", false)
				end
			elseif player.leaderstats.Stage.Value ~= checkpointNumber then
				if not checkpoint:GetAttribute("Touched") then
					checkpoint:SetAttribute("Touched", true)
					player.leaderstats.Stage.Value = checkpoint.Name
					player.PlayerGui.ScreenGui.StageFrame.StageNumber.Text = player.leaderstats.Stage.Value
					if player.PlayerGui.ScreenGui.StageFrame.StageForwardBy1.MouseButton1Click or player.PlayerGui.ScreenGui.StageFrame.StageForwardBy5.MouseButton1Click then
						sound.Looped = false
						sound.Volume = 0.5
						sound:Play()
						player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 4
						player.PlayerGui.ScreenGui.CoinsFrame.TextLabel.Text = player.leaderstats.Coins.Value
						task.wait(6)
						checkpoint:SetAttribute("Touched", false)
					end
				end
			end
			if player.leaderstats.Wins.Value > 0 and player.leaderstats.Stage.Value == 0 then
				checkpointNumber = 0 
				player.leaderstats.Stage.Value = checkpoint.Name
				player.leaderstats.Stage.Value = 0
				player.PlayerGui.ScreenGui.StageFrame.StageNumber.Text = "0"
				end
			end
		end)
end


game.ReplicatedStorage["2xCoins"].OnServerEvent:Connect(function(player)
	for _, checkpoint in pairs(game.Workspace.Stages:GetChildren()) do 
		checkpoint.Touched:Connect(function(hit)
			if hit.Parent:FindFirstChildWhichIsA("Humanoid") then
				local player = game.Players:GetPlayerFromCharacter(hit.Parent)
				local checkpointNumber = tonumber(checkpoint.Name) 
				player.PlayerGui.ScreenGui.StageFrame.StageNumber.Text = player.leaderstats.Stage.Value
				if player.leaderstats.Stage.Value == checkpointNumber then
					player.leaderstats.Stage.Value = tonumber(checkpoint.Name)
					if not checkpoint:GetAttribute("Touched") then
						checkpoint:SetAttribute("Touched", true)
						sound.Looped = false
						sound.Volume = 0.5
						sound:Play()
						player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 4
						player.PlayerGui.ScreenGui.CoinsFrame.TextLabel.Text = player.leaderstats.Coins.Value
						task.wait(6)
						checkpoint:SetAttribute("Touched", false)
					end
				elseif player.leaderstats.Stage.Value ~= checkpointNumber then
					if not checkpoint:GetAttribute("Touched") then
						checkpoint:SetAttribute("Touched", true)
						player.leaderstats.Stage.Value = tonumber(checkpoint.Name)
						player.PlayerGui.ScreenGui.StageFrame.StageNumber.Text = player.leaderstats.Stage.Value
						if player.PlayerGui.ScreenGui.StageFrame.StageForwardBy1.MouseButton1Click or player.PlayerGui.ScreenGui.StageFrame.StageForwardBy5.MouseButton1Click then
							sound.Looped = false
							sound.Volume = 0.5
							sound:Play()
							player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 4
							player.PlayerGui.ScreenGui.CoinsFrame.TextLabel.Text = player.leaderstats.Coins.Value
							task.wait(6)
							checkpoint:SetAttribute("Touched", false)
						end
					end
				end
			end
		end)
	end
end)


game.ReplicatedStorage.CoinsWins.OnServerEvent:Connect(function(plr)
	plr.leaderstats.Wins.Value += 1
	plr.leaderstats.Coins.Value = plr.leaderstats.Coins.Value + 200 
	plr.PlayerGui.ScreenGui.WinsFrame.TextLabel.Text = plr.leaderstats.Wins.Value
	plr.PlayerGui.ScreenGui.CoinsFrame.TextLabel.Text = plr.leaderstats.Coins.Value
	plr.leaderstats.Stage.Value = 0
	plrToStage(plr)
end)

game.ReplicatedStorage.CoinsWins2.OnServerEvent:Connect(function(plr)
	plr.leaderstats.Wins.Value+=4
	plr.leaderstats.Coins.Value = plr.leaderstats.Coins.Value + 1000
	plr.PlayerGui.ScreenGui.WinsFrame.TextLabel.Text = plr.leaderstats.Wins.Value
	plr.PlayerGui.ScreenGui.CoinsFrame.TextLabel.Text = plr.leaderstats.Coins.Value
	plr.leaderstats.Stage.Value = 0
	plrToStage(plr)
end)

game.ReplicatedStorage.GravityCoilGiver.OnServerEvent:Connect(function(plr)
	local GCclone = game.ServerStorage.Tools["Gravity Coil"]:Clone()
	GCclone.Parent = plr.Backpack
end)

game.ReplicatedStorage.SpeedCoilGiver.OnServerEvent:Connect(function(plr)
	local SCclone = game.ServerStorage.Tools.SpeedCoil:Clone()
	SCclone.Parent = plr.Backpack
end)

game.ReplicatedStorage.CoinsL1.OnServerEvent:Connect(function(plr)
	plr.leaderstats.Coins.Value -= 500
	plr.PlayerGui.ScreenGui.CoinsFrame.TextLabel.Text = plr.leaderstats.Coins.Value
end)

game.ReplicatedStorage.WinsL1.OnServerEvent:Connect(function(plr)
	plr.leaderstats.Wins.Value -=1
	plr.PlayerGui.ScreenGui.WinsFrame.TextLabel.Text = plr.leaderstats.Wins.Value
end)

game.ReplicatedStorage.CoinsL2.OnServerEvent:Connect(function(plr)
	plr.leaderstats.Coins.Value -= 1000
	plr.PlayerGui.ScreenGui.CoinsFrame.TextLabel.Text = plr.leaderstats.Coins.Value
end)

game.ReplicatedStorage.WinsL2.OnServerEvent:Connect(function(plr)
	plr.leaderstats.Wins.Value -= 3
	plr.PlayerGui.ScreenGui.WinsFrame.TextLabel.Text = plr.leaderstats.Wins.Value
end)

game.ReplicatedStorage.dieEvent.OnServerEvent:Connect(function(plr)
	if plr.Name == "tailsg6" then
		plr.leaderstats.Coins.Value -= 10
		plr.PlayerGui.ScreenGui.CoinsFrame.TextLabel.Text = plr.leaderstats.Coins.Value
	else
		plr.leaderstats.Coins.Value -=4
		plr.PlayerGui.ScreenGui.CoinsFrame.TextLabel.Text = plr.leaderstats.Coins.Value
	end
end)