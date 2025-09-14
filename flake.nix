{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    systems.url = "github:nix-systems/default";

    # Neovim packages from source
    lualine-pretty-path-source = {
      url = "github:bwpge/lualine-pretty-path";
      flake = false;
    };
  };

  outputs = {
    systems,
    nixpkgs,
    ...
  } @ inputs: let
    eachSystem = nixpkgs.lib.genAttrs (import systems);
  in {
    packages = eachSystem (system: {
      default =
        (inputs.nvf.lib.neovimConfiguration {
          extraSpecialArgs = {inherit (inputs) lualine-pretty-path-source;};
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./modules
            ./config
          ];
        })
        .neovim;
    });
  };
}
