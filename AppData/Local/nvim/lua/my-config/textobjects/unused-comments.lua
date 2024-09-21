---
---
--- Previous implementation of the block comments selection using mini.ai
--- New implementation is in use in the extra.lua file
--- Keeping this here for future reference.
---


local H = {} -- require("mini.ai.mini")

H.islist = vim.fn.has('nvim-0.10') == 1 and vim.islist or vim.tbl_islist

H.prepare_ai_captures = function(ai_captures)
  local is_capture = function(x)
    if type(x) == 'string' then x = { x } end
    if not H.islist(x) then return false end

    for _, v in ipairs(x) do
      if not (type(v) == 'string' and v:sub(1, 1) == '@') then return false end
    end
    return true
  end

  if not (type(ai_captures) == 'table' and is_capture(ai_captures.a) and is_capture(ai_captures.i)) then
    H.error('Wrong format for `ai_captures`. See `MiniAi.gen_spec.treesitter()` for details.')
  end

  local prepare = function(x)
    if type(x) == 'string' then return { x } end
    return x
  end

  return { a = prepare(ai_captures.a), i = prepare(ai_captures.i) }
end

H.get_matched_nodes_plugin = function(captures)
  local ts_queries = require('nvim-treesitter.query')
  return vim.tbl_map(
    function(match) return match.node end,
    -- This call should handle multiple languages in buffer
    ts_queries.get_capture_matches_recursively(0, captures, 'textobjects')
  )
end

local greedy_treesitter = function(ai_captures, opts)
  opts = vim.tbl_deep_extend('force', { use_nvim_treesitter = true }, opts or {})
  ai_captures = H.prepare_ai_captures(ai_captures)

  return function(ai_type, _, _)
    -- Get array of matched treesitter nodes
    local target_captures = ai_captures[ai_type]
    local has_nvim_treesitter = pcall(require, 'nvim-treesitter') and pcall(require, 'nvim-treesitter.query')
    local node_querier = (has_nvim_treesitter and opts.use_nvim_treesitter) and H.get_matched_nodes_plugin
      or H.get_matched_nodes_builtin
    local matched_nodes = node_querier(target_captures)

    local regions = {}
    local get_range = function(node)
      local line_from, col_from, line_to, col_to = node:range()
      return line_from+1, col_from+1, line_to+1, col_to
    end
    for _, node in ipairs(matched_nodes) do
      local line_from, col_from, line_to, col_to = get_range(node)
      print("Node: from.line:" .. line_from .. ", col:" .. col_from .. ", to.line:" .. line_to .. ", col:" .. col_to)

      local prev = #regions > 0 and regions[#regions] or nil
      if prev then
      print("Prev: from.line:" .. prev.from.line .. ", col:" .. prev.from.col .. ", to.line:" .. prev.to.line .. ", col:" .. prev.to.col)
      end 
      local should_merge = prev and prev.to.line == line_from-1 and prev.from.col == col_from
      if should_merge then
        print("Should merge.")
        prev.to.line = line_to
      else
        print("Not merging.")
        table.insert(regions, { 
          from = { line = line_from, col = col_from }, 
          to = { line = line_to, col = col_to } 
        })
      end
    end

    -- Return array of regions
    return regions
  end
end