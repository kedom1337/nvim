{
  keymaps = [
    {
      mode = "n";
      key = "<leader>c";
      action = ":Copilot toggle<cr>";
      options.desc = "Toggle GitHub Copilot";
    }
  ];

  plugins.copilot-lua = {
    enable = true;
    settings = {
      suggestion.auto_trigger = true;
    };
  };
}
