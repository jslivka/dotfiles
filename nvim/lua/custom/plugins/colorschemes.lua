return {
  { "ayu-theme/ayu-vim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "ellisonleao/gruvbox.nvim" },
  { "vague2k/vague.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "rebelot/kanagawa.nvim" },
  { "neanias/everforest-nvim" },
  { "RRethy/base16-nvim" },
  { "projekt0n/caret.nvim" },
  {
    "aliqyan-21/darkvoid.nvim",
    opts = {
      transparent = true,
      glow = true,
    },
  },
  {
    "eldritch-theme/eldritch.nvim",
    lazy = true,
    name = "eldritch",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  { "Edeneast/nightfox.nvim" },
  { "savq/melange-nvim" },
}
