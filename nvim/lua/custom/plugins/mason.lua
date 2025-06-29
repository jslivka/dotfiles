return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "flake8",
        "shellcheck",
        "shfmt",
        "stylua",
        "templ",
        "html-lsp",
        "htmx-lsp",
        "tailwindcss-language-server",
        "harper-ls",
      },
    },
  },
}
