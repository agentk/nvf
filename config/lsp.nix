{lib, ...}: let
  inherit (lib.nvim.binds) pushDownDefault;
in {
  vim = {
    lsp = {
      enable = true;

      formatOnSave = true;

      inlayHints.enable = true;
      lspkind.enable = true;
      otter-nvim.enable = true;
      trouble.enable = true;
    };

    binds.whichKey.register = pushDownDefault {"<leader>l" = "Language";};
  };
}
