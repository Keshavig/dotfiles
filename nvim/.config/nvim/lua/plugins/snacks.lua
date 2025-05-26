return {
    "folke/snacks.nvim",
    enabled = false,
    priory = 1000,
    lazy = false,
    opts = {
        statuscolumn = { enabled = false },
        scroll       = { enabled = false }, -- Gives me headache especially when using gg/G in large files
        dashboard    = { enabled = false },
        quickfile    = { enabled = true  },
        bigfile      = { enabled = true  },
    }
}
