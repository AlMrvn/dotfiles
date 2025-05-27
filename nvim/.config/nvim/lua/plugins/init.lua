-- [[ Plugin Manager Setup ]]
-- This file configures lazy.nvim, the plugin manager.
-- It handles plugin installation, updates, and configuration.

-- Install lazy.nvim if it's not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Safe require function for better error handling
local function safe_require(module)
    local status, result = pcall(require, module)
    if not status then
        vim.notify("Failed to load " .. module, vim.log.levels.ERROR)
        return nil
    end
    return result
end

-- Group plugin configurations by category
local plugin_configs = {
    core = {
        "plugins.configs.snacks",      -- Snacks configuration
        "plugins.configs.conform",     -- Formatting configuration
    },

    ui = {
        "plugins.configs.tokyonight",  -- Colorscheme configuration
        "plugins.configs.paint",       -- Custom highlighting configuration
    },
    navigation = {
        "plugins.configs.oil",         -- File explorer configuration
        "plugins.configs.flash",       -- Flash navigation configuration
    },
    mini = {
        "plugins.configs.mini",        -- Mini plugins configuration
    },
    treesitter = {
        "plugins.configs.treesitter",  -- Treesitter configuration
    },
}

-- Configure lazy.nvim and define all plugins
require("lazy").setup({
    -- [[ Core Plugins ]]
    -- Essential plugins that provide basic functionality
    "tpope/vim-sleuth",                    -- Automatically adjust shiftwidth and expandtab
    { "numToStr/Comment.nvim", opts = {} }, -- Smart and powerful comment plugin
    { "lewis6991/gitsigns.nvim", opts = {} }, -- Git integration
    { "folke/which-key.nvim", event = "VimEnter", config = true }, -- Key binding hints
    
    -- [[ Snacks.nvim ]]
    -- Quality of life plugins including picker functionality
    {
        "folke/snacks.nvim",
        priority = 1000,
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- Icons
            "nvim-lua/plenary.nvim",       -- Required for various functions
        },
        config = function()
            safe_require("plugins.configs.snacks")
        end,
    },
    
    -- [[ LSP and Completion ]]
    -- Language Server Protocol and code completion
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "saghen/blink.cmp",
        },
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        opts = {
            ensure_installed = {
                "stylua",
                "ruff",
                "basedpyright",
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)
            local mr = require("mason-registry")
            for _, tool in ipairs(opts.ensure_installed) do
                local p = mr.get_package(tool)
                if not p:is_installed() then
                    p:install()
                end
            end
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            automatic_installation = true,
        },
    },
    {
        "saghen/blink.cmp",
        version = "1.*",
        event = "InsertEnter",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        opts = {
            keymap = { preset = "default" },
            appearance = {
                nerd_font_variant = "mono"
            },
            completion = {
                documentation = { auto_show = false }
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            fuzzy = { implementation = "lua" }
        },
        opts_extend = { "sources.default" }
    },
    
    -- [[ Formatting ]]
    -- Code formatting and linting
    {
        "stevearc/conform.nvim",
        lazy = false,
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "[F]ormat buffer",
            },
        },
    },
    
    -- [[ UI and Colorscheme ]]
    -- Visual enhancements
    { "folke/tokyonight.nvim", priority = 1000 }, -- Colorscheme
    { "folke/todo-comments.nvim", event = "VimEnter", dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } }, -- Todo comments
    
    -- [[ File Management ]]
    -- File system navigation and management
    { "stevearc/oil.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }, -- File explorer
  
    -- [[ Navigation and Search ]]
    -- Enhanced navigation features
    { "folke/flash.nvim", event = "VeryLazy" }, -- Flash navigation
    
    -- [[ Mini Plugins ]]
    -- Small, focused plugins
    { "echasnovski/mini.ai", version = false },      -- Text objects
    { "echasnovski/mini.surround", version = false }, -- Surround text
    { "echasnovski/mini.statusline", version = false }, -- Status line
    
    -- [[ Treesitter ]]
    -- Syntax highlighting and parsing
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Syntax highlighting
    
    -- [[ Custom Highlight ]]
    -- Additional highlighting features
    { "folke/paint.nvim" }, -- Custom syntax highlighting
})

-- [[ Load Plugin Configurations ]]
-- Load configurations by category
for category, configs in pairs(plugin_configs) do
    vim.notify("Loading " .. category .. " configurations...", vim.log.levels.INFO)
    for _, config in ipairs(configs) do
        safe_require(config)
    end
end 
