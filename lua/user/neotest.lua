require("neotest").setup({
  require("neotest-vim-test")({ allow_file_types = { "java" } }),

})


vim.api.nvim_exec([[
  let g:ultest_deprecation_notice = 0

  "  let test#java#runner = 'gradletest'

]],false)
