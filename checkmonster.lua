local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
if First_Sea then
    if Lv == 1 or Lv <= 9 or _G.SelectMonster == "Bandit [Lv. 5]" then -- Bandit
        Ms = "Bandit [Lv. 5]"
        NameQuest = "BanditQuest1"
        QuestLv = 1
        NameMon = "Bandit"
        CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
        CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
    elseif Lv == 10 or Lv <= 14 or _G.SelectMonster == "Monkey [Lv. 14]" then -- Monkey
        Ms = "Monkey [Lv. 14]"
        NameQuest = "JungleQuest"
        QuestLv = 1
        NameMon = "Monkey"
        CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
        CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
    elseif Lv == 15 or Lv <= 29 or _G.SelectMonster == "Gorilla [Lv. 20]" then -- Gorilla
        Ms = "Gorilla [Lv. 20]"
        NameQuest = "JungleQuest"
        QuestLv = 2
        NameMon = "Gorilla"
        CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
        CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
    elseif Lv == 30 or Lv <= 39 or _G.SelectMonster == "Pirate [Lv. 35]" then -- Pirate
        Ms = "Pirate [Lv. 35]"
        NameQuest = "BuggyQuest1"
        QuestLv = 1
        NameMon = "Pirate"
        CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
        CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
    elseif Lv == 40 or Lv <= 59 or _G.SelectMonster == "Brute [Lv. 45]" then -- Brute
        Ms = "Brute [Lv. 45]"
        NameQuest = "BuggyQuest1"
        QuestLv = 2
        NameMon = "Brute"
        CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
        CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
    elseif Lv == 60 or Lv <= 74 or _G.SelectMonster == "Desert Bandit [Lv. 60]" then -- Desert Bandit
        Ms = "Desert Bandit [Lv. 60]"
        NameQuest = "DesertQuest"
        QuestLv = 1
        NameMon = "Desert Bandit"
        CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
        CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
    elseif Lv == 75 or Lv <= 89 or _G.SelectMonster == "Desert Officer [Lv. 70]" then -- Desert Officer
        Ms = "Desert Officer [Lv. 70]"
        NameQuest = "DesertQuest"
        QuestLv = 2
        NameMon = "Desert Officer"
        CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
        CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
    elseif Lv == 90 or Lv <= 99 or _G.SelectMonster == "Snow Bandit [Lv. 90]" then -- Snow Bandit
        Ms = "Snow Bandit [Lv. 90]"
        NameQuest = "SnowQuest"
        QuestLv = 1
        NameMon = "Snow Bandit"
        CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
        CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
    elseif Lv == 100 or Lv <= 119 or _G.SelectMonster == "Snowman [Lv. 100]" then -- Snowman
        Ms = "Snowman [Lv. 100]"
        NameQuest = "SnowQuest"
        QuestLv = 2
        NameMon = "Snowman"
        CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
        CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
    elseif Lv == 120 or Lv <= 149 or _G.SelectMonster == "Chief Petty Officer [Lv. 120]" then -- Chief Petty Officer
        Ms = "Chief Petty Officer [Lv. 120]"
        NameQuest = "MarineQuest2"
        QuestLv = 1
        NameMon = "Chief Petty Officer"
        CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
        CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
    elseif Lv == 150 or Lv <= 174 or _G.SelectMonster == "Sky Bandit [Lv. 150]" then -- Sky Bandit
        Ms = "Sky Bandit [Lv. 150]"
        NameQuest = "SkyQuest"
        QuestLv = 1
        NameMon = "Sky Bandit"
        CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
        CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
    elseif Lv == 175 or Lv <= 189 or _G.SelectMonster == "Dark Master [Lv. 175]" then -- Dark Master
        Ms = "Dark Master [Lv. 175]"
        NameQuest = "SkyQuest"
        QuestLv = 2
        NameMon = "Dark Master"
        CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
        CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
    elseif Lv == 190 or Lv <= 209 or _G.SelectMonster == "Prisoner [Lv. 190]" then -- Prisoner
        Ms = "Prisoner [Lv. 190]"
        NameQuest = "PrisonerQuest"
        QuestLv = 1
        NameMon = "Prisoner"
        CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
        CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
    elseif Lv == 210 or Lv <= 249 or _G.SelectMonster == "Dangerous Prisoner [Lv. 210]" then -- Dangerous Prisoner
        Ms = "Dangerous Prisoner [Lv. 210]"
        NameQuest = "PrisonerQuest"
        QuestLv = 2
        NameMon = "Dangerous Prisoner"
        CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
        CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
    elseif Lv == 250 or Lv <= 274 or _G.SelectMonster == "Toga Warrior [Lv. 250]" then -- Toga Warrior
        Ms = "Toga Warrior [Lv. 250]"
        NameQuest = "ColosseumQuest"
        QuestLv = 1
        NameMon = "Toga Warrior"
        CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
        CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
    elseif Lv == 275 or Lv <= 299 or _G.SelectMonster == "Gladiator [Lv. 275]" then -- Gladiator
        Ms = "Gladiator [Lv. 275]"
        NameQuest = "ColosseumQuest"
        QuestLv = 2
        NameMon = "Gladiator"
        CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
        CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
    elseif Lv == 300 or Lv <= 324 or _G.SelectMonster == "Military Soldier [Lv. 300]" then -- Military Soldier
        Ms = "Military Soldier [Lv. 300]"
        NameQuest = "MagmaQuest"
        QuestLv = 1
        NameMon = "Military Soldier"
        CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
        CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
    elseif Lv == 325 or Lv <= 374 or _G.SelectMonster == "Military Spy [Lv. 325]" then -- Military Spy
        Ms = "Military Spy [Lv. 325]"
        NameQuest = "MagmaQuest"
        QuestLv = 2
        NameMon = "Military Spy"
        CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
        CFrameMon = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
    elseif Lv == 375 or Lv <= 399 or _G.SelectMonster == "Fishman Warrior [Lv. 375]" then -- Fishman Warrior 
        Ms = "Fishman Warrior [Lv. 375]"
        NameQuest = "FishmanQuest"
        QuestLv = 1
        NameMon = "Fishman Warrior"
        CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
        CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
        if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
        end
    elseif Lv == 400 or Lv <= 449 or _G.SelectMonster == "Fishman Commando [Lv. 400]" then -- Fishman Commando
        Ms = "Fishman Commando [Lv. 400]"
        NameQuest = "FishmanQuest"
        QuestLv = 2
        NameMon = "Fishman Commando"
        CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
        CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
        if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
        end
    elseif Lv == 450 or Lv <= 474 or _G.SelectMonster == "God's Guard [Lv. 450]" then -- God's Guard
        Ms = "God's Guard [Lv. 450]"
        NameQuest = "SkyExp1Quest"
        QuestLv = 1
        NameMon = "God's Guard"
        CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
        CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
        if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
        end
    elseif Lv == 475 or Lv <= 524 or _G.SelectMonster == "Shanda [Lv. 475]" then -- Shanda
        Ms = "Shanda [Lv. 475]"
        NameQuest = "SkyExp1Quest"
        QuestLv = 2
        NameMon = "Shanda"
        CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
        CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
        if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
        end
    elseif Lv == 525 or Lv <= 549 or _G.SelectMonster == "Royal Squad [Lv. 525]" then -- Royal Squad
        Ms = "Royal Squad [Lv. 525]"
        NameQuest = "SkyExp2Quest"
        QuestLv = 1
        NameMon = "Royal Squad"
        CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
        CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
    elseif Lv == 550 or Lv <= 624 or _G.SelectMonster == "Royal Soldier [Lv. 550]" then -- Royal Soldier
        Ms = "Royal Soldier [Lv. 550]"
        NameQuest = "SkyExp2Quest"
        QuestLv = 2
        NameMon = "Royal Soldier"
        CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
        CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
    elseif Lv == 625 or Lv <= 649 or _G.SelectMonster == "Galley Pirate [Lv. 625]" then -- Galley Pirate
        Ms = "Galley Pirate [Lv. 625]"
        NameQuest = "FountainQuest"
        QuestLv = 1
        NameMon = "Galley Pirate"
        CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
        CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
    elseif Lv >= 650 or _G.SelectMonster == "Galley Captain [Lv. 650]" then -- Galley Captain
        Ms = "Galley Captain [Lv. 650]"
        NameQuest = "FountainQuest"
        QuestLv = 2
        NameMon = "Galley Captain"
        CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
        CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
    end
