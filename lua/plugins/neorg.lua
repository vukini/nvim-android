return {
{
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    -- Named so lazy.nvim loads the parsers first. Left to itself it loads the
    -- three in no fixed order, and when Neorg comes first it doesn't find them:
    -- "norg treesitter parser was not found" on some launches and not others.
    dependencies = {
        "nvim-neorg/tree-sitter-norg",
        "nvim-neorg/tree-sitter-norg-meta",
    },
    config = true,
},
}
