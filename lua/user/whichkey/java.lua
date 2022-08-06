M = {}
function M.refactoring_in_the_mod_of(type)
  if type == "normal" then

    return function()
      return {
        r = {
          name = "refactoring for Java",
          o = { "<Cmd>lua require'jdtls'.organize_imports()<cr>", "organize_imports" },
          v = { "<Cmd>lua require('jdtls').extract_variable()<cr>", "extract_variable" },
          c = { "<Cmd>lua require('jdtls').extract_constant()<cr>", "extract_constant" },

        },
      }
    end
  elseif type == "visual" then

    return function()
      return {
        r = {
          name = "Java Refactoring",
          v = { "<Esc><Cmd>lua require('jdtls').extract_variable(true)<cr>", "extract_variable" },
          c = { "<Esc><Cmd>lua require('jdtls').extract_constant(true)<cr>", "extract_constant" },
          m = { "<Esc><Cmd>lua require('jdtls').extract_method(true)<cr>", "extract_method" },
        },
      }
    end
  end
end


function M.test_for_java()
  return {
    t = {
      name = "Test",
      n = { "<Cmd>lua require'jdtls'.test_nearest_method()<cr>", "test_nearest_method" },
      t = { "<Cmd>lua require'jdtls'.test_class()<cr>", "test_class" },
      f = { "<Cmd>lua require'jdtls'.test_class()<cr>", "test_all_in_class" },
      m = {
        name = "maven test",
        m = {"<Cmd>TestNearest<cr>", "test_nearest_method"},
        f = {"<Cmd>TestFile<cr>", "test_fle"},
        l = {"<Cmd>TestLast<cr>", "test_last"},
      }
    },

  }
end

return M
