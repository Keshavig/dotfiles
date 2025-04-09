vim.api.nvim_create_autocmd("TextYankPost", {
  group = num_au,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
