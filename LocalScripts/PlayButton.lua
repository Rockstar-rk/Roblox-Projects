game.Players.LocalPlayer.PlayerGui.ScreenGui.StageFrame.Visible = false
game.Players.LocalPlayer.PlayerGui.ScreenGui.CoinsFrame.Visible = false
game.Players.LocalPlayer.PlayerGui.ScreenGui.Zone.Visible = false
game.Players.LocalPlayer.PlayerGui.ScreenGui.SHOP.Visible = false
game.Players.LocalPlayer.PlayerGui.ScreenGui.Premium.Visible = false
game.Players.LocalPlayer.PlayerGui.ScreenGui.CodesButton.Visible = false
game.Players.LocalPlayer.PlayerGui.ScreenGui.TextButton.Visible = false
game.Players.LocalPlayer.PlayerGui.ScreenGui.sETTINGS.Visible = false 
game.Players.LocalPlayer.PlayerGui.ScreenGui.MenuButton.Visible = false
game.Players.LocalPlayer.PlayerGui.ScreenGui.WinsFrame.Visible = false
game.Players.LocalPlayer.PlayerGui.ScreenGui.InviteButton.Visible = false
game.Players.LocalPlayer.PlayerGui.MenuFrame.Frame.Visible = true
game.Players.LocalPlayer.PlayerGui.MenuFrame.Frame.Tutorial.Visible = false

local sound = game.SoundService["Switches Clicks Buttons On Run 2 (SFX)"]

script.Parent.MouseButton1Click:Connect(function()
	sound.Looped = false
	sound:Play()
	game.Players.LocalPlayer.PlayerGui.ScreenGui.InviteButton.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.Premium.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.StageFrame.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.MenuButton.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.CoinsFrame.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.Zone.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.SHOP.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.CodesButton.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TextButton.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.sETTINGS.Visible = true
	game.Players.LocalPlayer.PlayerGui.MenuFrame.Frame.Play.Visible = false
	game.Players.LocalPlayer.PlayerGui.MenuFrame.Frame.Settingsbouton.Visible = false
	game.Players.LocalPlayer.PlayerGui.MenuFrame.Frame.TextLabel.Visible = false
	game.Players.LocalPlayer.PlayerGui.ScreenGui.WinsFrame.Visible = true
	game.Players.LocalPlayer.PlayerGui.MenuFrame.Frame.Tutorial.Visible = false
	game.Players.LocalPlayer.PlayerGui.MenuFrame.Frame.CreditButton.Visible = false
end)
