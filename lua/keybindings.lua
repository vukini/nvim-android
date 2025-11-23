
-- Keymappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd.colorscheme("darkblue")

-- Yank to EOL
vim.keymap.set("n", "Y", "y$", {desc = "Yank to EOL"})

-- Buffer Navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", {desc = "Next Buffer"})
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", {desc = "Previous Buffer"})

-- Splitting 
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", {desc = "Split Vertical"})
vim.keymap.set("n", "<leader>sh", ":split<CR>", {desc = "Split"})

vim.keymap.set("n", "<F2>", 
  function()
    vim.opt.number = not vim.opt.number:get()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
  end, { silent = true })
