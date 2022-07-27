M = {}

function M.refactoring_in_normal_mod()
  return {
    r = {
      name = "refactoring for Java",
      o = { "<Cmd>lua require'jdtls'.organize_imports()<cr>", "organize_imports" },
      v = { "<Cmd>lua require('jdtls').extract_variable()<cr>", "extract_variable" },
      c = { "<Cmd>lua require('jdtls').extract_constant()<cr>", "extract_constant" },

    },
  }
end

function M.refactoring_in_visual_mod()
  return {
    r = {
      name = "Java Refactoring",
      v = { "<Esc><Cmd>lua require('jdtls').extract_variable(true)<cr>", "extract_variable" },
      c = { "<Esc><Cmd>lua require('jdtls').extract_constant(true)<cr>", "extract_constant" },
      m = { "<Esc><Cmd>lua require('jdtls').extract_method(true)<cr>", "extract_method" },
    },
  }
end

function M.test_for_java()
  return {
    t = {
      name = "Test",
      n = { "<Cmd>lua require'jdtls'.test_nearest_method()<cr>", "test_nearest_method" },
      t = { "<Cmd>lua require'jdtls'.test_class()<cr>", "test_class" },
    },

  }
end


return M
