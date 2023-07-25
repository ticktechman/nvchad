-------------------------------------------------------------------------------
--                  Copyright (C) 2023 ticktech
--
--       filename: init.lua
--    description: init configuration for nvchad
--        created: 2023/06/24
--         author: ticktech
--
-------------------------------------------------------------------------------
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

--------------------
-- base options
--------------------
opt.mouse = nil
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.ignorecase = true
opt.whichwrap = "<,>"

g.mapleader = ","

g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/snippets"

-- goto last postion
cmd([[au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif]])

-- toggle quickfix window borrowed from lvim
cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])

autocmd("FileType", {
  pattern = { "c", "cpp", "lua", "sh", "go" },
  callback = function()
    autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
})

-------------------------------------------------------------------------------
