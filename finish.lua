    
-- Script By Solo
-- Not all script by Solo 
-- Please don't steal my function
-- I'm using Orion Library UI for this
-- Have fun using it player

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

function Notif(lol) 
    OrionLib:MakeNotification({
        Name = "SoloCheatPanel",
        Content = lol,
        Image = "rbxassetid://4483345998",
        Time = 8
    })
    wait(8)
end

Notif("Hello there, " .. game.Players.LocalPlayer.Name)
Notif("Please be patient, we are loading the script.")

local Window = OrionLib:MakeWindow({Name = "SoloCheatPanel", HidePremium = false, SaveConfig = true, ConfigFolder = "SoloCheatPanel"})

local Main = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local function sendMessages(playerName)
    print("Hello! " .. playerName)
    wait(2)
    print("Welcome to Orion Library UI Script by Solo (Jordan)")
    wait(4)
    print("Have fun ruining the game :)")
end

Main:AddButton({
    Name = "ConsoleMessages",
    Callback = function()
    OrionLib:MakeNotification({
			Name = "Info",
			Content = "Check console",
			Image = "rbxassetid://4483345998", -- Optional icon
			Time = 5
		})
		
        local playerName = game.Players.LocalPlayer.Name
        sendMessages(playerName)
    end    
})

Main:AddButton({
    Name = "WindowsBarSection",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexsoftworks/DomainX/main/source'),true))() 
    end    
})

