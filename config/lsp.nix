{
  lib,
  pkgs,
  ...
}: let
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

    # TODO: SchemaStore still needs LSP integration
    # See: https://github.com/b0o/SchemaStore.nvim
    startPlugins = [pkgs.vimPlugins.SchemaStore-nvim];

    binds.whichKey.register = pushDownDefault {"<leader>l" = "Language";};
  };
}
