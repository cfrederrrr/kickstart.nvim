return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      dapui.setup()

      require('nvim-dap-virtual-text').setup()

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      dap.adapters.codelldb = {
        type = 'server',
        port = '${port}',
        executable = {
          command = 'codelldb',
          args = { '--port', '${port}' },
        },
      }

      -- Debug configs for Zig/C/C++
      dap.configurations.zig = {
        {
          name = 'Launch Zig binary',
          type = 'codelldb',
          request = 'launch',
          program = '${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}',
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
      }

      dap.configurations.cpp = dap.configurations.zig
      dap.configurations.c = dap.configurations.zig
    end,
  },
}