local function checkChatSystem()
    local TextChatService = game:GetService("TextChatService")
    
    if TextChatService and TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        OrionLib:MakeNotification({
            Name = "Chat System Status",
            Content = "Game is Currently using new chat system",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    else
        OrionLib:MakeNotification({
            Name = "Chat System Status",
            Content = "Game is currently using old chat system",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
end

Main:AddButton({
    Name = "CheckChat",
    Callback = function()
        checkChatSystem()
    end
})

Main:AddButton({
    Name = "QuickMenu",
    Callback = function()
        -- UI Library Loading (Placeholder for your preferred UI library)
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/mikhailramlal/Rizzer/main/ui"))()

-- Create the QuickHack window
local QuickHack = lib:Window("QuickHack")

-- Variables for High Speed, Antikick, Antiban, and ESP
local HighSpeedEnabled = false
local AntikickEnabled = false
local AntibanEnabled = false
local ESPEnabled = false
local normalWalkSpeed = 16 -- Default Roblox walk speed

-- Function for High Speed
function ToggleHighSpeed(state)
    HighSpeedEnabled = state
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if HighSpeedEnabled then
        humanoid.WalkSpeed = 70 -- Set speed to 70
    else
        humanoid.WalkSpeed = normalWalkSpeed -- Reset to default
    end
end

-- Function for Antikick
function ToggleAntikick(state)
    AntikickEnabled = state

    if AntikickEnabled then
        local mt = getrawmetatable(game)
        local old = mt.__namecall

        setreadonly(mt, false)

        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "Kick" then
                return nil -- Prevents the player from being kicked
            end
            return old(self, ...)
        end)

        setreadonly(mt, true)
    end
end

-- Function for Antiban
function ToggleAntiban(state)
    AntibanEnabled = state

    if AntibanEnabled then
        game.Players.LocalPlayer.OnTeleport:Connect(function(state)
            if state == Enum.TeleportState.Started then
                game:Shutdown() -- Shutdown on teleport initiation to prevent being banned
            end
        end)
    end
end

-- Function for ESP (Shows all players)
function ToggleESP(state)
    ESPEnabled = state
    if ESPEnabled then
        local function CreateESPBox(player)
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.FillColor = Color3.fromRGB(255, 255, 255) -- White ESP
            highlight.OutlineColor = Color3.fromRGB(255, 0, 0) -- Red outline
            highlight.FillTransparency = 0.8 -- Slight transparency
            highlight.OutlineTransparency = 0
        end

        -- Apply ESP to all players
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character then
                CreateESPBox(player)
            end
        end

        -- Add ESP to new players
        game.Players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function(character)
                wait(1) -- Wait for the character to load
                CreateESPBox(player)
            end)
        end)
    else
        -- Disable ESP (Remove ESP from all players)
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChildOfClass("Highlight") then
                player.Character:FindFirstChildOfClass("Highlight"):Destroy()
            end
        end
    end
end

-- High Speed Toggle
QuickHack:Toggle("High Speed On/Off", false, function(state)
    ToggleHighSpeed(state)
end)

-- Antikick Toggle
QuickHack:Toggle("Antikick On/Off", false, function(state)
    ToggleAntikick(state)
end)

-- Antiban Toggle
QuickHack:Toggle("Antiban On/Off", false, function(state)
    ToggleAntiban(state)
end)

-- ESP Toggle
QuickHack:Toggle("ESP On/Off", false, function(state)
    ToggleESP(state)
end)

-- Label to indicate creator for QuickHack GUI
QuickHack:Label("Created by Solo")

---------------------
-- Rizz GUI Section
---------------------

-- Rizz Master Lines Loader (160 Creative Rizz Master Lines)
local Rizz_Lines = {
    "Are you made of copper and tellurium? Because you’re Cu-Te.",
    "Do you have a map? I keep getting lost in your eyes.",
    "Even if there wasn't gravity on Earth, I'd still fall for you.",
    "Is your name Google? Because you’ve got everything I’m searching for.",
    "You must be a magician, every time I look at you, everyone else disappears.",
    "Do you believe in love at first sight, or should I walk by again?",
    "Is your name Wi-Fi? Because I'm feeling a connection.",
    "Are you French? Because Eiffel for you.",
    "Do you have a Band-Aid? Because I just scraped my knee falling for you.",
    "I was blinded by your beauty... I’m going to need your name and number for insurance purposes.",
    -- Add 150 more Rizz Master lines here...
    "Girl, are you a campfire? Because you're hot and I want s'more.",
    "Are you a bank loan? Because you have my interest.",
    "If you were a vegetable, you'd be a cute-cumber.",
    "Is your aura made of gold? Because you’re priceless.",
    "Even if you were a keyboard, I'd never delete you."
}

-- Create the Rizz Master GUI window
local Rizz_Main = lib:Window("Rizz Master GUI")

-- Function to send message using TextChatService or ReplicatedStorage
function Chat(message)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end

-- Rizz Line Picker Dropdown
Rizz_Main:Dropdown("Line Picker", Rizz_Lines, function(line)
    getgenv().line2 = tostring(line)
end, true)

-- Button to send the selected Rizz line
Rizz_Main:Button("Send Rizz Line", function()
    Chat(getgenv().line2)
end)

-- Label to indicate creator for Rizz GUI
Rizz_Main:Label("Created by Solo")

---------------------
-- Roast GUI Section (200 Packgod Roast Lines)
---------------------

-- Packgod Roast Lines Loader (200 Packgod-style Roast Lines)
local Roast_Lines = {
    "Boy you built like a brick with no construction permit.",
    "You look like you use Google Maps just to walk around your own house.",
    "Bro, you couldn’t hit water if you fell out of a boat.",
    "You’re the reason shampoo bottles come with instructions.",
    "If I had a dollar for every brain you don't have, I’d be rich.",
    "Boy, you look like a before picture of every fitness program.",
    "You look like you still play hide and seek by yourself.",
    "You look like you eat soup with a fork.",
    "You get lost in a phone booth with Google Maps.",
    "Bro, you look like the type of guy to ask for directions in your own house.",
    "You built like a half-deflated football.",
    "You probably clap when the plane lands.",
    "Your hairline be playing hide and seek.",
    "You out here looking like a bootleg action figure.",
    "Boy, you got hit by the ugly stick twice.",
    "Your face look like it's been buffering for 10 years.",
    "You built like a deep-fried meme.",
    "Your style be stuck in 2012 with no updates.",
    "You look like you still take your mom to parent-teacher conferences.",
    "Boy, you wear Velcro shoes so you don't trip over your own laces.",
    -- Add 180 more Packgod roast lines here...
    "You built like a bag of unseasoned popcorn.",
    "You look like you use your phone as a mirror.",
    "Boy, you probably run out of breath chewing gum.",
    "You look like you call tech support to open a PDF.",
    "You so dumb you thought a quarterback was a refund.",
    "You built like a used punching bag.",
    "Your haircut look like it was drawn with an Etch-A-Sketch.",
    "Your internet probably got a lag switch just like your brain.",
    "You the type to bring a spoon to a knife fight.",
    "You look like you skip leg day to play Minecraft."
}

-- Create the Roast GUI window
local Roast_Main = lib:Window("Roast GUI")

-- Roast Line Picker Dropdown
Roast_Main:Dropdown("Roast Picker", Roast_Lines, function(roastLine)
    getgenv().line3 = tostring(roastLine)
end, true)

-- Button to send the selected Roast line
Roast_Main:Button("Send Roast Line", function()
    Chat(getgenv().line3)
end)

-- Label to indicate creator for Roast GUI
Roast_Main:Label("Created by Solo")
    end
})

Main:AddButton({
	Name = "RunNetless",
	Callback = function()
	OrionLib:MakeNotification({
			Name = "Info",
			Content = "Check console",
			Image = "rbxassetid://4483345998", -- Optional icon
			Time = 5
		})

		print("Installing Netless...")
		wait(5)
		warn("This won't work for some animations.")
		wait(2)
		print("Loading...")
		wait(3)
		print("Netless successfully running. By Solo.")

		-- Load the additional script here
		local LocalPlayer = game:GetService("Players").LocalPlayer
		local Heartbeat = game:GetService("RunService").Heartbeat

		Heartbeat:Connect(function()
			LocalPlayer.MaximumSimulationRadius = math.huge
			sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
		end)

		wait(0.2)

		for i, v in next, LocalPlayer.Character:GetDescendants() do
			if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then 
				game:GetService("RunService").Heartbeat:Connect(function()
					v.Velocity = Vector3.new(-30, 0, 0)
				end)
			end
		end

		wait(0.2)

		local character = LocalPlayer.Character
		local tools = {}
		for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then 
				v.Parent = character
				table.insert(tools, v)
			end
		end

		wait()
		for i, v in pairs(tools) do
			v.Parent = LocalPlayer.Backpack
		end

		wait(0.1)

		game:GetService("StarterGui"):SetCore("SendNotification", { 
			Title = "Message";
			Text = "Netless Running. By Solo";
			Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"
		})
	end
})

Main:AddButton({
    Name = "StatsGUI",
    Callback = function()
        -- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Function to create a uniform GUI background for all elements
local function createGuiBackground(parent, position, size)
    local frame = Instance.new("Frame")
    frame.Size = size
    frame.Position = position
    frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
    frame.BackgroundTransparency = 0.3 -- Slight transparency
    frame.BorderSizePixel = 1
    frame.BorderColor3 = Color3.new(1, 1, 1) -- White border for visibility
    frame.Parent = parent
    return frame
end

-- Create the frame for FPS and Ping
local statsFrame = createGuiBackground(screenGui, UDim2.new(0, 10, 0, 10), UDim2.new(0, 140, 0, 60))

-- Create FPS label
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, 0, 0.5, 0)
fpsLabel.Position = UDim2.new(0, 0, 0, 0)
fpsLabel.Text = "FPS: 0"
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextScaled = true
fpsLabel.Parent = statsFrame

-- Create Ping label
local pingLabel = Instance.new("TextLabel")
pingLabel.Size = UDim2.new(1, 0, 0.5, 0)
pingLabel.Position = UDim2.new(0, 0, 0.5, 0)
pingLabel.Text = "Ping: 0 ms"
pingLabel.TextColor3 = Color3.new(1, 1, 1)
pingLabel.BackgroundTransparency = 1
pingLabel.TextScaled = true
pingLabel.Parent = statsFrame

-- Variables to track FPS
local lastUpdateTime = tick()
local frameCount = 0

-- Function to update FPS
local function updateFPS()
    local currentTime = tick()
    frameCount = frameCount + 1

    if currentTime - lastUpdateTime >= 1 then
        fpsLabel.Text = string.format("FPS: %d", frameCount)
        lastUpdateTime = currentTime
        frameCount = 0
    end
end

-- Connect to RunService Heartbeat to update FPS
game:GetService("RunService").Heartbeat:Connect(updateFPS)

-- Update Ping using Roblox API
local function updatePing()
    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    pingLabel.Text = string.format("Ping: %s", ping)
end

-- Update Ping every frame
game:GetService("RunService").RenderStepped:Connect(function()
    updatePing()
end)

-- Create the frame for PlayerHealth at the bottom right corner
local healthFrame = createGuiBackground(screenGui, UDim2.new(1, -150, 1, -40), UDim2.new(0, 140, 0, 30))

-- Create PlayerHealth label
local healthLabel = Instance.new("TextLabel")
healthLabel.Size = UDim2.new(1, 0, 1, 0)
healthLabel.Position = UDim2.new(0, 0, 0, 0)
healthLabel.Text = "PlayerHealth: 100"
healthLabel.TextColor3 = Color3.new(1, 1, 1)
healthLabel.BackgroundTransparency = 1
healthLabel.TextScaled = true
healthLabel.Parent = healthFrame

-- Update PlayerHealth
local function updatePlayerHealth()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character.Humanoid
        healthLabel.Text = string.format("PlayerHealth: %.0f", humanoid.Health)

        humanoid.Died:Connect(function()
            healthLabel.Text = "PlayerHealth: 0"
        end)
    end
end

local function setupCharacter()
    updatePlayerHealth()
end

-- Call setupCharacter when character is added or respawned
game.Players.LocalPlayer.CharacterAdded:Connect(setupCharacter)
setupCharacter()

-- Create the frame for PlayerCount
local playerCountFrame = createGuiBackground(screenGui, UDim2.new(0, 10, 1, -80), UDim2.new(0, 140, 0, 30))

-- Create PlayerCount label
local playerCountLabel = Instance.new("TextLabel")
playerCountLabel.Size = UDim2.new(1, 0, 1, 0)
playerCountLabel.Position = UDim2.new(0, 0, 0, 0)
playerCountLabel.Text = "0/0 Players"
playerCountLabel.TextColor3 = Color3.new(1, 1, 1)
playerCountLabel.BackgroundTransparency = 1
playerCountLabel.TextScaled = true
playerCountLabel.Parent = playerCountFrame

-- Update PlayerCount
local function updatePlayerCount()
    local playerCount = #game.Players:GetPlayers()
    local maxPlayers = game:GetService("Players").MaxPlayers
    playerCountLabel.Text = string.format("%d/%d Players", playerCount, maxPlayers)
end

game.Players.PlayerAdded:Connect(updatePlayerCount)
game.Players.PlayerRemoving:Connect(updatePlayerCount)
updatePlayerCount()

-- Create the frame for Coordinates and Speed in the top right corner
local coordSpeedFrame = createGuiBackground(screenGui, UDim2.new(1, -150, 0, 10), UDim2.new(0, 140, 0, 60))

-- Create Coordinates label
local coordsLabel = Instance.new("TextLabel")
coordsLabel.Size = UDim2.new(1, 0, 0.5, 0)
coordsLabel.Position = UDim2.new(0, 0, 0, 0)
coordsLabel.Text = "Coordinates: (0, 0, 0)"
coordsLabel.TextColor3 = Color3.new(1, 1, 1)
coordsLabel.BackgroundTransparency = 1
coordsLabel.TextScaled = true
coordsLabel.Parent = coordSpeedFrame

-- Create Speed label
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0.5, 0)
speedLabel.Position = UDim2.new(0, 0, 0.5, 0)
speedLabel.Text = "Speed: 0"
speedLabel.TextColor3 = Color3.new(1, 1, 1)
speedLabel.BackgroundTransparency = 1
speedLabel.TextScaled = true
speedLabel.Parent = coordSpeedFrame

-- Update Coordinates and Speed
local function updateCoordinatesAndSpeed()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = player.Character.HumanoidRootPart
        local position = humanoidRootPart.Position
        coordsLabel.Text = string.format("Coordinates: (%.2f, %.2f, %.2f)", position.X, position.Y, position.Z)

        -- Update Speed
        local speed = humanoidRootPart.Velocity.Magnitude
        speedLabel.Text = string.format("Speed: %.2f", speed)
    end
end

-- Update Coordinates and Speed on Heartbeat
game:GetService("RunService").Heartbeat:Connect(updateCoordinatesAndSpeed)

-- Create the frame for Time and Game Information
local timeGameFrame = createGuiBackground(screenGui, UDim2.new(0.5, -70, 0, 10), UDim2.new(0, 140, 0, 30))

-- Create Time label
local timeLabel = Instance.new("TextLabel")
timeLabel.Size = UDim2.new(1, 0, 0.5, 0)
timeLabel.Position = UDim2.new(0, 0, 0, 0)
timeLabel.Text = "Time: 0:00"
timeLabel.TextColor3 = Color3.new(1, 1, 1)
timeLabel.BackgroundTransparency = 1
timeLabel.TextScaled = true
timeLabel.Parent = timeGameFrame

-- Create Game Name label
local gameLabel = Instance.new("TextLabel")
gameLabel.Size = UDim2.new(1, 0, 0.5, 0)
gameLabel.Position = UDim2.new(0, 0, 0.5, 0)
gameLabel.Text = "Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
gameLabel.TextColor3 = Color3.new(1, 1, 1)
gameLabel.BackgroundTransparency = 1
gameLabel.TextScaled = true
gameLabel.Parent = timeGameFrame

-- Update Time
local function updateTime()
    local currentTime = os.date("*t")
    timeLabel.Text = string.format("Time: %02d:%02d", currentTime.hour, currentTime.min)
end

-- Update Time every minute
while true do
    updateTime()
    wait(60) -- Update every minute
end
    end
})

