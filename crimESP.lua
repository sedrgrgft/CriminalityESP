local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()

local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Players = false 
ESP.Tracers = false 
ESP.Boxes = false 
ESP.Names = false


local watermark = library:Watermark("Criminality ESP Made By Dev")

local main = library:Load{
    Name = "DevX",
    SizeX = 600,
    SizeY = 650,
    Theme = "Midnight",
    Extension = "json", -- config file extension
    Folder = "DevX" -- config folder name
}

--[Config]

local configs = main:Tab("Configuration")

local themes = configs:Section{Name = "Theme", Side = "Left"}

local themepickers = {}

local themelist = themes:Dropdown{
    Name = "Theme",
    Default = library.currenttheme,
    Content = library:GetThemes(),
    Flag = "Theme Dropdown",
    Callback = function(option)
        if option then
            library:SetTheme(option)

            for option, picker in next, themepickers do
                picker:Set(library.theme[option])
            end
        end
    end
}

library:ConfigIgnore("Theme Dropdown")

local namebox = themes:Box{
    Name = "Custom Theme Name",
    Placeholder = "Custom Theme",
    Flag = "Custom Theme"
}

library:ConfigIgnore("Custom Theme")

themes:Button{
    Name = "Save Custom Theme",
    Callback = function()
        if library:SaveCustomTheme(library.flags["Custom Theme"]) then
            themelist:Refresh(library:GetThemes())
            themelist:Set(library.flags["Custom Theme"])
            namebox:Set("")
        end
    end
}

local customtheme = configs:Section{Name = "Custom Theme", Side = "Right"}

themepickers["Accent"] = customtheme:ColorPicker{
    Name = "Accent",
    Default = library.theme["Accent"],
    Flag = "Accent",
    Callback = function(color)
        library:ChangeThemeOption("Accent", color)
    end
}

library:ConfigIgnore("Accent")

themepickers["Window Background"] = customtheme:ColorPicker{
    Name = "Window Background",
    Default = library.theme["Window Background"],
    Flag = "Window Background",
    Callback = function(color)
        library:ChangeThemeOption("Window Background", color)
    end
}

library:ConfigIgnore("Window Background")

themepickers["Window Border"] = customtheme:ColorPicker{
    Name = "Window Border",
    Default = library.theme["Window Border"],
    Flag = "Window Border",
    Callback = function(color)
        library:ChangeThemeOption("Window Border", color)
    end
}

library:ConfigIgnore("Window Border")

themepickers["Tab Background"] = customtheme:ColorPicker{
    Name = "Tab Background",
    Default = library.theme["Tab Background"],
    Flag = "Tab Background",
    Callback = function(color)
        library:ChangeThemeOption("Tab Background", color)
    end
}

library:ConfigIgnore("Tab Background")

themepickers["Tab Border"] = customtheme:ColorPicker{
    Name = "Tab Border",
    Default = library.theme["Tab Border"],
    Flag = "Tab Border",
    Callback = function(color)
        library:ChangeThemeOption("Tab Border", color)
    end
}

library:ConfigIgnore("Tab Border")

themepickers["Tab Toggle Background"] = customtheme:ColorPicker{
    Name = "Tab Toggle Background",
    Default = library.theme["Tab Toggle Background"],
    Flag = "Tab Toggle Background",
    Callback = function(color)
        library:ChangeThemeOption("Tab Toggle Background", color)
    end
}

library:ConfigIgnore("Tab Toggle Background")

themepickers["Section Background"] = customtheme:ColorPicker{
    Name = "Section Background",
    Default = library.theme["Section Background"],
    Flag = "Section Background",
    Callback = function(color)
        library:ChangeThemeOption("Section Background", color)
    end
}

library:ConfigIgnore("Section Background")

themepickers["Section Border"] = customtheme:ColorPicker{
    Name = "Section Border",
    Default = library.theme["Section Border"],
    Flag = "Section Border",
    Callback = function(color)
        library:ChangeThemeOption("Section Border", color)
    end
}

library:ConfigIgnore("Section Border")

themepickers["Text"] = customtheme:ColorPicker{
    Name = "Text",
    Default = library.theme["Text"],
    Flag = "Text",
    Callback = function(color)
        library:ChangeThemeOption("Text", color)
    end
}

library:ConfigIgnore("Text")

themepickers["Disabled Text"] = customtheme:ColorPicker{
    Name = "Disabled Text",
    Default = library.theme["Disabled Text"],
    Flag = "Disabled Text",
    Callback = function(color)
        library:ChangeThemeOption("Disabled Text", color)
    end
}

library:ConfigIgnore("Disabled Text")

themepickers["Object Background"] = customtheme:ColorPicker{
    Name = "Object Background",
    Default = library.theme["Object Background"],
    Flag = "Object Background",
    Callback = function(color)
        library:ChangeThemeOption("Object Background", color)
    end
}

