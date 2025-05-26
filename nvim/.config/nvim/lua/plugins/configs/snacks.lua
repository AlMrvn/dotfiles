-- Snacks.nvim configuration
local Snacks = require("snacks")

-- Configure Snacks
Snacks.setup({
  -- Enable picker functionality
  picker = {
    enabled = true,
    prompt_position = "bottom",  -- Place the input prompt at the bottom
    sources = {
      explorer = {
        layout = {
          layout = {
            position = "right"
          }
        }
      }
    }
  },
  explorer = {
    enabled = true,
    show_hidden = true,
  },
  -- Enable terminal
  terminal = {
    enabled = true,
    direction = "horizontal",  -- Open terminal at the bottom
    size = 15,                -- Default size
  },
  -- Enable debug tools
  debug = {
    enabled = true,
  },
  -- Enable toggle features
  toggle = {
    enabled = true,
  },
  dashboard = {
    enabled = true,
    sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
    },
    preset = {
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    }
  },
})

-- Set up keymaps for common picker operations
vim.keymap.set("n", "<leader>ff", function() 
    Snacks.picker.files({
        hidden = true,  -- Include hidden files
        no_ignore = true,  -- Don't ignore files specified in .gitignore
    })
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fe", function() Snacks.picker.explorer() end, { desc = "[F]ile [E]xplorer"})
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
-- List all open buffers
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "List All Buffers" })
vim.keymap.set("n", "<leader>fw", function() 
    Snacks.picker.grep({
        hidden = true,  -- Include hidden files
        no_ignore = true,  -- Don't ignore files specified in .gitignore
    })
end, { desc = "Find Word" })
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Find Help Tags" })
vim.keymap.set("n", "<leader>fm", function() Snacks.picker.marks() end, { desc = "Find Marks" })
vim.keymap.set("n", "<leader>gc", function() Snacks.picker.git_commits() end, { desc = "Git Commits" })
vim.keymap.set("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })

-- Terminal integration
vim.keymap.set("n", "<C-/>", function() Snacks.terminal() end, { desc = "Toggle Terminal" })
vim.keymap.set("t", "<C-/>", function() Snacks.terminal() end, { desc = "Toggle Terminal" })

-- Debug tools (only available in Lua files)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.keymap.set("n", "<leader>dd", function() Snacks.debug.inspect() end, { buffer = true, desc = "Debug: Inspect" })
    vim.keymap.set("n", "<leader>dt", function() Snacks.debug.backtrace() end, { buffer = true, desc = "Debug: Backtrace" })
  end,
})

-- Toggle features
vim.keymap.set("n", "<leader>us", function() Snacks.toggle.option("spell") end, { desc = "Toggle Spelling" })
vim.keymap.set("n", "<leader>uw", function() Snacks.toggle.option("wrap") end, { desc = "Toggle Word Wrap" })
vim.keymap.set("n", "<leader>ul", function() Snacks.toggle.line_number() end, { desc = "Toggle Line Numbers" })
vim.keymap.set("n", "<leader>ud", function() Snacks.toggle.diagnostics() end, { desc = "Toggle Diagnostics" })
vim.keymap.set("n", "<leader>uh", function() Snacks.toggle.inlay_hints() end, { desc = "Toggle Inlay Hints" }) 