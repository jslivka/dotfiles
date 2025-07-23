return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        "ayu",
        "base16-atelier-savanna",
        "base16-sandcastle",
        "caret",
        "catppuccin",
        "darkvoid",
        "eldritch",
        "everforest",
        "gruvbox",
        "kanagawa",
        "nightfox",
        "tokyonight",
        "vague",
      },
      livePreview = true,
    })
  end,
}