end
if Second_Sea then
    if Lv == 700 or Lv <= 724 or _G.SelectMonster == "Raider [Lv. 700]" then -- Raider
        Ms = "Raider [Lv. 700]"
        NameQuest = "Area1Quest"
        QuestLv = 1
        NameMon = "Raider"
        CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
        CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
    elseif Lv == 725 or Lv <= 774 or _G.SelectMonster == "Mercenary [Lv. 725]" then -- Mercenary
        Ms = "Mercenary [Lv. 725]"
        NameQuest = "Area1Quest"
        QuestLv = 2
        NameMon = "Mercenary"
        CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
        CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
    elseif Lv == 775 or Lv <= 799 or _G.SelectMonster == "Swan Pirate [Lv. 775]" then -- Swan Pirate
        Ms = "Swan Pirate [Lv. 775]"
        NameQuest = "Area2Quest"
        QuestLv = 1
        NameMon = "Swan Pirate"
        CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
        CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
    elseif Lv == 800 or Lv <= 874 or _G.SelectMonster == "Factory Staff [Lv. 800]" then -- Factory Staff
        Ms = "Factory Staff [Lv. 800]"
        NameQuest = "Area2Quest"
        QuestLv = 2
        NameMon = "Factory Staff"
        CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
        CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
    elseif Lv == 875 or Lv <= 899 or _G.SelectMonster == "Marine Lieutenant [Lv. 875]" then -- Marine Lieutenant
        Ms = "Marine Lieutenant [Lv. 875]"
        NameQuest = "MarineQuest3"
        QuestLv = 1
        NameMon = "Marine Lieutenant"
        CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
        CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
    elseif Lv == 900 or Lv <= 949 or _G.SelectMonster == "Marine Captain [Lv. 900]" then -- Marine Captain
        Ms = "Marine Captain [Lv. 900]"
        NameQuest = "MarineQuest3"
        QuestLv = 2
        NameMon = "Marine Captain"
        CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
        CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
    elseif Lv == 950 or Lv <= 974 or _G.SelectMonster == "Zombie [Lv. 950]" then -- Zombie
        Ms = "Zombie [Lv. 950]"
        NameQuest = "ZombieQuest"
        QuestLv = 1
        NameMon = "Zombie"
        CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
        CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
    elseif Lv == 975 or Lv <= 999 or _G.SelectMonster == "Vampire [Lv. 975]" then -- Vampire
        Ms = "Vampire [Lv. 975]"
        NameQuest = "ZombieQuest"
        QuestLv = 2
        NameMon = "Vampire"
        CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
        CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
    elseif Lv == 1000 or Lv <= 1049 or _G.SelectMonster == "Snow Trooper [Lv. 1000]" then -- Snow Trooper
        Ms = "Snow Trooper [Lv. 1000]"
        NameQuest = "SnowMountainQuest"
        QuestLv = 1
        NameMon = "Snow Trooper"
        CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
        CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
    elseif Lv == 1050 or Lv <= 1099 or _G.SelectMonster == "Winter Warrior [Lv. 1050]" then -- Winter Warrior
        Ms = "Winter Warrior [Lv. 1050]"
        NameQuest = "SnowMountainQuest"
        QuestLv = 2
        NameMon = "Winter Warrior"
        CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
        CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
    elseif Lv == 1100 or Lv <= 1124 or _G.SelectMonster == "Lab Subordinate [Lv. 1100]" then -- Lab Subordinate
        Ms = "Lab Subordinate [Lv. 1100]"
        NameQuest = "IceSideQuest"
        QuestLv = 1
        NameMon = "Lab Subordinate"
        CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
        CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
    elseif Lv == 1125 or Lv <= 1174 or _G.SelectMonster == "Horned Warrior [Lv. 1125]" then -- Horned Warrior
        Ms = "Horned Warrior [Lv. 1125]"
        NameQuest = "IceSideQuest"
        QuestLv = 2
        NameMon = "Horned Warrior"
        CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
        CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
    elseif Lv == 1175 or Lv <= 1199 or _G.SelectMonster == "Magma Ninja [Lv. 1175]" then -- Magma Ninja
        Ms = "Magma Ninja [Lv. 1175]"
        NameQuest = "FireSideQuest"
        QuestLv = 1
        NameMon = "Magma Ninja"
        CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
        CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
    elseif Lv == 1200 or Lv <= 1249 or _G.SelectMonster == "Lava Pirate [Lv. 1200]" then -- Lava Pirate
        Ms = "Lava Pirate [Lv. 1200]"
        NameQuest = "FireSideQuest"
        QuestLv = 2
        NameMon = "Lava Pirate"
        CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
        CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
    elseif Lv == 1250 or Lv <= 1274 or _G.SelectMonster == "Ship Deckhand [Lv. 1250]" then -- Ship Deckhand
        Ms = "Ship Deckhand [Lv. 1250]"
        NameQuest = "ShipQuest1"
        QuestLv = 1
        NameMon = "Ship Deckhand"
        CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
        CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
        if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
        end
    elseif Lv == 1275 or Lv <= 1299 or _G.SelectMonster == "Ship Engineer [Lv. 1275]" then -- Ship Engineer
        Ms = "Ship Engineer [Lv. 1275]"
        NameQuest = "ShipQuest1"
        QuestLv = 2
        NameMon = "Ship Engineer"
        CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
        CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
        if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
        end
    elseif Lv == 1300 or Lv <= 1324 or _G.SelectMonster == "Ship Steward [Lv. 1300]" then -- Ship Steward
        Ms = "Ship Steward [Lv. 1300]"
        NameQuest = "ShipQuest2"
        QuestLv = 1
        NameMon = "Ship Steward"
        CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
        CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
        if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
        end
    elseif Lv == 1325 or Lv <= 1349 or _G.SelectMonster == "Ship Officer [Lv. 1325]" then -- Ship Officer
        Ms = "Ship Officer [Lv. 1325]"
        NameQuest = "ShipQuest2"
        QuestLv = 2
        NameMon = "Ship Officer"
        CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
        CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
        if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
        end
    elseif Lv == 1350 or Lv <= 1374 or _G.SelectMonster == "Arctic Warrior [Lv. 1350]" then -- Arctic Warrior
        Ms = "Arctic Warrior [Lv. 1350]"
        NameQuest = "FrostQuest"
        QuestLv = 1
        NameMon = "Arctic Warrior"
        CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
        CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
        if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
        end
    elseif Lv == 1375 or Lv <= 1424 or _G.SelectMonster == "Snow Lurker [Lv. 1375]" then -- Snow Lurker
        Ms = "Snow Lurker [Lv. 1375]"
        NameQuest = "FrostQuest"
        QuestLv = 2
        NameMon = "Snow Lurker"
        CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
        CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
    elseif Lv == 1425 or Lv <= 1449 or _G.SelectMonster == "Sea Soldier [Lv. 1425]" then -- Sea Soldier
        Ms = "Sea Soldier [Lv. 1425]"
        NameQuest = "ForgottenQuest"
        QuestLv = 1
        NameMon = "Sea Soldier"
        CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
        CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
    elseif Lv >= 1450 or _G.SelectMonster == "Water Fighter [Lv. 1450]" then -- Water Fighter
        Ms = "Water Fighter [Lv. 1450]"
        NameQuest = "ForgottenQuest"
        QuestLv = 2
        NameMon = "Water Fighter"
        CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
        CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
    end
