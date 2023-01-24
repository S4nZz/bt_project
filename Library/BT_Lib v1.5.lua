-- Blacktrap v1.5
-- Build Date : 11/1/23

local Library = {}

-- Service
local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local linear = Enum.EasingStyle.Linear
local inout = Enum.EasingDirection.InOut

local Utility = {}
local Objects = {}

local Toggles = {};
local Options = {};

getgenv().Toggles = Toggles;
getgenv().Options = Options;

function Library:AttemptSave()
    if Library.SaveManager then
        Library.SaveManager:Save();
    end;
end;

function Library:DraggingEnabled(frame, parent)
    local dragging = nil
    local dragInput = nil
    local mousePos = nil
    local framePos = nil
    
    function update(input)
        local delta = input.Position - mousePos
        local pos =UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        local Tween = tween:Create(parent, tweeninfo(.1), {Position = pos})
        Tween:Play()
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    input.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

function Utility:TweenObject(obj, properties, duration)
    tween:Create(obj, tweeninfo(duration, linear, inout), properties):Play()
end

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
local oldTheme = ""

local SettingsT = {

}

local Name = "BTConfig.JSON"

pcall(function()

if not pcall(function() readfile(Name) end) then
writefile(Name, game:service'HttpService':JSONEncode(SettingsT))
end

Settings = game:service'HttpService':JSONEncode(readfile(Name))
end)

local LibName = tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))

function Library:ToggleUI()
    if game.CoreGui[LibName].Enabled then
        game.CoreGui[LibName].Enabled = false
    else
        game.CoreGui[LibName].Enabled = true
    end
end

