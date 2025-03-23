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
  ];

  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;
    };
  };
}
