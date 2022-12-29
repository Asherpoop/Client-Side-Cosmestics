local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Sentinal GUI", "Sentinel")
local Tab = Window:NewTab("Player")
local Section = Tab:NewSection("Cosmetics")
Section:NewButton("Outfit Changer", "Put Any Code Of A Player To Get Thier Outfit", function()
    

local UsernameandHeadshots = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Confirm = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local Headshot = Instance.new("ImageLabel")
local UICorner_3 = Instance.new("UICorner")
local Username = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local UserID = Instance.new("TextBox")

--Properties:

UsernameandHeadshots.Name = "UsernameandHeadshots"
UsernameandHeadshots.Parent = game.CoreGui
UsernameandHeadshots.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = UsernameandHeadshots
Main.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
Main.Position = UDim2.new(0.193901479, 0, 0.32361111, 0)
Main.Size = UDim2.new(0, 250, 0, 238)

Main.Active = true
Main.Draggable = true 


	

UICorner.CornerRadius = UDim.new(0, 9)
UICorner.Parent = Main

Confirm.Name = "Confirm"
Confirm.Parent = Main
Confirm.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Confirm.Position = UDim2.new(0.100000001, 0, 0.693277299, 0)
Confirm.Size = UDim2.new(0, 200, 0, 50)
Confirm.Font = Enum.Font.SourceSans
Confirm.Text = "Confirm"
Confirm.TextColor3 = Color3.fromRGB(255, 255, 255)
Confirm.TextScaled = true
Confirm.TextSize = 14.000
Confirm.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 9)
UICorner_2.Parent = Confirm

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(131, 131, 131)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(131, 131, 131))}
UIGradient.Parent = Main

Headshot.Name = "Headshot"
Headshot.Parent = Main
Headshot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Headshot.BackgroundTransparency = 1.000
Headshot.Position = UDim2.new(0.0719999969, 0, 0.0672268942, 0)
Headshot.Size = UDim2.new(0, 63, 0, 67)
Headshot.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

UICorner_3.CornerRadius = UDim.new(0, 100)
UICorner_3.Parent = Headshot

Username.Name = "Username"
Username.Parent = Main
Username.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Username.Position = UDim2.new(0.34799999, 0, 0.100840338, 0)
Username.Size = UDim2.new(0, 138, 0, 50)
Username.Font = Enum.Font.SourceSans
Username.Text = "Put Code Here"
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.TextScaled = true
Username.TextSize = 14.000
Username.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0, 9)
UICorner_4.Parent = Username

UserID.Name = "UserID"
UserID.Parent = Main
UserID.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UserID.Position = UDim2.new(0.100000001, 0, 0.428571433, 0)
UserID.Size = UDim2.new(0, 200, 0, 50)
UserID.Font = Enum.Font.SourceSans
UserID.Text = "Keybind Is P"
UserID.TextColor3 = Color3.fromRGB(0, 0, 0)
UserID.TextScaled = true
UserID.TextSize = 14.000
UserID.TextWrapped = true

function Morph(UserId)
	local appearance = game.Players:GetCharacterAppearanceAsync(UserId)
	local player = game.Players.LocalPlayer

	for i,v in pairs(player.Character:GetChildren()) do
		if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("CharacterMesh") or v:IsA("BodyColors") then
			v:Destroy()
		end
	end

	if player.Character.Head:FindFirstChild("face") then
		player.Character.Head.face:Destroy()
	end

	for i,v in pairs(appearance:GetChildren()) do
		if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") then
			v.Parent = player.Character
		elseif v:IsA("Accessory") then
			player.Character.Humanoid:AddAccessory(v)
		elseif v.Name == "R6" then
			if player.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
				v:FindFirstChildOfClass("CharacterMesh").Parent = player.Character
			end
		elseif v.Name == "R15" then
			if player.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
				v:FindFirstChildOfClass("CharacterMesh").Parent = player.Character
			end
		end
	end

	if appearance:FindFirstChild("face") then
		appearance.face.Parent = player.Character.Head
	else
		local face = Instance.new("Decal")
		face.Face = "Front"
		face.Name = "face"
		face.Texture = "rbxasset://textures/face.png"
		face.Transparency = 0
		face.Parent = player.Character.Head
	end

	-- Reload Character
	local parent = player.Character.Parent
	player.Character.Parent = nil
	player.Character.Parent = parent
end

Main.Draggable = true

local userID = 4110227704
local headshot = "https://www.roblox.com/headshot-thumbnail/image?userId="..userID.."&width=420&height=420&format=png"

Headshot.Image = headshot
Username.Text = game.Players:GetNameFromUserIdAsync(userID)

Confirm.MouseButton1Click:Connect(function()
	local userID = UserID.Text
	local headshot = "https://www.roblox.com/headshot-thumbnail/image?userId="..userID.."&width=420&height=420&format=png"
	Headshot.Image = headshot
	Username.Text = game.Players:GetNameFromUserIdAsync(userID)
	Morph(userID)
end)

