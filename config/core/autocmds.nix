{
  autoGroups =
    let
      o.clear = true;
    in
    {
      highlight_yank = o;
      resize_splits = o;
      format_options = o;
    };

  autoCmd = [
    {
      group = "highlight_yank";
      event = [ "TextYankPost" ];
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      };
    }
    {
      group = "resize_splits";
      event = [ "VimResized" ];
      callback = {
        __raw = ''
          function()
            local current_tab = vim.fn.tabpagenr()
            vim.cmd("tabdo wincmd =")
            vim.cmd("tabnext " .. current_tab)
          end
        '';
      };
    }
    {
      group = "format_options";
      event = [ "FileType" ];
      callback = {
        __raw = ''
          function()
            vim.bo.formatoptions = vim.bo.formatoptions:gsub("[co]", "")
          end
        '';
      };
    }
  ];
}
