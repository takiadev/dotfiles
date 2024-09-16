-- Define input and output paths for actions using [[ ]] to prevent escaping
INPUT_ACTIONS_PATH = [[C:\Users\Julien\AppData\Local\nvim\lua\my-config\keys\actions.lua]]
OUTPUT_ACTIONS_PATH = [[C:\Users\Julien\AppData\Local\nvim\lua\my-config\keys\actions2.lua]]
GO_ACTIONS_OUTPUT_PATH = [[C:\Users\Julien\AppData\Local\nvim\lua\my-config\keys\actions_go.lua]] -- Add for go modes
OBJ_ACTIONS_OUTPUT_PATH = [[C:\Users\Julien\AppData\Local\nvim\lua\my-config\keys\actions_obj.lua]] -- Add for obj modes

-- Table to store rejected modes
local action_rejects = {}

-- Custom deep equality function for comparing tables (replaces vim.deep_equal)
local function deep_equal(tbl1, tbl2)
  if tbl1 == tbl2 then
    return true
  end
  if type(tbl1) ~= "table" or type(tbl2) ~= "table" then
    return false
  end
  for k, v in pairs(tbl1) do
    if not deep_equal(v, tbl2[k]) then
      return false
    end
  end
  for k in pairs(tbl2) do
    if tbl1[k] == nil then
      return false
    end
  end
  return true
end

-- Function to transform and merge the actions based on identical values and segregate modes
function transform_actions_format(actions)
  local transformed_actions = {}
  local go_actions = {}
  local obj_actions = {}

  for action, modes in pairs(actions) do
    local mode_map = {}

    -- Group modes with identical values
    for mode, value in pairs(modes) do
      if #mode == 1 then
        -- Single character mode
        local key = vim.inspect(value)
        if not mode_map[key] then
          mode_map[key] = { value = value, modes = {} }
        end
        table.insert(mode_map[key].modes, mode)
      elseif mode == "go" then
        -- Handle "go" mode
        if not go_actions[action] then
          go_actions[action] = {}
        end
        go_actions[action][mode] = value
      elseif mode == "obj" then
        -- Handle "obj" mode
        if not obj_actions[action] then
          obj_actions[action] = {}
        end
        obj_actions[action][mode] = value
      else
        -- Reject any other mode
        table.insert(action_rejects, { action = action, mode = mode, value = value })
      end
    end

    -- Add the single-character modes to the transformed actions
    if next(mode_map) ~= nil then
      transformed_actions[action] = {}
      for _, data in pairs(mode_map) do
        -- Sort the modes alphabetically and merge them
        table.sort(data.modes)
        local merged_modes = table.concat(data.modes)
        transformed_actions[action][merged_modes] = data.value
      end
    end
  end

  return transformed_actions, go_actions, obj_actions
end

-- Function to sort actions alphabetically
function sort_actions(tbl)
  local sorted_keys = {}

  -- Collect and sort the action keys
  for action in pairs(tbl) do
    table.insert(sorted_keys, action)
  end

  table.sort(sorted_keys) -- Sort the actions alphabetically
  return sorted_keys
end

-- Function to escape strings properly, especially for backslashes in dst field
function escape_string(s)
  if s == nil then
    return "" -- Skip nil values instead of returning "nil"
  end
  return '"' .. tostring(s):gsub("\\", "\\\\"):gsub('"', '\\"') .. '"' -- Properly escape backslashes and internal quotes
end

-- Function to serialize the opts field on one line
function serialize_opts_inline(opts)
  if type(opts) ~= "table" then
    return "{}" -- Return empty table if opts is not a table
  end

  local result = "{ "
  for k, v in pairs(opts) do
    if k ~= nil and v ~= nil then
      result = result .. k .. " = " .. escape_string(v) .. ", "
    end
  end
  result = result:sub(1, -3) .. " }" -- Trim trailing comma and space
  return result
end

