
-- Some objects taken from MiniExtra
-- https://github.com/echasnovski/mini.extra/blob/main/lua/mini/extra.lua
local Objects = {}
Objects.buffer = function()
    return function(ai_type)
        vim.notify("buffer: " .. vim.inspect(ai_type))
        local start_line, end_line = 1, vim.fn.line('$')
        if ai_type == 'i' then
        -- Skip first and last blank lines for `i` textobject
        local first_nonblank, last_nonblank = vim.fn.nextnonblank(start_line), vim.fn.prevnonblank(end_line)
        -- Do nothing for buffer with all blanks
        if first_nonblank == 0 or last_nonblank == 0 then return { from = { line = start_line, col = 1 } } end
        start_line, end_line = first_nonblank, last_nonblank
        end

        local to_col = math.max(vim.fn.getline(end_line):len(), 1)
        return { from = { line = start_line, col = 1 }, to = { line = end_line, col = to_col } }
    end
end

Objects.line = function()
    return function(ai_type)
        local line_num = vim.fn.line('.')
        local line = vim.fn.getline(line_num)
        -- Ignore indentation for `i` textobject
        local from_col = ai_type == 'a' and 1 or (line:match('^(%s*)'):len() + 1)
        -- Don't select `\n` past the line to operate within a line
        local to_col = line:len()

        return { from = { line = line_num, col = from_col }, to = { line = line_num, col = to_col } }
    end
end

Objects.number = function()
    local digits_pattern = '%f[%d]%d+%f[%D]'

    local find_a_number = function(line, init)
        -- First find consecutive digits
        local from, to = line:find(digits_pattern, init)
        if from == nil then return nil, nil end

        -- Make sure that these digits were not processed before. This can happen
        -- because 'miin.ai' does next with `init = from + 1`, meaning that
        -- "-12.34" was already matched, then it would try to match starting from
        -- "1": we want to avoid matching that right away and avoid matching "34"
        -- from this number.
        if from == init and line:sub(from - 1, from - 1) == '-' then
            init = to + 1
            from, to = line:find(digits_pattern, init)
        end
        if from == nil then return nil, nil end

        if line:sub(from - 2):find('^%d%.') ~= nil then
            init = to + 1
            from, to = line:find(digits_pattern, init)
        end
        if from == nil then return nil, nil end

        -- Match the whole number with minus and decimal part
        if line:sub(from - 1, from - 1) == '-' then from = from - 1 end
        local dec_part = line:sub(to + 1):match('^%.%d+()')
        if dec_part ~= nil then to = to + dec_part - 1 end
        return from, to
    end

    return function(ai_type)
        if ai_type == 'i' then return { digits_pattern } end
        return { find_a_number, { '^().*()$' } }
    end
end

local function merge_consecutive_ai_regions(delegate)
    local wrapper = function(ai_type, b, c)
      local regions = delegate(ai_type, b, c)
      local merged = {}
      for _, region in ipairs(regions) do
        local prev = #merged > 0 and merged[#merged] or nil
        local should_merge = prev and prev.to.line+1 == region.from.line and prev.from.col == region.from.col
        if should_merge then
          prev.to.line = region.to.line
        else
          table.insert(merged, region)
        end      
      end
      return merged
    end
    return wrapper
end

Objects.comment = function()
    local ai = require("mini.ai")
    return merge_consecutive_ai_regions(ai.gen_spec.treesitter({ a = "@comment.outer", i = "@comment.outer" }))
end



return Objects