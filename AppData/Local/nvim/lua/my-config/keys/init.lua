local M = {}

local utils = require("my-config.keys.utils")
local keys = require("my-config.keys.keys")
local actions = require("my-config.keys.actions")

M._plugins = utils.make_plugins_to_keys_array(keys, actions)

-- Output : { [<dst>] = { [<key>] = { [<mode>] = <opts> }}}
function M.get_plugin_data(plugin)
  return M._plugins[plugin]
end

-- Output : {key=<key>, mode={<mode>, ...}, desc=<desc>}
function M.get_key(plugin, dst)
  local keys = M._plugins[plugin][dst]
  -- keys: {[key] = { [mode] = opts} }
  if not keys then
    return { key = "<leader><leader><leader><leader><leader>" .. plugin .. dst, mode = "n", desc = plugin .. ":" .. dst }
  end

  local count = 0
  for k, m in pairs(keys) do
    count = count + 1
  end

  local error = "Use mapping aliases instead of mapping several keys to the plugin action: "
  error = error .. vim.inspect(keys)
  assert(count == 1, error)

  for k, modes in pairs(keys) do
    local result = { key = k, mode = {}, desc = "" }
    for m, o in pairs(modes) do
      table.insert(result.mode, m)
      result.desc = o.desc
    end
    return result
  end
end

function M.setup_keymaps()
  local dsts = M.get_plugin_data("keymap")

  local allowed_modes = "cinotvx"

  if dsts then
    for dst, keys in pairs(dsts) do
      for key, modes in pairs(keys) do
        for mode, opts in pairs(modes) do
          if allowed_modes:find(mode) then -- Check if mode is allowed
            if opts.noremap == nil and opts.remap == nil then
              opts.noremap = true
            end
            vim.keymap.set(mode, key, dst, opts)
          else
            print("Warning: Unsupported mode " .. mode .. " for key: " .. key)
          end
        end
      end
    end
  else
    print("Warning: No entries found for plugin 'keymap'.")
  end
end

return M