library:ConfigIgnore("Object Background")

themepickers["Object Border"] = customtheme:ColorPicker{
    Name = "Object Border",
    Default = library.theme["Object Border"],
    Flag = "Object Border",
    Callback = function(color)
        library:ChangeThemeOption("Object Border", color)
    end
}

library:ConfigIgnore("Object Border")

themepickers["Dropdown Option Background"] = customtheme:ColorPicker{
    Name = "Dropdown Option Background",
    Default = library.theme["Dropdown Option Background"],
    Flag = "Dropdown Option Background",
    Callback = function(color)
        library:ChangeThemeOption("Dropdown Option Background", color)
    end
}

library:ConfigIgnore("Dropdown Option Background")

local configsection = configs:Section{Name = "Configs", Side = "Left"}

local configlist = configsection:Dropdown{
    Name = "Configs",
    Content = library:GetConfigs(), -- GetConfigs(true) if you want universal configs
    Flag = "Config Dropdown"
}

library:ConfigIgnore("Config Dropdown")

local loadconfig = configsection:Button{
    Name = "Load Config",
    Callback = function()
        library:LoadConfig(library.flags["Config Dropdown"]) -- LoadConfig(library.flags["Config Dropdown"], true)  if you want universal configs
    end
}

local delconfig = configsection:Button{
    Name = "Delete Config",
    Callback = function()
        library:DeleteConfig(library.flags["Config Dropdown"]) -- DeleteConfig(library.flags["Config Dropdown"], true)  if you want universal configs
        configlist:Refresh(library:GetConfigs())
    end
}


local configbox = configsection:Box{
    Name = "Config Name",
    Placeholder = "Config Name",
    Flag = "Config Name"
}

library:ConfigIgnore("Config Name")

local save = configsection:Button{
    Name = "Save Config",
    Callback = function()
        library:SaveConfig(library.flags["Config Dropdown"] or library.flags["Config Name"]) -- SaveConfig(library.flags["Config Name"], true) if you want universal configs
        configlist:Refresh(library:GetConfigs())
    end
}

local keybindsection = configs:Section{Name = "UI Toggle Keybind", Side = "Left"}

keybindsection:Keybind{
    Name = "UI Toggle",
    Flag = "UI Toggle",
    Default = Enum.KeyCode.RightShift,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Callback = function(_, fromsetting)
        if not fromsetting then
            library:Close()
        end
    end
}

keybindsection:Keybind{
    Name = "UI Close",
    Flag = "UI Close",
    Default = Enum.KeyCode.Backspace,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Callback = function(_, fromsetting)
        if not fromsetting then
            library:Unload()
        end
    end
}
-------------------------------------
--[ESP Colors]

local ESPColor = {
    moneyc = nil,--Color3.fromRGB(107, 128, 104),
    scrapc = Color3.fromRGB(234,208,168),
    toolc = Color3.fromRGB(128,104,129),
    atmc = Color3.fromRGB(17,138,250),
    medsafec = Color3.fromRGB(77,77,77),
    smallsafec = Color3.fromRGB(235,203,0),
    registerc = Color3.fromRGB(190,200,200),
    mbsc = Color3.fromRGB(128,0,255),
    alarmc = Color3.fromRGB(250,107,107),
    camerac = Color3.fromRGB(238,0,255),
    dealerc = Color3.fromRGB(38,38,38),
    armorydealerc = Color3.fromRGB(30,255,0),
    vendingmachinec = Color3.fromRGB(255,89,89)
}








----------------

local tab = main:Tab("ESP")

local mainsec = tab:Section{
    Name = "Main",
    Side = "Left"
}

local toggle = mainsec:Toggle{
    Name = "Players",
    Flag = "p",
    --Default = true,
    Callback  = function(a)
        ESP.Players = a
    end
}

local toggle = mainsec:Toggle{
    Name = "Boxes",
    Flag = "b",
    --Default = true,
    Callback  = function(a)
        ESP.Boxes = a
    end
}

local toggle = mainsec:Toggle{
    Name = "Tracers",
    Flag = "t",
    --Default = true,
    Callback  = function(a)
        ESP.Tracers = a
    end
}

local toggle = mainsec:Toggle{
    Name = "Names",
    Flag = "n",
    --Default = true,
    Callback  = function(a)
        ESP.Names = a
    end
}
-----------------------------------
--[ESP]
local mainsec2 = tab:Section{
    Name = "Things ESP",
    Side = "Right"
}

ESP:AddObjectListener(game:GetService("Workspace").Filter.SpawnedBread, {
    Type = "MeshPart",
    CustomName = "Cash",
    Color = ESPColor.moneyc,
    IsEnabled = "cash"
})

