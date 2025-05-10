{
  keymaps = [
    {
      mode = "n";
      key = "<leader>db";
      action = ":DapToggleBreakpoint<cr>";
      options.desc = "dap: Toggle Breakpoint";
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = ":DapContinue<cr>";
      options.desc = "dap: Continue";
    }
    {
      mode = "n";
      key = "<leader>do";
      action = ":DapStepOver<cr>";
      options.desc = "dap: Step Over";
    }
    {
      mode = "n";
      key = "<leader>di";
      action = ":DapStepInto<cr>";
      options.desc = "dap: Step into";
    }
    {
      mode = "n";
      key = "<leader>dO";
      action = ":DapStepOut<cr>";
      options.desc = "dap: Step Out";
    }
    {
      mode = "n";
      key = "<leader>dt";
      action = ":DapTerminate<cr>";
      options.desc = "dap: Terminate";
    }
    {
      mode = "n";
      key = "<leader>du";
      action.__raw = ''
        function()
          require("dapui").toggle()
        end
      '';
      options.desc = "dap: Dap UI";
    }
  ];

  plugins = {
    dap.enable = true;
    dap-ui.enable = true;
    dap-virtual-text.enable = true;
  };
}
