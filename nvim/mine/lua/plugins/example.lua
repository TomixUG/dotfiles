local actions = require("telescope.actions")
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
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-j>"] = cmp.mapping.select_next_item(), -- move in the menu using j
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- move in the menu using k
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "svelte",
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
  { "themaxmarchuk/tailwindcss-colors.nvim" },
  { "simrat39/rust-tools.nvim" },
  { "Mofiqul/vscode.nvim" },
  -- { "olimorris/onedarkpro.nvim" },
  { "navarasu/onedark.nvim" },
  { "akinsho/flutter-tools.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "stevearc/dressing.nvim" },
  { "mfussenegger/nvim-dap" },

  { "mattn/libcallex-vim", build = "make -C autoload" },
  { "bytesnake/vim-graphical-preview", build = "cargo build --release" },
}