end
if Third_Sea then
    if Lv == 1500 or Lv <= 1524 or _G.SelectMonster == "Pirate Millionaire [Lv. 1500]" then -- Pirate Millionaire
        Ms = "Pirate Millionaire [Lv. 1500]"
        NameQuest = "PiratePortQuest"
        QuestLv = 1
        NameMon = "Pirate Millionaire"
        CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
        CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
    elseif Lv == 1525 or Lv <= 1574 or _G.SelectMonster == "Pistol Billionaire [Lv. 1525]" then -- Pistol Billoonaire
        Ms = "Pistol Billionaire [Lv. 1525]"
        NameQuest = "PiratePortQuest"
        QuestLv = 2
        NameMon = "Pistol Billionaire"
        CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
        CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
    elseif Lv == 1575 or Lv <= 1599 or _G.SelectMonster == "Dragon Crew Warrior [Lv. 1575]" then -- Dragon Crew Warrior
        Ms = "Dragon Crew Warrior [Lv. 1575]"
        NameQuest = "AmazonQuest"
        QuestLv = 1
        NameMon = "Dragon Crew Warrior"
        CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
        CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
    elseif Lv == 1600 or Lv <= 1624 or _G.SelectMonster == "Dragon Crew Archer [Lv. 1600]" then -- Dragon Crew Archer
        Ms = "Dragon Crew Archer [Lv. 1600]"
        NameQuest = "AmazonQuest"
        QuestLv = 2
        NameMon = "Dragon Crew Archer"
        CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
        CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
    elseif Lv == 1625 or Lv <= 1649 or _G.SelectMonster == "Female Islander [Lv. 1625]" then -- Female Islander
        Ms = "Female Islander [Lv. 1625]"
        NameQuest = "AmazonQuest2"
        QuestLv = 1
        NameMon = "Female Islander"
        CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
        CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
    elseif Lv == 1650 or Lv <= 1699 or _G.SelectMonster == "Giant Islander [Lv. 1650]" then -- Giant Islander
        Ms = "Giant Islander [Lv. 1650]"
        NameQuest = "AmazonQuest2"
        QuestLv = 2
        NameMon = "Giant Islander"
        CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
        CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
    elseif Lv == 1700 or Lv <= 1724 or _G.SelectMonster == "Marine Commodore [Lv. 1700]" then -- Marine Commodore
        Ms = "Marine Commodore [Lv. 1700]"
        NameQuest = "MarineTreeIsland"
        QuestLv = 1
        NameMon = "Marine Commodore"
        CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
        CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
    elseif Lv == 1725 or Lv <= 1774 or _G.SelectMonster == "Marine Rear Admiral [Lv. 1725]" then -- Marine Rear Admiral
        Ms = "Marine Rear Admiral [Lv. 1725]"
        NameQuest = "MarineTreeIsland"
        QuestLv = 2
        NameMon = "Marine Rear Admiral"
        CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
        CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
    elseif Lv == 1775 or Lv <= 1799 or _G.SelectMonster == "Fishman Raider [Lv. 1775]" then -- Fishman Raide
        Ms = "Fishman Raider [Lv. 1775]"
        NameQuest = "DeepForestIsland3"
        QuestLv = 1
        NameMon = "Fishman Raider"
        CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
        CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
    elseif Lv == 1800 or Lv <= 1824 or _G.SelectMonster == "Fishman Captain [Lv. 1800]" then -- Fishman Captain
        Ms = "Fishman Captain [Lv. 1800]"
        NameQuest = "DeepForestIsland3"
        QuestLv = 2
        NameMon = "Fishman Captain"
        CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
        CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
    elseif Lv == 1825 or Lv <= 1849 or _G.SelectMonster == "Forest Pirate [Lv. 1825]" then -- Forest Pirate
        Ms = "Forest Pirate [Lv. 1825]"
        NameQuest = "DeepForestIsland"
        QuestLv = 1
        NameMon = "Forest Pirate"
        CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
        CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
    elseif Lv == 1850 or Lv <= 1899 or _G.SelectMonster == "Mythological Pirate [Lv. 1850]" then -- Mythological Pirate
        Ms = "Mythological Pirate [Lv. 1850]"
        NameQuest = "DeepForestIsland"
        QuestLv = 2
        NameMon = "Mythological Pirate"
        CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
        CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
    elseif Lv == 1900 or Lv <= 1924 or _G.SelectMonster == "Jungle Pirate [Lv. 1900]" then -- Jungle Pirate
        Ms = "Jungle Pirate [Lv. 1900]"
        NameQuest = "DeepForestIsland2"
        QuestLv = 1
        NameMon = "Jungle Pirate"
        CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
        CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
    elseif Lv == 1925 or Lv <= 1974 or _G.SelectMonster == "Musketeer Pirate [Lv. 1925]" then -- Musketeer Pirate
        Ms = "Musketeer Pirate [Lv. 1925]"
        NameQuest = "DeepForestIsland2"
        QuestLv = 2
        NameMon = "Musketeer Pirate"
        CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
        CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
    elseif Lv == 1975 or Lv <= 1999 or _G.SelectMonster == "Reborn Skeleton [Lv. 1975]" then
        Ms = "Reborn Skeleton [Lv. 1975]"
        NameQuest = "HauntedQuest1"
        QuestLv = 1
        NameMon = "Reborn Skeleton"
        CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
        CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732e-05, -0.208259016, -1.08073925e-06, 1, -7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
    elseif Lv == 2000 or Lv <= 2024 or _G.SelectMonster == "Living Zombie [Lv. 2000]" then
        Ms = "Living Zombie [Lv. 2000]"
        NameQuest = "HauntedQuest1"
        QuestLv = 2
        NameMon = "Living Zombie"
        CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
        CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, -2.58006327e-08, 1, -6.06848474e-08, -0.0324240364, 5.98163865e-08, 0.999474227)
    elseif Lv == 2025 or Lv <= 2049 or _G.SelectMonster == "Demonic Soul [Lv. 2025]" then
        Ms = "Demonic Soul [Lv. 2025]"
        NameQuest = "HauntedQuest2"
        QuestLv = 1
        NameMon = "Demonic Soul"
        CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
        CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
    elseif Lv == 2050 or Lv <= 2074 or _G.SelectMonster == "Posessed Mummy [Lv. 2050]" then
        Ms = "Posessed Mummy [Lv. 2050]"
        NameQuest = "HauntedQuest2"
        QuestLv = 2
        NameMon = "Posessed Mummy"
        CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
        CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
    elseif Lv == 2075 or Lv <= 2099 or _G.SelectMonster == "Peanut Scout [Lv. 2075]" then
        Ms = "Peanut Scout [Lv. 2075]"
        NameQuest = "NutsIslandQuest"
        QuestLv = 1
        NameMon = "Peanut Scout"
        CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
        CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
    elseif Lv == 2100 or Lv <= 2124 or _G.SelectMonster == "Peanut President [Lv. 2100]" then
        Ms = "Peanut President [Lv. 2100]"
        NameQuest = "NutsIslandQuest"
        QuestLv = 2
        NameMon = "Peanut President"
        CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
        CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
    elseif Lv == 2125 or Lv <= 2149 or _G.SelectMonster == "Ice Cream Chef [Lv. 2125]" then
        Ms = "Ice Cream Chef [Lv. 2125]"
        NameQuest = "IceCreamIslandQuest"
        QuestLv = 1
        NameMon = "Ice Cream Chef"
        CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
        CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)
    elseif Lv == 2150 or Lv <= 2199 or _G.SelectMonster == "Ice Cream Commander [Lv. 2150]" then
        Ms = "Ice Cream Commander [Lv. 2150]"
        NameQuest = "IceCreamIslandQuest"
        QuestLv = 2
        NameMon = "Ice Cream Commander"
        CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
        CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)
    elseif Lv == 2200 or Lv <= 2224 or _G.SelectMonster == "Cookie Crafter [Lv. 2200]" then
        Ms = "Cookie Crafter [Lv. 2200]"
        NameQuest = "CakeQuest1"
        QuestLv = 1
        NameMon = "Cookie Crafter"
        CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
        CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1, 0, -0.625686109, 0, -0.780074954)
    elseif Lv == 2225 or Lv <= 2249 or _G.SelectMonster == "Cake Guard [Lv. 2225]" then
        Ms = "Cake Guard [Lv. 2225]"
        NameQuest = "CakeQuest1"
        QuestLv = 2
        NameMon = "Cake Guard"
        CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
        CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, -0.997700036, 0, 0.0677844882)
    elseif Lv == 2250 or Lv <= 2274 or _G.SelectMonster == "Baking Staff [Lv. 2250]" then
        Ms = "Baking Staff [Lv. 2250]"
        NameQuest = "CakeQuest2"
        QuestLv = 1
        NameMon = "Baking Staff"
        CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
        CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1, 0, 0.967087567, 0, -0.254443765)
    elseif Lv == 2275 or Lv <= 2299 or _G.SelectMonster == "Head Baker [Lv. 2275]" then
        Ms = "Head Baker [Lv. 2275]"
        NameQuest = "CakeQuest2"
        QuestLv = 2
        NameMon = "Head Baker"
        CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
        CFrameMon = CFrame.new(-2251.5791, 52.2714615, -13033.3965, -0.991971016, 0, -0.126466095, 0, 1, 0, 0.126466095, 0, -0.991971016)
    elseif Lv == 2300 or Lv <= 2324 or _G.SelectMonster == "Cocoa Warrior [Lv. 2300]" then
        Ms = "Cocoa Warrior [Lv. 2300]"
        NameQuest ="ChocQuest1"
        QuestLv = 1
        NameMon = "Cocoa Warrior"
        CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        CFrameMon = CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)
    elseif Lv == 2325 or Lv <= 2349 or _G.SelectMonster == "Chocolate Bar Battler [Lv. 2325]" then
        Ms = "Chocolate Bar Battler [Lv. 2325]"
        NameQuest = "ChocQuest1"
        QuestLv = 2
        NameMon = "Chocolate Bar Battler"
        CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        CFrameMon = CFrame.new(701.312073, 25.5824986, -12708.2148, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685)
    elseif Lv == 2350 or Lv <= 2374 or _G.SelectMonster == "Sweet Thief [Lv. 2350]" then
        Ms = "Sweet Thief [Lv. 2350]"
        NameQuest = "ChocQuest2"
        QuestLv = 1
        NameMon = "Sweet Thief"
        CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
        CFrameMon = CFrame.new(-140.258301, 25.5824986, -12652.3115, 0.173624337, -0, -0.984811902, 0, 1, -0, 0.984811902, 0, 0.173624337)
    elseif Lv == 2375 or Lv <= 2400 or _G.SelectMonster == "Candy Rebel [Lv. 2375]" then
        Ms = "Candy Rebel [Lv. 2375]"
        NameQuest = "ChocQuest2"
        QuestLv = 2
        NameMon = "Candy Rebel"
        CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
        CFrameMon = CFrame.new(47.9231453, 25.5824986, -13029.2402, -0.819156051, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, -0.819156051)
    elseif Lv == 2400 or Lv <= 2424 or _G.SelectMonster == "Candy Pirate [Lv. 2400]" then
        Ms = "Candy Pirate [Lv. 2400]"
        NameQuest = "CandyQuest1"
        QuestLv = 1
        NameMon = "Candy Pirate"
        CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
        CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, -0, -0.984811902, 0, 1, -0, 0.984811902, 0, 0.173624337)
    elseif Lv >= 2425 or _G.SelectMonster == "Snow Demon [Lv. 2425]" then
        Ms = "Snow Demon [Lv. 2425]"
        NameQuest = "CandyQuest1"
        QuestLv = 2
        NameMon = "Snow Demon"
        CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
        CFrameMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
    end
end
