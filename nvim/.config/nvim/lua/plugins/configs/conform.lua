require("conform").setup({
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff" },
    },
    formatters = {
        ruff = {
            prepend_args = { 
                "--line-length", "88",
                "--fix",
                "--format-only"
            },
        },
    },
})

-- Keymaps
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "[F]ormat buffer" })

-- Auto-format on save for Python files
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
}) 