repeat wait(0.1) until game:IsLoaded()

getgenv().info = {
    moneyFarm = false,
    autoRegen = false,
    muscleFarm = false
}

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChillGuy01/lua/main/main.lua", true))()

local list = {
    "Bic",
    "Peit",
    "Tri",
    "Back",
    "Ab",
    "Leg"
}

local function muscleFarm()
    spawn(function()
        while info.muscleFarm do
            wait()
            for _, muscle in ipairs(list) do
                local name = "ServerPlus"..muscle;
                game:GetService("ReplicatedStorage").Remotes.Plus:FindFirstChild(name):FireServer();
            end
        end
    end)
end

local function infinityRegen()
    spawn(function()
        while info.autoRegen do
            wait()
            game:GetService("ReplicatedStorage").Remotes.EnergyFatigue.ServerRegen:FireServer()
        end
    end)
end

local function moneyFarm()
    spawn(function()
        game.Players.LocalPlayer.Character:PivotTo(CFrame.new(-271, 20, -619))
        while info.moneyFarm do
            wait()
            game:GetService("ReplicatedStorage").Remotes.Money:FireServer()
            game:GetService("ReplicatedStorage").Remotes.Money:FireServer()
            game:GetService("ReplicatedStorage").Remotes.Money:FireServer()
            game:GetService("ReplicatedStorage").Remotes.Money:FireServer()
        end
    end)
end

local window = library:CreateMain("Olympia", "Private Script", Enum.KeyCode.RightControl)

local main = window:CreateTab("Main")

main:CreateToggle("Farm Money", function(State) 
    info.moneyFarm = State
    if State then
        moneyFarm()
    end
end)
main:CreateToggle("Farm Muscles", function(State) 
    info.muscleFarm = State
    if State then
        muscleFarm()
    end
end)
main:CreateToggle("Infinity Energy", function(State) 
    info.autoRegen = State 
    if State then
        infinityRegen()
    end
end)
