-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<A-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer next" })
map("n", "<A-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer prev" })

-- open terminal :TODO make smarter
map(
  "n",
  "<leader>t",
  ":sp<bar>terminal<cr>:resize12<cr>:set winfixheight<cr>:set nonumber<cr>:set norelativenumber<cr>",
  { desc = "Open terminal" }
)
