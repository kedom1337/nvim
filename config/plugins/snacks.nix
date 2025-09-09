{
  keymaps = [
    {
      mode = [
        "n"
        "t"
      ];
      key = "<a-i>";
      action.__raw = ''
        function() Snacks.lazygit() end
      '';
      options.desc = "snacks: Toggle lazy git";
    }
    {
      mode = "n";
      key = "<leader>z";
      action.__raw = ''
        function() Snacks.zen.zen() end
      '';
      options.desc = "snacks: Toggle zen mode";
    }
    {
      mode = "n";
      key = "<leader>f";
      action.__raw = ''
        function() Snacks.picker.smart() end
      '';
      options.desc = "snacks: Pick files";
    }
    {
      mode = "n";
      key = "<leader>g";
      action.__raw = ''
        function() Snacks.picker.grep() end
      '';
      options.desc = "snacks: Grep search";
    }
    {
      mode = "n";
      key = "<leader>k";
      action.__raw = ''
        function() Snacks.picker.keymaps() end
      '';
      options.desc = "snacks: Pick keymaps";
    }
    {
      mode = "n";
      key = "<leader>p";
      action.__raw = ''
        function() Snacks.picker.projects() end
      '';
      options.desc = "snacks: Pick projects";
    }
    {
      mode = "n";
      key = "<leader>s";
      action.__raw = ''
        function() Snacks.picker.lsp_workspace_symbols() end
      '';
      options.desc = "snacks: Pick LSP symbols";
    }
  ];

  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;
      input.enabled = true;
      lazygit.enabled = true;
      zen = {
        toggles.dim = false;
      };
      picker = {
        win.input.keys.__raw = ''
          {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["<c-l>"] = { "history_forward", mode = { "i", "n" } },
            ["<C-h>"] = { "history_back", mode = { "i", "n" } }
          }
        '';
      };
    };
  };
}
