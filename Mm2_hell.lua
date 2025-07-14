-- MM2 HELL SCRIPT от BigGroup 😈
local Player = game.Players.LocalPlayer
local GUI = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
GUI.Name = "MM2HellUI"
GUI.ResetOnSpawn = false

-- Фейк деньги
local coins = Instance.new("TextLabel", GUI)
coins.Size = UDim2.new(0, 350, 0, 40)
coins.Position = UDim2.new(0, 10, 0, 10)
coins.Text = "💰 Монеты: 10000000000000000000"
coins.TextScaled = true
coins.BackgroundTransparency = 1
coins.TextColor3 = Color3.fromRGB(255, 223, 0)

local gems = Instance.new("TextLabel", GUI)
gems.Size = UDim2.new(0, 350, 0, 40)
gems.Position = UDim2.new(0, 10, 0, 60)
gems.Text = "💎 Кристаллы: 99999999999999999999"
gems.TextScaled = true
gems.BackgroundTransparency = 1
gems.TextColor3 = Color3.fromRGB(0, 255, 255)

-- Gamepass Bypass
local MarketplaceService = game:GetService("MarketplaceService")
hookfunction(MarketplaceService.UserOwnsGamePassAsync, function()
	return true
end)

-- АвтоФАРМ
task.spawn(function()
	while task.wait(1) do
		pcall(function()
			local char = Player.Character
			if char and char:FindFirstChild("HumanoidRootPart") then
				char:MoveTo(Vector3.new(math.random(-50, 50), 10, math.random(-50, 50)))
			end
		end)
	end
end)

-- ЯЗЫКИ
local langs = {
	["🇷🇺"] = "Русский (платно)",
	["🇺🇦"] = "Українська (платно)",
	["🇧🇷"] = "Português",
	["🇺🇸"] = "English",
	["🇩🇪"] = "Deutsch",
	["🇸🇦"] = "العربية",
	["🇧🇩"] = "বাংলা",
	["🇩🇲"] = "Dominican",
	["🇨🇾"] = "Κυπριακή",
	["🇪🇬"] = "مصري",
	["🇩🇿"] = "الجزائرية",
	["🇩🇯"] = "Djibouti",
	["🇬🇦"] = "Gabon",
	["🇬🇵"] = "Guadeloupe",
	["🇭🇰"] = "香港",
	["🇰🇿"] = "Қазақша",
	["🇷🇼"] = "Kinyarwanda",
	["🇻🇦"] = "Vaticano"
}

local langFrame = Instance.new("Frame", GUI)
langFrame.Size = UDim2.new(0, 500, 0, 250)
langFrame.Position = UDim2.new(0.5, -250, 0.5, -125)
langFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
local grid = Instance.new("UIGridLayout", langFrame)
grid.CellSize = UDim2.new(0, 60, 0, 40)
grid.CellPadding = UDim2.new(0, 4, 0, 4)

for flag, name in pairs(langs) do
	local btn = Instance.new("TextButton", langFrame)
	btn.Text = flag
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextScaled = true
	btn.MouseButton1Click:Connect(function()
		if flag == "🇷🇺" or flag == "🇺🇦" then
			btn.Text = "💸 Платно"
		else
			btn.Text = "✅"
			langFrame:Destroy()
		end
	end)
end