return {
  "vimwiki/vimwiki",
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/wiki/",
        syntax = "markdown",
        ext = "md",
        keys = {
          "<leader>Ww",
          "<leader>Wt",
        },
      },
    }
  end,
}
