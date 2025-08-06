return {
  'mfussenegger/nvim-dap',
  optional = true, -- ensures it only loads if dap is loaded
  config = function()
    local dap = require 'dap'
    dap.adapters.lldb = {
      type = 'executable',
      command = 'lldb-vscode', -- make sure it's installed
      name = 'lldb',
    }

    dap.configurations.rust = {
      {
        name = 'Launch Rust',
        type = 'lldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
      },
    }
  end,
}