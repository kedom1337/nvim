{
  keymaps = [
    {
      mode = [
        "n"
        "t"
      ];
      key = "<a-i>";
      action.__raw = ''
        function()
          Snacks.terminal.toggle("fish")
        end
      '';
      options.desc = "Toggle floating terminal";
    }
    {
      mode = "n";
      key = "<leader>z";
      action.__raw = ''
        function()
          Snacks.zen.zen()
        end
      '';
      options.desc = "Toggle zen mode";
    }
  ];

  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;
      input.enabled = true;
      zen.toggles = {
        dim = false;
      };
    };
  };
}
