local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({Name = "FurryTrollKidsV3", HidePremium = false, SaveConfig = true, ConfigFolder = "FurryTrollKidsV3"})

local Tab = Window:MakeTab({Name = "Player", Icon = "rbxassetid://4483345998",})

local PlayerDropdown = Tab:AddDropdown({
Name = "Jogadores",
Default = "Nenhum",
Options = {},
Callback = function(Value)
-- não precisa fazer nada aqui
end
})

local KickButton = Tab:AddButton({
Name = "Kick Player",
Callback = function()
local selectedPlayer = PlayerDropdown:GetValue()
if selectedPlayer ~= "Nenhum" then
for _, player in pairs(game.Players:GetPlayers()) do
if player.Name == selectedPlayer then
player:Kick("Você foi banido por irritar ZythronisGD")
break
end
end
end
end
})

local InfinityYieldButton = Tab:AddButton({
Name = "Infinity Yield",
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infinityyield/master/infinityyield.lua"))()
end
})

local TirarSarroButton = Tab:AddButton({
Name = "TIRAR SARRO",
Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/38Jra00x"))()
end
})

local EspToggle = Tab:AddToggle({
Name = "ESP",
Default = false,
Callback = function(Value)
if Value then
for _, player in pairs(game.Players:GetPlayers()) do
if player.Character then
local esp = Instance.new("BoxHandleAdornment")
esp.Parent = player.Character.HumanoidRootPart
esp.Size = player.Character.HumanoidRootPart.Size
esp.Color = Color3.new(1, 0, 0) -- vermelho
esp.Transparency = 0.5
end
end
else
for _, player in pairs(game.Players:GetPlayers()) do
if player.Character then
local esp = player.Character.HumanoidRootPart:FindFirstChild("BoxHandleAdornment")
if esp then
esp:Destroy()
end
end
end
end
end
})

local WallhackToggle = Tab:AddToggle({
Name = "Wallhack",
Default = false,
Callback = function(Value)
if Value then
for _, player in pairs(game.Players:GetPlayers()) do
if player.Character then
local wallhack = Instance.new("BoxHandleAdornment")
wallhack.Parent = player.Character.HumanoidRootPart
wallhack.Size = player.Character.HumanoidRootPart.Size
wallhack.Color = Color3.new(1, 0.5, 0.5) -- rosa
wallhack.Transparency = 0.5
end
end
else
for _, player in pairs(game.Players:GetPlayers()) do
if player.Character then
local wallhack = player.Character.HumanoidRootPart:FindFirstChild("BoxHandleAdornment")
if wallhack then
wallhack:Destroy()
end
end
end
end
end
})

local function updatePlayers()
local players = {"Nenhum"}
for _, player in pairs(game.Players:GetPlayers()) do
table.insert(players, player.Name)
end
PlayerDropdown:SetOptions(players)
end

game.Players.PlayerAdded:Connect(updatePlayers)
game.Players.PlayerRemoving:Connect(updatePlayers)

updatePlayers()

OrionLib:Init()
