-- da_hills_hub_vip.lua by @5mewmet
-- подписка в ТГ обязательно 😈

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "hackbygpt VIP | Da Hills",
   LoadingTitle = "Загрузка VIP...",
   ConfigurationSaving = {
       Enabled = true,
       FolderName = "hackbygptVIP",
       FileName = "da_hills_vip"
   }
})

local Main = Window:CreateTab("ВСЁ В ОДНОМ 😈")

local cam = workspace.CurrentCamera
local SilentAim, AutoShoot, ShowFOV = false, false, false
local FOVRadius = 300

-- FOV круг + криповая картинка
local Circle = Drawing.new("Circle")
Circle.Thickness = 2
Circle.Radius = FOVRadius
Circle.Color = Color3.fromRGB(0, 255, 0)
Circle.Visible = false

local creepImage = Instance.new("BillboardGui", game.CoreGui)
creepImage.Size = UDim2.new(0, 100, 0, 100)
creepImage.StudsOffset = Vector3.new(0, 3, 0)
creepImage.AlwaysOnTop = true
creepImage.Enabled = false
local img = Instance.new("ImageLabel", creepImage)
img.Size = UDim2.new(1, 0, 1, 0)
img.BackgroundTransparency = 1
img.Image = "https://static.wikia.nocookie.net/secret-files/images/1/1b/Smile.jpg/revision/latest?cb=20110731135919&path-prefix=ru"

game:GetService("RunService").RenderStepped:Connect(function()
    if ShowFOV then
        Circle.Position = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
        Circle.Radius = FOVRadius
        Circle.Visible = true
        creepImage.Enabled = true
        creepImage.Position = UDim2.new(0, cam.ViewportSize.X/2 - 50, 0, cam.ViewportSize.Y/2 - 50)
    else
        Circle.Visible = false
        creepImage.Enabled = false
    end

    if AutoShoot then
        local target, mag = nil, FOVRadius
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local pos, ons = cam:WorldToViewportPoint(p.Character.Head.Position)
                if ons then
                    local d = (Vector2.new(pos.X, pos.Y) - Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)).Magnitude
                    if d < mag then mag, target = d, p end
                end
            end
        end
        if target and target.Character and target.Character:FindFirstChild("Head") then
            fireclickdetector(target.Character.Head:FindFirstChildWhichIsA("ClickDetector") or target.Character.Head)
        end
    end
end)

Main:CreateToggle({ Name="Silent Aim", CurrentValue=false, Callback=function(v) SilentAim = v end })
Main:CreateToggle({ Name="Auto Shoot", CurrentValue=false, Callback=function(v) AutoShoot = v end })
Main:CreateToggle({ Name="Show FOV", CurrentValue=false, Callback=function(v) ShowFOV = v end })
Main:CreateSlider({ Name="FOV Radius", Min=100, Max=1000, Value=300, Increment=10, Callback=function(v) FOVRadius = v end })

Main:CreateButton({ Name="Fly (двойной прыжок)", Callback=function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0"))()
end })

Main:CreateToggle({ Name="Speed Hack", CurrentValue=false, Callback=function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v and 50 or 16
end })

Main:CreateButton({ Name="ESP (basic)", Callback=function()
    loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
end })

Rayfield:Notify({ Title="VIP Загружен!", Content="Функции активны, удачи, хаосщик", Duration=5 })