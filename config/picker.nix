{lib, ...}: let
  inherit (lib.nvim.binds) mkKeymap;
  inherit (lib.nvim.binds) pushDownDefault;
in {
  vim = {
    fzf-lua = {
      enable = true;
    };

    binds.whichKey.register = pushDownDefault {
      "<leader>f" = "Find";
      "<leader>g" = "Git";
      "<leader>s" = "Search";
    };

    keymaps = let
      mkFzfKeymap = key: cmd: opts: desc: (mkKeymap "n" "<leader>${key}" ":lua require('fzf-lua')['${cmd}'](${opts})<CR>" {inherit desc;});
      mkFzfKeymapV = key: cmd: opts: desc: (mkKeymap "v" "<leader>${key}" ":lua require('fzf-lua')['${cmd}'](${opts})<CR>" {inherit desc;});
    in [
      # -- find
      (mkFzfKeymap "<space>" "buffers" "{ sort_mru = true, sort_lastused = true }" "Switch buffer")
      (mkFzfKeymap "fc" "files" "{ cwd = vim.fn.stdpath('config') }" "Find Config File")
      (mkFzfKeymap "ff" "files" "{}" "Find Files (Root Dir)")
      (mkFzfKeymap "," "files" "{}" "Find Files (Root Dir)")
      (mkFzfKeymap "fF" "files" "{ root = false }" "Find Files (cwd)")
      (mkFzfKeymap "fg" "git_files" "{}" "Find Files (git-files)")
      (mkFzfKeymap "fr" "oldfiles" "{}" "Recent")
      (mkFzfKeymap "fR" "oldfiles" "{ cwd = vim.uv.cwd }" "Recent (cwd)")
      # -- git
      (mkFzfKeymap "gc" "git_commits" "{}" "Commits")
      (mkFzfKeymap "gs" "git_status" "{}" "Status")
      # -- search
      (mkFzfKeymap "s\"" "registers" "{}" "Registers")
      (mkFzfKeymap "sa" "autocmds" "{}" "Auto Commands")
      (mkFzfKeymap "sb" "grep_curbuf" "{}" "Buffer grep")
      (mkFzfKeymap ":" "command_history" "{}" "Command History")
      (mkFzfKeymap "sC" "commands" "{}" "Commands")
      (mkFzfKeymap "sd" "diagnostics_document" "{}" "Document Diagnostics")
      (mkFzfKeymap "sD" "diagnostics_workspace" "{}" "Workspace Diagnostics")
      (mkFzfKeymap "/" "live_grep" "{}" "Grep (Root Dir)")
      (mkFzfKeymap "sG" "live_grep" "{ root = false }" "Grep (cwd)")
      (mkFzfKeymap "sh" "help_tags" "{}" "Help Pages")
      (mkFzfKeymap "sH" "highlights" "{}" "Search Highlight Groups")
      (mkFzfKeymap "sj" "jumps" "{}" "Jumplist")
      (mkFzfKeymap "sk" "keymaps" "{}" "Key Maps")
      (mkFzfKeymap "sl" "loclist" "{}" "Location List")
      (mkFzfKeymap "sM" "man_pges" "{}" "Man Pages")
      (mkFzfKeymap "sm" "marks" "{}" "Jump to Mark")
      (mkFzfKeymap "sR" "resume" "{}" "Resume")
      (mkFzfKeymap "sq" "quickfix" "{}" "Quickfix List")
      (mkFzfKeymap "sw" "grep_cword" "{}" "Word (Root Dir)")
      (mkFzfKeymap "sW" "grep_cword" "{ root = false }" "Word (cwd)")
      (mkFzfKeymapV "sw" "grep_visual" "{}" "Selection (Root Dir)")
      (mkFzfKeymapV "sW" "grep_visual" "{ root = false }" "Selection (cwd)")
      (mkFzfKeymap "uC" "colorschemes" "{}" "Colorscheme with Preview")
    ];
  };
}
