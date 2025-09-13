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
  };
}
