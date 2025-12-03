vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.g.netrw_banner = 1 
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4 -- " open files in previous window
vim.g.netrw_winsize = 25   --   " explorer width

require("config.lazy")
require("config.options-noice")
require("config.options-lualine")

vim.opt.termguicolors = true

 require("bufferline").setup{}

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


