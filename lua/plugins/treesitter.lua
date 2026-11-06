return {
  "nvim-treesitter/nvim-treesitter",
  -- `main` is the branch for Neovim 0.12. `master` is frozen and its README
  -- says 0.12 is not supported: with it, markdown buffers fail with
  -- "attempt to call method 'range' (a nil value)" and the Python highlight
  -- query doesn't load.
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local ts = require("nvim-treesitter")
    -- lazy.nvim resets the runtimepath, which drops this folder. Naming it
    -- here puts it back, ahead of the parsers that come with Neovim.
    ts.setup({ install_dir = vim.fn.stdpath("data") .. "/site" })
    -- On `main` a language is highlighted only once it is installed here
    -- (parser and queries together). These are the ones Termux's Neovim
    -- ships a parser for without queries; left like that, such a file opens
    -- with no colours at all. Already-installed ones are skipped.
    ts.install({
      "bash", "c", "css", "go", "html", "java", "javascript", "json",
      "latex", "python", "regex", "rust", "sql", "toml", "xml", "yaml",
    })
  end,
}