local Player = Window:MakeTab({
    Name = "Player",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Player:AddSlider({
    Name = "Speed",
    Min = 0,
    Max = 500,
    Default = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Speed",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end    
})

Player:AddSlider({
    Name = "Jump Power",
    Min = 0,
    Max = 500,
    Default = game.Players.LocalPlayer.Character.Humanoid.JumpPower,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Jump Power",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end    
})

Player:AddButton({
    Name = "Sit",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.Sit = true
        end
    end
})

Player:AddButton({
    Name = "Shiftlock",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Permanent-Shiftlock-V2-14049"))()
    end
})

Player:AddButton({
    Name = "Calendar",
    Callback = function()
        local currentDateTime = os.date("*t")  -- Get the current date and time
        local dayOfWeek = os.date("%A")  -- Get the day of the week
        local day = currentDateTime.day
        local month = os.date("%B")  -- Get the full month name
        local year = currentDateTime.year
        local hour = currentDateTime.hour
        local minute = currentDateTime.min
        local period = hour >= 12 and "PM" or "AM"  -- Determine AM or PM

        -- Format hour in 12-hour format
        hour = hour % 12
        if hour == 0 then
            hour = 12
        end

        local dateTimeString = string.format("%s, %d%s %s %d | Time: %02d:%02d %s", 
            dayOfWeek, 
            day, 
            (day % 10 == 1 and day ~= 11) and "st" or 
            (day % 10 == 2 and day ~= 12) and "nd" or 
            (day % 10 == 3 and day ~= 13) and "rd" or "th", 
            month, 
            year, 
            hour, 
            minute, 
            period)

        print(dateTimeString)  -- Print the date and time in the console
        OrionLib:MakeNotification({
            Name = "Today:",
            Content = dateTimeString,
            Duration = 5
        })
        
        OrionLib:MakeNotification({
			Name = "Creator",
			Content = "By Solo",
			Image = "rbxassetid://4483345998", -- Optional icon
			Time = 5
		})
    end
})

local function capitalizeFirstLetter(str)
    return str:gsub("(%a)(%w*)", function(firstLetter, rest)
        return firstLetter:upper() .. rest:lower()
    end)
end

Player:AddButton({
    Name = "GetMyInfo",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Info",
            Content = "Check Console",
            Time = 2, -- Time in seconds for how long the notification stays on screen
        })
        
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        local accountAge = player.AccountAge or 0
        local years = math.floor(accountAge / 365)
        local days = accountAge % 365
        local accountAgeString = string.format("%d Year(s) And %d Day(s)", years, days)

        local joinDate = os.date("%d-%m-%Y", os.time() - (accountAge * 24 * 3600))

        local playerName = player.Name or "Unknown"
        local playerId = player.UserId or "Unknown"
        local playerHealth = humanoid.Health or 0

        local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
        local stats = game:GetService("Stats")
        local ping = math.floor(stats.Network.ServerStatsItem["Data Ping"]:GetValue())

        local todayDate = os.date("%d %B, %A %I:%M %p %Y")

        local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "Unknown Game"
        local gameId = game.PlaceId or "Unknown ID"

        local userInputService = game:GetService("UserInputService")
        local deviceType
        if userInputService.TouchEnabled and not userInputService.KeyboardEnabled then
            deviceType = "Mobile"
        elseif userInputService.TouchEnabled and userInputService.KeyboardEnabled then
            deviceType = "Tablet"
        elseif userInputService.GamepadEnabled then
            deviceType = "Console"
        else
            deviceType = "PC"
        end

        local httpService = game:GetService("HttpService")
        local locationData = httpService:JSONDecode(game:HttpGet("http://ip-api.com/json/"))

        print("Info Data: ")
        for key, value in pairs(locationData) do
            print(capitalizeFirstLetter(key) .. ": " .. tostring(value))
        end

        local ipAddress = locationData.query
        local postal = locationData.zip or "Unknown"
        local countryCode = locationData.countryCode
        local countryData = httpService:JSONDecode(game:HttpGet("https://restcountries.com/v3.1/all"))
        local capitalOfCountry

        for _, countryInfo in pairs(countryData) do
            if countryInfo.cca2 == countryCode then
                capitalOfCountry = countryInfo.capital and countryInfo.capital[1] or "Unknown"
                break
            end
        end
        
        local latitude = locationData.lat or 0
        local longitude = locationData.lon or 0

        local north = latitude > 0 and latitude or -latitude
        local south = latitude < 0 and -latitude or latitude
        local east = longitude > 0 and longitude or -longitude
        local west = longitude < 0 and -longitude or longitude
        
        local serverCode = game.JobId or "Unknown"
        
        print("| User: " .. capitalizeFirstLetter(playerName) .. " | ID: " .. tostring(playerId) .. " | Country: (Logged)")
        print("| IP Address: (Logged) | Account Age: " .. accountAgeString .. " | Joined: " .. joinDate .. " | Place: (Logged)")
        print("| PlayerHealth: " .. playerHealth)
        print("| FPS: " .. fps .. " | Ping: " .. ping)
        print("| TodayDate: " .. todayDate)
        print("| Device: " .. deviceType)
        print("| Playing: " .. capitalizeFirstLetter(gameName) .. " [" .. gameId .. "]")
        print("| Capital Of Country: " .. capitalOfCountry)
        print("| Postal Code: " .. postal)
        print("| WiFi: (Logged) | HTTP: Nil")
        print("| Data: (Logged) | API: (Logged)")
        print("| Country Coordinates: N: " .. north .. " S: " .. south .. " E: " .. east .. " W: " .. west)
        print("| Server Code: " .. serverCode)
        wait(5)
        print(" [Created by SoloMadedJordan]")
    end
})