local frame = game:GetService("CoreGui").UsernameandHeadshots.Main -- path to the frame
local mouse = game:GetService('Players').LocalPlayer:GetMouse(); -- we need the mouse object, which also has the keyboard

mouse.KeyDown:connect(function(key) -- whenever a key is pushed down
	key = key:lower() -- i do this in all my key events, though i don't remember why
	if key == 'p' then -- if key pressed is h
		frame.Visible = not frame.Visible -- flip between visible/invisible
	end
end)

end)
Section:NewButton("Animation", "Get Zombie Animation", function()
    while true do
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921344533"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921345304"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921160088"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921343576"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921159222"
game.Players.LocalPlayer.Character.Humanoid.Jump = false
wait(1)
end
end)
Section:NewButton("Korblox", "Get Korblox", function()
    	local ply = game.Players.LocalPlayer
	local chr = ply.Character
	chr.RightLowerLeg.MeshId = "902942093"
	chr.RightLowerLeg.Transparency = "1"
	chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
	chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
	chr.RightFoot.MeshId = "902942089"
	chr.RightFoot.Transparency = "1"
end)
	
Section:NewButton("HeadLess", "Get Headless Not FE ⚠", function()
    	game.Players.LocalPlayer.Character.Head.Transparency = 1
	game.Players.LocalPlayer.Character.Head.Transparency = 1
	for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
		if (v:IsA("Decal")) then
			v.Transparency = 1
		end
	end
end)
Section:NewButton("Fake Macro", "C to Macro M To Speed Up And N To Speed Down", function()
    repeat wait() until game:IsLoaded() 

getgenv().Fix = true

getgenv().TeclasWS = {
    ["tecla1"] = "M", -- speed +5
    ["tecla2"] = "N", -- speed -5
    ["tecla3"] = "C" -- toggle  
}



-- // servicios
local MININOS_DOXXEADOS = game:GetService("Players")
local AUDIOS_LOUD_DE_TRAP = game:GetService("StarterGui") or "son una mierda"

-- // objetos
local neonazi = MININOS_DOXXEADOS.LocalPlayer
local esvastica = neonazi:GetMouse()

-- // variables
local lista_de_victimas_de_drizzy = getrenv()._G
local da_hood_rblxm_REAL = getrawmetatable(game)
local CP = da_hood_rblxm_REAL.__newindex
local CP_DE_DRIZZY = da_hood_rblxm_REAL.__index
local velocidad_de_cum = 222
local es_pedofilo = true

-- // funciones para acortar codigo :]
function anunciar_atentado_terrorista(fecha_del_atentado)
    AUDIOS_LOUD_DE_TRAP:SetCore("SendNotification",{
        Title="Toggled",
        Text=fecha_del_atentado,
        Icon="rbxthumb://type=Asset&id=7546367582&w=150&h=150"
       })
end


getgenv().TECHWAREWALKSPEED_LOADED = true


wait(1.5)


anunciar_atentado_terrorista("Executed Fake Macro"..TeclasWS.tecla3.."")

-- // conexión
esvastica.KeyDown:Connect(function(el_impostor)
    if el_impostor:lower() == TeclasWS.tecla1:lower() then
        velocidad_de_cum = velocidad_de_cum + 1
        anunciar_atentado_terrorista(" (speed =   "..tostring(velocidad_de_cum)..")")
    elseif el_impostor:lower() == TeclasWS.tecla2:lower() then
        velocidad_de_cum = velocidad_de_cum - 1
        anunciar_atentado_terrorista(" (speed =  "..tostring(velocidad_de_cum)..")")
    elseif el_impostor:lower() == TeclasWS.tecla3:lower() then
        if es_pedofilo then
            es_pedofilo = false
            anunciar_atentado_terrorista("speed off")
        else
            es_pedofilo = true
            anunciar_atentado_terrorista("speed on")
        end
    end
end)

-- // mi parte favorita: metametodos
setreadonly(da_hood_rblxm_REAL,false)
da_hood_rblxm_REAL.__index = newcclosure(function(BEST_ON_TOP,IS_GARBAGE)
    local esPedofilo = checkcaller()
    if IS_GARBAGE == "WalkSpeed" and not esPedofilo then
        return lista_de_victimas_de_drizzy.CurrentWS
    end
    return CP_DE_DRIZZY(BEST_ON_TOP,IS_GARBAGE)
end)
da_hood_rblxm_REAL.__newindex = newcclosure(function(kaias,ip,logger)
    local unNeonazi = checkcaller()
    if es_pedofilo then
        if ip == "WalkSpeed" and logger ~= 0 and not unNeonazi then
            return CP(kaias,ip,velocidad_de_cum)
        end
    end
    return CP(kaias,ip,logger)
end)
setreadonly(da_hood_rblxm_REAL,true)

repeat wait() until game:IsLoaded()
local Players = game:service('Players')
local Player = Players.LocalPlayer

repeat wait() until Player.Character

local userInput = game:service('UserInputService')
local runService = game:service('RunService')

local Multiplier = -0.22
local Enabled = false
local whentheflashnoiq

userInput.InputBegan:connect(function(Key)
    if Key.KeyCode == Enum.KeyCode.LeftBracket then
        Multiplier = Multiplier + 0.01
        print(Multiplier)
        wait(0.2)
        while userInput:IsKeyDown(Enum.KeyCode.LeftBracket) do
            wait()
            Multiplier = Multiplier + 0.01
            print(Multiplier)
        end
    end

    if Key.KeyCode == Enum.KeyCode.RightBracket then
        Multiplier = Multiplier - 0.01
        print(Multiplier)
        wait(0.2)
        while userInput:IsKeyDown(Enum.KeyCode.RightBracket) do
            wait()
            Multiplier = Multiplier - 0.01
            print(Multiplier)
        end
    end

    if Key.KeyCode == Enum.KeyCode.P then
        Enabled = not Enabled
        if Enabled == true then
            repeat
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier
                game:GetService("RunService").Stepped:waitn()
            until Enabled == true
        end
    end
OrionLib:MakeNotification({
	Name = "Executed!",
	Content = "Fake Macro Have Been Executed, C To Toggle!",
	Image = "rbxassetid://4483345998",
	Time = 5
})     
end)

end)
local Tab = Window:NewTab("Combat")
local Section = Tab:NewSection("Aim")
Section:NewButton("AimLock", "Q to Lock", function()
    local Settings = { AimLock = { Enabled = true, Aimlockkey = "q", Prediction = 0.130340, Aimpart = 'HumanoidRootPart', Notifications = true }, Settings = { Thickness = 3.5, Transparency = 1, Color = Color3.fromRGB(106, 13, 173), FOV = true } } local CurrentCamera = game:GetService("Workspace").CurrentCamera local Inset = game:GetService("GuiService"):GetGuiInset().Y local RunService = game:GetService("RunService") local Mouse = game.Players.LocalPlayer:GetMouse() local LocalPlayer = game.Players.LocalPlayer local Line = Drawing.new("Line") local Circle = Drawing.new("Circle") local Plr = game.Players.LocalPlayer Mouse.KeyDown:Connect(function(KeyPressed) if KeyPressed == (Settings.AimLock.Aimlockkey) then if Settings.AimLock.Enabled == true then Settings.AimLock.Enabled = false if Settings.AimLock.Notifications == true then Plr = FindClosestPlayer() game.StarterGui:SetCore("SendNotification", { Title = "p", Text = "Unlocked" }) end else Plr = FindClosestPlayer() Settings.AimLock.Enabled = true if Settings.AimLock.Notifications == true then game.StarterGui:SetCore("SendNotification", { Title = "p", Text = "Locked On : " .. tostring(Plr.Character.Humanoid.DisplayName) }) end end end end) function FindClosestPlayer() local ClosestDistance, ClosestPlayer = math.huge, nil; for _, Player in next, game:GetService("Players"):GetPlayers() do if Player ~= LocalPlayer then local Character = Player.Character if Character and Character.Humanoid.Health > 1 then local Position, IsVisibleOnViewPort = CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart .Position) if IsVisibleOnViewPort then local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude if Distance < ClosestDistance then ClosestPlayer = Player ClosestDistance = Distance end end end end end return ClosestPlayer, ClosestDistance end RunService.Heartbeat:connect(function() if Settings.AimLock.Enabled == true then local Vector = CurrentCamera:WorldToViewportPoint(Plr.Character[Settings.AimLock.Aimpart].Position + (Plr.Character[Settings.AimLock.Aimpart].Velocity * Settings.AimLock.Prediction)) Line.Color = Settings.Settings.Color Line.Transparency = Settings.Settings .Transparency Line.Thickness = Settings.Settings .Thickness Line.From = Vector2.new(Mouse.X, Mouse.Y + Inset) Line.To = Vector2.new(Vector.X, Vector.Y) Line.Visible = true Circle.Position = Vector2.new(Mouse.X, Mouse.Y + Inset) Circle.Visible = Settings.Settings.FOV Circle.Thickness = 1.5 Circle.Thickness = 2 Circle.Radius = 60 Circle.Color = Settings.Settings.Color elseif Settings.AimLock.FOV == true then Circle.Visible = true else Circle.Visible = false Line.Visible = false end end) local mt = getrawmetatable(game) local old = mt.__namecall setreadonly(mt, false) mt.__namecall = newcclosure(function(...) local args = {...} if Settings.AimLock.Enabled and getnamecallmethod() == "FireServer" and args[2] == "MousePos" then args[3] = Plr.Character[Settings.AimLock.Aimpart].Position + (Plr.Character[Settings.AimLock.Aimpart].Velocity * Settings.AimLock.Prediction) return old(unpack(args)) end return old(...) end)
end)
local Section = Tab:NewSection("Other")
Section:NewButton("Fly", "Q to Lock", function()
    
end)
local Tab = Window:NewTab("Other")
local Section = Tab:NewSection("Other")
Section:NewKeybind("Toggle GUI E", "Toggle ON or OFF The GUI", Enum.KeyCode.E, function()
	Library:ToggleUI()
end)