ESP:AddObjectListener(game:GetService("Workspace").Filter.SpawnedPiles, {
    Type = "Model",
    CustomName = "Scrap",
    Color = ESPColor.scrapc,
    IsEnabled = "scrap"
})

ESP:AddObjectListener(game:GetService("Workspace").Filter.SpawnedTools, {
    Type = "Model",
    CustomName = "Tool",
    Color = ESPColor.toolc,
    IsEnabled = "tool"
})

for i,v in pairs(game:GetService("Workspace").Map.ATMz:GetDescendants()) do
    if string.find(v.Name,"ATM") then 
        if v:FindFirstChild("MainPart") then 
            ESP:Add(v.MainPart, {
                Name = "ATM",
                IsEnabled = "atm",
                Color = ESPColor.atmc
            })
        end 
    end 
end

for i,v in pairs(game:GetService("Workspace").Map.BredMakurz:GetDescendants()) do
    if string.find(v.Name,"MediumSafe") then 
        if v:FindFirstChild("MainPart") then 
            ESP:Add(v.MainPart, {
                Name = "Medium Safe",
                IsEnabled = "mediumsafe",
                Color = ESPColor.medsafec
            })
        end 
    end 
end

for i,v in pairs(game:GetService("Workspace").Map.BredMakurz:GetDescendants()) do
    if string.find(v.Name,"SmallSafe") then 
        if v:FindFirstChild("MainPart") then 
            ESP:Add(v.MainPart, {
                Name = "Small Safe",
                IsEnabled = "smallsafe",
                Color = ESPColor.smallsafec
            })
        end 
    end 
end

for i,v in pairs(game:GetService("Workspace").Map.BredMakurz:GetDescendants()) do
    if string.find(v.Name,"Register") then 
        if v:FindFirstChild("MainPart") then 
            ESP:Add(v.MainPart, {
                Name = "Register",
                IsEnabled = "register",
                Color = ESPColor.registerc
            })
        end 
    end 
end

for i,v in pairs(game:GetService("Workspace").Map.MysteryBoxSpawns:GetDescendants()) do
    if string.find(v.Name,"Spawn") then 
        if v:FindFirstChild("SpawnPart") then 
            ESP:Add(v.SpawnPart, {
                Name = "Mystery Box Spawn",
                IsEnabled = "mysteryboxspawn",
                Color = ESPColor.mbsc
            })
        end 
    end 
end

for i,v in pairs(game:GetService("Workspace").Map.Security:GetDescendants()) do
    if string.find(v.Name,"Alarm") then 
        if v:FindFirstChild("MainPart") then 
            ESP:Add(v.MainPart, {
                Name = "Alarm",
                IsEnabled = "alarm",
                Color = ESPColor.alarmc
            })
        end 
    end 
end

for i,v in pairs(game:GetService("Workspace").Map.Security:GetDescendants()) do
    if string.find(v.Name,"Camera") then 
        if v:FindFirstChild("MainPart") then 
            ESP:Add(v.MainPart, {
                Name = "Camera",
                IsEnabled = "camera",
                Color = ESPColor.camerac
            })
        end 
    end 
end

for i,v in pairs(game:GetService("Workspace").Map.Shopz:GetDescendants()) do
    if string.find(v.Name,"Dealer") then 
        if v:FindFirstChild("DealerMan") then 
            ESP:Add(v.MainPart, {
                Name = "Dealer",
                IsEnabled = "dealer",
                Color = ESPColor.dealerc
            })
        end 
    end 
end

for i,v in pairs(game:GetService("Workspace").Map.Shopz:GetDescendants()) do
    if string.find(v.Name,"ArmoryDealer") then 
        if v:FindFirstChild("ArmoryMan") then 
            ESP:Add(v.MainPart, {
                Name = "Armory",
                IsEnabled = "armory",
                Color = ESPColor.armorydealerc
            })
        end 
    end 
end

for i,v in pairs(game:GetService("Workspace").Map.VendingMachines:GetDescendants()) do
    if string.find(v.Name,"VendingMachine") then 
        if v:FindFirstChild("MainPart") then 
            ESP:Add(v.MainPart, {
                Name = "Vending Machine",
                IsEnabled = "vendingmachine",
                Color = ESPColor.vendingmachinec
            })
        end 
    end 
end

-----------------------------------
--[UI]

local toggle = mainsec2:Toggle{
    Name = "Cash",
    Flag = "cash",
    --Default = true,
    Callback  = function(a)
        ESP.cash = a
    end
}

local toggle = mainsec2:Toggle{
    Name = "Scraps",
    Flag = "scraps",
    --Default = true,
    Callback  = function(a)
        ESP.scrap = a
    end
}

local toggle = mainsec2:Toggle{
    Name = "Tools",
    Flag = "tools",
    --Default = true,
    Callback  = function(a)
        ESP.tool = a
    end
}

