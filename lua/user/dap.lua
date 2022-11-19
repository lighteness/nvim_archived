local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

dapui.setup {
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
}

-- where the dap-terimial will be opened
-- The `terminal_win_cmd` defaults to `belowright new`
--  dap.defaults.fallback.terminal_win_cmd = '50vsplit new'
--  dap.defaults.fallback.focus_terminal = true

-- force use external terimial
dap.defaults.fallback.force_external_terminal = true
dap.defaults.fallback.external_terminal = {
  command = '/usr/local/bin/alacritty';
  args = { '-e' };
}


vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/.local/share/nvim/dapinstall/jsnode/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require 'dap.utils'.pick_process,
  },
}

dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
    host = function()
      local value = vim.fn.input('Host [127.0.0.1]: ')
      if value ~= "" then
        return value
      end
      return '127.0.0.1'
    end,
    port = function()
      local val = tonumber(vim.fn.input('Port: '))
      assert(val, "Please provide a port number")
      return val
    end,
  }
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host, port = config.port })
end

-----------------------------
-- for c++ and clang
dap.adapters.codelldb = {

  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = os.getenv('HOME') .. '/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    targetArchitecture = "x86_64",
  },
}


--[[ dap.adapters.cppdbg = { ]]
--[[   id = 'cppdbg', ]]
--[[   type = 'executable', ]]
--[[   command=  os.getenv('HOME') .. '/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7' , ]]
--[[ } ]]
--[[]]
--[[ dap.configurations.cpp = { ]]
--[[   { ]]
--[[     name = "Launch file", ]]
--[[     type = "cppdbg", ]]
--[[     request = "launch", ]]
--[[     program = function() ]]
--[[       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') ]]
--[[     end, ]]
--[[     cwd = '${workspaceFolder}', ]]
--[[     stopOnEntry = true, ]]
--[[   }, ]]
--[[   { ]]
--[[     name = 'Attach to gdbserver :1234', ]]
--[[     type = 'cppdbg', ]]
--[[     request = 'launch', ]]
--[[     MIMode = 'gdb', ]]
--[[     miDebuggerServerAddress = 'localhost:1234', ]]
--[[     miDebuggerPath = '/usr/bin/gdb', ]]
--[[     cwd = '${workspaceFolder}', ]]
--[[     program = function() ]]
--[[       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') ]]
--[[     end, ]]
--[[   }, ]]
--[[ } ]]

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
