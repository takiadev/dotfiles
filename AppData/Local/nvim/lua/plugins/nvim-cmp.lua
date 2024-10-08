
local cmp = require("cmp")

-- local function select_down_or_go_down(fallback)
--    if cmp.visible() then
--      cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
--    else
--        vim.cmd('normal <up>')
--    end
-- end

return {
    "hrsh7th/nvim-cmp",
    opts = {
        mapping = cmp.mapping.preset.insert({
            ['<M-n>'] = cmp.mapping.abort(),
            ['<M-i>'] = LazyVim.cmp.confirm({ select = auto_select }),
            ['<M-u>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
            ['<M-e>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
            -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
            -- ['<C-Space>'] = cmp.mapping.complete(),
            -- ['<C-e>'] = cmp.mapping.abort(),
            -- ['<CR>'] = LazyVim.cmp.confirm({ select = auto_select }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          })
    },
}
 --[[   
    
    function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      local auto_select = true
      return {
        auto_brackets = {}, -- configure any filetype to auto add brackets
        completion = {
          completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
          ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
          ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = function(entry, item)
            local icons = LazyVim.config.icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
  
            local widths = {
              abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
              menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
            }
  
            for key, width in pairs(widths) do
              if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
              end
            end
  
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
      }
    end,
    main = "lazyvim.util.cmp",
  }
-- ]]