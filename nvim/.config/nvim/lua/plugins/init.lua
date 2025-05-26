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
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- Icons
            "nvim-lua/plenary.nvim",       -- Required for various functions
        },
        config = function()
            require("plugins.configs.snacks")
        end,
    },
    
    -- [[ LSP and Completion ]]
    -- Language Server Protocol and code completion
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",           -- LSP installer
            "williamboman/mason-lspconfig.nvim", -- Bridge between mason and lspconfig
            "WhoIsSethDaniel/mason-tool-installer.nvim", -- Tool installer
            "hrsh7th/cmp-nvim-lsp",             -- LSP completion source
            "j-hui/fidget.nvim",                -- LSP status indicator
            "folke/neodev.nvim",                -- Neovim development tools
        },
    },
    {
        "hrsh7th/nvim-cmp",                     -- Completion engine
        event = "InsertEnter",
        dependencies = {
            "L3MON4D3/LuaSnip",                 -- Snippet engine
            "saadparwaiz1/cmp_luasnip",         -- Snippet completion
            "hrsh7th/cmp-nvim-lsp",             -- LSP completion
            "hrsh7th/cmp-path",                 -- Path completion
        },
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
    { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "3rd/image.nvim" } }, -- File tree
    
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
-- Load individual plugin configurations after plugins are installed
require("plugins.configs.lsp")          -- LSP configuration
require("plugins.configs.conform")      -- Formatting configuration
require("plugins.configs.cmp")          -- Completion configuration
require("plugins.configs.tokyonight")   -- Colorscheme configuration
require("plugins.configs.mini")         -- Mini plugins configuration
require("plugins.configs.treesitter")   -- Treesitter configuration
require("plugins.configs.paint")        -- Custom highlighting configuration
require("plugins.configs.oil")          -- File explorer configuration
require("plugins.configs.neo-tree")     -- File tree configuration
require("plugins.configs.flash")        -- Flash navigation configuration 