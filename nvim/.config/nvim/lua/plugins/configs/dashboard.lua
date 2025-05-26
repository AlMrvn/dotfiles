-- Dashboard configuration
local Snacks = require("snacks")

-- Initialize random seed
math.randomseed(os.time())

-- Function to get a random keymap tip
local function get_random_keymap_tip()
    local keymaps = {
        { key = "<leader>ff", desc = "Find Files" },
        { key = "<leader>fg", desc = "Find Git Files" },
        { key = "<leader>fb", desc = "List All Buffers" },
        { key = "<leader>fw", desc = "Find Word" },
        { key = "<leader>fh", desc = "Find Help Tags" },
        { key = "<leader>fm", desc = "Find Marks" },
        { key = "<leader>gc", desc = "Git Commits" },
        { key = "<leader>gb", desc = "Git Branches" },
        { key = "<C-/>", desc = "Toggle Terminal" },
        { key = "<leader>us", desc = "Toggle Spelling" },
        { key = "<leader>uw", desc = "Toggle Word Wrap" },
        { key = "<leader>ul", desc = "Toggle Line Numbers" },
        { key = "<leader>ud", desc = "Toggle Diagnostics" },
        { key = "<leader>uh", desc = "Toggle Inlay Hints" },
    }
    -- Generate a random index between 1 and the number of keymaps
    local random_index = math.random(1, #keymaps)
    local tip = keymaps[random_index]
    -- Add some visual separation and make the tip more noticeable
    return string.format("💡 Tip: %s - %s", tip.key, tip.desc)
end

-- Add dashboard configuration to existing Snacks setup
Snacks.config.dashboard = {
    enabled = true,
    config = {
        -- Header style
        header = {
            style = "minimal",  -- Simple and clean header
        },
        -- Recent files section
        recent = {
            enabled = true,
            limit = 5,         -- Show fewer recent files for a cleaner look
        },
        -- Quick actions section
        actions = {
            enabled = true,
            items = {
                { key = "f", desc = "Find Files", action = function() Snacks.picker.files() end },
                { key = "b", desc = "List Buffers", action = function() Snacks.picker.buffers() end },
                { key = "t", desc = "Toggle Terminal", action = function() Snacks.terminal() end },
            },
        },
        -- Git status section
        git = {
            enabled = true,
            show_branch = true,
        },
        -- Footer section
        footer = {
            enabled = true,
            content = function()
                return {
                    { text = "Neovim " .. vim.version().major .. "." .. vim.version().minor },
                    { text = "Press ? for help" },
                }
            end,
        },
    },
}

-- Dashboard keybinding
vim.keymap.set("n", "<leader>d", function() Snacks.dashboard() end, { desc = "Open Dashboard" })

-- Show dashboard on startup
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then  -- Only show if no file arguments were provided
            Snacks.dashboard()
        end
    end,
}) 