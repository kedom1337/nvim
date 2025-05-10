{
  autoGroups =
    let
      o.clear = true;
    in
    {
      no_spell = o;
      highlight_yank = o;
      resize_splits = o;
      format_options = o;
      check_time = o;
      man_unlisted = o;
      mini_split = o;
    };

  autoCmd = [
    {
      group = "no_spell";
      event = [ "FileType" ];
      pattern = [
        "dap*"
        "json"
      ];
      callback.__raw = ''
        function()
          vim.wo.spell = false
        end
      '';
    }
    {
      group = "highlight_yank";
      event = [ "TextYankPost" ];
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
    }
    {
      group = "resize_splits";
      event = [ "VimResized" ];
      callback.__raw = ''
        function()
          local current_tab = vim.fn.tabpagenr()
          vim.cmd("tabdo wincmd =")
          vim.cmd("tabnext " .. current_tab)
        end
      '';
    }
    {
      group = "check_time";
      event = [
        "FocusGained"
        "TermClose"
        "TermLeave"
      ];
      callback.__raw = ''
        function()
          if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
          end
        end
      '';
    }
    {
      group = "format_options";
      event = [ "FileType" ];
      callback.__raw = ''
        function()
          vim.bo.formatoptions = vim.bo.formatoptions:gsub("[co]", "")
        end
      '';
    }
    {
      group = "man_unlisted";
      event = [ "FileType" ];
      pattern = [ "man" ];
      callback.__raw = ''
        function(event)
          vim.bo[event.buf].buflisted = false
        end
      '';
    }
    {
      group = "mini_split";
      event = [ "User" ];
      pattern = [ "MiniFilesBufferCreate" ];
      callback.__raw = ''
        function(args)
          local map_split = function(buf_id, lhs, direction)
            local rhs = function()
              local cur_target = MiniFiles.get_explorer_state().target_window
              local new_target = vim.api.nvim_win_call(cur_target, function()
                vim.cmd(direction .. " split")
                return vim.api.nvim_get_current_win()
              end)

              MiniFiles.set_target_window(new_target)
              MiniFiles.go_in()
            end

            local desc = "Split " .. direction
            vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
          end

          local buf_id = args.data.buf_id
          map_split(buf_id, "<C-s>", "belowright horizontal")
          map_split(buf_id, "<C-v>", "belowright vertical")
        end
      '';
    }
  ];
}
