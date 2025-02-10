return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        "ayu",
        "catppuccin",
        "gruvbox",
        "kanagawa",
        "tokyonight",
        "vague",
        "everforest",
      },
      livePreview = true,
    })
  end,
}
