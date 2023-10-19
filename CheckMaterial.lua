if SelectMaterial == "Radioactive Material" then
    MMon = "Factory Staff [Lv. 800]"
    MPos = CFrame.new(295,73,-56)
    SP = "Default"
elseif SelectMaterial == "Mystic Droplet" then
    MMon = "Water Fighter [Lv. 1450]"
    MPos = CFrame.new(-3385,239,-10542)
    SP = "Default"
elseif SelectMaterial == "Magma Ore" then
    if First_Sea then
        MMon = "Military Spy [Lv. 325]"
        MPos = CFrame.new(-5815,84,8820)
        SP = "Default"
    elseif Second_Sea then
        MMon = "Magma Ninja [Lv. 1175]"
        MPos = CFrame.new(-5428,78,-5959)
        SP = "Default"
    end
elseif SelectMaterial == "Angel Wings" then
    MMon = "God's Guard [Lv. 450]"
    MPos = CFrame.new(-4698,845,-1912)
    SP = "Default"
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7859.09814, 5544.19043, -381.476196))
    end
elseif SelectMaterial == "Leather" then
    if First_Sea then
        MMon = "Brute [Lv. 45]"
        MPos = CFrame.new(-1145,15,4350)
        SP = "Default"
    elseif Second_Sea then
        MMon = "Marine Captain [Lv. 900]"
        MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
        SP = "Default"
    elseif Third_Sea then
        MMon = "Jungle Pirate [Lv. 1900]"
        MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
        SP = "Default"
    end
elseif SelectMaterial == "Scrap Metal" then
    if First_Sea then
        MMon = "Brute [Lv. 45]"
        MPos = CFrame.new(-1145,15,4350)
        SP = "Default"
    elseif Second_Sea then
        MMon = "Swan Pirate [Lv. 775]"
        MPos = CFrame.new(878,122,1235)
        SP = "Default"
    elseif Third_Sea then
        MMon = "Jungle Pirate [Lv. 1900]"
        MPos = CFrame.new(-12107,332,-10549)
        SP = "Default"
    end
elseif SelectMaterial == "Fish Tail" then
    if Third_Sea then
        MMon = "Fishman Raider [Lv. 1775]"
        MPos = CFrame.new(-10993,332,-8940)
        SP = "Default"
    elseif First_Sea then
        MMon = "Fishman Warrior [Lv. 375]"
        MPos = CFrame.new(61123,19,1569)
        SP = "Default"
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
        end
    end
elseif SelectMaterial == "Demonic Wisp" then
    MMon = "Demonic Soul [Lv. 2025]"
    MPos = CFrame.new(-9507,172,6158)
    SP = "Default"
elseif SelectMaterial == "Vampire Fang" then
    MMon = "Vampire [Lv. 975]"
    MPos = CFrame.new(-6033,7,-1317)
    SP = "Default"
elseif SelectMaterial == "Conjured Cocoa" then
    MMon = "Chocolate Bar Battler [Lv. 2325]"
    MPos = CFrame.new(620.6344604492188,78.93644714355469, -12581.369140625)
    SP = "Default"
elseif SelectMaterial == "Dragon Scale" then
    MMon = "Dragon Crew Archer [Lv. 1600]"
    MPos = CFrame.new(6594,383,139)
    SP = "Default"
elseif SelectMaterial == "Gunpowder" then
    MMon = "Pistol Billionaire [Lv. 1525]"
    MPos = CFrame.new(-469,74,5904)
    SP = "Default"
elseif SelectMaterial == "Mini Tusk" then
    MMon = "Mythological Pirate [Lv. 1850]"
    MPos = CFrame.new(-13545,470,-6917)
    SP = "Default"
end
