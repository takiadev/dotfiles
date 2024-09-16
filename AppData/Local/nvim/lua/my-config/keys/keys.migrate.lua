-- Define input and output paths using [[ ]] to prevent escaping
INPUT_PATH = [[C:\Users\Julien\AppData\Local\nvim\lua\my-config\keys\keys.lua]]
OUTPUT_PATH = [[C:\Users\Julien\AppData\Local\nvim\lua\my-config\keys\keys2.lua]]
GO_OUTPUT_PATH = [[C:\Users\Julien\AppData\Local\nvim\lua\my-config\keys\keys_go.lua]] -- Add for go modes
OBJ_OUTPUT_PATH = [[C:\Users\Julien\AppData\Local\nvim\lua\my-config\keys\keys_obj.lua]] -- Add for obj modes

-- Table to store rejected modes
local rejects = {}

-- Function to transform the keys format and segregate the modes
function transform_keys_format(keys)
  local transformed_keys = {}
  local go_keys = {}
  local obj_keys = {}

  for key, modes in pairs(keys) do
    local mode_map = {}

    -- Group modes with the same action
    for mode, action in pairs(modes) do
      if #mode == 1 then
        -- Single character mode, process normally
        if not mode_map[action] then
          mode_map[action] = {}
        end
        table.insert(mode_map[action], mode) -- Collect the modes for sorting
      elseif mode == "go" then
        -- Handle "go" mode
        if not go_keys[key] then
          go_keys[key] = {}
        end
        go_keys[key][mode] = action
      elseif mode == "obj" then
        -- Handle "obj" mode
        if not obj_keys[key] then
          obj_keys[key] = {}
        end
        obj_keys[key][mode] = action
      else
        -- Reject any other mode
        table.insert(rejects, { key = key, mode = mode, action = action })
      end
    end

    -- Add the single-character modes to the transformed keys
    if next(mode_map) ~= nil then
      transformed_keys[key] = {}
      for action, mode_table in pairs(mode_map) do
        -- Sort the modes alphabetically
        table.sort(mode_table)
        local sorted_modes = table.concat(mode_table)
        transformed_keys[key][sorted_modes] = action -- No quotes around mode_str
      end
    end
  end

  return transformed_keys, go_keys, obj_keys
end

-- Function to escape strings properly and ensure correct formatting
function escape_string(s)
  return '"' .. s:gsub('"', '\\"') .. '"' -- Properly escape quotes
end

-- Function to sort keys in alphabetical order with normal keys first, then Alt, then Ctrl, and uppercase after lowercase
function sort_keys(tbl)
  local normal_keys = {}
  local alt_keys = {}
  local ctrl_keys = {}

  -- Classify keys
  for key in pairs(tbl) do
    if key:match("^<A%-") then
      table.insert(alt_keys, key)
    elseif key:match("^<C%-") then
      table.insert(ctrl_keys, key)
    else
      table.insert(normal_keys, key)
    end
  end

  -- Sort each group alphabetically and handle uppercase right after lowercase
  local function case_sort(keys)
    table.sort(keys, function(a, b)
      local lower_a, lower_b = a:lower(), b:lower()
      if lower_a == lower_b then
        return a < b -- Sort lowercase before uppercase
      else
        return lower_a < lower_b
      end
    end)
  end

  case_sort(normal_keys)
  case_sort(alt_keys)
  case_sort(ctrl_keys)

  -- Combine sorted keys
  local sorted_keys = {}
  for _, key in ipairs(normal_keys) do
    table.insert(sorted_keys, key)
  end
  for _, key in ipairs(alt_keys) do
    table.insert(sorted_keys, key)
  end
  for _, key in ipairs(ctrl_keys) do
    table.insert(sorted_keys, key)
  end

  return sorted_keys
end

-- Function to serialize the Lua table to a string with sorted keys
function serialize_table(tbl)
  local sorted_keys = sort_keys(tbl)
  local result = "{\n"
  for _, key in ipairs(sorted_keys) do
    result = result .. "  [" .. escape_string(key) .. "] = {"
    for mode_str, action in pairs(tbl[key]) do
      result = result .. "    " .. mode_str .. " = " .. escape_string(action) .. "," -- Ensure mode_str is properly formatted
    end
    result = result .. "  },\n"
  end
  result = result .. "}\n"
  return result
end

-- Load the Lua file from INPUT_PATH using loadfile
local func, load_err = loadfile(INPUT_PATH)

if not func then
  error("Error loading file: " .. load_err)
end

-- Execute the file to load the keys table
local keys = func()

-- Transform the keys to the desired format and segregate go and obj modes
local transformed_keys, go_keys, obj_keys = transform_keys_format(keys)

-- Serialize the transformed keys table
local output_content = "-- file: " .. OUTPUT_PATH .. "\nreturn " .. serialize_table(transformed_keys)

-- Write the main transformed keys to OUTPUT_PATH
if OUTPUT_PATH and OUTPUT_PATH ~= "" then
  local output_file = io.open(OUTPUT_PATH, "w")
  if not output_file then
    error("Could not open output file: " .. OUTPUT_PATH)
  end
  output_file:write(output_content)
  output_file:close()
  print("Keys file transformed and written to " .. OUTPUT_PATH)
end

-- Write the go modes to GO_OUTPUT_PATH if specified
if GO_OUTPUT_PATH and GO_OUTPUT_PATH ~= "" then
  local go_content = "-- file: " .. GO_OUTPUT_PATH .. "\nreturn " .. serialize_table(go_keys)
  local go_file = io.open(GO_OUTPUT_PATH, "w")
  if not go_file then
    error("Could not open output file: " .. GO_OUTPUT_PATH)
  end
  go_file:write(go_content)
  go_file:close()
  print("Go modes written to " .. GO_OUTPUT_PATH)
end

-- Write the obj modes to OBJ_OUTPUT_PATH if specified
if OBJ_OUTPUT_PATH and OBJ_OUTPUT_PATH ~= "" then
  local obj_content = "-- file: " .. OBJ_OUTPUT_PATH .. "\nreturn " .. serialize_table(obj_keys)
  local obj_file = io.open(OBJ_OUTPUT_PATH, "w")
  if not obj_file then
    error("Could not open output file: " .. OBJ_OUTPUT_PATH)
  end
  obj_file:write(obj_content)
  obj_file:close()
  print("Obj modes written to " .. OBJ_OUTPUT_PATH)
end

-- Display the rejected modes on stdout
if #rejects > 0 then
  print("Rejected entries:")
  for _, reject in ipairs(rejects) do
    print("Key: " .. reject.key .. ", Mode: " .. reject.mode .. ", Action: " .. reject.action)
  end
end
