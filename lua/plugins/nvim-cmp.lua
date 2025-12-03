return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",            -- snippet engine
      "saadparwaiz1/cmp_luasnip",    -- snippets source
      "hrsh7th/cmp-nvim-lsp",        -- LSP source
      "hrsh7th/cmp-buffer",          -- buffer words
      "hrsh7th/cmp-path",            -- filesystem paths
      "hrsh7th/cmp-cmdline",         -- :cmdline completion
      "rafamadriz/friendly-snippets" -- pre-made snippets
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- load VSCode-style snippets from friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- better completion menu behavior
      vim.o.completeopt = "menu,menuone,noselect"

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- accept currently selected
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      })

      -- `/` search completion (buffer)
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- `:` command-line completion (path + cmdline)
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      -- LSP capabilities (use in your LSP setup)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- example: require("lspconfig").lua_ls.setup({ capabilities = capabilities })
    end,
  },
}
