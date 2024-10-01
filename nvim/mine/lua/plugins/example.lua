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

      -- require("cmp").setup(opts)
      -- require("cmp").setup.filetype("markdown", {
      --   sources = {},
      -- })
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
          -- { name = "buffer" }, -- TEXT FIELDS AHH
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
    -- opts = {
    --   ensure_installed = {
    --     "svelte",
    --   },
    -- },
    opts = function(_, opts)
      opts.highlight = opts.highlight or {}
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "bibtex" })
      end
      if type(opts.highlight.disable) == "table" then
        vim.list_extend(opts.highlight.disable, { "latex" })
      else
        opts.highlight.disable = { "latex" }
      end
    end,
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
  { "mfussenegger/nvim-dap", config = function() end },

  { "mattn/libcallex-vim", build = "make -C autoload" },
  { "bytesnake/vim-graphical-preview", build = "cargo build --release" },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_browser = "firefox"
      vim.g.mkdp_open_ip = "127.0.0.1"
      vim.g.mkdp_port = 8080
    end,
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
  }, -- preview markdown files on browser
  {
    "fpeterek/nvim-surfers",
    config = function()
      require("nvim-surfers").setup({
        use_tmux = false,
      })
    end,
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_complete_enabled = 1
      -- vim.g.vimtex_compiler_method = "tectonic"
      -- vim.g.vimtex_compiler_tectonic = {
      --   options = {
      --     "watch",
      --   },
      -- }
      vim.g.vimtex_compiler_method = "generic"
      vim.g.vimtex_compiler_generic = {
        -- Well, it always returns 0 (succeeds)…
        command = [[watchexec -e tex -e bib "
                    echo vimtex_compiler_callback_compiling &&
                    tectonic main.tex -Z continue-on-errors --keep-intermediates --synctex --keep-logs &&
                    echo vimtex_compiler_callback_success ||
                    echo vimtex_compiler_callback_failure
                "]],
      }
    end,
    keys = {
      { "<localLeader>l", "", desc = "+vimtext" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        texlab = {
          keys = {
            { "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
          },
        },
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    build = (not LazyVim.is_win())
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      {
        "nvim-cmp",
        dependencies = {
          "saadparwaiz1/cmp_luasnip",
        },
        opts = function(_, opts)
          opts.snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          }
          table.insert(opts.sources, { name = "luasnip" })
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },
}
