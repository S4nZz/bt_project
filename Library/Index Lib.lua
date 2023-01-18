-- Make Library --
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/jmesfo0/bt_project/main/Library/BT_Lib%20v1.5.lua"))()

 -- Make Save Manager --
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/jmesfo0/bt_project/main/Library/addons/SaveManager.lua"))()

-- Make Tables --
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

local TempTable = {}

for i=1,100 do
  table.insert(TempTable, i..". Text Entry")
end

local newTable = {}

for i=1,100 do
  table.insert(newTable, i..". New Text Entry")
end

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
Element:addToggle("Toggle1", "Toggle", "Info", Default, function(state)
    getgenv().Toggle = state
    print(state)
end)


-- Make Dropdown --
local Dropdown = Element:addDropdown("Dropdown1", "Dropdown", "Info", "Default", List, function(state)
    print(state)
end)

-- Refresh Dropdown --
Element:addButton("Refresh Dropdown", "Info", function()
    Dropdown:Refresh(newList)
end)

-- Make Slider --
Element:addSlider("Slider1", "Slider", "Info", 0, 500, 50, function(Value)
    print(Value)
end)

-- Make TextBox --
Element:addTextBox("Textbox1", "Textbox", "Info", "Textbox Text", function(Value)
    print(Value)
end)

-- Make Keybind --
Element:addKeybind("Keybind", "Info", Enum.KeyCode.F, function(Value)
    print(Value)
end)

-- Make Label --
Element:addLabel("Label")

-- Make Log --
local Log = Element:addLog(table.concat(TempTable, "\n"))

--Log:Refresh()

-- Refresh Log --
Element:addButton("Refresh Log", "info", function() 
  Log:Refresh(table.concat(newTable, "\n"))
end)

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

SaveManager:SetLibrary(Library)

SaveManager:SetFolder('BlackTrap/psx')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs) 

SaveManager:LoadAutoloadConfig()