-- Cheats Tab
local Cheats = Window:MakeTab({
    Name = "Cheats",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Cheats:AddButton({
    Name = "Speed 100",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end    
})

Cheats:AddButton({
    Name = "SpeedReset",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end    
})

Cheats:AddButton({
    Name = "HideAllPlayers (Client)",
    Callback = function()
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.Parent = nil
            end
        end
    end    
})

Cheats:AddButton({
    Name = "UnhideAllPlayers (Client)",
    Callback = function()
        for _, player in pairs(game.Players:GetPlayers()) do
            if not player.Character.Parent then
                player.Character.Parent = game.Workspace
            end
        end
    end    
})

Cheats:AddButton({
    Name = "ShowInvisibleBlocks",
    Callback = function()
        for _, part in pairs(game.Workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Transparency == 1 then
                part.Transparency = 0.5
            end
        end
    end
})

Cheats:AddButton({
    Name = "UnshowInvisibleBlocks",
    Callback = function()
        for _, part in pairs(game.Workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Transparency == 0.5 then
                part.Transparency = 1
            end
        end
    end
})

-- SoloCheats Tab
local SoloCheats = Window:MakeTab({
    Name = "SoloCheats",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Click TP
local clickTPEnabled = false
local mouse = game.Players.LocalPlayer:GetMouse()

SoloCheats:AddToggle({
    Name = "ClickTP (Toggle)",
    Default = false,
    Callback = function(state)
        clickTPEnabled = state
        if state then
            mouse.Button1Down:Connect(function()
                if clickTPEnabled and mouse.Target then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p)
                end
            end)
        end
    end
})

-- Bring All (Client)
SoloCheats:AddButton({
    Name = "Bring All (Client)",
    Callback = function()
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                v.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end    
})

-- Bring Random (Client)
SoloCheats:AddButton({
    Name = "Bring Random (Client)",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        if randomPlayer ~= game.Players.LocalPlayer then
            randomPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end    
})

-- TpToRandom (Client)
SoloCheats:AddButton({
    Name = "TpToRandom",
    Callback = function()
        local players = game.Players:GetPlayers()
        if #players > 1 then
            local randomPlayer = players[math.random(1, #players)]
            if randomPlayer ~= game.Players.LocalPlayer then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = randomPlayer.Character.HumanoidRootPart.CFrame
            end
        else
            Notif("No players available to teleport to!")
        end
    end    
})

-- ESP (Toggle)
SoloCheats:AddToggle({
    Name = "ESP (Toggle)",
    Default = false,
    Callback = function(state)
        if state then
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local espBox = Instance.new("BoxHandleAdornment")
                    espBox.Adornee = v.Character.HumanoidRootPart
                    espBox.Size = v.Character.HumanoidRootPart.Size
                    espBox.Color3 = Color3.new(1, 1, 1)
                    espBox.Transparency = 0.5
                    espBox.ZIndex = 0
                    espBox.AlwaysOnTop = true
                    espBox.Parent = v.Character.HumanoidRootPart
                end
            end
        else
            for _, v in pairs(game.Players:GetPlayers()) do
                if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    for _, obj in pairs(v.Character.HumanoidRootPart:GetChildren()) do
                        if obj:IsA("BoxHandleAdornment") then
                            obj:Destroy()
                        end
                    end
                end
            end
        end
    end
})

-- LeaveGame Button
SoloCheats:AddButton({
    Name = "LeaveGame",
    Callback = function()
        game.Players.LocalPlayer:Kick("You lefted the game lol. Error code: 1")
    end    
})

-- Special Tab
local Special = Window:MakeTab({
    Name = "Special",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Special:AddButton({
    Name = "InfiniteYield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end    
})

Special:AddButton({
    Name = "GhostHub",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
    end    
})

-- Add Color Picker
Special:AddColorpicker({
    Name = "Colorpicker",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        print(Value)
    end  
})

Special:AddButton({
    Name = "ItemGetterGUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gametoolgiver.lua"))()
    end    
})

-- Exploit Tab
local Exploit = Window:MakeTab({
    Name = "Exploit",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Exploit:AddButton({
    Name = "1x1x1x1 GUI (Client)",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-1X1X1X1-GUI-PLS-LIKE-11504"))()
    end    
})

Exploit:AddButton({
    Name = "C00lGui (Serverside)",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-menu-c00lkidd-18800"))()
    end    
})

Exploit:AddButton({
    Name = "C00lGuiV2 (Serverside)",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-coolkid-gui-15453"))()
    end    
})

Exploit:AddButton({
    Name = "LalolBackdoorEXE",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Backdoor-game-15740"))()
    end    
})

Exploit:AddButton({
    Name = "SoloKeyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoloMadedHacker/LolKeyboard/main/Lua.lua"))()
    end    
})

Exploit:AddButton({
    Name = "Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GGH52lan/GGH52lan/main/keyboard.txt"))()
    end    
})

Exploit:AddButton({
    Name = "IPLogger (Reborn) ",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-IP-Logger-VFI-V2-18761"))()
    end    
})

Exploit:AddButton({
    Name = "Mouse Cursor",
    Callback = function()
        loadstring(game:HttpGet(('https://pastefy.ga/V75mqzaz/raw'),true))()
    end    
})

local EnergizeAnim = Window:MakeTab({
    Name = "EnergizeAnim",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

EnergizeAnim:AddButton({
    Name = "EnergizeOriginal",
    Callback = function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/1p6xnBNf'),true))()
    end    
})

EnergizeAnim:AddButton({
    Name = "EnergizeRemake",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Energize-10408"))()
    end    
})

EnergizeAnim:AddButton({
    Name = "EnergizeRemastered",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/JE4628uS"))()
    end    
})

local Anim = Window:MakeTab({
    Name = "Anim",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Anim:AddButton({
    Name = "HugHub",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Hug-Gui-R6-17818"))()
    end    
})

Anim:AddButton({
    Name = "OldAnim (No netless)",
    Callback = function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/6GNkQUu6'),true))() 
    end    
})

Anim:AddButton({
	Name = "ResetAnim (Works some only)",
	Callback = function()
	OrionLib:MakeNotification({
			Name = "Message",
			Content = "Successfully reseted animation!",
			Image = "rbxassetid://4483345998", -- Optional icon
			Time = 5
		})
		
		local LocalPlayer = game:GetService("Players").LocalPlayer
		if LocalPlayer.Character then
			LocalPlayer.Character:BreakJoints()
		end
	end
})

Anim:AddButton({
	Name = "SillyBoyAnim",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Silly-animation-V4-16636"))()
	end
})

Anim:AddButton({
	Name = "SillySadBoyAnim",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Silly-Sadboy-15795"))()
	end
})

Anim:AddButton({
	Name = "Bleach (JustInCase)",
	Callback = function()
		print("Do ya need a bleach?")
STOP = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)
STOP.SoundId = "http://roblox.com/asset?id=356970690"
STOP.Looped = true
STOP:Play()
STOP.Volume = 2
plr = game.Players.LocalPlayer
char = plr.Character
mouse = plr:GetMouse()
local cough = Instance.new("Sound", workspace)
cough.SoundId = "http://roblox.com/asset?id=178522287"
Bleach = Instance.new("Part", char["Left Arm"])
Bleach.CanCollide = false
Mesh = Instance.new("SpecialMesh", Bleach)
Mesh.MeshId = "http://roblox.com/asset?id=483388971"
Mesh.Scale = Vector3.new(0.005, 0.005, 0.005)
Mesh.TextureId = "http://roblox.com/asset?id=520016684"
Handy = Instance.new("Weld", Bleach)
Handy.Part0 = Bleach
Handy.Part1 = char["Left Arm"]
Handy.C0 = CFrame.new(0.5,1.8,0)
Handy.C1 = CFrame.Angles(0,4,1)
drink = Instance.new("Sound", char.Head)
drink.SoundId = "http://roblox.com/asset?id=10722059"
function cringe(key)
	key = key:lower()
	if key == "q" then
		game.Chat:Chat(char.Head,"This is too cringe","Blue")
		wait(2)
		game.Chat:Chat(char.Head,"This needs to stop, now","Red")
		wait(2)
		game.Chat:Chat(char.Head,"This is cancer.","Red")
		wait(2)
		game.Chat:Chat(char.Head,"This is too strong","Red")
		wait(2)
		game.Chat:Chat(char.Head,"I need to die","Red")
		for i = 1,10 do
			wait()
			char.HumanoidRootPart.RootJoint.C0 = char.HumanoidRootPart.RootJoint.C0 * CFrame.Angles(-0.018,0,0)
			Handy.C0 = Handy.C0 * CFrame.new(-0.05,-0.07,0.09)
			Handy.C0 = Handy.C0 * CFrame.Angles(0.12,0,0)
			char.Torso["Left Shoulder"].C0 = char.Torso["Left Shoulder"].C0 * CFrame.Angles(0.2,0,-0.1)
		end
                STOP.Volume = 0
		drink:Play()
		for i = 1,50 do
			wait()
			char.Humanoid.Health = char.Humanoid.Health - 1
		end
		char.Humanoid.WalkSpeed = 0
		wait(2)
		for i = 1,10 do
			wait()
			char.HumanoidRootPart.RootJoint.C0 = char.HumanoidRootPart.RootJoint.C0 * CFrame.Angles(0.018,0,0)
			Handy.C0 = Handy.C0 * CFrame.new(0.05,0.07,-0.09)
			Handy.C0 = Handy.C0 * CFrame.Angles(-0.12,0,0)
			char.Torso["Left Shoulder"].C0 = char.Torso["Left Shoulder"].C0 * CFrame.Angles(-0.2,0,0.1)
		end
		char.Humanoid.WalkSpeed = 6
		cough:Play()
		for i = 1,100 do
			wait(0.05)
			char.Humanoid.Health = char.Humanoid.Health - 1
		end
		end
end
function kys()
	        cough:destroy()
			local ded = Instance.new("Sound", char.Head)
			ded.SoundId = "http://roblox.com/asset?id=393884633"
			ded:Play()
			end
mouse.KeyDown:connect(cringe)
char.Humanoid.Died:connect(kys)
	end
})

Anim:AddButton({
	Name = "CocaCola",
	Callback = function()
wait(2)

local player = game.Players.LocalPlayer
local char = player.Character
local mouse = player:GetMouse()
local canAttack = false
local damage = false
local rootJointC0 = char.HumanoidRootPart.RootJoint.C0
char.Torso["Right Shoulder"]:Remove()

--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Part0 = Instance.new("Part")
Part0:BreakJoints()
Weld1 = Instance.new("Weld")
Weld2 = Instance.new("Weld")
Weld3 = Instance.new("Weld")
SpecialMesh2 = Instance.new("SpecialMesh")
Part0.Name = "Handle"
Part0.Parent = mas
Part0.BrickColor = BrickColor.new("Mid gray")
Part0.Rotation = Vector3.new(-180, 0, 180)
Part0.FormFactor = Enum.FormFactor.Plate
Part0.Size = Vector3.new(1, 1.20000005, 1)
Part0.CFrame = CFrame.new(-18.1699982, 0.600000024, -0.639984131, -1, -1.21401766e-17, -2.78761293e-23, -1.21401766e-17, 1, 1.21401766e-17, 2.78761293e-23, 1.21401766e-17, -1)
Part0.BottomSurface = Enum.SurfaceType.Smooth
Part0.TopSurface = Enum.SurfaceType.Smooth
Part0.Color = Color3.new(0.803922, 0.803922, 0.803922)
Part0.Position = Vector3.new(-18.1699982, 0.600000024, -0.639984131)
Part0.Orientation = Vector3.new(0, -180, 0)
Part0.Color = Color3.new(0.803922, 0.803922, 0.803922)
Weld1.C0 = Weld1.C0 * CFrame.new(0,-1,-0.5) * CFrame.fromEulerAnglesXYZ(-1.5,0,0)
Weld1.Parent = char["Right Arm"]
Weld1.Part0 = char["Right Arm"]
Weld1.Part1 = Part0
Weld2.C0 = CFrame.new(1.5,0.5,0)
Weld2.C1 = CFrame.new(0,0.5,0)
Weld2.Parent = char.Torso
Weld2.Part0 = char.Torso
Weld2.Part1 = char["Right Arm"]
Weld3.C0 = CFrame.new(-1.5,0.5,0)
Weld3.C1 = CFrame.new(0,0.5,0)
Weld3.Parent = char.Torso
Weld3.Part0 = char.Torso
Weld3.Part1 = nil
SpecialMesh2.Parent = Part0
SpecialMesh2.MeshId = "http://www.roblox.com/asset/?id=10470609"
SpecialMesh2.Scale = Vector3.new(1.5, 1.5, 1.5)
SpecialMesh2.TextureId = "http://www.roblox.com/asset/?id=10483355"
SpecialMesh2.MeshType = Enum.MeshType.FileMesh
SpecialMesh2.Scale = Vector3.new(1.5, 1.5, 1.5)
for i,v in pairs(mas:GetChildren()) do
	v.Parent = char
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end

for i = 1,15 do
Weld2.C0 = Weld2.C0 * CFrame.Angles(0.1,0,0)
wait()
end

canAttack = true

char.Humanoid.Died:connect(function()
local sound = Instance.new("Sound",char)
sound.SoundId = "rbxassetid://182003383"
sound.Pitch = 1
sound:Play()
end)

mouse.Button1Down:connect(function()
if canAttack == true then
canAttack = false
for i = 1,10 do
Weld2.C0 = Weld2.C0 * CFrame.Angles(0,0,-0.1)
wait()
end
for i = 1,5 do
Weld1.C0 = Weld1.C0 * CFrame.Angles(0,0,0.1)
wait()
end
local drink = Instance.new("Sound", char)
drink.SoundId = "rbxassetid://10722059"
drink.Volume = 5
drink:Play()
wait(3)
char:FindFirstChild("Humanoid").Health = char:FindFirstChild("Humanoid").Health + 20
char:FindFirstChild("Humanoid").WalkSpeed = char:FindFirstChild("Humanoid").WalkSpeed + 0.1
for i = 1,5 do
Weld1.C0 = Weld1.C0 * CFrame.Angles(0,0,-0.1)
wait()
end
for i = 1,10 do
Weld2.C0 = Weld2.C0 * CFrame.Angles(0,0,0.1)
wait()
end
canAttack = true
end
end)

mouse.KeyDown:connect(function(key)
if key:lower() == "q" and canAttack == true then
canAttack = false
for i = 1,10 do
Weld2.C0 = Weld2.C0 * CFrame.Angles(0.1,0,0)
wait()
end
damage = true
for i = 1,19 do
Weld2.C0 = Weld2.C0 * CFrame.Angles(-0.1,0,0)
wait()
end
for i = 1,9 do
Weld2.C0 = Weld2.C0 * CFrame.Angles(0.1,0,0)
wait()
end
damage = false
canAttack = true
elseif key:lower() == "e" and canAttack == true then
canAttack = false
Weld3.Part1 = char["Left Arm"]
char.Torso["Left Shoulder"].Part1 = nil
for i = 1,15 do
Weld3.C0 = Weld3.C0 * CFrame.Angles(0.1,0,0)
wait()
end
for i = 1,15 do
Weld2.C0 = Weld2.C0 * CFrame.Angles(0,0,0.1)
Weld3.C0 = Weld3.C0 * CFrame.Angles(0,0,-0.1)
wait()
end
damage = true
for i = 1,400 do
char.HumanoidRootPart.RootJoint.C0 = char.HumanoidRootPart.RootJoint.C0 * CFrame.Angles(0,0,0.1)
wait()
end
char.HumanoidRootPart.RootJoint.C0 = rootJointC0
damage = false
for i = 1,15 do
Weld2.C0 = Weld2.C0 * CFrame.Angles(0,0,-0.1)
wait()
end
Weld3.C0 = CFrame.new(-1.5,0.5,0)
char.Torso["Left Shoulder"].Part1 = char["Left Arm"]
Weld3.Part1 = nil
canAttack = true
elseif key:lower() == "r" and canAttack == true then
canAttack = false
for i = 1,13 do
Weld2.C0 = Weld2.C0 * CFrame.Angles(0.1,0,0)
wait()
end
wait(5)
Part0.Transparency = 1
local fake = Part0:Clone()
fake.Parent = char
fake.CanCollide = false
fake.Position = Part0.Position
fake.Transparency = 0
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Parent = fake
bodyVelocity.Velocity = char.Torso.CFrame.lookVector * 90
fake.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") and hit.Parent ~= char then
hit.Parent:FindFirstChild("Humanoid").Health = hit.Parent:FindFirstChild("Humanoid").Health - 10
hit.Parent:FindFirstChild("Humanoid").Sit = true
fake:Remove()
end
end)
for i = 1,13 do
Weld2.C0 = Weld2.C0 * CFrame.Angles(-0.1,0,0)
wait()
end
for i = 1,100 do
Part0.Transparency = Part0.Transparency - 0.01
wait()
end
Part0.Transparency = 0
canAttack = true
elseif key:lower() == "t" and canAttack == true and mouse.Target ~= nil then
canAttack = false
local victim = mouse.Target.Parent
local humanoid = victim:FindFirstChild("Humanoid")
if humanoid == nil then
canAttack = true
return
end
humanoid.WalkSpeed = 0
char.Humanoid.WalkSpeed = 0
Part0.Transparency = 1
Weld2.C0 = CFrame.new(1.5,0.5,0)
local fake = Part0:Clone()
fake.Parent = char
fake.Transparency = 0
local fakeWeld = Instance.new("Weld")
fakeWeld.C0 = fakeWeld.C0 * CFrame.new(0,-1,-0.5) * CFrame.fromEulerAnglesXYZ(-1.5,0,0)
fakeWeld.Part0 = victim["Right Arm"]
fakeWeld.Part1 = fake
fakeWeld.Parent = victim["Right Arm"]
local armWeld = Instance.new("Weld")
armWeld.C0 = CFrame.new(1.5,0.5,0)
armWeld.C1 = CFrame.new(0,0.5,0)
armWeld.Parent = victim.Torso
armWeld.Part0 = victim.Torso
armWeld.Part1 = victim["Right Arm"]
for i = 1,15 do
armWeld.C0 = armWeld.C0 * CFrame.Angles(0.1,0,0)
wait()
end
for i = 1,10 do
armWeld.C0 = armWeld.C0 * CFrame.Angles(0,0,-0.1)
wait()
end
for i = 1,5 do
fakeWeld.C0 = fakeWeld.C0 * CFrame.Angles(0,0,0.1)
wait()
end
local drink = Instance.new("Sound", victim)
drink.SoundId = "rbxassetid://10722059"
drink.Volume = 5
drink:Play()
wait(3)
fakeWeld:Remove()
victim.Head.BrickColor = BrickColor.new("Medium green")
if victim.Head:FindFirstChild("face") then
victim.Head.face.Texture = "http://www.roblox.com/asset/?id=137852314"
end
humanoid.PlatformStand = true
for i = 1,humanoid.MaxHealth do
humanoid.Health = humanoid.Health - 1
wait()
end
char.Humanoid.WalkSpeed = 16
for i = 1,100 do
Part0.Transparency = Part0.Transparency - 0.01
wait()
end
Part0.Transparency = 0
for i = 1,15 do
Weld2.C0 = Weld2.C0 * CFrame.Angles(0.1,0,0)
wait()
end
canAttack = true
elseif key:lower() == "y" and canAttack == true and mouse.Target ~= nil then
canAttack = false
local victim = mouse.Target.Parent
local humanoid = victim:FindFirstChild("Humanoid")
if humanoid == nil then
canAttack = true
return
end
humanoid.WalkSpeed = 0
char.Humanoid.WalkSpeed = 0
Part0.Transparency = 1
Weld2.C0 = CFrame.new(1.5,0.5,0)
local fake = Part0:Clone()
fake.Parent = char
fake.Transparency = 0
local fakeWeld = Instance.new("Weld")
fakeWeld.C0 = fakeWeld.C0 * CFrame.new(0,-1,-0.5) * CFrame.fromEulerAnglesXYZ(-1.5,0,0)
fakeWeld.Part0 = victim["Right Arm"]
fakeWeld.Part1 = fake
fakeWeld.Parent = victim["Right Arm"]
local armWeld = Instance.new("Weld")
armWeld.C0 = CFrame.new(1.5,0.5,0)
armWeld.C1 = CFrame.new(0,0.5,0)
armWeld.Parent = victim.Torso
armWeld.Part0 = victim.Torso
armWeld.Part1 = victim["Right Arm"]
for i = 1,15 do
armWeld.C0 = armWeld.C0 * CFrame.Angles(0.1,0,0)
wait()
end
for i = 1,10 do
armWeld.C0 = armWeld.C0 * CFrame.Angles(0,0,-0.1)
wait()
end
for i = 1,5 do
fakeWeld.C0 = fakeWeld.C0 * CFrame.Angles(0,0,0.1)
wait()
end
local drink = Instance.new("Sound", victim)
drink.SoundId = "rbxassetid://10722059"
drink.Volume = 5
drink:Play()
wait(3)
fake:Remove()
humanoid.Health = humanoid.Health + 20
char.Humanoid.WalkSpeed = 16
for i = 1,10 do
armWeld.C0 = armWeld.C0 * CFrame.Angles(0,0,0.1)
wait()
end
for i = 1,15 do
armWeld.C0 = armWeld.C0 * CFrame.Angles(-0.1,0,0)
wait()
end
for i = 1,100 do
Part0.Transparency = Part0.Transparency - 0.01
wait()
end
Part0.Transparency = 0
for i = 1,15 do
Weld2.C0 = Weld2.C0 * CFrame.Angles(0.1,0,0)
wait()
end
canAttack = true
elseif key:lower() == "u" and canAttack == true and mouse.Target ~= nil then
canAttack = false
local victim = mouse.Target.Parent
local humanoid = victim:FindFirstChild("Humanoid")
if humanoid == nil then
canAttack = true
return
end
humanoid.WalkSpeed = 0
char.Humanoid.WalkSpeed = 0
Part0.Transparency = 1
Weld2.C0 = CFrame.new(1.5,0.5,0)
local fake = Part0:Clone()
fake.Parent = char
fake.Transparency = 0
local fakeWeld = Instance.new("Weld")
fakeWeld.C0 = fakeWeld.C0 * CFrame.new(0,-1,-0.5) * CFrame.fromEulerAnglesXYZ(-1.5,0,0)
fakeWeld.Part0 = victim["Right Arm"]
fakeWeld.Part1 = fake
fakeWeld.Parent = victim["Right Arm"]
local armWeld = Instance.new("Weld")
armWeld.C0 = CFrame.new(1.5,0.5,0)
armWeld.C1 = CFrame.new(0,0.5,0)
armWeld.Parent = victim.Torso
armWeld.Part0 = victim.Torso
armWeld.Part1 = victim["Right Arm"]
for i = 1,15 do
armWeld.C0 = armWeld.C0 * CFrame.Angles(0.1,0,0)
wait()
end
for i = 1,10 do
armWeld.C0 = armWeld.C0 * CFrame.Angles(0,0,-0.1)
wait()
end
for i = 1,5 do
fakeWeld.C0 = fakeWeld.C0 * CFrame.Angles(0,0,0.1)
wait()
end
local drink = Instance.new("Sound", victim)
drink.SoundId = "rbxassetid://10722059"
drink.Volume = 5
drink:Play()
wait(3)
local freezing = Instance.new("Sound", victim)
freezing.SoundId = "rbxassetid://268249319"
freezing.Volume = 5
freezing:Play()
local value = Instance.new("BoolValue",victim)
value.Name = "Frozen"
value.Value = true
for i,v in pairs(victim:GetChildren()) do
if v.ClassName == "Part" then
v.BrickColor = BrickColor.new("Bright blue")
v.Anchored = true
end
end
char.Humanoid.WalkSpeed = 16
for i = 1,100 do
Part0.Transparency = Part0.Transparency - 0.01
wait()
end
Part0.Transparency = 0
for i = 1,15 do
Weld2.C0 = Weld2.C0 * CFrame.Angles(0.1,0,0)
wait()
end
canAttack = true
end
end)

Part0.Touched:connect(function(hit)
if damage == true then
if hit.Parent:FindFirstChild("Humanoid") and hit.Parent ~= char then
hit.Parent:FindFirstChild("Humanoid").Health = hit.Parent:FindFirstChild("Humanoid").Health - 10
hit.Parent:FindFirstChild("Humanoid").Sit = true
local hit0 = Instance.new("Sound", hit)
hit0.SoundId = "rbxassetid://260430060"
hit0.Volume = 3
local hit1 = Instance.new("Sound", hit)
hit1.SoundId = "rbxassetid://138087186"
hit1.Volume = 3
local hit2 = Instance.new("Sound", hit)
hit2.SoundId = "rbxassetid://131237241"
hit2.Volume = 3
local hit3 = Instance.new("Sound", hit)
hit3.SoundId = "rbxassetid://278062209"
hit3.Volume = 3
hit3.TimePosition = 0.33
local math1 = math.random(1,4)
if math1 == 1 then
hit0:Play()
end
if math1 == 2 then
hit1:Play()
end
if math1 == 3 then
hit2:Play()
end
if math1 == 4 then
hit3:Play()
end
if hit.Parent:FindFirstChild("Frozen") then
local hit0 = Instance.new("Sound", hit)
hit0.SoundId = "rbxassetid://516789356"
hit0.Volume = 5
hit0:Play()
hit.Parent.Frozen:Remove()
for i,v in pairs(hit.Parent:GetChildren()) do
if v.ClassName == "Part" then
v.Anchored = false
end
end
end
end
end
end)
	end
})

Anim:AddButton({
    Name = "InvisibleDrink",
    Callback = function()
        wait(2)

local player = game.Players.LocalPlayer
local char = player.Character
local mouse = player:GetMouse()
local canAttack = false
local damage = false
local rootJointC0 = char.HumanoidRootPart.RootJoint.C0
char.Torso["Right Shoulder"]:Remove()

--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Part0 = Instance.new("Part")
Part0:BreakJoints()
Weld1 = Instance.new("Weld")
Weld2 = Instance.new("Weld")
Weld3 = Instance.new("Weld")
SpecialMesh2 = Instance.new("SpecialMesh")
Part0.Name = "Handle"
Part0.Parent = mas
Part0.BrickColor = BrickColor.new("Mid gray")
Part0.Rotation = Vector3.new(-180, 0, 180)
Part0.FormFactor = Enum.FormFactor.Plate
Part0.Size = Vector3.new(1, 1.20000005, 1)
Part0.CFrame = CFrame.new(-18.1699982, 0.600000024, -0.639984131, -1, -1.21401766e-17, -2.78761293e-23, -1.21401766e-17, 1, 1.21401766e-17, 2.78761293e-23, 1.21401766e-17, -1)
Part0.BottomSurface = Enum.SurfaceType.Smooth
Part0.TopSurface = Enum.SurfaceType.Smooth
Part0.Color = Color3.new(0.803922, 0.803922, 0.803922)
Part0.Position = Vector3.new(-18.1699982, 0.600000024, -0.639984131)
Part0.Orientation = Vector3.new(0, -180, 0)
Part0.Color = Color3.new(0.803922, 0.803922, 0.803922)
Weld1.C0 = Weld1.C0 * CFrame.new(0,-1,-0.5) * CFrame.fromEulerAnglesXYZ(-1.5,0,0)
Weld1.Parent = char["Right Arm"]
Weld1.Part0 = char["Right Arm"]
Weld1.Part1 = Part0
Weld2.C0 = CFrame.new(1.5,0.5,0)
Weld2.C1 = CFrame.new(0,0.5,0)
Weld2.Parent = char.Torso
Weld2.Part0 = char.Torso
Weld2.Part1 = char["Right Arm"]
Weld3.C0 = CFrame.new(-1.5,0.5,0)
Weld3.C1 = CFrame.new(0,0.5,0)
Weld3.Parent = char.Torso
Weld3.Part0 = char.Torso
Weld3.Part1 = nil
SpecialMesh2.Parent = Part0
SpecialMesh2.MeshId = "rbxassetid://115414892" -- Bloxy Cola mesh ID
SpecialMesh2.Scale = Vector3.new(1.5, 1.5, 1.5)
SpecialMesh2.TextureId = "rbxassetid://115414911" -- Bloxy Cola texture ID
SpecialMesh2.MeshType = Enum.MeshType.FileMesh
SpecialMesh2.Scale = Vector3.new(1.5, 1.5, 1.5)
for i,v in pairs(mas:GetChildren()) do
	v.Parent = char
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end

for i = 1,15 do
	Weld2.C0 = Weld2.C0 * CFrame.Angles(0.1,0,0)
	wait()
end

canAttack = true

char.Humanoid.Died:connect(function()
	local sound = Instance.new("Sound",char)
	sound.SoundId = "rbxassetid://182003383" -- Replace with a sound ID for Bloxy Cola if desired
	sound.Pitch = 1
	sound:Play()
end)

mouse.Button1Down:connect(function()
	if canAttack == true then
		canAttack = false
		for i = 1,10 do
			Weld2.C0 = Weld2.C0 * CFrame.Angles(0,0,-0.1)
			wait()
		end
		for i = 1,5 do
			Weld1.C0 = Weld1.C0 * CFrame.Angles(0,0,0.1)
			wait()
		end
		local drink = Instance.new("Sound", char)
		drink.SoundId = "rbxassetid://10722059" -- Keep or replace with a Bloxy Cola sound ID
		drink.Volume = 5
		drink:Play()
		wait(3)
		char:FindFirstChild("Humanoid").Health = char:FindFirstChild("Humanoid").Health + 20
		char:FindFirstChild("Humanoid").WalkSpeed = char:FindFirstChild("Humanoid").WalkSpeed + 0.1
		for i = 1,5 do
			Weld1.C0 = Weld1.C0 * CFrame.Angles(0,0,-0.1)
			wait()
		end
		for i = 1,10 do
			Weld2.C0 = Weld2.C0 * CFrame.Angles(0,0,0.1)
			wait()
		end
		canAttack = true
	end
end)

mouse.KeyDown:connect(function(key)
	if key:lower() == "q" and canAttack == true then
		canAttack = false
		for i = 1,10 do
			Weld2.C0 = Weld2.C0 * CFrame.Angles(0.1,0,0)
			wait()
		end
		damage = true
		for i = 1,19 do
			Weld2.C0 = Weld2.C0 * CFrame.Angles(-0.1,0,0)
			wait()
		end
		for i = 1,9 do
			Weld2.C0 = Weld2.C0 * CFrame.Angles(0.1,0,0)
			wait()
		end
		damage = false
		canAttack = true
	elseif key:lower() == "e" and canAttack == true then
		canAttack = false
		Weld3.Part1 = char["Left Arm"]
		char.Torso["Left Shoulder"].Part1 = nil
		for i = 1,15 do
			Weld3.C0 = Weld3.C0 * CFrame.Angles(0.1,0,0)
			wait()
		end
		for i = 1,15 do
			Weld2.C0 = Weld2.C0 * CFrame.Angles(0,0,0.1)
			Weld3.C0 = Weld3.C0 * CFrame.Angles(0,0,-0.1)
			wait()
		end
		damage = true
		for i = 1,400 do
			char.HumanoidRootPart.RootJoint.C0 = char.HumanoidRootPart.RootJoint.C0 * CFrame.Angles(0,0,0.1)
			wait()
		end
		char.HumanoidRootPart.RootJoint.C0 = rootJointC0
		damage = false
		for i = 1,15 do
			Weld2.C0 = Weld2.C0 * CFrame.Angles(0,0,-0.1)
			wait()
		end
		Weld3.C0 = CFrame.new(-1.5,0.5,0)
		char.Torso["Left Shoulder"].Part1 = char["Left Arm"]
		Weld3.Part1 = nil
		canAttack = true
	elseif key:lower() == "r" and canAttack == true then
		canAttack = false
		for i = 1,13 do
			Weld2.C0 = Weld2.C0 * CFrame.Angles(0.1,0,0)
			wait()
		end
		wait(5)
		Part0.Transparency = 1
		local fake = Part0:Clone()
		fake.Parent = char
		fake.CanCollide = false
		fake.Position = Part0.Position
		fake.Transparency = 0
		local bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.Parent = fake
		bodyVelocity.Velocity = char.Torso.CFrame.lookVector * 90
		fake.Touched:connect(function(hit)
			if hit.Parent:FindFirstChild("Humanoid") and hit.Parent ~= char then
				hit.Parent.Humanoid:TakeDamage(10)
			end
		end)
		wait(2)
		canAttack = true
		Part0.Transparency = 0
	end
end)
    end
})

OrionLib:Init()

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Function to create a uniform GUI background for all elements
local function createGuiBackground(parent, position, size)
    local frame = Instance.new("Frame")
    frame.Size = size
    frame.Position = position
    frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
    frame.BackgroundTransparency = 0.3 -- Slight transparency
    frame.BorderSizePixel = 1
    frame.BorderColor3 = Color3.new(1, 1, 1) -- White border for visibility
    frame.Parent = parent
    return frame
end

-- Create the frame for FPS and Ping
local statsFrame = createGuiBackground(screenGui, UDim2.new(0, 10, 0, 10), UDim2.new(0, 140, 0, 60))

-- Create FPS label
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, 0, 0.5, 0)
fpsLabel.Position = UDim2.new(0, 0, 0, 0)
fpsLabel.Text = "FPS: 0"
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextScaled = true
fpsLabel.Parent = statsFrame

-- Create Ping label
local pingLabel = Instance.new("TextLabel")
pingLabel.Size = UDim2.new(1, 0, 0.5, 0)
pingLabel.Position = UDim2.new(0, 0, 0.5, 0)
pingLabel.Text = "Ping: 0 ms"
pingLabel.TextColor3 = Color3.new(1, 1, 1)
pingLabel.BackgroundTransparency = 1
pingLabel.TextScaled = true
pingLabel.Parent = statsFrame

-- Variables to track FPS
local lastUpdateTime = tick()
local frameCount = 0

-- Function to update FPS
local function updateFPS()
    local currentTime = tick()
    frameCount = frameCount + 1

    if currentTime - lastUpdateTime >= 1 then
        fpsLabel.Text = string.format("FPS: %d", frameCount)
        lastUpdateTime = currentTime
        frameCount = 0
    end
end

-- Connect to RunService Heartbeat to update FPS
game:GetService("RunService").Heartbeat:Connect(updateFPS)

-- Update Ping using Roblox API
local function updatePing()
    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    pingLabel.Text = string.format("Ping: %s", ping)
end

-- Update Ping every frame
game:GetService("RunService").RenderStepped:Connect(function()
    updatePing()
end)

-- Create the frame for PlayerHealth at the bottom right corner
local healthFrame = createGuiBackground(screenGui, UDim2.new(1, -150, 1, -40), UDim2.new(0, 140, 0, 30))

-- Create PlayerHealth label
local healthLabel = Instance.new("TextLabel")
healthLabel.Size = UDim2.new(1, 0, 1, 0)
healthLabel.Position = UDim2.new(0, 0, 0, 0)
healthLabel.Text = "PlayerHealth: 100"
healthLabel.TextColor3 = Color3.new(1, 1, 1)
healthLabel.BackgroundTransparency = 1
healthLabel.TextScaled = true
healthLabel.Parent = healthFrame

-- Update PlayerHealth
local function updatePlayerHealth()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character.Humanoid
        healthLabel.Text = string.format("PlayerHealth: %.0f", humanoid.Health)

        humanoid.Died:Connect(function()
            healthLabel.Text = "PlayerHealth: 0"
        end)
    end
end

local function setupCharacter()
    updatePlayerHealth()
end

-- Call setupCharacter when character is added or respawned
game.Players.LocalPlayer.CharacterAdded:Connect(setupCharacter)
setupCharacter()

-- Create the frame for PlayerCount
local playerCountFrame = createGuiBackground(screenGui, UDim2.new(0, 10, 1, -80), UDim2.new(0, 140, 0, 30))

-- Create PlayerCount label
local playerCountLabel = Instance.new("TextLabel")
playerCountLabel.Size = UDim2.new(1, 0, 1, 0)
playerCountLabel.Position = UDim2.new(0, 0, 0, 0)
playerCountLabel.Text = "0/0 Players"
playerCountLabel.TextColor3 = Color3.new(1, 1, 1)
playerCountLabel.BackgroundTransparency = 1
playerCountLabel.TextScaled = true
playerCountLabel.Parent = playerCountFrame

-- Update PlayerCount
local function updatePlayerCount()
    local playerCount = #game.Players:GetPlayers()
    local maxPlayers = game:GetService("Players").MaxPlayers
    playerCountLabel.Text = string.format("%d/%d Players", playerCount, maxPlayers)
end

game.Players.PlayerAdded:Connect(updatePlayerCount)
game.Players.PlayerRemoving:Connect(updatePlayerCount)
updatePlayerCount()

-- Create the frame for Coordinates and Speed in the top right corner
local coordSpeedFrame = createGuiBackground(screenGui, UDim2.new(1, -150, 0, 10), UDim2.new(0, 140, 0, 60))

-- Create Coordinates label
local coordsLabel = Instance.new("TextLabel")
coordsLabel.Size = UDim2.new(1, 0, 0.5, 0)
coordsLabel.Position = UDim2.new(0, 0, 0, 0)
coordsLabel.Text = "Coordinates: (0, 0, 0)"
coordsLabel.TextColor3 = Color3.new(1, 1, 1)
coordsLabel.BackgroundTransparency = 1
coordsLabel.TextScaled = true
coordsLabel.Parent = coordSpeedFrame

-- Create Speed label
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0.5, 0)
speedLabel.Position = UDim2.new(0, 0, 0.5, 0)
speedLabel.Text = "Speed: 0"
speedLabel.TextColor3 = Color3.new(1, 1, 1)
speedLabel.BackgroundTransparency = 1
speedLabel.TextScaled = true
speedLabel.Parent = coordSpeedFrame

-- Update Coordinates and Speed
local function updateCoordinatesAndSpeed()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = player.Character.HumanoidRootPart
        local position = humanoidRootPart.Position
        coordsLabel.Text = string.format("Coordinates: (%.2f, %.2f, %.2f)", position.X, position.Y, position.Z)

        -- Update Speed
        local speed = humanoidRootPart.Velocity.Magnitude
        speedLabel.Text = string.format("Speed: %.2f", speed)
    end
end

-- Update Coordinates and Speed on Heartbeat
game:GetService("RunService").Heartbeat:Connect(updateCoordinatesAndSpeed)

-- Create the frame for Time and Game Information
local timeGameFrame = createGuiBackground(screenGui, UDim2.new(0.5, -70, 0, 10), UDim2.new(0, 140, 0, 30))

-- Create Time label
local timeLabel = Instance.new("TextLabel")
timeLabel.Size = UDim2.new(1, 0, 0.5, 0)
timeLabel.Position = UDim2.new(0, 0, 0, 0)
timeLabel.Text = "Time: 0:00"
timeLabel.TextColor3 = Color3.new(1, 1, 1)
timeLabel.BackgroundTransparency = 1
timeLabel.TextScaled = true
timeLabel.Parent = timeGameFrame

-- Create Game Name label
local gameLabel = Instance.new("TextLabel")
gameLabel.Size = UDim2.new(1, 0, 0.5, 0)
gameLabel.Position = UDim2.new(0, 0, 0.5, 0)
gameLabel.Text = "Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
gameLabel.TextColor3 = Color3.new(1, 1, 1)
gameLabel.BackgroundTransparency = 1
gameLabel.TextScaled = true
gameLabel.Parent = timeGameFrame

-- Update Time
local function updateTime()
    local currentTime = os.date("*t")
    timeLabel.Text = string.format("Time: %02d:%02d", currentTime.hour, currentTime.min)
end

-- Update Time every minute
while true do
    updateTime()
    wait(60) -- Update every minute
end

-- End of code. 