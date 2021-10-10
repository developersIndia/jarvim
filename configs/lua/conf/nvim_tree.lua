--[[
Configurations for "kyazdani42/nvim-tree.lua" plugin

For more info on configuring the File Explorer to fit your
needs check out `h: nvim-tree.lua`

Know bugs for this plugin
1. Any of the "vim.g.nvim_tree..." variables might break because of an ongoing refactoring project. 
   Refer to https://github.com/kyazdani42/nvim-tree.lua/issues/674 if something broke after an update.

2. Icons dont show up when the "nvim-web-devicons" plugin is lazy-loaded. It might be fixed some day so
   refer to https://github.com/kyazdani42/nvim-tree.lua/issues/694 to track it.
--]]

local M = {}

function M.config()
    vim.g.nvim_tree_gitignore = 1               -- Default is 0. Respects ignored glob patterns of the .gitignore file
    vim.g.nvim_tree_highlight_opened_files = 1  -- Default is 0. Highlights open files with a light background colour
    vim.g.nvim_tree_git_hl = 1                  -- File highlights for git attributes
    vim.g.nvim_tree_quit_on_open = 1            -- Default 0. Closes the file explorer when a file is opened
    vim.g.nvim_tree_markers = 1                 -- Default 0. Displays indent markers in the file explorer useful for nested directories
    vim.g.nvim_tree_hide_dotfiles = 1           -- Default 0. Hides dotfiles like .git, .gitignore & such from the file explorer
    vim.g.nvim_tree_ignore = {                  -- Table of files/folders to ignore from showing up on the file explorer
        '.git', 'node_modules', '.cache', '__pycache__'
    }
    vim.g.nvim_tree_show_tree_icons = {         -- Show context aware icons
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 0,
    }
    vim.g.nvim_tree_icons = {                   -- Custom icons for each type of supported features
                default = '',
        symlink = '',
        git_icons = {
            unstaged = '✗',
            staged = '✓',
            unmerged = '',
            renamed = '➜',
            untracked = '★',
            deleted = '',
            ignored = '◌',
        },
        folder_icons = {
            arrow_closed = '',
            arrow_open = '',
            default = '',
            open = '',
            empty = '',
            empty_open = '',
            symlink = '',
            symlink_open = '',
        },
        lsp = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        },
    }

    require('nvim-tree').setup {
        auto_close = true,
        update_cwd = true,
        lsp_diagnostics = true,
    }

    -- Colorscheme concerns
    vim.cmd [[
        highlight link NvimTreeIndentMarker whitespace
        highlight link NvimTreeFolderIcon Nontext
    ]]

    -- Lazyload NvimTree
    require('nvim-tree.events').on_nvim_tree_ready(function()
        vim.cmd 'NvimTreeRefresh'
    end)
end

function M.setup()
    local map = require('utils').map
    -- Add your preferred custom key bindings here
    map('n', '<C-b>', '<CMD>NvimTreeToggle<CR>')
end

return M
