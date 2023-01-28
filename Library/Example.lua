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

-- Make Window --
local Window = Library:CreateWindow("ScriptTitle", "Game")

-- Make Tabs --
local Tabs = Window:addTab("Tabs", img)

-- Make Section --
local Section = Tabs:addSection("Section")

-- Make Element --
local Element = Section:newSection("Element", false) -- true, hide's label title of the section.

-- Make Button --
Element:addButton("Button", "Info", function()
    print(Button)
end)

-- Make Toggle --
Element:addToggle("Toggle1", "Toggle Title", "Info", false, function(Value)
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
local Paragraph = Element:addParagraph("Paragraph1", "Title", TempTable)
Options["Paragraph1"]:SetValue(TempTable)
	

-- Refresh Log --
Element:addButton("Refresh Paragraph", "Refresh Paragraph", function() 
  Options["Paragraph1"]:SetValue(newTable)
end)

-- Make Notification --
Element:addButton("Notification", "Info", function()
    Library:Notification("Title", "Text Description")
end)

-- Make Corner Notify --
Element:addButton("Notify", "Info", function()
    Library:Notify("Title", "Text Description")
end)

-- Make Corner Notify --
Element:addButton("Destroy UI", "Info", function()
    Library:DestroyUI()
end)

-- Make Keybind --
Element:addKeybind("Keybind", "Info", Enum.KeyCode.End, function()
    print("Key Pressed")
end)

-- SaveManager Set Library --
SaveManager:SetLibrary(Library)

-- SaveManager Set Folder --
SaveManager:SetFolder('BlackTrap/psx')

-- SaveManager Add Tab/Config Section --
SaveManager:BuildConfigSection(Tabs) 

-- SaveManager AutoLoad Configuration --
SaveManager:LoadAutoloadConfig()


-- Themes Section--
local ThemesList = {
	"Default", 
	"DarkTheme", 
	"LightTheme", 
	"BloodTheme", 
	"GrapeTheme", 
	"Ocean", 
	"Midnight", 
	"Sentinel", 
	"Synapse", 
	"Serpent"
}

local themes = {
    AccentColor = Color3.fromRGB(45, 45, 45),
    Background = Color3.fromRGB(30, 30, 30),
    TextColor = Color3.fromRGB(180, 180, 180),
    ImageColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(12, 12, 12)
}

local themeStyles = {
    Default = {
        AccentColor = Color3.fromRGB(45, 45, 45),
        Background = Color3.fromRGB(30, 30, 30),
        TextColor = Color3.fromRGB(180, 180, 180),
        ImageColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(12, 12, 12)
    },
    DarkTheme = {
        AccentColor = Color3.fromRGB(64, 64, 64),
        Background = Color3.fromRGB(0, 0, 0),
        TextColor = Color3.fromRGB(180, 180, 180),
        ImageColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(20, 20, 20)
    },
    LightTheme = {
        AccentColor = Color3.fromRGB(150, 150, 150),
        Background = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(0, 0, 0),
        ImageColor = Color3.fromRGB(0, 0, 0),
        ElementColor = Color3.fromRGB(224, 224, 224)
    },
    BloodTheme = {
        AccentColor = Color3.fromRGB(227, 27, 27),
        Background = Color3.fromRGB(150, 10, 10),
        TextColor = Color3.fromRGB(255, 255, 255),
        ImageColor = Color3.fromRGB(255,255,255),
        ElementColor = Color3.fromRGB(220, 20, 20)
    },
    GrapeTheme = {
        AccentColor = Color3.fromRGB(166, 71, 214),
        Background = Color3.fromRGB(120, 50, 180),
        TextColor = Color3.fromRGB(255, 255, 255),
        ImageColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(140, 58, 180)
    },
    Ocean = {
        AccentColor = Color3.fromRGB(86, 76, 251),
        Background = Color3.fromRGB(26, 32, 108),
        ImageColor = Color3.fromRGB(200, 200, 200),
        TextColor = Color3.fromRGB(200, 200, 200),
        ElementColor = Color3.fromRGB(38, 45, 150)
    },
    Midnight = {
        AccentColor = Color3.fromRGB(26, 189, 158),
        Background = Color3.fromRGB(44, 62, 82),
        ImageColor = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(52, 74, 95)
    },
    Sentinel = {
        AccentColor = Color3.fromRGB(230, 35, 69),
        Background = Color3.fromRGB(32, 32, 32),
        ImageColor = Color3.fromRGB(119, 209, 138),
        TextColor = Color3.fromRGB(119, 209, 138),
        ElementColor = Color3.fromRGB(12, 12, 12)
    },
    Synapse = {
        AccentColor = Color3.fromRGB(46, 48, 43),
        Background = Color3.fromRGB(13, 15, 12),
        ImageColor = Color3.fromRGB(152, 99, 53),
        TextColor = Color3.fromRGB(152, 99, 53),
        ElementColor = Color3.fromRGB(24, 24, 24)
    },
    Serpent = {
        AccentColor = Color3.fromRGB(0, 166, 58),
        Background = Color3.fromRGB(31, 41, 43),
        ImageColor = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(22, 29, 31)
    }
}

local ThemeSection = Tabs:addSection("Theme")
local Themes = ThemeSection:newSection("Theme Settings", true)
Themes:addDropdown("SelectedTheme", "Select Theme", "Select Theme to Auto Load", "", ThemesList, function(Value)
	getgenv().Theme = Value
	for i,v in pairs(themeStyles) do
		if i == getgenv().Theme then
			for theme,color in pairs(v) do
				Library:ChangeColor(theme, color)
			end
		end
	end
	print("Selected Theme:", Value)
end)

for theme, color in pairs(themes) do
    Themes:addColor(theme, "Change your "..theme, color, function(color3)
        Library:ChangeColor(theme, color3)
    end)
end
