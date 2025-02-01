return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true, -- Enable the plugin
  event = "VeryLazy", -- Load the plugin lazily
  opts = {
    filesystem = {
      follow_current_file = true, -- Automatically highlight the current file
      hijack_netrw = true, -- Replace netrw with neo-tree
      hijack_netrw_behaviour = "open_current",
    },
    window = {
      width = 30, -- Set the width of the Neo-tree window
      mappings = {
        ["<space>e"] = "toggle_node", -- Map <space> to toggle a node
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim", -- Dependency required for neo-tree
    "MunifTanjim/nui.nvim", -- UI library for neo-tree
    "nvim-tree/nvim-web-devicons", -- Optional: Icons for files
  },
  config = function()
    -- Add your custom keybinding here
    vim.keymap.set("n", "<leader>dj", ":Neotree position=current<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>pf", ":Neotree position=bottom<CR>", { silent = true, noremap = true })
  end,
}
