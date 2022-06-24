require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  -- sync_install = false,

  -- List of parsers to ignore installing (for "all")

  highlight = {
    -- `false` will disable the whole extension
    enable = true

  },

  indent = {
    enable = true
  },
}

vim.opt.foldmethod=expr
vim.opt.foldexpr=nvim_treesitter#foldexpr()
