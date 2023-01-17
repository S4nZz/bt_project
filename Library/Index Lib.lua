-- Make Library --
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/S4nZz/bt_project/main/Library/BT_Lib%20v1.5.lua"))()

-- Make Windows --
local Windows = Library:CreateWindow("Hub", "Game", "Default")

-- Make Tabs --
local Tabs = Windows:addTab("Tabs", img)

-- Make Section --
local Section = Tabs:addSection("Section")

-- Make Element --
local Element = Section:newSection("Element", false)

-- Make Button --
Element:addButton("Button", "Info", function()
    print(Button)
end)

-- Make Toggle --
Element:addToggle("Toggle", "Info", Default, function(state)
    getgenv().Toggle = state
    print(state)
end)


local List = {
    "Dropdown 1";
    "Dropdown 2";
    "Dropdown 3";
    }

local newList = {
    "newDropdown 1";
    "newDropdown 2";
    "newDropdown 3";
    }

-- Make Dropdown --
local Dropdown = Element:addDropdown("Dropdown", "Info", List, function(state)
    print(state)
end)

-- Refresh Dropdown --
Element:addButton("Refresh Dropdown", "Info", function()
    Dropdown:Refresh(newList)
end)

-- Make Slider --
local minVal = 0
local maxVal = 500
local startVal = 50
Element:addSlider("Slider", "Info", minVal, maxVal, startVal, function(Value)
    print(Value)
end)

-- Make TextBox --
Element:addTextBox("Textbox", "Info", "Textbox Text", function(state)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = state
    print(state)
end)

-- Make Keybind --
Element:addKeybind("Keybind", "Info", Enum.KeyCode.F, function(state)
    print(state)
end)

-- Make Label --
Element:addLabel("Label")

-- Make Log --
Element:addLog("Text Log") --:Refresh(newLog)



-- Make Notification --
Element:addButton("Notification", "Info", function()
    Library:Notification("Title", "Text Description")
end)

-- Add Themes --
local themes = {
    AccentColor = Color3.fromRGB(45, 45, 45),
    Background = Color3.fromRGB(30, 30, 30),
    TextColor = Color3.fromRGB(180, 180, 180),
    ImageColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(12, 12, 12)
}

for theme, color in pairs(themes) do
    Element:addColor(theme, "Change your "..theme, color, function(color3)
        Library:ChangeColor(theme, color3)
    end)
end
