local fn = vim.fn       -- Alias to execute Neovim-specific functions
local opt = vim.opt     -- Alias to setup Neovim options
local cmd = vim.cmd     -- Alias for vim.cmd

local execute = vim.api.nvim_command

-- Miscellaneous Neovim stuff that cant be programmed with native Lua code yet {{{2
cmd [[ colorscheme gruvbox ]]
cmd [[ highlight Normal guibg=NONE ctermbg=NONE ]]

-----------------------------------------------------------------------------//
-- Generic Neovim Configurations {{{1
-----------------------------------------------------------------------------//
-- Indentation configs {{{2
opt.expandtab = true    -- Use Spaces instead of tabs when <Tab> is pressed
opt.shiftwidth = 4      -- Size of an indent
opt.smartindent = true  -- Insert indents automatically
opt.tabstop = 4         -- Number of spaces press a single <Tab> counts for
opt.softtabstop = 4
opt.shiftround = true   -- Round indent

-- Display & Improved Quality of Life {{{2
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 6
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.numberwidth = 2
opt.cursorline = true
opt.wrap = false                -- Disables wrapping text globally
opt.showmode = false
opt.lazyredraw = true
opt.emoji = false
opt.list = true                 -- Show invisible characters
opt.listchars = {
    eol = '↲',
    tab = '→ ',
    extends = '…',
    precedes = '…',
    trail = '·',
}
opt.shortmess:append 'I'    -- Disables the startup screen & info
opt.iskeyword:prepend { '-' }   -- Treat dash-separated words as a single word textobject

-- Backup configs {{{2
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = false
opt.confirm = true          -- Ask for confirmation before any destructive actions

-- Window Splitting & Buffer management {{{2
opt.hidden = true
opt.splitbelow = true
opt.splitright = true
opt.fillchars = {
    vert = '│',
    fold = ' ',
    diff = '-', -- alternatives: ⣿ ░
    msgsep = '‾',
    foldopen = '▾',
    foldsep = '│',
    foldclose = '▸',
}

-- Wild & File-globbing patterns {{{2
opt.pumblend = 7    -- Make popup window transclucent
opt.pumheight = 20  -- Limit the number of autocomplete items shown

-----------------------------------------------------------------------------//
-- Plugins {{{1
-----------------------------------------------------------------------------//
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
end)

-----------------------------------------------------------------------------//
-- Utilitarian functions & Wrappers
-----------------------------------------------------------------------------//
-- TODO: Refactor this section into separate dirs
-- Functional wrapper for creating AutoGroups
local function create_augroups(autocmds, name)
    cmd('augroup ' .. name)
    cmd('autocmd!')
    for _, autocmd in ipairs(autocmds) do
        cmd('autocmd ' .. table.concat(autocmd, ' '))
    end
    cmd('augroup END')
end

-- Functional wrapper for mapping keys
local function map(mode, lhs, rhs, opts)
   local options = { noremap = true }
   if opts then
       options = vim.tbl_extend('force', options, opts)
   end
   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------------------------//
-- Keymappings {{{1
-----------------------------------------------------------------------------//
-- Set <Leader> to <Space>
vim.g.mapleader = ' '

-- Pressing two <Space> simulataneously switches between buffers
map('n', '<Leader><Leader>', ':b#<CR>')

-- Easier navigation between splits
map('n', '<C-j>', '<C-w>j', { noremap = false })
map('n', '<C-k>', '<C-w>k', { noremap = false })
map('n', '<C-h>', '<C-w>h', { noremap = false })
map('n', '<C-l>', '<C-w>l', { noremap = false })

-- Use "Alt = 'Vim Navigation'" to resize windows
map('n', '<M-j>', '<Cmd>resize -2<CR>')
map('n', '<M-k>', '<Cmd>resize +2<CR>')
map('n', '<M-h>', '<Cmd>vertical resize -2<CR>')
map('n', '<M-l>', '<Cmd>vertical resize +2<CR>')

-- Improved "quality of life" when navigating around a single line
map('n', 'H', '<Home>')     -- Press H (capital) to move to the start of the line
map('n', 'L', '<End>')      -- Press L (capital) to move to the end of the line
map('n', 'Y', 'y$')         -- Press Y (capital) to copy the entire line

-- Navigating around while in "Insert" mode
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-h>', '<Left>')
map('i', '<C-l>', '<Right>')

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Press "Ctrl + a" to select everything in a buffer
map('n', '<C-a>', '<Esc>ggVG<CR>')

-- Some sensible defaults
map('', 'Q', '<NOP>')       -- Disable Ex mode as I can't think of any ways to use it
map('n', 'x', '"_x')        -- Delete characters w/o yanking it
map('x', 'x', '"_x')        -- Delete visual selection w/o yanking

-- Disable arrow keys for learning Vim movements
map('', '<Up>', '<NOP>')
map('', '<Down>', '<NOP>')
map('', '<Left>', '<NOP>')
map('', '<Right>', '<NOP>')

-- Disable arrow keys in Insert mode as well
map('i', '<Up>', '<NOP>')
map('i', '<Down>', '<NOP>')
map('i', '<Left>', '<NOP>')
map('i', '<Right>', '<NOP>')

-- Remap "jk" to "<Esc>" to change into Normal mode
map('i', 'jk', '<Esc>')

-- Edit & source the "init.lua" file more intuitively
map('n', '<Leader>v', ':edit $MYVIMRC<CR>')
map('n', '<Leader>s', ':luafile $MYVIMRC<CR>')

--[[
Use resources for future references:
- https://icyphox.sh/blog/nvim-lua/
- https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
]]
