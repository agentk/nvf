_: let
  importFilesIn = dir: (
    map (fname: import (dir + "/${fname}")) (
      builtins.filter (name: name != "default.nix") (
        builtins.attrNames (builtins.readDir dir)
      )
    )
  );
in {
  imports = importFilesIn ../config;

  vim = {
    viAlias = true;
    vimAlias = true;
    additionalRuntimePaths = [
      ../nvim
      (builtins.path {
        path = ../nvim/after; # this must be a relative path
        name = "custom-runtime-after"; # name is arbitrary
      })
    ];

    # autopairs.nvim-autopairs.enable = true;
    # snippets.luasnip.enable = true;

    # notify = {
    #   nvim-notify.enable = true;
    # };

    # projects = {
    #   project-nvim.enable = true;
    # };

    # terminal = {
    #   toggleterm = {
    #     enable = true;
    #     lazygit.enable = true;
    #   };
    # };

    # session = {
    #   nvim-session-manager.enable = false;
    # };

    # gestures = {
    #   gesture-nvim.enable = false;
    # };

    # comments = {
    #   comment-nvim.enable = true;
    # };

    # presence = {
    #   neocord.enable = false;
    # };
  };
}
