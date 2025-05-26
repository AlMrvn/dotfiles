vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<leader>fe", "<cmd>Neotree toggle focus right reveal_force_cwd<cr>", { desc = "Sidebar with neotree" })

require("neo-tree").setup({
    default_component_configs = {
        indent = {
            indent_size = 2,
        },
        modified = {
            symbol = "*",
        },
        diagnostics = {
            symbols = {
                hint = "h",
                info = "i",
                warn = "w",
                error = "e",
            },
        },
        git_status = {
            symbols = {
                added = "",
                deleted = "",
                modified = "",
                renamed = "",
                untracked = "",
                unstaged = "",
                ignored = "",
                staged = "",
                conflict = "",
            },
        },
    },
    popup_border_style = "rounded",
    event_handlers = {
        {
            event = "file_opened",
            handler = function()
                require("neo-tree").close_all()
            end,
        },
    },
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            group_empty_dirs = true,
            never_show = {
                ".DS_Store",
                ".git",
            },
        },
        bind_to_cwd = true,
        window = {
            mappings = {
                ["n"] = "toggle_node",
                ["<space>"] = "none",
            },
        },
    },
}) 