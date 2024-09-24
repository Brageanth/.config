local lsp = require("lsp-zero")
local cmp = require('cmp')
local cmp_action = lsp.cmp_action()

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  formatting = {
    fields = {'abbr', 'kind', 'menu'},
    format = require('lspkind').cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
    })
  },
  sources = {
    { name = 'path' },
    { name = 'buffer' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})


lsp.preset({
  manage_nvim_cmp = {
    use_luasnip = true,
  }
})


lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
      -- with the ones you want to install
    ensure_installed = {'eslint'},
    handlers = {
        lsp.default_setup,
    },
})

lsp.setup({
    formatters = {
        eslint = {
            command = "eslint",
            args = { "--fix", "--stdin", "--stdin-filename", "$FILENAME" },
            rootPatterns = { ".eslintrc.js", ".eslintrc.json", ".eslintrc", ".eslintignore" },
            isStdout = true,
            isStderr = false,
        },
        prettier = {
            command = "prettier",
            args = { "--stdin-filepath", "$FILENAME" },
            rootPatterns = { ".prettierrc", ".prettierrc.json", ".prettierrc.js", ".prettierrc.json" },
            isStdout = true,
            isStderr = false,
        },
    },
    formatFiletypes = {
        javascript = "eslint",
        javascriptreact = "eslint",
        typescript = "eslint",
        typescriptreact = "eslint",
        json = "prettier",
    },
    languages = {
      javascript = {
        format = {
          tool = 'prettier',
        },
      },
      typescript = {
        format = {
          tool = 'prettier',
        },
      },
      typescriptreact = {
        format = {
          tool = 'prettier',
        },
      },
    }
})

