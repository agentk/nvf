{lib, ...}: let
  inherit (lib.nvim.binds) pushDownDefault;
in {
  vim = {
    ui = {
      borders.enable = true;
      colorizer.enable = true;
      fastaction.enable = true;
      illuminate.enable = true;
    };

    binds.whichKey.register = pushDownDefault {"<leader>u" = "UI";};
  };
}
