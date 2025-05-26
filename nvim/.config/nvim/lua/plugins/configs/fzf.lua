-- FZF configuration
local fzf = require('fzf-lua')

-- Configure FZF
fzf.setup({
    -- Use native FZF binary if available
    fzf_bin = vim.fn.executable('fzf') == 1 and 'fzf' or nil,
    
    -- Use native FZF binary for better performance
    fzf_opts = {
        ['--layout'] = 'reverse',
        ['--info'] = 'inline',
        ['--height'] = '40%',
        ['--border'] = 'rounded',
    },
    
    -- Configure preview window
    previewers = {
        builtin = {
            extensions = {
                -- Enable syntax highlighting in preview
                ['*'] = { syntax = true },
            },
        },
    },
    
    -- Configure keymaps
    keymap = {
        builtin = {
            -- Toggle preview
            ['<C-p>'] = 'toggle-preview',
            -- Toggle preview fullscreen
            ['<C-f>'] = 'toggle-fullscreen',
            -- Toggle preview horizontal/vertical
            ['<C-h>'] = 'toggle-preview-ccw',
            ['<C-l>'] = 'toggle-preview-cw',
            -- Toggle preview page up/down
            ['<C-b>'] = 'preview-page-up',
            ['<C-d>'] = 'preview-page-down',
        },
    },
})

-- Define keymaps
local function set_keymaps()
    -- Files
    vim.keymap.set('n', '<leader>ff', function() fzf.files() end, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>fg', function() fzf.git_files() end, { desc = '[F]ind [G]it files' })
    
    -- Search
    vim.keymap.set('n', '<leader>fw', function() fzf.grep() end, { desc = '[F]ind [W]ord' })
    vim.keymap.set('n', '<leader>fb', function() fzf.buffers() end, { desc = '[F]ind [B]uffers' })
    vim.keymap.set('n', '<leader>fh', function() fzf.help_tags() end, { desc = '[F]ind [H]elp' })
    vim.keymap.set('n', '<leader>fm', function() fzf.marks() end, { desc = '[F]ind [M]arks' })
    
    -- Git
    vim.keymap.set('n', '<leader>gc', function() fzf.git_commits() end, { desc = '[G]it [C]ommits' })
    vim.keymap.set('n', '<leader>gb', function() fzf.git_branches() end, { desc = '[G]it [B]ranches' })
    
    -- LSP
    vim.keymap.set('n', 'gd', function() fzf.lsp_definitions() end, { desc = '[G]oto [D]efinition' })
    vim.keymap.set('n', 'gr', function() fzf.lsp_references() end, { desc = '[G]oto [R]eferences' })
    vim.keymap.set('n', 'gi', function() fzf.lsp_implementations() end, { desc = '[G]oto [I]mplementation' })
    vim.keymap.set('n', '<leader>ds', function() fzf.lsp_document_symbols() end, { desc = '[D]ocument [S]ymbols' })
    vim.keymap.set('n', '<leader>ws', function() fzf.lsp_workspace_symbols() end, { desc = '[W]orkspace [S]ymbols' })
end

-- Set keymaps
set_keymaps() 