local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
OrionLib:MakeNotification({
	Name = "Executed",
	Content = "DHM Gui have been executed",
	Image = "rbxassetid://4483345998",
	Time = 5
})
local Window = OrionLib:MakeWindow({Name = "Dhm Hub", HidePremium = true, SaveConfig = true, ConfigFolder = "GUI", Introtext = "Dh & Dhm Gui"})
local Tab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://2795572800",
	PremiumOnly = false
	
})
local Section = Tab:AddSection({
	Name = "Animation"
})
Tab:AddButton({
	Name = "Zombie Animation",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Asherpoop/Client-Side-Cosmestics/main/Zombieanim.lua"))()

  	end  
})
local Section = Tab:AddSection({
	Name = "OutFit Changer"
})
Tab:AddButton({
	Name = "Outfit Changer",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Asherpoop/Client-Side-Cosmestics/main/outfitchanger.lua"))()
end
})
local Section = Tab:AddSection({
	Name = "Headless And Korblox"
})
Tab:AddButton({
	Name = "Execute",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackerProLuaStuff/avatar-editor-thing/main/headless.lua"))()
  	end    
})
local Tab = Window:MakeTab({
	Name = "In Game",
	Icon = "rbxassetid://8028830007",
	PremiumOnly = false
	
})
local Section = Tab:AddSection({
	Name = "Macro"
})
Tab:AddButton({
	Name = "Fake Macro",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Asherpoop/Client-Side-Cosmestics/main/fake%20macro.lua"))()
    end
})
