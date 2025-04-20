return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = function(_, opts)
        opts.scope = {
            enabled = false, -- Disable scope highlighting (the blue line)
        }
        return opts
    end,
}

