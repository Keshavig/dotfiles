return {
  "mbbill/undotree",
  config = function()
    vim.g.undotree_WindowLayout = 2
  end,
  keys = {
    { "<leader>ut", "<cmd>UndotreeToggle | UndotreeFocus | vertical resize 50<cr>", desc = "Toggle Undotree" },
  },
}
