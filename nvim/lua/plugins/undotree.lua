return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",  -- Lazy-load on command
  keys = {                -- Optional, set the keybinding directly for speed
    { "n", "ut", ":UndotreeToggle | UndotreeFocus | vertical resize 50<CR>", { noremap = true, silent = true } }
  },
}
