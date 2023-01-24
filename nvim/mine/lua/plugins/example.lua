return {
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
        -- format = {
        --   cmdline = { pattern = "^:", icon = ">", lang = "vim" },
        -- },
      },
      popupmenu = {
        enabled = true, -- enables the Noice popupmenu UI
      },
      presets = {
        command_palette = false, -- put the popupmenu down
      },
    },
  },
  {
    "akinsho/nvim-bufferline.lua",
    event = "VeryLazy",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      mappings = {
        comment = "gc",
        comment_line = "gc",
        textobject = "gc",
      },
    },
  },
}
