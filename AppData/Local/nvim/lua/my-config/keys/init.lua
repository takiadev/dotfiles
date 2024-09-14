local M = {}

local utils = require('my-config.keys.utils')

-- {[<key>] = {[<mode>] = "<action>"}}
local keys = require('my-config.keys.keys')

-- {[<action>] = {[<mode>] = {plugin = <plugin>, dst = <dst>, opts = <opts>}}}
local actions = require('my-config.keys.actions')

-- {[<plugin>] = { [<dst>] = { [<key>] = { <mode>, <opts> }}}}
M._plugins = utils.make_plugins_to_keys_array(keys, actions)

-- Output : { [<dst>] = { [<key>] = { [<mode>] = <opts> }}}
function M.get_plugin_data(plugin)
	return M._plugins[plugin]
end

-- Output : {key=<key>, mode={<mode>, ...}, desc=<desc>}
function M.get_key(plugin, dst)
	local keys  = M._plugins[plugin][dst]
	-- keys: {[key] = { [mode] = opts} }
	if not keys then
		return {key="<leader><leader><leader><leader><leader>" .. plugin .. dst, mode="n", desc=plugin .. ":" .. dst}
	end

	local count = 0
	for k, m in pairs(keys) do
		count = count + 1
	end
	
	local error = "Use mapping aliases instead of mapping several keys to the plugin action: "
	error = error .. vim.inspect(keys)
	assert(count == 1, error)
	
	for k, modes in pairs(keys) do	
		local result = {key=k, mode={}, desc=""}
		for m, o in pairs(modes) do
			table.insert(result.mode, m)
			result.desc = o.desc
		end
		return result
	end
end

function M.setup_keymaps()
	-- { [<dst>] = { [<key>] = { <mode>, <opts> }}}
	local rules = M.get_plugin_data('keymap')
	-- print(vim.inspect(rules))
	local allowed_modes = {n=true, x=true, o=true, c=true, v=true}
	-- print("Mappings for key a:")
	-- print(vim.inspect(rules["v:count == 0 ? 'gk' : 'k'"]))
	for dst, keys in pairs(rules) do
		for key, modes in pairs(keys) do
			for mode, opts in pairs(modes) do
				if allowed_modes[mode] then
					local o = {noremap=true, desc=opts.desc, expr=opts.expr}
					function f()
						vim.notify(vim.inspect({dst=dst, opts=o}))
					end
					--if key == "a" or dst == "v" then
					-- print("Setting keymap: " .. mode .. ", " .. key .. " -> " .. dst .. " : " .. vim.inspect(o))
					--end
					-- if key == "f" then
					--	print("vim.keymap.set(" .. mode .. ", " .. key .. ", " .. dst .. ")")
					-- end
					vim.keymap.set(mode, key, dst, o)
				end
			end
		end
	end
	-- vim.keymap.set({"n", "x"}, "a", "v", {desc="XXXXXXX", noremap=true})
end

return M