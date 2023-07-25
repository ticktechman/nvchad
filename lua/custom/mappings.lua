-------------------------------------------------------------------------------
--
--       filename: mapping.lua
--    description: key mappings for nvchad
--        created: 2023/06/24
--         author: tichtechman
--
-------------------------------------------------------------------------------

local M = {}

Copymode = function()
  vim.cmd([[set nonu]])
  vim.cmd([[IndentBlanklineDisable]])
  vim.cmd([[set signcolumn=no]])
end

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>z"] = { "<cmd> q! <CR>", "quit current buffer" },
    ["<leader>t"] = { "<cmd> TagbarToggle <CR>", "toggle tagbar" },
    ["<leader>,"] = { "<cmd> call QuickFixToggle() <CR>", "toggle quickfix window" },
    ["<leader>p"] = { "<cmd> lua Copymode() <CR>", "set copy mode" },
  },
  v = {
    ["<C-=>"] = { ":Tabularize /=<CR>", opts = { remap = true } },
    ["<C-;>"] = { ":Tabularize /:<CR>", opts = { remap = true } },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    ["L"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["H"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

return M
-------------------------------------------------------------------------------
