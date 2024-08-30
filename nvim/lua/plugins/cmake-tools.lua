return {
  "Civitasv/cmake-tools.nvim",
  lazy = true,
  init = function()
    vim.keymap.set("n", "<leader>Cr", "<cmd>CMakeRun<cr>", { desc = "CMake | Run", silent = true })
    vim.keymap.set("n", "<leader>Cg", "<cmd>CMakeGenerate<cr>", { desc = "CMake | Generate", silent = true })
    vim.keymap.set("n", "<leader>Cb", "<cmd>CMakeBuild<cr>", { desc = "CMake | Build", silent = true })
    vim.keymap.set("n", "<leader>Cc", "<cmd>CMakeClean<cr>", { desc = "CMake | Clean", silent = true })
    local loaded = false
    local function check()
      local cwd = vim.uv.cwd()
      if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
        require("lazy").load({ plugins = { "cmake-tools.nvim" } })
        loaded = true
      end
    end
    check()
    vim.api.nvim_create_autocmd("DirChanged", {
      callback = function()
        if not loaded then
          check()
        end
      end,
    })
  end,
  opts = {},
}
