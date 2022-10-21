game.Players.LocalPlayer.Character.Head.Transparency = 1
game.Players.LocalPlayer.Character.Head.Transparency = 1
for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
if (v:IsA("Decal")) then
v.Transparency = 1
end
  OrionLib:MakeNotification({
	Name = "Executed",
	Content = "Headless Executed
	Image = "rbxassetid://4483345998",
	Time = 5
})
end
