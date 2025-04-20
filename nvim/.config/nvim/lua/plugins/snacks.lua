return {
    "folke/snacks.nvim",
    enabled = true,
    priory = 1000,
    lazy = false,
    opts = {
        statuscolumn = { enabled = false },
        scroll       = { enabled = false }, -- Gives me headache especially when using gg/G in large files
        dashboard    = { enabled = true  },
        quickfile    = { enabled = true  },
        bigfile      = { enabled = true  },
    }
}
