--skidded from 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/addons/SaveManager.lua'
--lol

local httpService = game:GetService('HttpService')

local SaveManager = {} do
	SaveManager.Folder = 'BlackTrap'
	SaveManager.Ignore = {}
	SaveManager.Parser = {
		Toggle = {
			Save = function(idx, object) 
				return { type = 'Toggle', idx = idx, value = object.Value } 
			end,
			Load = function(idx, data)
				if Toggles[idx] then 
					Toggles[idx]:SetValue(data.value)
				end
			end,
		},
		Slider = {
			Save = function(idx, object)
				return { type = 'Slider', idx = idx, value = tostring(object.Value) }
			end,
			Load = function(idx, data)
				if Options[idx] then 
					Options[idx]:SetValue(data.value)
				end
			end,
		},
		Dropdown = {
			Save = function(idx, object)
				return { type = 'Dropdown', idx = idx, value = object.Value }
			end,
			Load = function(idx, data)
				if Options[idx] then 
					Options[idx]:SetValue(data.value)
				end
			end,
		},
		Textbox = {
			Save = function(idx, object)
				return { type = 'Textbox', idx = idx, value = object.Value }
			end,
			Load = function(idx, data)
				if Options[idx] then 
					Options[idx]:SetValue(data.value)
				end
			end,
		},
		Paragraph = {
			Save = function(idx, object)
				return { type = 'Paragraph', idx = idx, value = object.Value }
			end,
			Load = function(idx, data)
				if Options[idx] then 
					Options[idx]:SetValue(data.value)
				end
			end,
		},
		ColorPicker = {
			Save = function(idx, object)
				return { type = 'ColorPicker', idx = idx, value = object.Value }
			end,
			Load = function(idx, data)
				if Options[idx] then 
					Options[idx]:SetValue(idx, data.value)
				end
			end,
		}
	}

	function SaveManager:SetIgnoreIndexes(list)
		for _, key in next, list do
			self.Ignore[key] = true
		end
	end

	function SaveManager:SetFolder(folder)
		self.Folder = folder;
		self:BuildFolderTree()
	end

	function SaveManager:Save(name)
		if not name then return false, 'invalid name' end
		
		local fullPath = self.Folder .. '/settings/' .. name .. '.json'

		local data = {
			objects = {}
		}

		for idx, toggle in next, Toggles do
			if self.Ignore[idx] then continue end

			table.insert(data.objects, self.Parser[toggle.Type].Save(idx, toggle))
		end

		for idx, option in next, Options do
			if not self.Parser[option.Type] then continue end
			if self.Ignore[idx] then continue end

			table.insert(data.objects, self.Parser[option.Type].Save(idx, option))
		end	

		local success, encoded = pcall(httpService.JSONEncode, httpService, data)
		if not success then
			return false, 'failed to encode data'
		end

		writefile(fullPath, encoded)
		return true
	end

	function SaveManager:Load(name)
		local file = self.Folder .. '/settings/' .. name .. '.json'
		if not isfile(file) then return false, 'invalid file' end

		local success, decoded = pcall(httpService.JSONDecode, httpService, readfile(file))
		if not success then return false, 'decode error' end

		for _, option in next, decoded.objects do
			if self.Parser[option.type] then
				self.Parser[option.type].Load(option.idx, option)
			end
		end

		return true
	end

	function SaveManager:IgnoreThemeSettings()
		self:SetIgnoreIndexes({ 
			"Background", "ElementColor", "AccentColor", "TextColor", "ImageColor", -- themes
			"ThemeManager_ThemeList", 'ThemeManager_CustomThemeList', 'ThemeManager_CustomThemeName', -- themes
		})
	end

	function SaveManager:BuildFolderTree()
		local paths = {
			self.Folder,
			self.Folder .. '/themes',
			self.Folder .. '/settings'
		}

		for i = 1, #paths do
			local str = paths[i]
			if not isfolder(str) then
				makefolder(str)
			end
		end
	end

	function SaveManager:RefreshConfigList()
		local list = listfiles(self.Folder .. '/settings')

		local out = {}
		for i = 1, #list do
			local file = list[i]
			if file:sub(-5) == '.json' then
				-- i hate this but it has to be done ...

				local pos = file:find('.json', 1, true)
				local start = pos

				local char = file:sub(pos, pos)
				while char ~= '/' and char ~= '\\' and char ~= '' do
					pos = pos - 1
					char = file:sub(pos, pos)
				end

				if char == '/' or char == '\\' then
					table.insert(out, file:sub(pos + 1, start - 1))
				end
			end
		end
		
		return out
	end

	function SaveManager:SetLibrary(library)
		self.Library = library
	end

	function SaveManager:LoadAutoloadConfig()
		if isfile(self.Folder .. '/settings/autoload.txt') then
			local name = readfile(self.Folder .. '/settings/autoload.txt')

			local success, err = self:Load(name)
			if not success then
				return self.Library:Notify('Error', 'Failed to load autoload config: ' .. err)
			end
			self.Library:Notify(string.format('Auto loaded config %q', name))
		end
	end


	function SaveManager:BuildConfigSection(tab)
		assert(self.Library, 'Must set SaveManager.Library')
		local element = tab:addSection("Config")
		local section = element:newSection("Configuration Manager", true)
		
		local ConfigList = section:addDropdown('SaveManager_ConfigList', 'Config List', 'Display Config List', '', self:RefreshConfigList(), function(Value) 
			Options.SaveManager_ConfigName:SetValue(Value)
		end)
		section:addTextBox('SaveManager_ConfigName', 'Rename config')

		--section:AddDivider()

		section:addButton('Save config', 'Info', function()
			local name = Options.SaveManager_ConfigName.Value or ""

			if name:gsub(' ', '') == '' then 
				return self.Library:Notify('Error', 'Invalid config name (empty)', 2)
			end

			local success, err = self:Save(name)
			if not success then
				return self.Library:Notify('Error', 'Failed to save config: ' .. err)
			end

			self.Library:Notify(string.format('Auto loaded config %q', name))

			Options.SaveManager_ConfigList.Values = self:RefreshConfigList()
			ConfigList:Refresh(Options.SaveManager_ConfigList.Values)
			--Options.SaveManager_ConfigList:SetValues()
			Options.SaveManager_ConfigList:SetValue(nil)
		end)
		section:addButton('Load config', 'Info', function()
			local name = Options.SaveManager_ConfigList.Value

			local success, err = self:Load(name)
			if not success then
				return self.Library:Notify('Error', 'Failed to load config: ' .. err)
			end

			self.Library:Notify("Loaded", string.format('Loaded config %q', name))
		end)

		section:addButton('Overwrite config', 'Info', function()
			local name = Options.SaveManager_ConfigList.Value

			local success, err = self:Save(name)
			if not success then
				return self.Library:Notify('Error', 'Failed to overwrite config: ' .. err)
			end

			self.Library:Notify('Saved', string.format('Overwrote config %q', name))
		end)
		
		section:addButton('Autoload config', 'Info', function()
			local name = Options.SaveManager_ConfigList.Value
			writefile(self.Folder .. '/settings/autoload.txt', name)
			SaveManager.AutoloadLabel:UpdateLabel('Current autoload config: ' .. name)
			self.Library:Notify('Auto Load', string.format('Set %q to auto load', name))
		end)

		section:addButton('Refresh config list', 'Info', function()
			Options.SaveManager_ConfigList.Values = self:RefreshConfigList()
			ConfigList:Refresh(Options.SaveManager_ConfigList.Values)
			--Options.SaveManager_ConfigList:SetValues()
			Options.SaveManager_ConfigList:SetValue(nil)
		end)

		SaveManager.AutoloadLabel = section:addLabel('• Current autoload config : none')

		if isfile(self.Folder .. '/settings/autoload.txt') then
			local name = readfile(self.Folder .. '/settings/autoload.txt')
			SaveManager.AutoloadLabel:UpdateLabel('• Current autoload config : ' .. name)
		end

		SaveManager:SetIgnoreIndexes({ 'SaveManager_ConfigList', 'SaveManager_ConfigName' })
	end

	SaveManager:BuildFolderTree()
end
return SaveManager