function Library:CreateWindow(title, gameName, themeList)
    if not themeList then
        themeList = themes
    end
    if themeList == "Default" then
        themeList = themeStyles.Default
    elseif themeList == "DarkTheme" then
        themeList = themeStyles.DarkTheme
    elseif themeList == "LightTheme" then
        themeList = themeStyles.LightTheme
    elseif themeList == "BloodTheme" then
        themeList = themeStyles.BloodTheme
    elseif themeList == "GrapeTheme" then
        themeList = themeStyles.GrapeTheme
    elseif themeList == "Ocean" then
        themeList = themeStyles.Ocean
    elseif themeList == "Midnight" then
        themeList = themeStyles.Midnight
    elseif themeList == "Sentinel" then
        themeList = themeStyles.Sentinel
    elseif themeList == "Synapse" then
        themeList = themeStyles.Synapse
    elseif themeList == "Serpent" then
        themeList = themeStyles.Serpent
    else
        if themeList.AccentColor == nil then
            themeList.AccentColor = Color3.fromRGB(45, 45, 45)
        elseif themeList.Background == nil then
            themeList.Background = Color3.fromRGB(30, 30, 30)
        elseif themeList.ImageColor == nil then
            themeList.ImageColor = Color3.fromRGB(255, 255, 255)
        elseif themeList.TextColor == nil then
            themeList.TextColor = Color3.fromRGB(180, 180, 180)
        elseif themeList.ElementColor == nil then
            themeList.ElementColor = Color3.fromRGB(12, 12, 12)
        end
    end
    
    themeList = themeList or {}
    local selectedTab 
    title = title or "Library"
    table.insert(Library, title)
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if v:IsA("ScreenGui") and v.Name == title then
            v:Destroy()
        end
    end

    local ScreenGui = Instance.new("ScreenGui")
    local openBT = Instance.new("ImageButton")
    local Main = Instance.new("ImageLabel")
    local mainCorner = Instance.new("UICorner")
    local coverTopHeader = Instance.new("Frame")
    local coverTopCorner = Instance.new("UICorner")
    local mainTopHeader = Instance.new("Frame")
    local TopHeaderCorner = Instance.new("UICorner")
    local mainLogo = Instance.new("ImageLabel")
    local mainTitle = Instance.new("TextLabel")
    local close = Instance.new("ImageButton")
    local mainDiscord = Instance.new("ImageButton")
    local mainFrame = Instance.new("Frame")
    local mainFrameCorner = Instance.new("UICorner")
    local mainTabs = Instance.new("ScrollingFrame")
    local mainTabsCorner = Instance.new("UICorner")
    local mainTabsList = Instance.new("UIListLayout")
    local tabsSection = Instance.new("Frame")
    local tabSecCorner = Instance.new("UICorner")
    local mainPages = Instance.new("Frame")
    local mainPagesCorner = Instance.new("UICorner")
    local blurFrame = Instance.new("Frame")
    local infoContainer = Instance.new("Frame")
    local CoverBT = Instance.new("Frame")

    Library:DraggingEnabled(coverTopHeader, Main)

    ScreenGui.Name = LibName
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    game:GetService("UserInputService").InputBegan:connect(function(input, hide) 
        if input.KeyCode == Enum.KeyCode.Tab then 
            game.CoreGui[LibName].Enabled = not game.CoreGui[LibName].Enabled
        end
    end)

    CoverBT.Name = "CoverBT"
    CoverBT.Parent = ScreenGui
    CoverBT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CoverBT.BackgroundTransparency = 1.000
    CoverBT.Size = UDim2.new(0, 35, 0, 35)
    CoverBT.Position = UDim2.new(0.100220447, 0, 0, 150)

    openBT.Name = "openBT"
    openBT.Parent = CoverBT
    openBT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    openBT.BackgroundTransparency = 1.000
    openBT.BorderSizePixel = 0
    openBT.Size = UDim2.new(0, 35, 0, 35)
    openBT.Image = "http://www.roblox.com/asset/?id=12021503727"
    openBT.ImageColor3 = Color3.fromRGB(255, 0, 0)
    
    openBT.MouseLeave:Connect(function()
        Utility:TweenObject(openBT, {Size = UDim2.new(0, 35, 0, 35)}, 0.1)
        Utility:TweenObject(openBT, {BackgroundTransparency = 1}, 0.1)
    end)
    
    openBT.MouseEnter:Connect(function()
        Utility:TweenObject(openBT, {Size = UDim2.new(0, 25, 0, 25)}, 0.1)
        Utility:TweenObject(openBT, {BackgroundTransparency = 0.5}, 0.1)
    end)

    local openclosetog = false
    openBT.MouseButton1Click:Connect(function()
        if openclosetog == true then
            Utility:TweenObject(Main, {Size = UDim2.new(0, 600, 0, 400)}, 0.1)
        else
            Utility:TweenObject(Main, {Size = UDim2.new(0, 0, 0, 0)}, 0.1)
        end
        openclosetog = not openclosetog
    end)

    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main.BackgroundTransparency = 1.000
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.481963903, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 0, 0, 0)
    Main.Image = "http://www.roblox.com/asset/?id=12058283358"
    Main.ClipsDescendants = true
    wait(0.2)
    Utility:TweenObject(Main, {Size = UDim2.new(0, 600, 0, 400)}, 0.1)

    mainCorner.CornerRadius = UDim.new(0, 4)
    mainCorner.Name = "mainCorner"
    mainCorner.Parent = Main

    coverTopHeader.Name = "coverTopHeader"
    coverTopHeader.Parent = Main
    coverTopHeader.BackgroundColor3 = themeList.AccentColor
    Objects[coverTopHeader] = "BackgroundColor3"
    coverTopHeader.Size = UDim2.new(0, 600, 0, 35)

    coverTopCorner.CornerRadius = UDim.new(0, 4)
    coverTopCorner.Name = "coverTopCorner"
    coverTopCorner.Parent = coverTopHeader

    mainTopHeader.Name = "mainTopHeader"
    mainTopHeader.Parent = coverTopHeader
    mainTopHeader.BackgroundColor3 = themeList.Background
    Objects[mainTopHeader] = "BackgroundColor3"
    mainTopHeader.Position = UDim2.new(0, 3, 0, 3)
    mainTopHeader.Size = UDim2.new(0, 594, 0, 29)

    TopHeaderCorner.CornerRadius = UDim.new(0, 4)
    TopHeaderCorner.Name = "TopHeaderCorner"
    TopHeaderCorner.Parent = mainTopHeader

    mainLogo.Name = "mainLogo"
    mainLogo.Parent = mainTopHeader
    mainLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainLogo.BackgroundTransparency = 1.000
    mainLogo.BorderSizePixel = 0
    mainLogo.Position = UDim2.new(0.00200000009, 3, 0.114, 0)
    mainLogo.Size = UDim2.new(0, 21, 0, 21)
    mainLogo.Image = "http://www.roblox.com/asset/?id=12021503727"
    mainLogo.ImageColor3 = Color3.fromRGB(255, 0, 0)

    mainTitle.Name = "mainTitle"
    mainTitle.Parent = mainTopHeader
    mainTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainTitle.BackgroundTransparency = 1.000
    mainTitle.BorderSizePixel = 0
    mainTitle.Position = UDim2.new(0.050847467, 0, 0.068965517, 0)
    mainTitle.Size = UDim2.new(0, 200, 0, 25)
    mainTitle.Font = Enum.Font.SourceSansBold
    mainTitle.Text = title.." [ "..gameName.." ]"
    mainTitle.TextColor3 = themeList.TextColor
    Objects[mainTitle] = "TextColor3"
    mainTitle.TextSize = 14.000
    mainTitle.TextXAlignment = Enum.TextXAlignment.Left

    close.Name = "close"
    close.Parent = mainTopHeader
    close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    close.BackgroundTransparency = 1.000
    close.BorderSizePixel = 0
    close.Position = UDim2.new(0.959999979, 0, 0.123999998, 0)
    close.Size = UDim2.new(0, 21, 0, 21)
    close.Image = "http://www.roblox.com/asset/?id=3926305904"
    close.ImageRectOffset = Vector2.new(284, 4)
    close.ImageRectSize = Vector2.new(24, 24)
    close.ImageColor3 = themeList.ImageColor
    close.MouseLeave:Connect(function()
        Utility:TweenObject(close, {BackgroundTransparency = 1}, 0.1)
    end)
    
    close.MouseEnter:Connect(function()
        Utility:TweenObject(close, {BackgroundTransparency = 0.5}, 0.1)
    end)
    
    close.MouseButton1Click:Connect(function()
        game.TweenService:Create(close, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            ImageTransparency = 1
        }):Play()
        wait()
        game.TweenService:Create(Main, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0,0,0,0),
			Position = UDim2.new(0, Main.AbsolutePosition.X + (Main.AbsoluteSize.X / 2), 0, Main.AbsolutePosition.Y + (Main.AbsoluteSize.Y / 2))
		}):Play()
        wait(1)
        ScreenGui:Destroy()
    end)

    mainDiscord.Name = "mainDiscord"
    mainDiscord.Parent = mainTopHeader
    mainDiscord.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainDiscord.BackgroundTransparency = 1.000
    mainDiscord.Position = UDim2.new(0.914141417, 0, 0.137931019, 0)
    mainDiscord.Size = UDim2.new(0, 21, 0, 21)
    mainDiscord.Image = "http://www.roblox.com/asset/?id=12058969086"
    mainDiscord.ImageColor3 = Color3.fromRGB(200, 200, 200)
    
    mainDiscord.MouseLeave:Connect(function()
        Utility:TweenObject(mainDiscord, {BackgroundTransparency = 1}, 0.1)
    end)
    
    mainDiscord.MouseEnter:Connect(function()
        Utility:TweenObject(mainDiscord, {BackgroundTransparency = 0.5}, 0.1)
    end)

    mainDiscord.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/Mp7qppfwER")
        wait(.1)
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Discord",
            Text = "Discord copied on your clipboard",
            Button1 = "Okay",
            Duration = 20
        })
    end)

    mainFrame.Name = "mainFrame"
    mainFrame.Parent = Main
    mainFrame.BackgroundColor3 = themeList.AccentColor
    Objects[mainFrame] = "BackgroundColor3"
    mainFrame.Position = UDim2.new(0, 0, 0.108000033, 0)
    mainFrame.Size = UDim2.new(0, 600, 0, 356)

    mainFrameCorner.CornerRadius = UDim.new(0, 4)
    mainFrameCorner.Name = "mainFrameCorner"
    mainFrameCorner.Parent = mainFrame

    mainTabs.Name = "mainTabs"
    mainTabs.Parent = mainFrame
    mainTabs.BackgroundColor3 = themeList.Background
    Objects[mainTabs] = "BackgroundColor3"
    mainTabs.Position = UDim2.new(0, 3, 0, 3)
    mainTabs.Size = UDim2.new(0, 150, 0, 350)
    mainTabs.ScrollBarThickness = 0
    mainTabs.Active = true
    
    mainTabsList.Name = "mainTabsList"
    mainTabsList.Parent = mainTabs
    mainTabsList.SortOrder = Enum.SortOrder.LayoutOrder
    mainTabsList.Padding = UDim.new(0, 2)

    mainTabsCorner.CornerRadius = UDim.new(0, 4)
    mainTabsCorner.Name = "mainTabsCorner"
    mainTabsCorner.Parent = mainTabs
    
    mainTabs.CanvasSize = UDim2.new(0, 0, 0, mainTabsList.AbsoluteContentSize.Y)
    mainTabsList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        mainTabs.CanvasSize = UDim2.new(0, 0, 0, mainTabsList.AbsoluteContentSize.Y)
    end)

    tabsSection.Name = "tabsSection"
    tabsSection.Parent = mainFrame
    tabsSection.BackgroundColor3 = themeList.ElementColor
    Objects[tabsSection] = "BackgroundColor3"
    tabsSection.Position = UDim2.new(0, 156, 0, 3)
    tabsSection.Size = UDim2.new(0, 440, 0, 30)
    
    tabSecCorner.Name = "tabSecCorner"
    tabSecCorner.Parent = tabsSection
    tabSecCorner.CornerRadius = UDim.new(0, 4)

    mainPages.Name = "mainPages"
    mainPages.Parent = mainFrame
    mainPages.BackgroundColor3 = themeList.Background
    Objects[mainPages] = "BackgroundColor3"
    mainPages.Position = UDim2.new(0, 156, 0, 36)
    mainPages.Size = UDim2.new(0, 440, 0, 317)
    mainPages.Visible = true

    mainPagesCorner.CornerRadius = UDim.new(0, 4)
    mainPagesCorner.Name = "mainPagesCorner"
    mainPagesCorner.Parent = mainPages
    
    blurFrame.Name = "blurFrame"
    blurFrame.Parent = mainPages
    blurFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    blurFrame.BackgroundTransparency = 1
    blurFrame.BorderSizePixel = 0
    blurFrame.Position = UDim2.new(0, 0, 0, 0)
    blurFrame.Size = UDim2.new(1, 0, 1, 0)
    blurFrame.ZIndex = 999
    
    infoContainer.Name = "infoContainer"
    infoContainer.Parent = mainFrame
    infoContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    infoContainer.BackgroundTransparency = 1.000
    infoContainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
    infoContainer.ClipsDescendants = true
    infoContainer.Position = UDim2.new(0.299047619, 0, 0.874213815, 0)
    infoContainer.Size = UDim2.new(0, 390, 0, 30)

    coroutine.wrap(function()
        while wait() do
            coverTopHeader.BackgroundColor3 = themeList.AccentColor
            mainTopHeader.BackgroundColor3 = themeList.Background
            mainTitle.TextColor3 = themeList.TextColor
            mainFrame.BackgroundColor3 = themeList.AccentColor
            mainTabs.BackgroundColor3 = themeList.Background
            mainPages.BackgroundColor3 = themeList.Background
            tabsSection.BackgroundColor3 = themeList.ElementColor
            close.ImageColor3 = themeList.ImageColor
        end
    end)()

    function Library:ChangeColor(prope,color)
        if prope == "Background" then
            themeList.Background = color
        elseif prope == "AccentColor" then
            themeList.AccentColor = color
        elseif prope == "ImageColor" then
            themeList.ImageColor = color
        elseif prope == "TextColor" then
            themeList.TextColor = color
        elseif prope == "ElementColor" then
            themeList.ElementColor = color
        end
    end

    function Library:Notification(nTitle, nText)

        local NotifFrame = Instance.new("TextButton")
        local mainNotif = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local notifHeader = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local notifLabel = Instance.new("TextLabel")
        local notifBack = Instance.new("Frame")
        local UICorner_3 = Instance.new("UICorner")
        local notifDesc = Instance.new("TextLabel")
        local btn = Instance.new("TextButton")
        local UICorner_4 = Instance.new("UICorner")

        NotifFrame.Name = nTitle or "NotifFrame"
        NotifFrame.Parent = Main
        NotifFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        NotifFrame.BackgroundTransparency = 1.000
        NotifFrame.BorderSizePixel = 0
        NotifFrame.AutoButtonColor = false
        NotifFrame.Size = UDim2.new(1, 0, 1, 0)
        NotifFrame.Font = Enum.Font.SourceSans
        NotifFrame.Text = ""
        NotifFrame.TextSize = 14.000
        NotifFrame.TextColor3 = Color3.fromRGB(255, 255, 255)

        Utility:TweenObject(NotifFrame, {BackgroundTransparency = 0.200}, 0.15)
        wait(0.15)

        mainNotif.Name = "mainNotif"
        mainNotif.Parent = NotifFrame
        mainNotif.AnchorPoint = Vector2.new(0.5, 0.5)
        mainNotif.BackgroundColor3 = themeList.AccentColor
        mainNotif.ClipsDescendants = true
        mainNotif.Position = UDim2.new(0.499166727, 0, 0.5, 0)
        mainNotif.Size = UDim2.new(0, 0, 0, 0)

        Utility:TweenObject(mainNotif, {Size = UDim2.new(0, 507, 0, 324)}, 0.15)

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = mainNotif

        notifHeader.Name = "notifHeader"
        notifHeader.Parent = mainNotif
        notifHeader.BackgroundColor3 = themeList.ElementColor
        notifHeader.Position = UDim2.new(0.0118343197, 0, 0.0185185187, 0)
        notifHeader.Size = UDim2.new(0, 495, 0, 30)

        UICorner_2.CornerRadius = UDim.new(0, 4)
        UICorner_2.Parent = notifHeader

        notifLabel.Name = "notifLabel"
        notifLabel.Parent = notifHeader
        notifLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        notifLabel.BackgroundTransparency = 1.000
        notifLabel.BorderSizePixel = 0
        notifLabel.Size = UDim2.new(1, 0, 1, 0)
        notifLabel.Font = Enum.Font.SourceSansBold
        notifLabel.Text = "!! "..nTitle.." !!" or "Notification"
        notifLabel.TextColor3 = themeList.TextColor
        notifLabel.TextSize = 15.000

        notifBack.Name = "notifBack"
        notifBack.Parent = mainNotif
        notifBack.BackgroundColor3 = themeList.ElementColor
        notifBack.Position = UDim2.new(0.0118343197, 0, 0.132716045, 0)
        notifBack.Size = UDim2.new(0, 495, 0, 273)

        UICorner_3.CornerRadius = UDim.new(0, 4)
        UICorner_3.Parent = notifBack

        notifDesc.Name = "notifDesc"
        notifDesc.Parent = notifBack
        notifDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        notifDesc.BackgroundTransparency = 1.000
        notifDesc.BorderSizePixel = 0
        notifDesc.Position = UDim2.new(0.0141414143, 0, 0.0402930416, 0)
        notifDesc.Size = UDim2.new(0, 481, 0, 216)
        notifDesc.Font = Enum.Font.SourceSansBold
        notifDesc.Text = nText or "Text Description"
        notifDesc.TextColor3 = themeList.TextColor
        notifDesc.TextSize = 14.000
        notifDesc.TextXAlignment = Enum.TextXAlignment.Left
        notifDesc.TextYAlignment = Enum.TextYAlignment.Top

        btn.Name = "btn"
        btn.Parent = notifBack
        btn.BackgroundColor3 = themeList.AccentColor
        btn.Position = UDim2.new(0.404040396, 0, 0.868131876, 0)
        btn.Size = UDim2.new(0, 95, 0, 27)
        btn.AutoButtonColor = false
        btn.Font = Enum.Font.SourceSansBold
        btn.Text = "OK"
        btn.TextColor3 = themeList.TextColor
        btn.TextSize = 16.000
        btn.BackgroundTransparency = 0

        if themeList.AccentColor == Color3.fromRGB(255,255,255) then
            Utility:TweenObject(btn, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
        end 
        if themeList.AccentColor == Color3.fromRGB(0,0,0) then
            Utility:TweenObject(btn, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
        end 

        UICorner_4.CornerRadius = UDim.new(0, 4)
        UICorner_4.Parent = btn

        coroutine.wrap(function()
            while wait() do
                btn.TextColor3 = themeList.TextColor
                btn.BackgroundColor3 = themeList.AccentColor
                notifDesc.TextColor3 = themeList.TextColor
                notifBack.BackgroundColor3 = themeList.ElementColor
                notifLabel.TextColor3 = themeList.TextColor
                notifHeader.BackgroundColor3 = themeList.ElementColor
                mainNotif.BackgroundColor3 = themeList.AccentColor
            end
        end)()

		btn.MouseEnter:Connect(function()
            Utility:TweenObject(btn, {BackgroundTransparency = 0.7}, 0.15)
            Utility:TweenObject(btn, {TextSize = 14.000}, 0.15)
        end)
	    
	    btn.MouseLeave:Connect(function()
            Utility:TweenObject(btn, {BackgroundTransparency = 0}, 0.15)
            Utility:TweenObject(btn, {TextSize = 16.000}, 0.15)
        end)
        
		btn.MouseButton1Click:Connect(function()
            Utility:TweenObject(mainNotif, {Size = UDim2.new(0, 0, 0, 0)}, 0.15)
			wait(0.15)
            Utility:TweenObject(NotifFrame, {BackgroundTransparency = 1.000}, 0.15)
			wait(0.15)
			NotifFrame:Destroy()
		end)
	end
    
    local CreateTab = {}
    
    local first = true
    
    function CreateTab:addTab(tabName, tabimg)
        tabName = tabName or "Tab"
        tabimg = tabimg or "rbxassetid://6026568229"
        table.insert(CreateTab, tabName)
        local tabButton = Instance.new("TextButton")
        local tabCorner = Instance.new("UICorner")
        local tabTitle = Instance.new("TextLabel")
        local tabImage = Instance.new("ImageLabel")
        
        tabButton.Name = "tabButton"
        tabButton.Parent = mainTabs
        tabButton.BackgroundColor3 = themeList.ElementColor
        Objects[tabButton] = "BackgroundColor3"
        tabButton.Size = UDim2.new(0, 150, 0, 28)
        tabButton.AutoButtonColor = false
        tabButton.Font = Enum.Font.SourceSansBold
        tabButton.Text = ""
        tabButton.TextSize = 14.000
        tabButton.TextColor3 = themeList.TextColor
        tabButton.BackgroundTransparency = 0
        
        tabCorner.Parent = tabButton
        tabCorner.CornerRadius = UDim.new(0, 4)
        
        tabTitle.Name = "tabTitle"
        tabTitle.Parent = tabButton
        tabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tabTitle.BackgroundTransparency = 1.000
        tabTitle.BorderSizePixel = 0
        tabTitle.Size = UDim2.new(0, 120, 0, 28)
        tabTitle.Position = UDim2.new(0, 30, 0, 0)
        tabTitle.Font = Enum.Font.SourceSansBold
        tabTitle.Text = tabName
        tabTitle.TextSize = 14.000
        tabTitle.TextXAlignment = Enum.TextXAlignment.Left
        tabTitle.TextColor3 = themeList.TextColor
        Objects[tabTitle] = "TextColor3"
        
        tabImage.Name = "tabImage"
        tabImage.Parent = tabButton
        tabImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tabImage.BackgroundTransparency = 1.000
        tabImage.BorderSizePixel = 0
        tabImage.Position = UDim2.new(0, 3, 0, 5)
        tabImage.Size = UDim2.new(0, 18, 0, 18)
        tabImage.Image = tabimg
        tabImage.ImageColor3 = themeList.ImageColor
        Objects[tabImage] = "ImageColor3"
        
        local tabSectionFrame = Instance.new("ScrollingFrame")
        local tabsectionframeLayout = Instance.new("UIListLayout")
        local tabsectionCorner = Instance.new("UICorner")
        local pagesFolder = Instance.new("Frame")
        
        tabSectionFrame.Name = "tabSectionFrame"
        tabSectionFrame.Parent = tabsSection
        tabSectionFrame.BackgroundColor3 = themeList.Background
        Objects[tabSectionFrame] = "BackgroundColor3"
        tabSectionFrame.BorderSizePixel = 0
        tabSectionFrame.Active = true
        tabSectionFrame.Visible = false
        tabSectionFrame.Size = UDim2.new(0, 434, 0, 24)
        tabSectionFrame.Position = UDim2.new(0, 3, 0, 3)
        tabSectionFrame.ScrollBarThickness = 0
        
        tabsectionframeLayout.Parent = tabSectionFrame
        tabsectionframeLayout.Name = "tabsectionframeLayout"
        tabsectionframeLayout.SortOrder = Enum.SortOrder.LayoutOrder
        tabsectionframeLayout.Padding = UDim.new(0, 3)
        tabsectionframeLayout.FillDirection = Enum.FillDirection.Horizontal
        tabsectionframeLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        
        tabsectionCorner.Parent = tabSectionFrame
        tabsectionCorner.CornerRadius = UDim.new(0, 4)
        
        pagesFolder.Name = "pagesFolder"
        pagesFolder.Parent = mainPages
        pagesFolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        pagesFolder.BackgroundTransparency = 1.000
        pagesFolder.BorderSizePixel = 0
        pagesFolder.Size = UDim2.new(1, 0, 1, 0)
        pagesFolder.Visible = false
        
        tabSectionFrame.CanvasSize = UDim2.new(0, tabsectionframeLayout.AbsoluteContentSize.X, 0, 0)
        tabsectionframeLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tabSectionFrame.CanvasSize = UDim2.new(0, tabsectionframeLayout.AbsoluteContentSize.X, 0, 0)
        end)

        if first then
            first = false
            Utility:TweenObject(tabButton, {BackgroundTransparency = 0.5}, 0.2)
            tabSectionFrame.Visible = true
        else
            Utility:TweenObject(tabButton, {BackgroundTransparency = 0}, 0.2)
            tabSectionFrame.Visible = false
        end
        
        tabButton.MouseButton1Click:Connect(function()
            for i,v in next, mainPages:GetChildren() do
                if v.Name == "pagesFolder" then
                    v.Visible = false
                end
            end
            pagesFolder.Visible = true
            for i,v in next, tabsSection:GetChildren() do
                if v.Name == "tabSectionFrame" then
                    v.Visible = false
                end
            end
            tabSectionFrame.Visible = true
            for i,v in next, mainTabs:GetChildren() do
                if v:IsA("TextButton") then
                    if themeList.ElementColor == Color3.fromRGB(255,255,255) then
                        Utility:TweenObject(v, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
                    end 
                    if themeList.ElementColor == Color3.fromRGB(0,0,0) then
                        Utility:TweenObject(v, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
                    end 
                    Utility:TweenObject(v, {BackgroundTransparency = 0}, 0.2)
                end
            end
            if themeList.ElementColor == Color3.fromRGB(255,255,255) then
                Utility:TweenObject(tabButton, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
            end 
            if themeList.ElementColor == Color3.fromRGB(0,0,0) then
                Utility:TweenObject(tabButton, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
            end
            Utility:TweenObject(tabButton, {BackgroundTransparency = 0.5}, 0.2)
        end)
        
        coroutine.wrap(function()
            while wait() do
                tabImage.ImageColor3 = themeList.ImageColor
                tabTitle.TextColor3 = themeList.TextColor
                tabButton.BackgroundColor3 = themeList.ElementColor
                tabSectionFrame.BackgroundColor3 = themeList.Background
            end
        end)()
        
        local tabSections = {}

        local sectab = false
        
        function tabSections:addSection(secTitle)
            local sectionTitle = Instance.new("TextButton")
            local sectionCorner = Instance.new("UICorner")
            local pageContainer = Instance.new("ScrollingFrame")
            local pageContainerList = Instance.new("UIListLayout")
            
            local function UpdateSize()
                local cS = pageContainerList.AbsoluteContentSize
    
                game.TweenService:Create(pageContainer, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    CanvasSize = UDim2.new(0,0,0,cS.Y)
                }):Play()
            end
            
            pageContainer.Name = "pageContainer"
            pageContainer.Parent = pagesFolder
            pageContainer.Active = true
            pageContainer.BackgroundColor3 = themeList.Background
            pageContainer.BorderSizePixel = 0
            pageContainer.Position = UDim2.new(0, 10, 0, 8)
            pageContainer.Size = UDim2.new(0, 420, 0, 300)
            pageContainer.Visible = false
            pageContainer.ScrollBarThickness = 0
    
            pageContainerList.Name = "pageContainerList"
            pageContainerList.Parent = pageContainer
            pageContainerList.SortOrder = Enum.SortOrder.LayoutOrder
            pageContainerList.Padding = UDim.new(0, 4)
            
            sectionTitle.Name = "sectionTitle"
            sectionTitle.Parent = tabSectionFrame
            sectionTitle.BackgroundColor3 = themeList.ElementColor
            sectionTitle.Size = UDim2.new(0, 150, 0, 24)
            sectionTitle.AutoButtonColor = false
            sectionTitle.Font = Enum.Font.SourceSansBold
            sectionTitle.Text = "[ "..secTitle.." ]"
            sectionTitle.TextSize = 14.000
            sectionTitle.TextColor3 = themeList.TextColor
            sectionTitle.BackgroundTransparency = 0.7
            
            sectionCorner.Parent = sectionTitle
            sectionCorner.CornerRadius = UDim.new(0, 4)
            
            if sectab then
                sectab = false
                pageContainer.Visible = true
                sectionTitle.BackgroundTransparency = 0
                UpdateSize()
            else
                pageContainer.Visible = false
                sectionTitle.BackgroundTransparency = 0.7
            end
            
            table.insert(tabSections, secTitle)
            
            UpdateSize()
            pageContainer.ChildAdded:Connect(UpdateSize)
            pageContainer.ChildRemoved:Connect(UpdateSize)
            
            sectionTitle.MouseButton1Click:Connect(function()
                UpdateSize()
                for i,v in next, pagesFolder:GetChildren() do
                    if v.Name == "pageContainer" then
                        v.Visible = false
                    end
                end
                pagesFolder.Visible = true
                pageContainer.Visible = true
                for i,v in next, tabSectionFrame:GetChildren() do
                    if v:IsA("TextButton") then
                        if themeList.ElementColor == Color3.fromRGB(255,255,255) then
                            Utility:TweenObject(v, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
                        end 
                        if themeList.ElementColor == Color3.fromRGB(0,0,0) then
                            Utility:TweenObject(v, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
                        end 
                        Utility:TweenObject(v, {BackgroundTransparency = 0.7}, 0.2)
                    end
                end
                if themeList.ElementColor == Color3.fromRGB(255,255,255) then
                    Utility:TweenObject(sectionTitle, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
                end 
                if themeList.ElementColor == Color3.fromRGB(0,0,0) then
                    Utility:TweenObject(sectionTitle, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
                end 
                Utility:TweenObject(sectionTitle, {BackgroundTransparency = 0}, 0.2)
            end)
            
            local secItems = {}
            local focusing = false
            local viewDe = false
            
            coroutine.wrap(function()
                while wait() do
                    pageContainer.BackgroundColor3 = themeList.Background
                    sectionTitle.TextColor3 = themeList.TextColor
                    sectionTitle.BackgroundColor3 = themeList.ElementColor
                end
            end)()
            
            function secItems:newSection(secName, hidden)
                local sectionFunctions = {}
                local modules = {}
                hidden = hidden or false
                local sectionFrame = Instance.new("Frame")
                local sectionlistoknvm = Instance.new("UIListLayout")
                local sectionHead = Instance.new("Frame")
                local sHeadCorner = Instance.new("UICorner")
                local sectionName = Instance.new("TextLabel")
                local sectionInners = Instance.new("Frame")
                local sectionElListing = Instance.new("UIListLayout")
                
                if hidden then
        		    sectionHead.Visible = false
        	    else
        		    sectionHead.Visible = true
                end
    	    
    	        sectionFrame.Name = "sectionFrame"
                sectionFrame.Parent = pageContainer
                sectionFrame.BackgroundColor3 = themeList.Background--36, 37, 43
                sectionFrame.BorderSizePixel = 0
                
                sectionlistoknvm.Name = "sectionlistoknvm"
                sectionlistoknvm.Parent = sectionFrame
                sectionlistoknvm.SortOrder = Enum.SortOrder.LayoutOrder
                sectionlistoknvm.Padding = UDim.new(0, 3)
                
                for i,v in pairs(sectionInners:GetChildren()) do
                    while wait() do
                        if v:IsA("Frame") or v:IsA("TextButton") then
                            function size(pro)
                                if pro == "Size" then
                                    UpdateSize()
                                    updateSectionFrame()
                                end
                            end
                            v.Changed:Connect(size)
                        end
                    end
                end
                
                sectionHead.Name = "sectionHead"
                sectionHead.Parent = sectionFrame
                sectionHead.BackgroundColor3 = themeList.ElementColor
                Objects[sectionHead] = "BackgroundColor3"
                sectionHead.Size = UDim2.new(1, 0, 0, 25)
                
                sHeadCorner.CornerRadius = UDim.new(0, 4)
                sHeadCorner.Name = "sHeadCorner"
                sHeadCorner.Parent = sectionHead
    
                sectionName.Name = "sectionName"
                sectionName.Parent = sectionHead
                sectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                sectionName.BackgroundTransparency = 1.000
                sectionName.BorderColor3 = Color3.fromRGB(27, 42, 53)
                sectionName.Position = UDim2.new(0, 0, 0, 0)
                sectionName.Size = UDim2.new(1, 0, 1, 0)
                sectionName.Font = Enum.Font.SourceSansBold
                sectionName.Text = secName
                sectionName.RichText = true
                sectionName.TextColor3 = themeList.TextColor
                Objects[sectionName] = "TextColor3"
                sectionName.TextSize = 14.000
                sectionName.TextXAlignment = Enum.TextXAlignment.Center
                
                if themeList.ElementColor == Color3.fromRGB(255,255,255) then
                    Utility:TweenObject(sectionName, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
                end 
                if themeList.ElementColor == Color3.fromRGB(0,0,0) then
                    Utility:TweenObject(sectionName, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
                end
                
                sectionInners.Name = "sectionInners"
                sectionInners.Parent = sectionFrame
                sectionInners.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                sectionInners.BackgroundTransparency = 1.000
                sectionInners.Position = UDim2.new(0, 0, 0.190751448, 0)
    
                sectionElListing.Name = "sectionElListing"
                sectionElListing.Parent = sectionInners
                sectionElListing.SortOrder = Enum.SortOrder.LayoutOrder
                sectionElListing.Padding = UDim.new(0, 3)
                
                coroutine.wrap(function()
                    while wait() do
                        sectionFrame.BackgroundColor3 = themeList.Background
                        sectionHead.BackgroundColor3 = themeList.ElementColor
                        sectionTitle.TextColor3 = themeList.TextColor
                        sectionTitle.BackgroundColor3 = themeList.ElementColor
                        sectionName.TextColor3 = themeList.TextColor
                    end
                end)()
                
                local function updateSectionFrame()
                    local innerSc = sectionElListing.AbsoluteContentSize
                    sectionInners.Size = UDim2.new(1, 0, 0, innerSc.Y)
                    local frameSc = sectionlistoknvm.AbsoluteContentSize
                    sectionFrame.Size = UDim2.new(1, 0, 0, frameSc.Y)
                end
                UpdateSize()
                updateSectionFrame()

                local Elements = {}
                function Elements:addButton(bname, tipINf, callback)
                    showLogo = showLogo or true
                    local ButtonFunction = {}
                    tipINf = tipINf or "Tip: Clicking this nothing will happen!"
                    bname = bname or "Click Me!"
                    callback = callback or function() end
    
                    local buttonElement = Instance.new("TextButton")
                    local UICorner = Instance.new("UICorner")
                    local btnInfo = Instance.new("TextLabel")
                    local viewInfo = Instance.new("ImageButton")
                    local touch = Instance.new("ImageLabel")
                    local Sample = Instance.new("ImageLabel")
    
                    table.insert(modules, bname)
    
                    buttonElement.Name = bname
                    buttonElement.Parent = sectionInners
                    buttonElement.BackgroundColor3 = themeList.ElementColor
                    buttonElement.ClipsDescendants = true
                    buttonElement.Size = UDim2.new(1, 0, 0, 25)
                    buttonElement.AutoButtonColor = false
                    buttonElement.Font = Enum.Font.SourceSans
                    buttonElement.Text = ""
                    buttonElement.TextColor3 = Color3.fromRGB(0, 0, 0)
                    buttonElement.TextSize = 14.000
                    Objects[buttonElement] = "BackgroundColor3"
    
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = buttonElement
    
                    viewInfo.Name = "viewInfo"
                    viewInfo.Parent = buttonElement
                    viewInfo.BackgroundTransparency = 1.000
                    viewInfo.LayoutOrder = 9
                    viewInfo.Position = UDim2.new(0.940000007, 0, 0, 2)
                    viewInfo.Size = UDim2.new(0, 21, 0, 21)
                    viewInfo.ZIndex = 2
                    viewInfo.Image = "rbxassetid://3926305904"
                    viewInfo.ImageColor3 = themeList.ImageColor
                    Objects[viewInfo] = "ImageColor3"
                    viewInfo.ImageRectOffset = Vector2.new(764, 764)
                    viewInfo.ImageRectSize = Vector2.new(36, 36)
    
                    Sample.Name = "Sample"
                    Sample.Parent = buttonElement
                    Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Sample.BackgroundTransparency = 1.000
                    Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                    Sample.ImageColor3 = themeList.ImageColor
                    Objects[Sample] = "ImageColor3"
                    Sample.ImageTransparency = 0.600
    
                    local moreInfo = Instance.new("TextLabel")
                    local UICorner = Instance.new("UICorner")
    
                    moreInfo.Name = "TipMore"
                    moreInfo.Parent = infoContainer
                    moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
                    moreInfo.Position = UDim2.new(0, 0, 2, 0)
                    moreInfo.Size = UDim2.new(1, 0, 1, 0)
                    moreInfo.ZIndex = 9
                    moreInfo.Font = Enum.Font.SourceSans
                    moreInfo.Text = "  "..tipINf
                    moreInfo.RichText = true
                    moreInfo.TextColor3 = themeList.TextColor
                    Objects[moreInfo] = "TextColor3"
                    moreInfo.TextSize = 14.000
                    moreInfo.TextXAlignment = Enum.TextXAlignment.Left
                    Objects[moreInfo] = "BackgroundColor3"
    
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = moreInfo
    
                    touch.Name = "touch"
                    touch.Parent = buttonElement
                    touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    touch.BackgroundTransparency = 1.000
                    touch.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    touch.Position = UDim2.new(0, 3, 0, 3)
                    touch.Size = UDim2.new(0, 17, 0, 17)
                    touch.Image = "rbxassetid://3926305904"
                    touch.ImageColor3 = themeList.ImageColor
                    Objects[touch] = "ImageColor"
                    touch.ImageRectOffset = Vector2.new(84, 204)
                    touch.ImageRectSize = Vector2.new(36, 36)
                    touch.ImageTransparency = 0
    
                    btnInfo.Name = "btnInfo"
                    btnInfo.Parent = buttonElement
                    btnInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    btnInfo.BackgroundTransparency = 1.000
                    btnInfo.Position = UDim2.new(0, 30, 0, 0)
                    btnInfo.Size = UDim2.new(0, 314, 0, 25)
                    btnInfo.Font = Enum.Font.SourceSansBold
                    btnInfo.Text = bname
                    btnInfo.RichText = true
                    btnInfo.TextColor3 = themeList.TextColor
                    Objects[btnInfo] = "TextColor3"
                    btnInfo.TextSize = 14.000
                    btnInfo.TextXAlignment = Enum.TextXAlignment.Left
    
                    if themeList.AccentColor == Color3.fromRGB(255,255,255) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
                    end 
                    if themeList.AccentColor == Color3.fromRGB(0,0,0) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
                    end 
    
                    updateSectionFrame()
                    UpdateSize()
    
                    local ms = game.Players.LocalPlayer:GetMouse()
    
                    local btn = buttonElement
                    local sample = Sample
    
                    btn.MouseButton1Click:Connect(function()
                        if not focusing then
                            callback()
                        else
                            for i,v in next, infoContainer:GetChildren() do
                                Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.05)
                                focusing = false
                            end
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.05)
                        end
                    end)
                    local hovering = false
                    btn.MouseEnter:Connect(function()
                        if not focusing then
                            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                            }):Play()
                            hovering = true
                        end
                    end)
                    btn.MouseLeave:Connect(function()
                        if not focusing then 
                            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = themeList.ElementColor
                            }):Play()
                            hovering = false
                        end
                    end)
                    viewInfo.MouseButton1Click:Connect(function()
                        if not viewDe then
                            viewDe = true
                            focusing = true
                            for i,v in next, infoContainer:GetChildren() do
                                if v ~= moreInfo then
                                    Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                end
                            end
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,0,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                            Utility:TweenObject(btn, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                            wait(1.5)
                            focusing = false
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,2,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                            wait(0)
                            viewDe = false
                        end
                    end)
                    coroutine.wrap(function()
                        while wait() do
                            if not hovering then
                                buttonElement.BackgroundColor3 = themeList.ElementColor
                            end
                            viewInfo.ImageColor3 = themeList.ImageColor
                            Sample.ImageColor3 = themeList.ImageColor
                            moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
                            moreInfo.TextColor3 = themeList.TextColor
                            touch.ImageColor3 = themeList.ImageColor
                            btnInfo.TextColor3 = themeList.TextColor
                        end
                    end)()
                    
                    function ButtonFunction:UpdateButton(newTitle)
                        btnInfo.Text = newTitle
                    end
                    return ButtonFunction
                end

                function Elements:addTextBox(Idx, tname, tTip, textbox, callback)
					local Textbox = {
						Value = textbox;
						Type = 'Textbox';
					};
                    tname = tname or "Textbox"
                    tTip = tTip or "Gets a value of Textbox"
                    callback = callback or function() end
                    textbox = Textbox.Value or 'Type Here'

                    local textboxElement = Instance.new("TextButton")
                    local UICorner = Instance.new("UICorner")
                    local viewInfo = Instance.new("ImageButton")
                    local write = Instance.new("ImageLabel")
                    local TextBox = Instance.new("TextBox")
                    local UICorner_2 = Instance.new("UICorner")
                    local togName = Instance.new("TextLabel")
    
                    textboxElement.Name = "textboxElement"
                    textboxElement.Parent = sectionInners
                    textboxElement.BackgroundColor3 = themeList.ElementColor
                    textboxElement.ClipsDescendants = true
                    textboxElement.Size = UDim2.new(1, 0, 0, 25)
                    textboxElement.AutoButtonColor = false
                    textboxElement.Font = Enum.Font.SourceSans
                    textboxElement.Text = ""
                    textboxElement.TextColor3 = Color3.fromRGB(0, 0, 0)
                    textboxElement.TextSize = 14.000
    
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = textboxElement
    
                    viewInfo.Name = "viewInfo"
                    viewInfo.Parent = textboxElement
                    viewInfo.BackgroundTransparency = 1.000
                    viewInfo.LayoutOrder = 9
                    viewInfo.Position = UDim2.new(0.940000007, 0, 0, 2)
                    viewInfo.Size = UDim2.new(0, 21, 0, 21)
                    viewInfo.ZIndex = 2
                    viewInfo.Image = "rbxassetid://3926305904"
                    viewInfo.ImageColor3 = themeList.ImageColor
                    viewInfo.ImageRectOffset = Vector2.new(764, 764)
                    viewInfo.ImageRectSize = Vector2.new(36, 36)
    
                    write.Name = "write"
                    write.Parent = textboxElement
                    write.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    write.BackgroundTransparency = 1.000
                    write.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    write.Position = UDim2.new(0, 6, 0, 5)
                    write.Size = UDim2.new(0, 12, 0, 15)
                    write.Image = "rbxassetid://3926305904"
                    write.ImageColor3 = themeList.ImageColor
                    write.ImageRectOffset = Vector2.new(324, 604)
                    write.ImageRectSize = Vector2.new(36, 36)
    
                    TextBox.Parent = textboxElement
                    TextBox.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 6, themeList.AccentColor.g * 255 - 6, themeList.AccentColor.b * 255 - 7)
                    TextBox.BorderSizePixel = 0
                    TextBox.ClipsDescendants = true
                    TextBox.Position = UDim2.new(0, 226, 0, 3)
                    TextBox.Size = UDim2.new(0, 150, 0, 19)
                    TextBox.ZIndex = 99
                    TextBox.Font = Enum.Font.Code
                    TextBox.PlaceholderColor3 = Color3.fromRGB(themeList.TextColor.r * 255 - 19, themeList.TextColor.g * 255 - 26, themeList.TextColor.b * 255 - 35)
                    TextBox.PlaceholderText = textbox or "Type here!"
                    TextBox.Text = ""
                    TextBox.TextColor3 = themeList.TextColor
                    TextBox.TextSize = 12.000
    
                    UICorner_2.CornerRadius = UDim.new(0, 4)
                    UICorner_2.Parent = TextBox
    
                    togName.Name = "togName"
                    togName.Parent = textboxElement
                    togName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    togName.BackgroundTransparency = 1.000
                    togName.Position = UDim2.new(0, 30, 0, 0)
                    togName.Size = UDim2.new(0, 138, 0, 25)
                    togName.Font = Enum.Font.SourceSansBold
                    togName.Text = tname
                    togName.RichText = true
                    togName.TextColor3 = themeList.TextColor
                    togName.TextSize = 14.000
                    togName.TextXAlignment = Enum.TextXAlignment.Left
    
                    local moreInfo = Instance.new("TextLabel")
                    local UICorner = Instance.new("UICorner")
    
                    moreInfo.Name = "TipMore"
                    moreInfo.Parent = infoContainer
                    moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
                    moreInfo.Position = UDim2.new(0, 0, 2, 0)
                    moreInfo.Size = UDim2.new(1, 0, 1, 0)
                    moreInfo.ZIndex = 9
                    moreInfo.Font = Enum.Font.SourceSans
                    moreInfo.RichText = true
                    moreInfo.Text = "  "..tTip
                    moreInfo.TextColor3 = themeList.TextColor
                    moreInfo.TextSize = 14.000
                    moreInfo.TextXAlignment = Enum.TextXAlignment.Left
    
                    if themeList.AccentColor == Color3.fromRGB(255,255,255) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
                    end 
                    if themeList.AccentColor == Color3.fromRGB(0,0,0) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
                    end 
    
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = moreInfo
    
                    updateSectionFrame()
                    UpdateSize()
                
                    local btn = textboxElement
                    local infBtn = viewInfo
    
                    btn.MouseButton1Click:Connect(function()
                        if focusing then
                            for i,v in next, infoContainer:GetChildren() do
                                Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                focusing = false
                            end
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        end
                    end)
                    local hovering = false
                    btn.MouseEnter:Connect(function()
                        if not focusing then
                            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                            }):Play()
                            hovering = true
                        end 
                    end)
    
                    btn.MouseLeave:Connect(function()
                        if not focusing then
                            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = themeList.ElementColor
                            }):Play()
                            hovering = false
                        end
                    end)
    
                    TextBox.FocusLost:Connect(function()
                        if not EnterPressed then 
                            callback(TextBox.Text)
							Textbox.Value = TextBox.Text
                            return
                        end
                        TextBox.Text = textbox
						Textbox.Value = TextBox.Text
                        if focusing then
                            for i,v in next, infoContainer:GetChildren() do
                                Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                focusing = false
                            end
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        end
                    end)
    
                    viewInfo.MouseButton1Click:Connect(function()
                        if not viewDe then
                            viewDe = true
                            focusing = true
                            for i,v in next, infoContainer:GetChildren() do
                                if v ~= moreInfo then
                                    Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                end
                            end
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,0,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                            Utility:TweenObject(btn, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                            wait(1.5)
                            focusing = false
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,2,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                            wait(0)
                            viewDe = false
                        end
                    end)
                    coroutine.wrap(function()
                        while wait() do
                            if not hovering then
                                textboxElement.BackgroundColor3 = themeList.ElementColor
                            end
                            TextBox.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 6, themeList.AccentColor.g * 255 - 6, themeList.AccentColor.b * 255 - 7)
                            viewInfo.ImageColor3 = themeList.ImageColor
                            moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
                            moreInfo.TextColor3 = themeList.TextColor
                            write.ImageColor3 = themeList.ImageColor
                            togName.TextColor3 = themeList.TextColor
                            TextBox.PlaceholderColor3 = Color3.fromRGB(themeList.TextColor.r * 255 - 19, themeList.TextColor.g * 255 - 26, themeList.TextColor.b * 255 - 35)
                            TextBox.TextColor3 = themeList.TextColor
                        end
                    end)()
					
					function Textbox:SetValue(Text)
						TextBox.PlaceholderText = Text;
						TextBox.Text = Text;
						Textbox.Value = TextBox.Text;
					end;
					
					Options[Idx] = Textbox;
                end

                function Elements:addToggle(Idx, tname, nTip, default, callback)
					local Toggle = {
						Value = default or false;
						Type = 'Toggle';
					};
                    local TogFunction = {}
                    tname = tname or "Toggle"
                    nTip = nTip or "Prints Current Toggle State"
                    callback = callback or function() end
                    local toggled = false
                    default = default or false
                    table.insert(SettingsT, tname)

                    local toggleElement = Instance.new("TextButton")
                    local UICorner = Instance.new("UICorner")
                    local toggleEnabled = Instance.new("ImageLabel")
                    local togName = Instance.new("TextLabel")
                    local viewInfo = Instance.new("ImageButton")
                    local Sample = Instance.new("ImageLabel")

                    toggleElement.Name = "toggleElement"
                    toggleElement.Parent = sectionInners
                    toggleElement.BackgroundColor3 = themeList.ElementColor
                    toggleElement.ClipsDescendants = true
                    toggleElement.Size = UDim2.new(1, 0, 0, 25)
                    toggleElement.AutoButtonColor = false
                    toggleElement.Font = Enum.Font.SourceSans
                    toggleElement.Text = ""
                    toggleElement.TextColor3 = Color3.fromRGB(0, 0, 0)
                    toggleElement.TextSize = 14.000

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = toggleElement

                    toggleEnabled.Name = "toggleEnabled"
                    toggleEnabled.Parent = toggleElement
                    toggleEnabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    toggleEnabled.BackgroundTransparency = 1.000
                    toggleEnabled.Position = UDim2.new(0, 3, 0, 3)
                    toggleEnabled.Size = UDim2.new(0, 17, 0, 17)
                    toggleEnabled.Image = "rbxassetid://3926311105"
                    toggleEnabled.ImageColor3 = themeList.ImageColor
                    toggleEnabled.ImageRectOffset = Vector2.new(940, 784)
                    toggleEnabled.ImageRectSize = Vector2.new(48, 48)

                    togName.Name = "togName"
                    togName.Parent = toggleElement
                    togName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    togName.BackgroundTransparency = 1.000
                    togName.Position = UDim2.new(0, 30, 0, 0)
                    togName.Size = UDim2.new(0, 288, 0, 25)
                    togName.Font = Enum.Font.SourceSansBold
                    togName.Text = tname
                    togName.RichText = true
                    togName.TextColor3 = themeList.TextColor
                    togName.TextSize = 14.000
                    togName.TextXAlignment = Enum.TextXAlignment.Left

                    viewInfo.Name = "viewInfo"
                    viewInfo.Parent = toggleElement
                    viewInfo.BackgroundTransparency = 1.000
                    viewInfo.LayoutOrder = 9
                    viewInfo.Position = UDim2.new(0.940000007, 0, 0, 2)
                    viewInfo.Size = UDim2.new(0, 21, 0, 21)
                    viewInfo.ZIndex = 2
                    viewInfo.Image = "rbxassetid://3926305904"
                    viewInfo.ImageColor3 = themeList.ImageColor
                    viewInfo.ImageRectOffset = Vector2.new(764, 764)
                    viewInfo.ImageRectSize = Vector2.new(36, 36)

                    Sample.Name = "Sample"
                    Sample.Parent = toggleElement
                    Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Sample.BackgroundTransparency = 1.000
                    Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                    Sample.ImageColor3 = themeList.ImageColor
                    Sample.ImageTransparency = 0.600

                    local moreInfo = Instance.new("TextLabel")
                    local UICorner = Instance.new("UICorner")
    
                    moreInfo.Name = "TipMore"
                    moreInfo.Parent = infoContainer
                    moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
                    moreInfo.Position = UDim2.new(0, 0, 2, 0)
                    moreInfo.Size = UDim2.new(1, 0, 1, 0)
                    moreInfo.ZIndex = 9
                    moreInfo.Font = Enum.Font.SourceSans
                    moreInfo.RichText = true
                    moreInfo.Text = "  "..nTip
                    moreInfo.TextColor3 = themeList.TextColor
                    moreInfo.TextSize = 14.000
                    moreInfo.TextXAlignment = Enum.TextXAlignment.Left
    
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = moreInfo

                    local ms = game.Players.LocalPlayer:GetMouse()

                    if themeList.AccentColor == Color3.fromRGB(255,255,255) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
                    end 
                    if themeList.AccentColor == Color3.fromRGB(0,0,0) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
                    end 

                    local btn = toggleElement
                    local sample = Sample
                    local img = toggleEnabled
                    local infBtn = viewInfo

                    updateSectionFrame()
                    UpdateSize()

                    if default == true then
                        img.ImageRectOffset = Vector2.new(4, 836)
                        toggled = not toggled
						Toggle.Value = default
                        pcall(callback, toggled)
                    end

                    btn.MouseButton1Click:Connect(function()
                        if not focusing then
                            if toggled == false then
                                img.ImageRectOffset = Vector2.new(4, 836)
                            else
                                img.ImageRectOffset = Vector2.new(940, 784)
                            end
                            toggled = not toggled
							Toggle.Value = toggled
                            pcall(callback, toggled)
                        else
                            for i,v in next, infoContainer:GetChildren() do
                                Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                focusing = false
                            end
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        end
                    end)
                    local hovering = false
                    btn.MouseEnter:Connect(function()
                        if not focusing then
                            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                            }):Play()
                            hovering = true
                        end 
                    end)
                    btn.MouseLeave:Connect(function()
                        if not focusing then
                            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = themeList.ElementColor
                            }):Play()
                            hovering = false
                        end
                    end)

                    coroutine.wrap(function()
                        while wait() do
                            if not hovering then
                                toggleElement.BackgroundColor3 = themeList.ElementColor
                            end
                            toggleEnabled.ImageColor3 = themeList.ImageColor
                            togName.TextColor3 = themeList.TextColor
                            viewInfo.ImageColor3 = themeList.ImageColor
                            Sample.ImageColor3 = themeList.ImageColor
                            moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
                            moreInfo.TextColor3 = themeList.TextColor
                        end
                    end)()
                    viewInfo.MouseButton1Click:Connect(function()
                        if not viewDe then
                            viewDe = true
                            focusing = true
                            for i,v in next, infoContainer:GetChildren() do
                                if v ~= moreInfo then
                                    Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                end
                            end
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,0,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                            Utility:TweenObject(btn, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                            wait(1.5)
                            focusing = false
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,2,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                            wait(0)
                            viewDe = false
                        end
                    end)
					

                    function TogFunction:UpdateToggle(isTogOn)
                        isTogOn = isTogOn or toggle
                        if isTogOn then
                            toggled = true
							Toggle.Value = toggled;
                            img.ImageRectOffset = Vector2.new(4, 836)
                            pcall(callback, toggled)
                        else
                            toggled = false
							Toggle.Value = toggled;
                            img.ImageRectOffset = Vector2.new(940, 784)
                            pcall(callback, toggled)
                        end
                    end
					
					function Toggle:SetValue(Bool)
                        Bool = Bool or toggle
                        if Bool then
                            toggled = true
							Toggle.Value = toggled;
                            img.ImageRectOffset = Vector2.new(4, 836)
                            pcall(callback, toggled)
                        else
                            toggled = false
							Toggle.Value = toggled;
                            img.ImageRectOffset = Vector2.new(940, 784)
                            pcall(callback, toggled)
                        end
					end;	
					
					Toggles[Idx] = Toggle;
					
                    return TogFunction
                end

                function Elements:addSlider(Idx, slidInf, slidTip, minvalue, maxvalue, startVal, callback)
					local Slider = {
						Value = startVal;
						Min = minvalue;
						Max = maxvalue;
						Type = 'Slider';
					};
                    slidInf = slidInf or "Slider"
                    slidTip = slidTip or "Slider tip here"
                    maxvalue = maxvalue
                    minvalue = minvalue or 0
                    startVal = (math.clamp(startVal, minvalue, maxvalue))
                    if startVal > maxvalue then set = maxvalue end
                    callback = callback or function() end
    
                    local sliderElement = Instance.new("TextButton")
                    local UICorner = Instance.new("UICorner")
                    local togName = Instance.new("TextLabel")
                    local viewInfo = Instance.new("ImageButton")
                    local SliderCover = Instance.new("Frame")
                    local sliderBtn = Instance.new("TextButton")
                    local UICorner_2 = Instance.new("UICorner")
                    local UIListLayout = Instance.new("UIListLayout")
                    local sliderDrag = Instance.new("Frame")
                    local Circle = Instance.new("Frame")
                    local UICorner_4 = Instance.new("UICorner")
                    local UICorner_3 = Instance.new("UICorner")
                    local write = Instance.new("ImageLabel")
    
                    sliderElement.Name = "sliderElement"
                    sliderElement.Parent = sectionInners
                    sliderElement.BackgroundColor3 = themeList.ElementColor
                    sliderElement.ClipsDescendants = true
                    sliderElement.Size = UDim2.new(1, 0, 0, 25)
                    sliderElement.AutoButtonColor = false
                    sliderElement.Font = Enum.Font.SourceSans
                    sliderElement.Text = ""
                    sliderElement.TextColor3 = Color3.fromRGB(0, 0, 0)
                    sliderElement.TextSize = 14.000
    
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = sliderElement
    
                    togName.Name = "togName"
                    togName.Parent = sliderElement
                    togName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    togName.BackgroundTransparency = 1.000
                    togName.Position = UDim2.new(0, 30, 0, 0)
                    togName.Size = UDim2.new(0, 200, 0, 25)
                    togName.Font = Enum.Font.SourceSansBold
                    togName.Text = slidInf.." - "..tostring(startVal and math.floor((startVal / maxvalue) * (maxvalue - minvalue) + minvalue) or 0)
                    togName.RichText = true
                    togName.TextColor3 = themeList.TextColor
                    togName.TextSize = 14.000
                    togName.TextXAlignment = Enum.TextXAlignment.Left
    
                    viewInfo.Name = "viewInfo"
                    viewInfo.Parent = sliderElement
                    viewInfo.BackgroundTransparency = 1.000
                    viewInfo.LayoutOrder = 9
                    viewInfo.Position = UDim2.new(0.940000007, 0, 0, 2)
                    viewInfo.Size = UDim2.new(0, 21, 0, 21)
                    viewInfo.ZIndex = 2
                    viewInfo.Image = "rbxassetid://3926305904"
                    viewInfo.ImageColor3 = themeList.ImageColor
                    viewInfo.ImageRectOffset = Vector2.new(764, 764)
                    viewInfo.ImageRectSize = Vector2.new(36, 36)

                    SliderCover.Name = "SliderCover"
                    SliderCover.Parent = sectionInners
                    SliderCover.BackgroundColor3 = themeList.ElementColor
                    SliderCover.ClipsDescendants = true
                    SliderCover.Size = UDim2.new(1, 0, 0, 25)
    
                    sliderBtn.Name = "sliderBtn"
                    sliderBtn.Parent = SliderCover
                    sliderBtn.BackgroundColor3 = Color3.fromRGB(themeList.Background.r * 255 + 5, themeList.Background.g * 255 + 5, themeList.Background.b * 255  + 5)
                    sliderBtn.BorderSizePixel = 0
                    sliderBtn.Position = UDim2.new(0, 20, 0, 9)
                    sliderBtn.Size = UDim2.new(0, 380, 0, 6)
                    sliderBtn.AutoButtonColor = false
                    sliderBtn.Font = Enum.Font.SourceSans
                    sliderBtn.Text = ""
                    sliderBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                    sliderBtn.TextSize = 14.000
    
                    UICorner_2.Parent = sliderBtn
    
                    UIListLayout.Parent = sliderBtn
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    
                    sliderDrag.Name = "sliderDrag"
                    sliderDrag.Parent = sliderBtn
                    sliderDrag.BackgroundColor3 = themeList.ImageColor
                    sliderDrag.BorderColor3 = Color3.fromRGB(74, 99, 135)
                    sliderDrag.BorderSizePixel = 0
                    sliderDrag.Size = UDim2.new(startVal/maxvalue - minvalue, 0, 0, 6)
    
                    UICorner_3.Parent = sliderDrag

                    Circle.Name = "Circle"
                    Circle.Parent = sliderDrag
                    Circle.AnchorPoint = Vector2.new(0, 0.1)
                    Circle.BackgroundColor3 = Color3.fromRGB(themeList.ImageColor.r * 255 - 1, themeList.ImageColor.g * 255 - 255, themeList.ImageColor.b * 255 - 255)
                    Circle.Position = UDim2.new(1, -2, 0, -1)
                    Circle.Size = UDim2.new(0, 10, 0, 10)
        
                    UICorner_4.Parent = Circle
                    UICorner_4.CornerRadius = UDim.new(0, 10000)
    
                    write.Name = "write"
                    write.Parent = sliderElement
                    write.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    write.BackgroundTransparency = 1.000
                    write.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    write.Position = UDim2.new(0, 3, 0, 3)
                    write.Size = UDim2.new(0, 17, 0, 17)
                    write.Image = "rbxassetid://3926307971"
                    write.ImageColor3 = themeList.ImageColor
                    write.ImageRectOffset = Vector2.new(404, 164)
                    write.ImageRectSize = Vector2.new(36, 36)
    
                    local moreInfo = Instance.new("TextLabel")
                    local UICorner = Instance.new("UICorner")
    
                    moreInfo.Name = "TipMore"
                    moreInfo.Parent = infoContainer
                    moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
                    moreInfo.Position = UDim2.new(0, 0, 2, 0)
                    moreInfo.Size = UDim2.new(1, 0, 1, 0)
                    moreInfo.ZIndex = 9
                    moreInfo.Font = Enum.Font.SourceSans
                    moreInfo.Text = "  "..slidTip
                    moreInfo.TextColor3 = themeList.TextColor
                    moreInfo.TextSize = 14.000
                    moreInfo.RichText = true
                    moreInfo.TextXAlignment = Enum.TextXAlignment.Left
    
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = moreInfo
    
                    if themeList.AccentColor == Color3.fromRGB(255,255,255) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
                    end 
                    if themeList.AccentColor == Color3.fromRGB(0,0,0) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
                    end 
    
                    updateSectionFrame()
                    UpdateSize()

                    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
                    local ms = game.Players.LocalPlayer:GetMouse()
                    local uis = game:GetService("UserInputService")
                    local btn = sliderElement
                    local infBtn = viewInfo
                    local hovering = false
                    btn.MouseEnter:Connect(function()
                        if not focusing then
                            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                            }):Play()
                            hovering = true
                        end 
                    end)
                    btn.MouseLeave:Connect(function()
                        if not focusing then
                            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = themeList.ElementColor
                            }):Play()
                            hovering = false
                        end
                    end)        
    
                    coroutine.wrap(function()
                        while wait() do
                            if not hovering then
                                sliderElement.BackgroundColor3 = themeList.ElementColor
                            end
                            moreInfo.TextColor3 = themeList.TextColor
                            moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
                            write.ImageColor3 = themeList.ImageColor
                            togName.TextColor3 = themeList.TextColor
                            viewInfo.ImageColor3 = themeList.ImageColor
                            sliderBtn.BackgroundColor3 = Color3.fromRGB(themeList.Background.r * 255 + 5, themeList.Background.g * 255 + 5, themeList.Background.b * 255  + 5)
                            sliderDrag.BackgroundColor3 = themeList.ImageColor
                            Circle.BackgroundColor3 = Color3.fromRGB(themeList.ImageColor.r * 255 - 1, themeList.ImageColor.g * 255 - 255, themeList.ImageColor.b * 255 - 255)
                        end
                    end)()
    
                    local Value;
                    if Value == nil then
                        Value = startVal
                    end

                    sliderBtn.MouseButton1Down:Connect(function()
                        if not focusing then
                            Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 380) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue)) or 0
                            pcall(function()
                                callback(Value)
								Slider.Value = Value
                            end)
                            Utility:TweenObject(sliderDrag, {Size = UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X, 0, 380), 0, 6)}, 0.05)
                            Utility:TweenObject(Circle, {Position = UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X - 2, 0, 380), 0, -1)}, 0.05)
                            Utility:TweenObject(Circle, {Size = UDim2.new(0, 10, 0, 10)}, 0.05)
                            Utility:TweenObject(Circle, {BackgroundColor3 = Color3.fromRGB(themeList.ImageColor.r * 255 - 1, themeList.ImageColor.g * 255 - 255, themeList.ImageColor.b * 255 - 255)}, 0.05)
                            
                            moveconnection = mouse.Move:Connect(function()
                                togName.Text = slidInf.." - "..Value
                                Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 380) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue)) or 0
                                pcall(function()
                                    callback(Value)
									Slider.Value = Value
                                end)
                                Utility:TweenObject(sliderDrag, {Size = UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X, 0, 380), 0, 6)}, 0.05)
                                Utility:TweenObject(Circle, {Position = UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X - 2, 0, 380), 0, -1)}, 0.05)
                                Utility:TweenObject(Circle, {Size = UDim2.new(0, 12, 0, 12)}, 0.05)
                                Utility:TweenObject(Circle, {BackgroundColor3 = Color3.fromRGB(themeList.ImageColor.r * 255 - 200, themeList.ImageColor.g * 255 + 255, themeList.ImageColor.b * 255 - 200)}, 0.05)
                            end)

                            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 380) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue)) or 0
                                    pcall(function()
                                        callback(Value)
										Slider.Value = Value
                                    end)
                                    togName.Text = slidInf.." - "..Value
                                    Utility:TweenObject(sliderDrag, {Size = UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X, 0, 380), 0, 6)}, 0.05)
                                    Utility:TweenObject(Circle, {Position = UDim2.new(0, math.clamp(mouse.X - sliderDrag.AbsolutePosition.X - 2, 0, 380), 0, -1)}, 0.05)
                                    Utility:TweenObject(Circle, {Size = UDim2.new(0, 10, 0, 10)}, 0.05)
                                    Utility:TweenObject(Circle, {BackgroundColor3 = Color3.fromRGB(themeList.ImageColor.r * 255 - 200, themeList.ImageColor.g * 255 + 255, themeList.ImageColor.b * 255 - 200)}, 0.05)
                                    moveconnection:Disconnect()
                                    releaseconnection:Disconnect()
                                end
                            end)
                        else
                            for i,v in next, infoContainer:GetChildren() do
                                Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                focusing = false
                            end
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        end
                    end)

                    sliderBtn.MouseEnter:Connect(function()
                        if not focusing then
                            game.TweenService:Create(SliderCover, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                            }):Play()
                            hovering = true
                        end 
                    end)
                    sliderBtn.MouseLeave:Connect(function()
                        if not focusing then
                            game.TweenService:Create(SliderCover, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = themeList.ElementColor
                            }):Play()
                            hovering = false
                        end
                    end)

                    viewInfo.MouseButton1Click:Connect(function()
                        if not viewDe then
                            viewDe = true
                            focusing = true
                            for i,v in next, infoContainer:GetChildren() do
                                if v ~= moreInfo then
                                    Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                end
                            end
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,0,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                            Utility:TweenObject(btn, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                            wait(1.5)
                            focusing = false
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,2,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                            wait(0)
                            viewDe = false
                        end
                    end)
					function Slider:SetValue(Str)
						local Num = tonumber(Str);

						if (not Num) then
							return;
						end;

						Num = math.clamp(Num, minvalue, maxvalue);

						
						Value = Num
						Slider.Value = Num;
						
					end;
					Options[Idx] = Slider;
                end

                function Elements:addDropdown(Idx, dropname, dropinf, default, list, callback)
					local Dropdown = {
						Value = default;
						Values = list;
						Type = 'Dropdown';
					};
                    local DropFunction = {}
                    dropname = dropname or "Dropdown"
					default = Dropdown.Value or "Select"
                    list = list or {}
                    dropinf = dropinf or "Dropdown info"
                    callback = callback or function() end   
    
                    local opened = false
                    local DropYSize = 25
    
                    local dropFrame = Instance.new("Frame")
                    local dropOpen = Instance.new("TextButton")
                    local listImg = Instance.new("ImageLabel")
                    local itemTextbox = Instance.new("TextLabel")
                    local viewInfo = Instance.new("ImageButton")
                    local UICorner = Instance.new("UICorner")
                    local UIListLayout = Instance.new("UIListLayout")
                    local Sample = Instance.new("ImageLabel")
    
                    local ms = game.Players.LocalPlayer:GetMouse()
                    Sample.Name = "Sample"
                    Sample.Parent = dropOpen
                    Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Sample.BackgroundTransparency = 1.000
                    Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                    Sample.ImageColor3 = themeList.ImageColor
                    Sample.ImageTransparency = 0.600
                    
                    dropFrame.Name = "dropFrame"
                    dropFrame.Parent = sectionInners
                    dropFrame.BackgroundColor3 = themeList.ElementColor
                    dropFrame.BorderSizePixel = 0
                    dropFrame.Position = UDim2.new(0, 0, 0, 0)
                    dropFrame.Size = UDim2.new(1, 0, 0, 25)
                    dropFrame.ClipsDescendants = true

                    local sample = Sample
                    local btn = dropOpen

                    dropOpen.Name = "dropOpen"
                    dropOpen.Parent = dropFrame
                    dropOpen.BackgroundColor3 = themeList.ElementColor
                    dropOpen.Size = UDim2.new(1, 0, 0, 25)
                    dropOpen.AutoButtonColor = false
                    dropOpen.Font = Enum.Font.SourceSans
                    dropOpen.Text = default
                    dropOpen.TextColor3 = Color3.fromRGB(0, 0, 0)
                    dropOpen.TextSize = 14.000
                    dropOpen.ClipsDescendants = true
                    dropOpen.MouseButton1Click:Connect(function()
                        if not focusing then
                            if opened then
                                opened = false
                                dropFrame:TweenSize(UDim2.new(1, 0, 0, 25), "InOut", "Linear", 0.08)
                                wait(0.1)
                                updateSectionFrame()
                                UpdateSize()
                            else
                                opened = true
                                dropFrame:TweenSize(UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y), "InOut", "Linear", 0.08, true)
                                wait(0.1)
                                updateSectionFrame()
                                UpdateSize()
                            end
                        else
                            for i,v in next, infoContainer:GetChildren() do
                                Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                focusing = false
                            end
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        end
                    end)
    
                    listImg.Name = "listImg"
                    listImg.Parent = dropOpen
                    listImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    listImg.BackgroundTransparency = 1.000
                    listImg.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    listImg.Position = UDim2.new(0, 3, 0, 3)
                    listImg.Size = UDim2.new(0, 17, 0, 17)
                    listImg.Image = "rbxassetid://3926305904"
                    listImg.ImageColor3 = themeList.ImageColor
                    listImg.ImageRectOffset = Vector2.new(644, 364)
                    listImg.ImageRectSize = Vector2.new(36, 36)
    
                    itemTextbox.Name = "itemTextbox"
                    itemTextbox.Parent = dropOpen
                    itemTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    itemTextbox.BackgroundTransparency = 1.000
                    itemTextbox.Position = UDim2.new(0, 30, 0, 0)
                    itemTextbox.Size = UDim2.new(0, 300, 0, 25)
                    itemTextbox.Font = Enum.Font.SourceSansBold
                    itemTextbox.Text = dropname
                    itemTextbox.RichText = true
                    itemTextbox.TextColor3 = themeList.TextColor
                    itemTextbox.TextSize = 14.000
                    itemTextbox.TextXAlignment = Enum.TextXAlignment.Left
    
                    viewInfo.Name = "viewInfo"
                    viewInfo.Parent = dropOpen
                    viewInfo.BackgroundTransparency = 1.000
                    viewInfo.LayoutOrder = 9
                    viewInfo.Position = UDim2.new(0.940000007, 0, 0, 2)
                    viewInfo.Size = UDim2.new(0, 21, 0, 21)
                    viewInfo.ZIndex = 2
                    viewInfo.Image = "rbxassetid://3926305904"
                    viewInfo.ImageColor3 = themeList.ImageColor
                    viewInfo.ImageRectOffset = Vector2.new(764, 764)
                    viewInfo.ImageRectSize = Vector2.new(36, 36)
    
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = dropOpen
    
                    local Sample = Instance.new("ImageLabel")
    
                    Sample.Name = "Sample"
                    Sample.Parent = dropOpen
                    Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Sample.BackgroundTransparency = 1.000
                    Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                    Sample.ImageColor3 = themeList.ImageColor
                    Sample.ImageTransparency = 0.600
    
                    UIListLayout.Parent = dropFrame
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.Padding = UDim.new(0, 3)
    
                    updateSectionFrame() 
                    UpdateSize()
    
                    local ms = game.Players.LocalPlayer:GetMouse()
                    local uis = game:GetService("UserInputService")
                    local infBtn = viewInfo
    
                    local moreInfo = Instance.new("TextLabel")
                    local UICorner = Instance.new("UICorner")
    
                    moreInfo.Name = "TipMore"
                    moreInfo.Parent = infoContainer
                    moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
                    moreInfo.Position = UDim2.new(0, 0, 2, 0)
                    moreInfo.Size = UDim2.new(1, 0, 1, 0)
                    moreInfo.ZIndex = 9
                    moreInfo.RichText = true
                    moreInfo.Font = Enum.Font.SourceSans
                    moreInfo.Text = "  "..dropinf
                    moreInfo.TextColor3 = themeList.TextColor
                    moreInfo.TextSize = 14.000
                    moreInfo.TextXAlignment = Enum.TextXAlignment.Left
    
                    local hovering = false
                    btn.MouseEnter:Connect(function()
                        if not focusing then
                            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                            }):Play()
                            hovering = true
                        end 
                    end)
                    btn.MouseLeave:Connect(function()
                        if not focusing then
                            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = themeList.ElementColor
                            }):Play()
                            hovering = false
                        end
                    end)        
                    coroutine.wrap(function()
                        while wait() do
                            if not hovering then
                                dropOpen.BackgroundColor3 = themeList.ElementColor
                            end
                            Sample.ImageColor3 = themeList.ImageColor
                            dropFrame.BackgroundColor3 = themeList.ElementColor
                            listImg.ImageColor3 = themeList.ImageColor
                            itemTextbox.TextColor3 = themeList.TextColor
                            viewInfo.ImageColor3 = themeList.ImageColor
                            moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
                            moreInfo.TextColor3 = themeList.TextColor
                        end
                    end)()
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = moreInfo
    
                    if themeList.AccentColor == Color3.fromRGB(255,255,255) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
                    end 
                    if themeList.AccentColor == Color3.fromRGB(0,0,0) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
                    end 
    
                    viewInfo.MouseButton1Click:Connect(function()
                        if not viewDe then
                            viewDe = true
                            focusing = true
                            for i,v in next, infoContainer:GetChildren() do
                                if v ~= moreInfo then
                                    Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                end
                            end
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,0,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                            Utility:TweenObject(btn, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                            wait(1.5)
                            focusing = false
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,2,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                            wait(0)
                            viewDe = false
                        end
                    end)     
    
                    for i,v in next, list do
                        local optionSelect = Instance.new("TextButton")
                        local UICorner_2 = Instance.new("UICorner")
                        local Sample1 = Instance.new("ImageLabel")
    
                        local ms = game.Players.LocalPlayer:GetMouse()
                        Sample1.Name = "Sample1"
                        Sample1.Parent = optionSelect
                        Sample1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Sample1.BackgroundTransparency = 1.000
                        Sample1.Image = "http://www.roblox.com/asset/?id=4560909609"
                        Sample1.ImageColor3 = themeList.ImageColor
                        Sample1.ImageTransparency = 0.600
    
                        local sample1 = Sample1
                        DropYSize = DropYSize + 25
                        optionSelect.Name = "optionSelect"
                        optionSelect.Parent = dropFrame
                        optionSelect.BackgroundColor3 = themeList.ElementColor
                        optionSelect.Position = UDim2.new(0, 0, 0, 26)
                        optionSelect.Size = UDim2.new(1, 0, 0, 25)
                        optionSelect.AutoButtonColor = false
                        optionSelect.Font = Enum.Font.SourceSansBold
                        optionSelect.Text = "     "..v
                        optionSelect.TextColor3 = Color3.fromRGB(themeList.TextColor.r * 255 - 6, themeList.TextColor.g * 255 - 6, themeList.TextColor.b * 255 - 6)
                        optionSelect.TextSize = 14.000
                        optionSelect.TextXAlignment = Enum.TextXAlignment.Left
                        optionSelect.ClipsDescendants = true
                        optionSelect.MouseButton1Click:Connect(function()
                            if not focusing then
                                opened = false
                                callback(v)
								Dropdown.Value = v
                                itemTextbox.Text = dropname.." - "..v
                                dropFrame:TweenSize(UDim2.new(1, 0, 0, 25), 'InOut', 'Linear', 0.08)
                                wait(0.1)
                                updateSectionFrame()
                                UpdateSize()
                            else
                                for i,v in next, infoContainer:GetChildren() do
                                    Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                    focusing = false
                                end
                                Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                            end
                        end)
        
                        UICorner_2.CornerRadius = UDim.new(0, 4)
                        UICorner_2.Parent = optionSelect
    
                        local oHover = false
                        optionSelect.MouseEnter:Connect(function()
                            if not focusing then
                                game.TweenService:Create(optionSelect, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                                }):Play()
                                oHover = true
                            end 
                        end)
                        optionSelect.MouseLeave:Connect(function()
                            if not focusing then
                                game.TweenService:Create(optionSelect, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = themeList.ElementColor
                                }):Play()
                                oHover = false
                            end
                        end)   
                        coroutine.wrap(function()
                            while wait() do
                                if not oHover then
                                    optionSelect.BackgroundColor3 = themeList.ElementColor
                                end
                                optionSelect.TextColor3 = Color3.fromRGB(themeList.TextColor.r * 255 - 6, themeList.TextColor.g * 255 - 6, themeList.TextColor.b * 255 - 6)
                                Sample1.ImageColor3 = themeList.ImageColor
                            end
                        end)()
                    end
					
					function Dropdown:SetValue(Val)
						if (not Val) then
							Dropdown.Value = nil;
							dropOpen.Text = "";
						elseif table.find(Dropdown.Values, Val) then
							Dropdown.Value = Val;
							dropOpen.Text = Val;
						end;
					end;
					
					Options[Idx] = Dropdown;
					
                    function DropFunction:Refresh(newList)
                        newList = newList or {}
                        for i,v in next, dropFrame:GetChildren() do
                            if v.Name == "optionSelect" then
                                v:Destroy()
                            end
                        end
                        itemTextbox.Text = dropname.." - [Refresh Item]"
                        wait(1)
                        itemTextbox.Text = dropname..""
                        for i,v in next, newList do
                            local optionSelect = Instance.new("TextButton")
                            local UICorner_2 = Instance.new("UICorner")
                            local Sample11 = Instance.new("ImageLabel")
                            local ms = game.Players.LocalPlayer:GetMouse()
                            Sample11.Name = "Sample11"
                            Sample11.Parent = optionSelect
                            Sample11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            Sample11.BackgroundTransparency = 1.000
                            Sample11.Image = "http://www.roblox.com/asset/?id=4560909609"
                            Sample11.ImageColor3 = themeList.ImageColor
                            Sample11.ImageTransparency = 0.600
        
                            local sample11 = Sample11
                            DropYSize = DropYSize + 25
                            optionSelect.Name = "optionSelect"
                            optionSelect.Parent = dropFrame
                            optionSelect.BackgroundColor3 = themeList.ElementColor
                            optionSelect.Position = UDim2.new(0, 0, 0, 26)
                            optionSelect.Size = UDim2.new(1, 0, 0, 25)
                            optionSelect.AutoButtonColor = false
                            optionSelect.Font = Enum.Font.SourceSansBold
                            optionSelect.Text = "     "..v
                            optionSelect.TextColor3 = Color3.fromRGB(themeList.TextColor.r * 255 - 6, themeList.TextColor.g * 255 - 6, themeList.TextColor.b * 255 - 6)
                            optionSelect.TextSize = 14.000
                            optionSelect.TextXAlignment = Enum.TextXAlignment.Left
                            optionSelect.ClipsDescendants = true
                            UICorner_2.CornerRadius = UDim.new(0, 4)
                            UICorner_2.Parent = optionSelect
                            optionSelect.MouseButton1Click:Connect(function()
                                if not focusing then
                                    opened = false
                                    callback(v)
									Dropdown.Value = v
                                    itemTextbox.Text = dropname.." - "..v
                                    dropFrame:TweenSize(UDim2.new(1, 0, 0, 25), 'InOut', 'Linear', 0.08)
                                    wait(0.1)
                                    updateSectionFrame()
                                    UpdateSize() 
									
                                else
                                    for i,v in next, infoContainer:GetChildren() do
                                        Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                        focusing = false
                                    end
                                    Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                                end
                            end)
                            updateSectionFrame()
                            UpdateSize()
                            local hov = false
                            optionSelect.MouseEnter:Connect(function()
                                if not focusing then
                                    game.TweenService:Create(optionSelect, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                                    }):Play()
                                    hov = true
                                end 
                            end)
                            optionSelect.MouseLeave:Connect(function()
                                if not focusing then
                                    game.TweenService:Create(optionSelect, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        BackgroundColor3 = themeList.ElementColor
                                    }):Play()
                                    hov = false
                                end
                            end)   
                            coroutine.wrap(function()
                                while wait() do
                                    if not oHover then
                                        optionSelect.BackgroundColor3 = themeList.ElementColor
                                    end
                                    optionSelect.TextColor3 = Color3.fromRGB(themeList.TextColor.r * 255 - 6, themeList.TextColor.g * 255 - 6, themeList.TextColor.b * 255 - 6)
                                    Sample11.ImageColor3 = themeList.ImageColor
                                end
                            end)()
                        end
                        if opened then 
                            dropFrame:TweenSize(UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y), "InOut", "Linear", 0.08, true)
                            wait(0.1)
                            updateSectionFrame()
                            UpdateSize()
                        else
                            dropFrame:TweenSize(UDim2.new(1, 0, 0, 25), "InOut", "Linear", 0.08)
                            wait(0.1)
                            updateSectionFrame()
                            UpdateSize()
                        end
                    end
                    return DropFunction
                end

                function Elements:addKeybind(keytext, keyinf, first, callback)
                    keytext = keytext or "KeybindText"
                    keyinf = keyinf or "KebindInfo"
                    callback = callback or function() end
                    local oldKey = first.Name
                    local keybindElement = Instance.new("TextButton")
                    local UICorner = Instance.new("UICorner")
                    local togName = Instance.new("TextLabel")
                    local viewInfo = Instance.new("ImageButton")
                    local touch = Instance.new("ImageLabel")
                    local Sample = Instance.new("ImageLabel")
                    local togName_2 = Instance.new("TextLabel")
    
                    local ms = game.Players.LocalPlayer:GetMouse()
                    local uis = game:GetService("UserInputService")
                    local infBtn = viewInfo
    
                    local moreInfo = Instance.new("TextLabel")
                    local UICorner1 = Instance.new("UICorner")
    
                    local sample = Sample
    
                    keybindElement.Name = "keybindElement"
                    keybindElement.Parent = sectionInners
                    keybindElement.BackgroundColor3 = themeList.ElementColor
                    keybindElement.ClipsDescendants = true
                    keybindElement.Size = UDim2.new(1, 0, 0, 25)
                    keybindElement.AutoButtonColor = false
                    keybindElement.Font = Enum.Font.SourceSans
                    keybindElement.Text = ""
                    keybindElement.TextColor3 = Color3.fromRGB(0, 0, 0)
                    keybindElement.TextSize = 14.000
                    keybindElement.MouseButton1Click:connect(function(e) 
                        if not focusing then
                            togName_2.Text = ". . ."
                            local a, b = game:GetService('UserInputService').InputBegan:wait();
                            if a.KeyCode.Name ~= "Unknown" then
                                togName_2.Text = a.KeyCode.Name
                                oldKey = a.KeyCode.Name;
                            end
                        else
                            for i,v in next, infoContainer:GetChildren() do
                                Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                focusing = false
                            end
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        end
                    end)
            
                    game:GetService("UserInputService").InputBegan:connect(function(current, ok) 
                        if not ok then 
                            if current.KeyCode.Name == oldKey then 
                                callback()
                            end
                        end
                    end)
    
                    moreInfo.Name = "TipMore"
                    moreInfo.Parent = infoContainer
                    moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
                    moreInfo.Position = UDim2.new(0, 0, 2, 0)
                    moreInfo.Size = UDim2.new(1, 0, 1, 0)
                    moreInfo.ZIndex = 9
                    moreInfo.RichText = true
                    moreInfo.Font = Enum.Font.SourceSans
                    moreInfo.Text = "  "..keyinf
                    moreInfo.TextColor3 = themeList.TextColor
                    moreInfo.TextSize = 14.000
                    moreInfo.TextXAlignment = Enum.TextXAlignment.Left
    
                    Sample.Name = "Sample"
                    Sample.Parent = keybindElement
                    Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Sample.BackgroundTransparency = 1.000
                    Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                    Sample.ImageColor3 = themeList.ImageColor
                    Sample.ImageTransparency = 0.600
                    
                    togName.Name = "togName"
                    togName.Parent = keybindElement
                    togName.BackgroundColor3 = themeList.TextColor
                    togName.BackgroundTransparency = 1.000
                    togName.Position = UDim2.new(0, 30, 0, 0)
                    togName.Size = UDim2.new(0, 222, 0, 25)
                    togName.Font = Enum.Font.SourceSansBold
                    togName.Text = keytext
                    togName.RichText = true
                    togName.TextColor3 = themeList.TextColor
                    togName.TextSize = 14.000
                    togName.TextXAlignment = Enum.TextXAlignment.Left
    
                    viewInfo.Name = "viewInfo"
                    viewInfo.Parent = keybindElement
                    viewInfo.BackgroundTransparency = 1.000
                    viewInfo.LayoutOrder = 9
                    viewInfo.Position = UDim2.new(0.940000007, 0, 0, 2)
                    viewInfo.Size = UDim2.new(0, 21, 0, 21)
                    viewInfo.ZIndex = 2
                    viewInfo.Image = "rbxassetid://3926305904"
                    viewInfo.ImageColor3 = themeList.ImageColor
                    viewInfo.ImageRectOffset = Vector2.new(764, 764)
                    viewInfo.ImageRectSize = Vector2.new(36, 36)
                    viewInfo.MouseButton1Click:Connect(function()
                        if not viewDe then
                            viewDe = true
                            focusing = true
                            for i,v in next, infoContainer:GetChildren() do
                                if v ~= moreInfo then
                                    Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                end
                            end
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,0,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                            Utility:TweenObject(keybindElement, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                            wait(1.5)
                            focusing = false
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,2,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                            wait(0)
                            viewDe = false
                        end
                    end)  
                    updateSectionFrame()
                    UpdateSize()
                    local oHover = false
                    keybindElement.MouseEnter:Connect(function()
                        if not focusing then
                            game.TweenService:Create(keybindElement, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                            }):Play()
                            oHover = true
                        end 
                    end)
                    keybindElement.MouseLeave:Connect(function()
                        if not focusing then
                            game.TweenService:Create(keybindElement, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = themeList.ElementColor
                            }):Play()
                            oHover = false
                        end
                    end)        
    
                    UICorner1.CornerRadius = UDim.new(0, 4)
                    UICorner1.Parent = moreInfo
    
                    if themeList.AccentColor == Color3.fromRGB(255,255,255) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
                    end 
                    if themeList.AccentColor == Color3.fromRGB(0,0,0) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
                    end 
    
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = keybindElement
    
                    touch.Name = "touch"
                    touch.Parent = keybindElement
                    touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    touch.BackgroundTransparency = 1.000
                    touch.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    touch.Position = UDim2.new(0, 3, 0, 3)
                    touch.Size = UDim2.new(0, 17, 0, 17)
                    touch.Image = "rbxassetid://3926305904"
                    touch.ImageColor3 = themeList.ImageColor
                    touch.ImageRectOffset = Vector2.new(364, 284)
                    touch.ImageRectSize = Vector2.new(36, 36)
    
                    togName_2.Name = "togName"
                    togName_2.Parent = keybindElement
                    togName_2.BackgroundColor3 = themeList.AccentColor
                    togName_2.BorderSizePixel = 0
                    togName_2.Position = UDim2.new(0.727386296, 0, 0, 3)
                    togName_2.Size = UDim2.new(0, 70, 0, 19)
                    togName_2.Font = Enum.Font.SourceSansBold
                    togName_2.Text = oldKey
                    togName_2.TextColor3 = themeList.TextColor
                    togName_2.TextSize = 14.000
                    togName_2.TextXAlignment = Enum.TextXAlignment.Center

                    local UICorner_2 = Instance.new("UICorner")

                    UICorner_2.Parent = togName_2
                    UICorner_2.CornerRadius = UDim.new(0, 4)
    
                    coroutine.wrap(function()
                        while wait() do
                            if not oHover then
                                keybindElement.BackgroundColor3 = themeList.ElementColor
                            end
                            togName_2.TextColor3 = themeList.TextColor
                            togName_2.BackgroundColor3 = themeList.AccentColor
                            touch.ImageColor3 = themeList.ImageColor
                            viewInfo.ImageColor3 = themeList.ImageColor
                            togName.BackgroundColor3 = themeList.TextColor
                            togName.TextColor3 = themeList.TextColor
                            Sample.ImageColor3 = themeList.ImageColor
                            moreInfo.TextColor3 = themeList.TextColor
                            moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
    
                        end
                    end)()
                end

                function Elements:addColor(colText, colInf, defcolor, callback)
                    colText = colText or "ColorPicker"
                    callback = callback or function() end
                    defcolor = defcolor or Color3.fromRGB(1,1,1)
                    local h, s, v = Color3.toHSV(defcolor)
                    local ms = game.Players.LocalPlayer:GetMouse()
                    local colorOpened = false
                    local colorElement = Instance.new("TextButton")
                    local UICorner = Instance.new("UICorner")
                    local colorHeader = Instance.new("Frame")
                    local UICorner_2 = Instance.new("UICorner")
                    local touch = Instance.new("ImageLabel")
                    local togName = Instance.new("TextLabel")
                    local viewInfo = Instance.new("ImageButton")
                    local colorCurrent = Instance.new("Frame")
                    local UICorner_3 = Instance.new("UICorner")
                    local UIListLayout = Instance.new("UIListLayout")
                    local colorInners = Instance.new("Frame")
                    local UICorner_4 = Instance.new("UICorner")
                    local rgb = Instance.new("ImageButton")
                    local UICorner_5 = Instance.new("UICorner")
                    local rbgcircle = Instance.new("ImageLabel")
                    local darkness = Instance.new("ImageButton")
                    local UICorner_6 = Instance.new("UICorner")
                    local darkcircle = Instance.new("ImageLabel")
                    local toggleDisabled = Instance.new("ImageLabel")
                    local toggleEnabled = Instance.new("ImageLabel")
                    local onrainbow = Instance.new("TextButton")
                    local togName_2 = Instance.new("TextLabel")
    
                    local Sample = Instance.new("ImageLabel")
                    Sample.Name = "Sample"
                    Sample.Parent = colorHeader
                    Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Sample.BackgroundTransparency = 1.000
                    Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                    Sample.ImageColor3 = themeList.ImageColor
                    Sample.ImageTransparency = 0.600
    
                    local btn = colorHeader
                    local sample = Sample
    
                    colorElement.Name = "colorElement"
                    colorElement.Parent = sectionInners
                    colorElement.BackgroundColor3 = themeList.ElementColor
                    colorElement.BackgroundTransparency = 1.000
                    colorElement.ClipsDescendants = true
                    colorElement.Size = UDim2.new(1, 0, 0, 25)
                    colorElement.AutoButtonColor = false
                    colorElement.Font = Enum.Font.SourceSans
                    colorElement.Text = ""
                    colorElement.TextColor3 = Color3.fromRGB(0, 0, 0)
                    colorElement.TextSize = 14.000
                    colorElement.MouseButton1Click:Connect(function()
                        if not focusing then
                            if colorOpened then
                                colorOpened = false
                                colorElement:TweenSize(UDim2.new(1, 0, 0, 25), "InOut", "Linear", 0.08)
                                wait(0.1)
                                updateSectionFrame()
                                UpdateSize()
                            else
                                colorOpened = true
                                colorElement:TweenSize(UDim2.new(1, 0, 0, 141), "InOut", "Linear", 0.08, true)
                                wait(0.1)
                                updateSectionFrame()
                                UpdateSize()
                            end
                        else
                            for i,v in next, infoContainer:GetChildren() do
                                Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                focusing = false
                            end
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        end
                    end)
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = colorElement
    
                    colorHeader.Name = "colorHeader"
                    colorHeader.Parent = colorElement
                    colorHeader.BackgroundColor3 = themeList.ElementColor
                    colorHeader.Size = UDim2.new(1, 0, 0, 25)
                    colorHeader.ClipsDescendants = true
    
                    UICorner_2.CornerRadius = UDim.new(0, 4)
                    UICorner_2.Parent = colorHeader
                    
                    touch.Name = "touch"
                    touch.Parent = colorHeader
                    touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    touch.BackgroundTransparency = 1.000
                    touch.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    touch.Position = UDim2.new(0, 3, 0, 3)
                    touch.Size = UDim2.new(0, 17, 0, 17)
                    touch.Image = "rbxassetid://3926305904"
                    touch.ImageColor3 = themeList.ImageColor
                    touch.ImageRectOffset = Vector2.new(44, 964)
                    touch.ImageRectSize = Vector2.new(36, 36)
    
                    togName.Name = "togName"
                    togName.Parent = colorHeader
                    togName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    togName.BackgroundTransparency = 1.000
                    togName.Position = UDim2.new(0, 30, 0, 0)
                    togName.Size = UDim2.new(0, 288, 0, 25)
                    togName.Font = Enum.Font.SourceSansBold
                    togName.Text = colText
                    togName.TextColor3 = themeList.TextColor
                    togName.TextSize = 14.000
                    togName.RichText = true
                    togName.TextXAlignment = Enum.TextXAlignment.Left
    
                    local moreInfo = Instance.new("TextLabel")
                    local UICorner = Instance.new("UICorner")
    
                    moreInfo.Name = "TipMore"
                    moreInfo.Parent = infoContainer
                    moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
                    moreInfo.Position = UDim2.new(0, 0, 2, 0)
                    moreInfo.Size = UDim2.new(1, 0, 1, 0)
                    moreInfo.ZIndex = 9
                    moreInfo.Font = Enum.Font.SourceSans
                    moreInfo.Text = "  "..colInf
                    moreInfo.TextColor3 = themeList.TextColor
                    moreInfo.TextSize = 14.000
                    moreInfo.RichText = true
                    moreInfo.TextXAlignment = Enum.TextXAlignment.Left
    
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = moreInfo
    
                    viewInfo.Name = "viewInfo"
                    viewInfo.Parent = colorHeader
                    viewInfo.BackgroundTransparency = 1.000
                    viewInfo.LayoutOrder = 9
                    viewInfo.Position = UDim2.new(0.940000007, 0, 0, 2)
                    viewInfo.Size = UDim2.new(0, 21, 0, 21)
                    viewInfo.ZIndex = 2
                    viewInfo.Image = "rbxassetid://3926305904"
                    viewInfo.ImageColor3 = themeList.ImageColor
                    viewInfo.ImageRectOffset = Vector2.new(764, 764)
                    viewInfo.ImageRectSize = Vector2.new(36, 36)
                    viewInfo.MouseButton1Click:Connect(function()
                        if not viewDe then
                            viewDe = true
                            focusing = true
                            for i,v in next, infoContainer:GetChildren() do
                                if v ~= moreInfo then
                                    Utility:TweenObject(v, {Position = UDim2.new(0,0,2,0)}, 0.2)
                                end
                            end
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,0,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                            Utility:TweenObject(colorElement, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                            wait(1.5)
                            focusing = false
                            Utility:TweenObject(moreInfo, {Position = UDim2.new(0,0,2,0)}, 0.2)
                            Utility:TweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                            wait(0)
                            viewDe = false
                        end
                    end)   
    
                    colorCurrent.Name = "colorCurrent"
                    colorCurrent.Parent = colorHeader
                    colorCurrent.BackgroundColor3 = defcolor
                    colorCurrent.Position = UDim2.new(0.792613626, 0, 0, 3)
                    colorCurrent.Size = UDim2.new(0, 42, 0, 19)
    
                    UICorner_3.CornerRadius = UDim.new(0, 4)
                    UICorner_3.Parent = colorCurrent
    
                    UIListLayout.Parent = colorElement
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.Padding = UDim.new(0, 3)
    
                    colorInners.Name = "colorInners"
                    colorInners.Parent = colorElement
                    colorInners.BackgroundColor3 = themeList.ElementColor
                    colorInners.Position = UDim2.new(0, 0, 0.255319148, 0)
                    colorInners.Size = UDim2.new(1, 0, 0, 105)
    
                    UICorner_4.CornerRadius = UDim.new(0, 4)
                    UICorner_4.Parent = colorInners
    
                    rgb.Name = "rgb"
                    rgb.Parent = colorInners
                    rgb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    rgb.BackgroundTransparency = 1.000
                    rgb.Position = UDim2.new(0.0198863633, 0, 0.0476190485, 0)
                    rgb.Size = UDim2.new(0, 211, 0, 93)
                    rgb.Image = "http://www.roblox.com/asset/?id=6523286724"
    
                    UICorner_5.CornerRadius = UDim.new(0, 4)
                    UICorner_5.Parent = rgb
    
                    rbgcircle.Name = "rbgcircle"
                    rbgcircle.Parent = rgb
                    rbgcircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    rbgcircle.BackgroundTransparency = 1.000
                    rbgcircle.Size = UDim2.new(0, 14, 0, 14)
                    rbgcircle.Image = "rbxassetid://3926309567"
                    rbgcircle.ImageColor3 = Color3.fromRGB(0, 0, 0)
                    rbgcircle.ImageRectOffset = Vector2.new(628, 420)
                    rbgcircle.ImageRectSize = Vector2.new(48, 48)
    
                    darkness.Name = "darkness"
                    darkness.Parent = colorInners
                    darkness.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    darkness.BackgroundTransparency = 1.000
                    darkness.Position = UDim2.new(0.636363626, 0, 0.0476190485, 0)
                    darkness.Size = UDim2.new(0, 18, 0, 93)
                    darkness.Image = "http://www.roblox.com/asset/?id=6523291212"
    
                    UICorner_6.CornerRadius = UDim.new(0, 4)
                    UICorner_6.Parent = darkness
    
                    darkcircle.Name = "darkcircle"
                    darkcircle.Parent = darkness
                    darkcircle.AnchorPoint = Vector2.new(0.5, 0)
                    darkcircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    darkcircle.BackgroundTransparency = 1.000
                    darkcircle.Size = UDim2.new(0, 14, 0, 14)
                    darkcircle.Image = "rbxassetid://3926309567"
                    darkcircle.ImageColor3 = Color3.fromRGB(0, 0, 0)
                    darkcircle.ImageRectOffset = Vector2.new(628, 420)
                    darkcircle.ImageRectSize = Vector2.new(48, 48)
    
                    toggleDisabled.Name = "toggleDisabled"
                    toggleDisabled.Parent = colorInners
                    toggleDisabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    toggleDisabled.BackgroundTransparency = 1.000
                    toggleDisabled.Position = UDim2.new(0.704659104, 0, 0.0657142699, 0)
                    toggleDisabled.Size = UDim2.new(0, 21, 0, 21)
                    toggleDisabled.Image = "rbxassetid://3926309567"
                    toggleDisabled.ImageColor3 = themeList.ImageColor
                    toggleDisabled.ImageRectOffset = Vector2.new(628, 420)
                    toggleDisabled.ImageRectSize = Vector2.new(48, 48)
    
                    toggleEnabled.Name = "toggleEnabled"
                    toggleEnabled.Parent = colorInners
                    toggleEnabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    toggleEnabled.BackgroundTransparency = 1.000
                    toggleEnabled.Position = UDim2.new(0.704999983, 0, 0.0659999996, 0)
                    toggleEnabled.Size = UDim2.new(0, 21, 0, 21)
                    toggleEnabled.Image = "rbxassetid://3926309567"
                    toggleEnabled.ImageColor3 = themeList.ImageColor
                    toggleEnabled.ImageRectOffset = Vector2.new(784, 420)
                    toggleEnabled.ImageRectSize = Vector2.new(48, 48)
                    toggleEnabled.ImageTransparency = 1.000
    
                    onrainbow.Name = "onrainbow"
                    onrainbow.Parent = toggleEnabled
                    onrainbow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    onrainbow.BackgroundTransparency = 1.000
                    onrainbow.Position = UDim2.new(2.90643607e-06, 0, 0, 0)
                    onrainbow.Size = UDim2.new(1, 0, 1, 0)
                    onrainbow.Font = Enum.Font.SourceSans
                    onrainbow.Text = ""
                    onrainbow.TextColor3 = Color3.fromRGB(0, 0, 0)
                    onrainbow.TextSize = 14.000
    
                    togName_2.Name = "togName"
                    togName_2.Parent = colorInners
                    togName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    togName_2.BackgroundTransparency = 1.000
                    togName_2.Position = UDim2.new(0.779999971, 0, 0.100000001, 0)
                    togName_2.Size = UDim2.new(0, 278, 0, 14)
                    togName_2.Font = Enum.Font.SourceSansBold
                    togName_2.Text = "Rainbow"
                    togName_2.TextColor3 = themeList.TextColor
                    togName_2.TextSize = 14.000
                    togName_2.TextXAlignment = Enum.TextXAlignment.Left
    
                    if themeList.AccentColor == Color3.fromRGB(255,255,255) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
                    end 
                    if themeList.AccentColor == Color3.fromRGB(0,0,0) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
                    end 
                    local hovering = false
    
                    colorElement.MouseEnter:Connect(function()
                        if not focusing then
                            game.TweenService:Create(colorElement, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                            }):Play()
                            hovering = true
                        end 
                    end)
                    colorElement.MouseLeave:Connect(function()
                        if not focusing then
                            game.TweenService:Create(colorElement, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = themeList.ElementColor
                            }):Play()
                            hovering = false
                        end
                    end)        
    
                    if themeList.AccentColor == Color3.fromRGB(255,255,255) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
                    end 
                    if themeList.AccentColor == Color3.fromRGB(0,0,0) then
                        Utility:TweenObject(moreInfo, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
                    end 
                    coroutine.wrap(function()
                        while wait() do
                            if not hovering then
                                colorElement.BackgroundColor3 = themeList.ElementColor
                            end
                            touch.ImageColor3 = themeList.ImageColor
                            colorHeader.BackgroundColor3 = themeList.ElementColor
                            togName.TextColor3 = themeList.TextColor
                            moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.AccentColor.r * 255 - 14, themeList.AccentColor.g * 255 - 17, themeList.AccentColor.b * 255 - 13)
                            moreInfo.TextColor3 = themeList.TextColor
                            viewInfo.ImageColor3 = themeList.ImageColor
                            colorInners.BackgroundColor3 = themeList.ElementColor
                            toggleDisabled.ImageColor3 = themeList.ImageColor
                            toggleEnabled.ImageColor3 = themeList.ImageColor
                            togName_2.TextColor3 = themeList.TextColor
                            Sample.ImageColor3 = themeList.ImageColor
                        end
                    end)()
                    updateSectionFrame()
                    UpdateSize()
                    local plr = game.Players.LocalPlayer
                    local mouse = plr:GetMouse()
                    local uis = game:GetService('UserInputService')
                    local rs = game:GetService("RunService")
                    local colorpicker = false
                    local darknesss = false
                    local dark = false
                    local rgb = rgb    
                    local dark = darkness    
                    local cursor = rbgcircle
                    local cursor2 = darkcircle
                    local color = {1,1,1}
                    local rainbow = false
                    local rainbowconnection
                    local counter = 0
                    --
                    local function zigzag(X) return math.acos(math.cos(X*math.pi))/math.pi end
                    counter = 0
                    local function mouseLocation()
                        return plr:GetMouse()
                    end
                    local function cp()
                        if colorpicker then
                            local ml = mouseLocation()
                            local x,y = ml.X - rgb.AbsolutePosition.X,ml.Y - rgb.AbsolutePosition.Y
                            local maxX,maxY = rgb.AbsoluteSize.X,rgb.AbsoluteSize.Y
                            if x<0 then x=0 end
                            if x>maxX then x=maxX end
                            if y<0 then y=0 end
                            if y>maxY then y=maxY end
                            x = x/maxX
                            y = y/maxY
                            local cx = cursor.AbsoluteSize.X/2
                            local cy = cursor.AbsoluteSize.Y/2
                            cursor.Position = UDim2.new(x,-cx,y,-cy)
                            color = {1-x,1-y,color[3]}
                            local realcolor = Color3.fromHSV(color[1],color[2],color[3])
                            colorCurrent.BackgroundColor3 = realcolor
                            callback(realcolor)
                        end
                        if darknesss then
                            local ml = mouseLocation()
                            local y = ml.Y - dark.AbsolutePosition.Y
                            local maxY = dark.AbsoluteSize.Y
                            if y<0 then y=0 end
                            if y>maxY then y=maxY end
                            y = y/maxY
                            local cy = cursor2.AbsoluteSize.Y/2
                            cursor2.Position = UDim2.new(0.5,0,y,-cy)
                            cursor2.ImageColor3 = Color3.fromHSV(0,0,y)
                            color = {color[1],color[2],1-y}
                            local realcolor = Color3.fromHSV(color[1],color[2],color[3])
                            colorCurrent.BackgroundColor3 = realcolor
                            callback(realcolor)
                        end
                    end
    
                    local function setcolor(tbl)
                        local cx = cursor.AbsoluteSize.X/2
                        local cy = cursor.AbsoluteSize.Y/2
                        color = {tbl[1],tbl[2],tbl[3]}
                        cursor.Position = UDim2.new(color[1],-cx,color[2]-1,-cy)
                        cursor2.Position = UDim2.new(0.5,0,color[3]-1,-cy)
                        local realcolor = Color3.fromHSV(color[1],color[2],color[3])
                        colorCurrent.BackgroundColor3 = realcolor
                    end
                    local function setrgbcolor(tbl)
                        local cx = cursor.AbsoluteSize.X/2
                        local cy = cursor.AbsoluteSize.Y/2
                        color = {tbl[1],tbl[2],color[3]}
                        cursor.Position = UDim2.new(color[1],-cx,color[2]-1,-cy)
                        local realcolor = Color3.fromHSV(color[1],color[2],color[3])
                        colorCurrent.BackgroundColor3 = realcolor
                        callback(realcolor)
                    end
                    local function togglerainbow()
                        if rainbow then
                            game.TweenService:Create(toggleEnabled, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                ImageTransparency = 1
                            }):Play()
                            rainbow = false
                            rainbowconnection:Disconnect()
                        else
                            game.TweenService:Create(toggleEnabled, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                ImageTransparency = 0
                            }):Play()
                            rainbow = true
                            rainbowconnection = rs.RenderStepped:Connect(function()
                                setrgbcolor({zigzag(counter),1,1})
                                counter = counter + 0.01
                            end)
                        end
                    end
    
                    onrainbow.MouseButton1Click:Connect(togglerainbow)
                    --
                    mouse.Move:connect(cp)
                    rgb.MouseButton1Down:connect(function()colorpicker=true end)
                    dark.MouseButton1Down:connect(function()darknesss=true end)
                    uis.InputEnded:Connect(function(input)
                        if input.UserInputType.Name == 'MouseButton1' then
                            if darknesss then darknesss = false end
                            if colorpicker then colorpicker = false end
                        end
                    end)
                    setcolor({h,s,v})
                end
                
                function Elements:addLog(textlog)
                    local logcatfunc = {}
					
                    local Title = Instance.new("TextLabel")
                    local titleCorner = Instance.new("UICorner")
                    local Frame = Instance.new("ScrollingFrame")
                    local UICorner = Instance.new("UICorner")
                    local TextLabel = Instance.new("TextLabel")
                    
                    Title.Name = "Title"
                    Title.Parent = sectionInners
                    Title.BackgroundColor3 = themeList.AccentColor
                    Title.BorderSizePixel = 0
                    Title.Size = UDim2.new(1, 0, 0, 15)
                    Title.Font = Enum.Font.SourceSansBold
                    Title.Text = "• Console Log •"
                    Title.TextColor3 = themeList.TextColor
                    Title.TextSize = 14.000
                    Title.TextXAlignment = Enum.TextXAlignment.Center
                    
                    titleCorner.Parent = Title
                    titleCorner.CornerRadius = UDim.new(0, 4)
                    
                    Frame.Name = "Frame"
                    Frame.Parent = sectionInners
                    Frame.BackgroundColor3 = themeList.ElementColor
                    Frame.Size = UDim2.new(1, 0, 0, 150)
                    Frame.ClipsDescendants = true
                    Frame.Active = true
                    Frame.ScrollBarThickness = 8
                    Frame.ScrollBarImageColor3 = themeList.ImageColor
		    Frame.CanvasSize = UDim2.new(0, 0, 0, string.len(TextLabel.Text))
                    
                    UICorner.Parent = Frame
                    UICorner.CornerRadius = UDim.new(0, 4)
                    
                    TextLabel.Parent = Frame
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderSizePixel = 0
		    TextLabel.Position = UDim2.new(0, 3, 0, 0)
                    TextLabel.Size = UDim2.new(1, -10, 0, string.len(TextLabel.Text))
                    TextLabel.Font = Enum.Font.Code
                    TextLabel.TextColor3 = themeList.TextColor
                    TextLabel.TextSize = 12.000
                    TextLabel.Text = textlog
		    TextLabel.TextScaled = false
		    TextLabel.TextWrapped = true
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.TextYAlignment = Enum.TextYAlignment.Top
					
		    TextLabel:GetPropertyChangedSignal("Text"):Connect(function()
			Frame.CanvasSize = UDim2.new(0, 0, 0, string.len(TextLabel.Text))
			TextLabel.Size = UDim2.new(1, -10, 0, string.len(TextLabel.Text))
		    end)
                    
                    coroutine.wrap(function()
                        Title.BackgroundColor3 = themeList.AccentColor
                        Title.TextColor3 = themeList.TextColor
                        Frame.BackgroundColor3 = themeList.ElementColor
                        Frame.ScrollBarImageColor3 = themeList.ImageColor
                        TextLabel.TextColor3 = themeList.TextColor
                    end)()
                    
		    updateSectionFrame()
                    UpdateSize()
                    function logcatfunc:Refresh(newLog)
                        if TextLabel.Text ~= newLog then
			    TextLabel.Text = newLog
			end
                    end
                    return logcatfunc
                end

                function Elements:addLabel(title)
                    local labelFunctions = {}
                    local label = Instance.new("TextLabel")
                    local UICorner = Instance.new("UICorner")
                    label.Name = "label"
                    label.Parent = sectionInners
                    label.BackgroundColor3 = themeList.AccentColor
		    label.BackgroundTransparency = 1.000
                    label.BorderSizePixel = 0
                    label.ClipsDescendants = true
                    label.Text = title
                    label.Size = UDim2.new(1, 0, 0, 15)
                    label.Font = Enum.Font.SourceSansBold
                    label.Text = "  "..title
                    label.RichText = true
                    label.TextColor3 = themeList.TextColor
                    Objects[label] = "TextColor3"
                    label.TextSize = 14.000
                    label.TextXAlignment = Enum.TextXAlignment.Left
                    
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = label
                    
                    if themeList.AccentColor == Color3.fromRGB(255,255,255) then
                        Utility:TweenObject(label, {TextColor3 = Color3.fromRGB(0,0,0)}, 0.2)
                    end 
                    if themeList.AccentColor == Color3.fromRGB(0,0,0) then
                        Utility:TweenObject(label, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.2)
                    end
		    
                    coroutine.wrap(function()
                        while wait() do
                            label.BackgroundColor3 = themeList.AccentColor
                            label.TextColor3 = themeList.TextColor
                        end
                    end)()
                    updateSectionFrame()
                    UpdateSize()
                    function labelFunctions:UpdateLabel(newText)
                        if label.Text ~= "  "..newText then
                            label.Text = "  "..newText
                        end
                    end	
                    return labelFunctions
                end    
                return Elements
            end
            return secItems
        end 
        return tabSections
    end
    return CreateTab
end
return Library
