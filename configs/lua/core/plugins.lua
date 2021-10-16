--[[
Module for installing plugins.
Add/remove or configure plugins as per your needs over here
--]]

local cmd = vim.cmd
local fn = vim.fn
local execute = vim.nvim_exec_command

-- "packer.nvim" installation path
local install_path = fn.stdpath 'data' .. '/site/pack/packer/opt/packer.nvim'

-- Ensure a local clone of "packer.nvim" exists
if fn.empty(fn.glob(install_path)) > 0 then
    execute(
        '!git clone https://github.com/wbthomason/packer.nvim'
            .. ' '
            .. install_path
    )
end

-- Load "packer.nvim"
cmd [[ packadd! packer.nvim ]]

local packer = require 'packer'
local use = packer.use

-- Install rest of the plugins for later use
packer.startup(function()

    use { -- Install packer.nvim
        'wbthomason/packer.nvim',
        opt = true
    }

    use { -- Galaxyline statusline
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function ()
            require 'config.statusline'
        end,
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use { -- Plugin for toggling comments
        'b3nj5m1n/kommentary',
        event = { 'BufRead', 'BufNewFile' },
        config = require('conf.kommentary').config
    }

    use { -- Plugin for better syntax highlighting & much more
        'nvim-treesitter/nvim-treesitter',
        event = { 'BufRead', 'BufNewFile' },
        config = require(conf.treesitter).config,
        requires = {
            {
                'nvim-treesitter/nvim-treesitter-refactor',
                after = 'nvim-treesitter'
            },
            {
                'nvim-treesitter/nvim-treesitter-textobjects',
                after = 'nvim-treesitter'
            },
            -- {
            --     'lewis6991/spellsitter.nvim',
            --     after = 'nvim-treesitter',
            --     config = function()
            --         require('spellsitter').setup {
            --             hl = 'SpellBad',
            --             captures = {},
            --         }
            --     end
            -- },
        },
        run = ':TSUpdate',
    }
end)

