return { -- sudo apt install lldb
  'mfussenegger/nvim-dap',
  optional = true,
  config = function()
    local dap = require 'dap'
    dap.adapters.node2 = {
      type = 'executable',
      command = 'node',
      args = { os.getenv('HOME') .. '/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js' },
    }

    dap.configurations.javascript = {
      {
        name = 'Launch JS file',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
      },
    }
  end,
}