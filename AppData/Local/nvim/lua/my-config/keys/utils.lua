local M = {}

local function convert_keys(keys)
  local converted_keys = {}

  for key_combination, modes in pairs(keys) do
    converted_keys[key_combination] = {}
    for mode_string, action in pairs(modes) do
      -- Iterate over each character in mode_string using gmatch
      for mode in mode_string:gmatch(".") do
        -- Create individual entries for each mode
        converted_keys[key_combination][mode] = action
      end
    end
  end

  return converted_keys
end

local function convert_actions(actions)
  local converted_actions = {}

  for action_name, modes in pairs(actions) do
    converted_actions[action_name] = {}
    for mode_string, data in pairs(modes) do
      -- Iterate over each character in mode_string using gmatch
      for mode in mode_string:gmatch(".") do
        -- Create individual entries for each mode
        converted_actions[action_name][mode] = data
      end
    end
  end

  return converted_actions
end

-- Input  : {[<key>] = {[<mode>] = "<action>"}}
-- Input  : {[<action>] = {[<mode>] = {plugin = <plugin>, dst = <dst>, opts = <opts>}}}
-- Output : {[<plugin>] = { [<dst>] = { [<key>] = { [<mode>] = <opts> }}}}
function M.make_plugins_to_keys_array(keys, actions)
  keys = convert_keys(keys)
  actions = convert_actions(actions)
  local plugins_to_keys_array = {}

  for key, modes in pairs(keys) do
    for mode_str, action in pairs(modes) do
      for mode in mode_str:gmatch(".") do
        local action_data = actions[action]

        if action_data and action_data[mode] then
          local plugin = action_data[mode].plugin or "unknown_plugin"
          local dst = action_data[mode].dst or "unknown_dst"
          local opts = action_data[mode].opts or {}

          if not plugins_to_keys_array[plugin] then
            plugins_to_keys_array[plugin] = {}
          end

          if not plugins_to_keys_array[plugin][dst] then
            plugins_to_keys_array[plugin][dst] = {}
          end

          if not plugins_to_keys_array[plugin][dst][key] then
            plugins_to_keys_array[plugin][dst][key] = {}
          end

          plugins_to_keys_array[plugin][dst][key][mode] = opts
        else
          print("Warning: Missing action data for key: " .. key .. " and mode: " .. mode)
        end
      end
    end
  end
  return plugins_to_keys_array
end

return M

