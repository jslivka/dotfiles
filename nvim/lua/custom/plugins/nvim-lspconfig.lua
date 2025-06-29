return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        harper_ls = {
          enabled = true,
          filetypes = { "markdown" },
          settings = {
            ["harper-ls"] = {
              userDictPath = "~/github/dotfiles-latest/neovim/neobean/spell/en.utf-8.add",
              linters = {
                ToDoHyphen = false,
                SpellCheck = true,
              },
              isolateEnglish = true,
              markdown = {
                -- [ignores this part]()
                -- [[ also ignores my marksman links ]]
                IgnoreLinkTitle = true,
              },
            },
          },
        },
      },
    },
  },
}
