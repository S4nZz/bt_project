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
local newTable = {}

for i=1,100 do
  table.insert(TempTable, i..". Text Entry")
end



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
Element:addToggle("Toggle1", "Toggle Title", "Info", Default, function(Value)
    print(Value)
end)


-- Make Dropdown --
local Dropdown = Element:addDropdown("Dropdown1", "Dropdown Title", "Info", "Dropdown 1", List, function(Value)
    print(Value)
end)

-- Refresh Dropdown --
Element:addButton("Refresh Dropdown", "Info", function()
    Dropdown:Refresh(newList)
end)

-- Make Slider --
Element:addSlider("Slider1", "Slider Title", "Info", 0, 500, 50, function(Value)
    print(Value)
end)

-- Make TextBox --
Element:addTextBox("Textbox1", "Textbox Title", "Info", "", function(Value)
    print(Value)
end)

-- Make Keybind --
Element:addKeybind("Keybind Title", "Info", Enum.KeyCode.F, function(Value)
    print(Value)
end)

-- Make Label --
Element:addLabel("Text Label")

-- Make Log --
local Log = Element:addLog("Log1", "Log Title", TempTable)
Log:Refresh(TempTable)
	

-- Refresh Log --
Element:addButton("Refresh Log", "info", function() 
  Log:Refresh(newTable)
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

-- SaveManager Set Library --
SaveManager:SetLibrary(Library)

-- SaveManager Set Folder --
SaveManager:SetFolder('BlackTrap/psx')

-- SaveManager Add Tab/Config Section --
SaveManager:BuildConfigSection(Tabs) 

-- SaveManager AutoLoad Configuration --
SaveManager:LoadAutoloadConfig()
