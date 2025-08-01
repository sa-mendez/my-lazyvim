-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Misc settings

--- When performing diffs, split windows vertically (as opposed to default which is horizontally
vim.opt.diffopt:append("vertical")

--- Set delimeters to use when showing characters using ':set list' command
vim.opt.listchars = "eol:↴,tab:<->,trail:~,extends:>,precedes:<"
vim.opt.list = false

--- Disable realtive numbers
vim.opt.relativenumber = false

--- the font used in graphical neovim applications.
vim.opt.guifont = "AnonymicePro Nerd Font:h12"

--- These are neovide specific GUI settings
vim.g.neovide_refresh_rate = 144
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_opacity = 0.95
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_particle_density = 40
vim.g.neovide_remember_window_size = 1

-- Some customizations for the vimwiki plugin
-- vim.g.vimwiki_list = [{'path': '~/MyWiki/',
--                       \ 'syntax': 'markdown', 'ext': '.md'}]

-- Set material_style for marko-cerovac/material.nvim plugin
vim.g.material_style = "deep ocean"
