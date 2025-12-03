return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jvgrootveld/telescope-zoxide",
  },
  config = function()
    local t = require("telescope")

    t.setup({
      extensions = {
        zoxide = {
          prompt_title = "[ zoxide ]",
        },
      },
    })

    t.load_extension("zoxide")

    -- keymap: jump to zoxide dirs
    vim.keymap.set("n", "<leader>cd", t.extensions.zoxide.list, { desc = "Zoxide directories" })
  end,
}
