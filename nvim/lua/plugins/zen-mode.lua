return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    plugins = {
      gitsigns = true,
    },
  },
  init = function()
    vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Zen Mode", silent = true })
  end,
}
