return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "leoluz/nvim-dap-go"
    },

    config = function()
      local dap, dapui, dapgo = require("dap"), require("dapui"), require("dap-go")

      dapgo.setup({
        dap_configurations = {
          {
            type = "go",
            name = "Debug",
            request = "launch",
            program = "${workspaceFolder}",
            --args = dapgo.get_arguments,
            --buildFlags = dapgo.get_build_flags,
          },

          {
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
            port = 2345, -- Match the port you started dlv with
            host = "127.0.0.1", -- Match the listen address
          }

        }
      })
      require("dapui").setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, {})
      vim.keymap.set('n', '<Leader>B', dap.set_breakpoint, {})
      vim.keymap.set('n', '<Leader>dc', dap.continue, {})
      vim.keymap.set('n', '<F10>', dap.step_over, {})
      vim.keymap.set('n', '<F11>', dap.step_into, {})
      vim.keymap.set('n', '<F12>', dap.step_out, {})
    end,
  },

}
