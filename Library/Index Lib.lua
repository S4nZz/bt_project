-- Make Library --
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/S4nZz/bt_project/main/Library/BT_Lib%20v1.5.lua"))()

-- Make Notification --
Library:Notification("Title", "Description")

-- Make Windows --
local Windows = Library:CreateWindow("Title", "Game", "Default")

-- Make Tabs --
local Tabs = Windows:addTab("Title", img)

-- Make Section --
local Section = Tabs:addSection("Title")

-- Make Element --
local Element = Section:newSection("Title", false)

-- Make Button --
Element:addButton("Title", "Info", function()
    print(Button)
end)

-- Make Toggle --
Element:addToggle("Title", "Info", Default, function(state)
    getgenv().Toggle = state
    if getgenv().Toggle == true then
        Default = true
    elseif getgenv().Toggle == false then
        Default = false
    else
        Default = false
    end
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
Element:addDropdown("Title", "Info", List, function(state)
    Print(Dropdown)
end)

-- Refresh Dropdown --
local Dropdown = Element:addDropdown("Title", "Info", List, function(state)
    Dropdown:Refresh(newList)
end)

-- Make Slider --
local minVal = 0
local maxVal = 500
local startVal = 50
Element:addSlider("Title", "Info", minVal, maxVal, startVal, function(Value)
    Print(Value)
end)

-- Make TextBox --
Element:addTextBox("Title", "Info", function(state)
    Print(State)
end)

-- Make Keybind --
Element:addKeybind("Title", "Info", Enum.KeyCode.F, function(state)
    Print(state)
end)

-- Make Label --
Element:addLabel("Text Label")

-- Add Themes --
for theme, color in pairs(themes) do
    Element:addColor(theme, "Change your "..theme, color, function(color3)
        Library:ChangeColor(theme, color3)
    end)
end

local themes = {
    AccentColor = Color3.fromRGB(45, 45, 45),
    Background = Color3.fromRGB(30, 30, 30),
    TextColor = Color3.fromRGB(180, 180, 180),
    ImageColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(12, 12, 12)
}
