{lib, ...}: let
  inherit (lib.generators) mkLuaInline;
  inherit (lib.nvim.binds) mkKeymap;
in {
  vim = {
    augroups = [{name = "TermOpenGroup";}];
    autocmds = [
      {
        event = ["TermOpen"];
        group = "TermOpenGroup";
        callback = mkLuaInline ''
          function()
            vim.opt_local.number = false
            vim.opt_local.relativenumber = false
            vim.opt_local.spell = false
          end '';
      }
    ];

    keymaps = [
      # Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
      # for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
      # is not what someone will guess without a bit more experience.
      #
      # NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
      # or just use <C-\><C-n> to exit terminal mode
      (mkKeymap "t" "<Esc><Esc>" "<C-\\><C-n>" {desc = "Exit terminal mode";})
    ];
  };
}
