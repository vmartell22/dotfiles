return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "|",
        tab_char = "|",
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = "IblScope",
      },
      -- Hides indent lines completely on specific windows and filetypes
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        buftypes = {
          "terminal",
          "nofile",
        },
      },
    },
    config = function(_, opts)
      local cp_palette = require("catppuccin.palettes").get_palette("macchiato")
      
      if cp_palette then
        vim.api.nvim_set_hl(0, "IblIndent", { fg = cp_palette.surface1, nocombine = true })
        vim.api.nvim_set_hl(0, "IblScope", { fg = cp_palette.lavender, nocombine = true })
      end

      require("ibl").setup(opts)
    end,
  },
}

