local M = {}

 -- Input  : {[<key>] = {<mode> = "<action>"}}
 -- Output : {[<action>] = {mode = "<key>"}}
 function M.make_action_to_keys_array(keys)
	local pivoted = {}
	for key, modes in pairs(keys) do
		for mode, action in pairs(modes) do
			if action ~= "" then -- Skip empty actions
				pivoted[action] = pivoted[action] or {}
				pivoted[action][mode] = key
			end
		end
	end
	return pivoted
end

-- Input  : "<action>"
-- Output : {<mode> = "<key>"}  
function M.keys_for_action(action)
	local mapping = {}
	for key, modes in pairs(keys) do
		for mode, mapped_action in pairs(modes) do
			if mapped_action == action then
				mapping[mode] = key
			end
		end
	end
	return mapping
end

-- Input  : "<action>"
-- Output : {[<key>] = {mode1, ...}}
function M.keys_for_action2(action)
	local mapping = {}
	for key, modes in pairs(keys) do
		for mode, mapped_action in pairs(modes) do
			if mapped_action == action then
				if not mapping[key] then
					mapping[key] = {}
				end
				table.insert(mapping[key], mode)
			end
		end
	end
	return mapping
end


-- Input  : {[<action>] = {[<mode>] = {plugin = <plugin>, dst = <dst>, opts = <opts>  }}}
-- Output : {[<plugin>] = {[<dst>] = {[<action>] = {[<mode>] = <opts>  }]}}}
function M.make_plugins_to_action_array(actions)
	local plugins = {}
	for action, modes in pairs(actions) do
		for mode, data in pairs(modes) do
			local p = data.plugin
			-- print("make pta: " .. action .. " - " .. mode .. " - " .. (p or ""))
            if p then
                local dst = data.dst
                plugins[p] = plugins[p] or {}
                plugins[p][dst] = plugins[p][dst] or {}
				plugins[p][dst][action] = plugins[p][dst][action] or {}
                plugins[p][dst][action][mode] = data.opts
            end
        end
	end
	-- print(vim.inspect(plugins))
	return plugins
end

-- Input  : {[<key>] = {[<mode>] = "<action>"}}
-- Input  : {[<action>] = {[<mode>] = {plugin = <plugin>, dst = <dst>, opts = <opts>}}}
-- Output : {[<plugin>] = { [<dst>] = { [<key>] = { [<mode>] = <opts> }}}}
function M.make_plugins_to_keys_array(keys, actions)
	-- Output : {[<action>] = {[<mode>] = "<key>"}}
	local a_to_k = M.make_action_to_keys_array(keys)
	
	-- Output : {[<plugin>] = {[<dst>] = {[<action>] = {mode=<mode>, opts=<opts>}}}}
	local p_to_a = M.make_plugins_to_action_array(actions)
	local result = {}
	for plugin, dsts in pairs(p_to_a) do
		if plugin then
			result[plugin] = {}
			for dst, actions in pairs(dsts) do
				if dst and dst ~= "" then
					result[plugin][dst] = {}
					for action, modes in pairs(actions) do
						for mode, opts in pairs(modes) do
							local key = a_to_k[action][mode]
						if key then
							result[plugin][dst][key] = result[plugin][dst][key] or {}
							result[plugin][dst][key][mode] = opts -- ideally, should deepcopy here
						end
					end
					end
				end
			end
		end
	end
	
	-- print(vim.inspect(p_to_a))
	-- print(vim.inspect(result))
	return result
end

return M