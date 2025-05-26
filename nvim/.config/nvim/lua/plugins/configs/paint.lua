require("paint").setup({
    highlights = {
        {
            filter = { filetype = "stim" },
            pattern = "TICK",
            hl = "Constant",
        },
        {
            filter = { filetype = "stim" },
            pattern = "(.*_COORDS.*)$",
            hl = "Conditional",
        },
        {
            filter = { filetype = "stim" },
            pattern = "(DETECTOR.*)",
            hl = "Tag",
        },
        {
            filter = { filetype = "stim" },
            pattern = "([MR] .*)$",
            hl = "Number",
        },
        {
            filter = { filetype = "stim" },
            pattern = "([M].*)$",
            hl = "Number",
        },
        {
            filter = { filetype = "stim" },
            pattern = "(DEPOLARIZE.*)",
            hl = "Comment",
        },
        {
            filter = { filetype = "stim" },
            pattern = "(.*_ERROR.*)",
            hl = "Comment",
        },
        {
            filter = { filetype = "stim" },
            pattern = "(OBSERVABLE_INCLUDE.*)",
            hl = "String",
        },
    },
}) 