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
  -- Enable bigfile
  bigfile = {
    enabled = true,
    filesize = 1, -- Size in MB
    pattern = { "*" },
  },
  -- Enable git features
  git = {
    enabled = true,
    signs = {
      add = "│",
      change = "│",
      delete = "│",
      topdelete = "│",
      changedelete = "│",
      untracked = "│",
    },
    blame = {
      enabled = true,
      virtual_text = true,
      delay = 1000,
    },
  },
  -- Enable notifier
  notifier = {
    enabled = true,
    timeout = 3000,
    background_colour = "#000000",
    max_height = 10,
    max_width = 50,
  },
  -- Enable notify quickfile
  notify = {
    enabled = true,
    background_colour = "#000000",
    fps = 30,
    level = 2,
    minimum_width = 50,
    render = "minimal",
    stages = "fade_in_slide_out",
    timeout = 3000,
    top_down = false,
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

-- Keymap Organization:
-- All keymaps follow a consistent pattern using the [Action] [Target] format
-- 1. Find commands: <leader>f[target] - [F]ind [X]
-- 2. Git commands: <leader>g[target] - [G]it [X]
-- 3. Use commands: <leader>u[target] - [U]se [X]
-- 4. Notification commands: <leader>n[target] - [N]otification [X]

-- Find commands (all start with <leader>f)
vim.keymap.set("n", "<leader>ff", function() 
    Snacks.picker.files({
        hidden = true,  -- Include hidden files
        no_ignore = true,  -- Don't ignore files specified in .gitignore
    })
end, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fe", function() Snacks.picker.explorer() end, { desc = "[F]ind [E]xplorer"})
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "[F]ind [B]uffers" })
vim.keymap.set("n", "<leader>fw", function() 
    Snacks.picker.grep({
        hidden = true,  -- Include hidden files
        no_ignore = true,  -- Don't ignore files specified in .gitignore
    })
end, { desc = "[F]ind [W]ord" })
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fm", function() Snacks.picker.marks() end, { desc = "[F]ind [M]arks" })

-- Git commands (all start with <leader>g)
vim.keymap.set("n", "<leader>gf", function() Snacks.picker.git_files() end, { desc = "[G]it [F]iles" })
vim.keymap.set("n", "<leader>gc", function() Snacks.picker.git_commits() end, { desc = "[G]it [C]ommits" })
vim.keymap.set("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "[G]it [B]ranches" })
vim.keymap.set("n", "<leader>gl", function() Snacks.git.blame_line() end, { desc = "[G]it [L]ine Blame" })

-- Terminal integration
vim.keymap.set("n", "<C-/>", function() Snacks.terminal() end, { desc = "Toggle Terminal" })
vim.keymap.set("t", "<C-/>", function() Snacks.terminal() end, { desc = "Toggle Terminal" })

-- Debug tools (only available in Lua files)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.keymap.set("n", "<leader>fd", function() Snacks.debug.inspect() end, { buffer = true, desc = "[F]ind [D]ebug Info" })
    vim.keymap.set("n", "<leader>ft", function() Snacks.debug.backtrace() end, { buffer = true, desc = "[F]ind [T]race" })
  end,
})

-- Use commands (all start with <leader>u)
vim.keymap.set("n", "<leader>us", function() Snacks.toggle.option("spell") end, { desc = "[U]se [S]pell" })
vim.keymap.set("n", "<leader>uw", function() Snacks.toggle.option("wrap") end, { desc = "[U]se [W]rap" })
vim.keymap.set("n", "<leader>ul", function() Snacks.toggle.line_number() end, { desc = "[U]se [L]ine Numbers" })
vim.keymap.set("n", "<leader>ud", function() Snacks.toggle.diagnostics() end, { desc = "[U]se [D]iagnostics" })
vim.keymap.set("n", "<leader>uh", function() Snacks.toggle.inlay_hints() end, { desc = "[U]se [H]ints" })

-- Notification commands (all start with <leader>n)
vim.keymap.set("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "[U]se [N]otifications" })
vim.keymap.set("n", "<leader>nh", function() Snacks.notifier.show_history() end, { desc = "[N]otification [H]istory" }) 