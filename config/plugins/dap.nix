{
  keymaps = [
    {
      mode = "n";
      key = "<leader>db";
      action = ":DapToggleBreakpoint<cr>";
      options.desc = "Toggle Breakpoint";
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = ":DapContinue<cr>";
      options.desc = "Continue";
    }
    {
      mode = "n";
      key = "<leader>do";
      action = ":DapStepOver<cr>";
      options.desc = "Step Over";
    }
    {
      mode = "n";
      key = "<leader>di";
      action = ":DapStepInto<cr>";
      options.desc = "Step into";
    }
    {
      mode = "n";
      key = "<leader>dO";
      action = ":DapStepOut<cr>";
      options.desc = "Step Out";
    }
    {
      mode = "n";
      key = "<leader>dt";
      action = ":DapTerminate<cr>";
      options.desc = "Terminate";
    }
    {
      mode = "n";
      key = "<leader>du";
      action.__raw = ''
        function()
          require("dapui").toggle()
        end
      '';
      options.desc = "Dap UI";
    }
  ];

  plugins = {
    dap = {
      enable = true;
      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "●";
          texthl = "DapBreakpointCondition";
        };
        dapLogPoint = {
          text = "◆";
          texthl = "DapLogPoint";
        };
      };
    };
    dap-ui.enable = true;
    dap-virtual-text.enable = true;
  };
}