-- Function to serialize the actions table to a string with sorted actions and one-line mode strings
function serialize_actions_table(tbl)
  local sorted_actions = sort_actions(tbl)
  local result = "{\n"
  for _, action in ipairs(sorted_actions) do
    result = result .. "  " .. action .. " = {\n"
    for mode_str, value in pairs(tbl[action]) do
      result = result
        .. "    "
        .. mode_str
        .. " = { src = "
        .. escape_string(value.src)
        .. ", plugin = "
        .. (value.plugin and escape_string(value.plugin) or "nil")
        .. ", dst = "
        .. escape_string(value.dst)
        .. ", opts = "
        .. serialize_opts_inline(value.opts)
        .. " },\n"
    end
    result = result .. "  },\n"
  end
  result = result .. "}\n"
  return result
end

-- Load the Lua file from INPUT_ACTIONS_PATH using loadfile
local func_actions, load_err_actions = loadfile(INPUT_ACTIONS_PATH)

if not func_actions then
  error("Error loading file: " .. load_err_actions)
end

-- Execute the function to load the actions table
local actions = func_actions()

-- Ensure that the result is a table
if type(actions) ~= "table" then
  error("Expected actions table, but got: " .. type(actions))
end

-- Transform the actions to the desired format and segregate go and obj modes
local transformed_actions, go_actions, obj_actions = transform_actions_format(actions)

-- Serialize the transformed actions table
local output_actions_content = "-- file: "
  .. OUTPUT_ACTIONS_PATH
  .. "\nreturn "
  .. serialize_actions_table(transformed_actions)

-- Write the main transformed actions to OUTPUT_ACTIONS_PATH
if OUTPUT_ACTIONS_PATH and OUTPUT_ACTIONS_PATH ~= "" then
  local output_actions_file = io.open(OUTPUT_ACTIONS_PATH, "w")
  if not output_actions_file then
    error("Could not open output file: " .. OUTPUT_ACTIONS_PATH)
  end
  output_actions_file:write(output_actions_content)
  output_actions_file:close()
  print("Actions file transformed and written to " .. OUTPUT_ACTIONS_PATH)
end

-- Write the go modes to GO_ACTIONS_OUTPUT_PATH if specified
if GO_ACTIONS_OUTPUT_PATH and GO_ACTIONS_OUTPUT_PATH ~= "" then
  local go_actions_content = "-- file: " .. GO_ACTIONS_OUTPUT_PATH .. "\nreturn " .. serialize_actions_table(go_actions)
  local go_actions_file = io.open(GO_ACTIONS_OUTPUT_PATH, "w")
  if not go_actions_file then
    error("Could not open output file: " .. GO_ACTIONS_OUTPUT_PATH)
  end
  go_actions_file:write(go_actions_content)
  go_actions_file:close()
  print("Go actions written to " .. GO_ACTIONS_OUTPUT_PATH)
end

-- Write the obj modes to OBJ_ACTIONS_OUTPUT_PATH if specified
if OBJ_ACTIONS_OUTPUT_PATH and OBJ_ACTIONS_OUTPUT_PATH ~= "" then
  local obj_actions_content = "-- file: "
    .. OBJ_ACTIONS_OUTPUT_PATH
    .. "\nreturn "
    .. serialize_actions_table(obj_actions)
  local obj_actions_file = io.open(OBJ_ACTIONS_OUTPUT_PATH, "w")
  if not obj_actions_file then
    error("Could not open output file: " .. OBJ_ACTIONS_OUTPUT_PATH)
  end
  obj_actions_file:write(obj_actions_content)
  obj_actions_file:close()
  print("Obj actions written to " .. OBJ_ACTIONS_OUTPUT_PATH)
end

-- Display the rejected actions on stdout
if #action_rejects > 0 then
  print("Rejected actions:")
  for _, reject in ipairs(action_rejects) do
    print(
      "Action: "
        .. reject.action
        .. ", Mode: "
        .. reject.mode
        .. ", Value: { src = "
        .. reject.value.src
        .. ", plugin = "
        .. (reject.value.plugin or "nil")
        .. ", dst = "
        .. reject.value.dst
        .. " }"
    )
  end
end
