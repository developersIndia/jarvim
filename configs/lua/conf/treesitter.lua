--[[
Configuration file for nvim-treesitter plugin

Refer to ":h nvim-treesitter" for more info & documentations
on the plugin

Following extensions are also installed for the plugin:

- "nvim-treesitter/nvim-treesitter-refactor"
- "nvim-treesitter/nvim-treesitter-textobjects"
- "lewis6991/spellsitter.nvim"

A list of available community maintained extensions are also available at:
https://github.com/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins
--]]

local M = {}

function M.config()

    -- Enable the rest of the extensions if any installed
    vim.cmd [[ packadd nvim-treesitter-refactor ]]
    vim.cmd [[ packadd nvim-treesitter-textobjects ]]

    -- Following are some useful extensions to take a look at:
    -- - "lewis6991/spellsitter.nvim"
    -- - "JoosepAlviste/nvim-ts-context-commentstring"
    -- - "folke/twilight.nvim"
    -- - "windwp/nvim-ts-autotag"
    -- - "theHamsta/nvim-treesitter-pairs"
    -- - "p00f/nvim-ts-rainbow"
    -- - "romgrk/nvim-treesitter-context"

    require('nvim-treesitter.configs').setup {
        -- List of parsers to ensure are installed & updated all the time
        ensure_installed = {
            'lua', 'jsonc', 'comment', 'yaml', 'vim'
        },
        -- Enable & configure other modules here.
        -- For reference check out the documentations at:
        -- https://github.com/nvim-treesitter/nvim-treesitter#available-modules
        indent = {
            enable = true
        },
        highlight = {
            enable = true
        },
        incremental_selection = {
            enable = true
        }
    }
end

return M
