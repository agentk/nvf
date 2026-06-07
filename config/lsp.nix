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
      # VS Code–style pictograms for Neovim completion items
      lspkind.enable = true;
      # Otter.nvim provides lsp features, including code completion, for code embedded in other documents
      otter-nvim.enable = true;
      trouble.enable = true;

      servers.nil.settings.nil.nix.flake.autoArchive = true;
    };

    # TODO: SchemaStore still needs LSP integration
    # See: https://github.com/b0o/SchemaStore.nvim
    startPlugins = [pkgs.vimPlugins.SchemaStore-nvim];

    binds.whichKey.register = pushDownDefault {"<leader>l" = "Language";};
  };
}
