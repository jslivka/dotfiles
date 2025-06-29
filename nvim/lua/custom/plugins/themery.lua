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
        "eldritch",
        "gruvbox",
        "nightfox",
        "kanagawa",
        "tokyonight",
        "vague",
        "everforest",
      },
      livePreview = true,
    })
  end,
}
