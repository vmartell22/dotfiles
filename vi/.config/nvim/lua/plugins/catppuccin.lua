return {
  {
    "catppuccin/nvim",
    name = "catppuccin-nvim",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        auto_integrations = true,
      })
      vim.cmd.colorscheme("catppuccin-nvim")
    end,
  },
}
