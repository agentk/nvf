{lib, ...}: let
  inherit (lib.nvim.binds) pushDownDefault;
in {
  vim = {
    debugger.nvim-dap = {
      enable = true;
      ui.enable = true;
    };

    binds.whichKey.register = pushDownDefault {"<leader>d" = "Debugging";};
  };
}