local toggle = mainsec2:Toggle{
    Name = "ATMs",
    Flag = "atms",
    --Default = true,
    Callback  = function(a)
        ESP.atm = a
    end
}

local toggle = mainsec2:Toggle{
    Name = "Medium Safes",
    Flag = "medsafe",
    --Default = true,
    Callback  = function(a)
        ESP.mediumsafe = a
    end
}

local toggle = mainsec2:Toggle{
    Name = "Small Safes",
    Flag = "smolsafes",
    --Default = true,
    Callback  = function(a)
        ESP.smallsafe = a
    end
}

local toggle = mainsec2:Toggle{
    Name = "Registers",
    Flag = "registers",
    --Default = true,
    Callback  = function(a)
        ESP.register = a
    end
}

local toggle = mainsec2:Toggle{
    Name = "Mystery Box Spawns",
    Flag = "mbs",
    --Default = true,
    Callback  = function(a)
        ESP.mysteryboxspawn = a
    end
}

local toggle = mainsec2:Toggle{
    Name = "Alarms",
    Flag = "alarm",
    --Default = true,
    Callback  = function(a)
        ESP.alarm = a
    end
}

local toggle = mainsec2:Toggle{
    Name = "Cameras",
    Flag = "camera",
    --Default = true,
    Callback  = function(a)
        ESP.camera = a
    end
}

local toggle = mainsec2:Toggle{
    Name = "Dealers",
    Flag = "dealers",
    --Default = true,
    Callback  = function(a)
        ESP.dealer = a
    end
}

local toggle = mainsec2:Toggle{
    Name = "Armory Dealers",
    Flag = "armory",
    --Default = true,
    Callback  = function(a)
        ESP.armory = a
    end
}

local toggle = mainsec2:Toggle{
    Name = "Vending Machines",
    Flag = "vendingmachines",
    --Default = true,
    Callback  = function(a)
        ESP.vendingmachine = a
    end
}

--[ESP Colors]
--UI
local mainsec3 = tab:Section{
    Name = "Colors (In Complete)",
    Side = "Right"
}
local colorpicker = mainsec3:ColorPicker{
    Name = "Money",
    Default = ESPColor.moneyc,
    Flag = "mc",
    Callback = function(color)
        ESPColor.moneyc = color
    end
}

local colorpicker = mainsec3:ColorPicker{
    Name = "Scrap",
    Default = ESPColor.scrapc,
    Flag = "sc",
    Callback = function(color)
        ESPColor.scrapc = color
    end
}

local colorpicker = mainsec3:ColorPicker{
    Name = "Tools",
    Default = ESPColor.toolc,
    Flag = "tc",
    Callback = function(color)
        ESPColor.toolc = color
    end
}
local colorpicker = mainsec3:ColorPicker{
    Name = "Medium Safes",
    Default = ESPColor.medsafec,
    Flag = "medc",
    Callback = function(color)
        ESPColor.medsafec = color
    end
}

local colorpicker = mainsec3:ColorPicker{
    Name = "Small Safes",
    Default = ESPColor.smallsafec,
    Flag = "smc",
    Callback = function(color)
        ESPColor.smallsafec = color
    end
}

local colorpicker = mainsec3:ColorPicker{
    Name = "Register",
    Default = ESPColor.registerc,
    Flag = "tc",
    Callback = function(color)
        ESPColor.registerc = color
    end
}
local colorpicker = mainsec3:ColorPicker{
    Name = "Mystery Box Spawns",
    Default = ESPColor.mbsc,
    Flag = "mbc",
    Callback = function(color)
        ESPColor.mbsc = color
    end
}

local colorpicker = mainsec3:ColorPicker{
    Name = "Alarms",
    Default = ESPColor.alarmc,
    Flag = "ac",
    Callback = function(color)
        ESPColor.alarmc = color
    end
}

local colorpicker = mainsec3:ColorPicker{
    Name = "Cameras",
    Default = ESPColor.camerac,
    Flag = "cc",
    Callback = function(color)
        ESPColor.camerac = color
    end
}
local colorpicker = mainsec3:ColorPicker{
    Name = "Dealers",
    Default = ESPColor.dealerc,
    Flag = "dc",
    Callback = function(color)
        ESPColor.dealerc = color
    end
}

local colorpicker = mainsec3:ColorPicker{
    Name = "Armory Dealers",
    Default = ESPColor.armorydealerc,
    Flag = "ADC",
    Callback = function(color)
        ESPColor.armorydealerc = color
    end
}

local colorpicker = mainsec3:ColorPicker{
    Name = "Vending Machines",
    Default = ESPColor.vendingmachinec,
    Flag = "vmc",
    Callback = function(color)
        ESPColor.vendingmachinec = color
    end
}
