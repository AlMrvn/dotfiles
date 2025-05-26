-- [[ Version Check ]]
-- Check if Neovim version is at least 0.11
local function check_version()
    local version = vim.version()
    if version.major == 0 and version.minor < 11 then
        vim.notify(
            string.format(
                "Neovim version %d.%d.%d is below 0.11. Some features may not work correctly.",
                version.major,
                version.minor,
                version.patch
            ),
            vim.log.levels.WARN,
            { title = "Version Warning" }
        )
    end
end

-- Run version check
check_version()

-- Neovim initialization file
-- This is the entry point for your Neovim configuration.
-- The loading order is important:
-- 1. Core settings (vim options, globals)
-- 2. Autocommands (filetype detection, etc.)
-- 3. Keymaps (user-defined keybindings)
-- 4. Plugins (plugin manager and plugin configurations)

-- Load core settings first
require("core.init")      -- Basic vim settings and options
require("core.autocmds")  -- Filetype detection and other autocommands

-- Load keymaps
require("keymaps.init")   -- User-defined keybindings

-- Load plugins and their configurations
require("plugins.init")   -- Plugin manager and plugin configurations

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
