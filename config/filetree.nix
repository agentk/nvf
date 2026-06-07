{lib, ...}: let
  inherit (lib.generators) mkLuaInline;
in {
  vim = {
    filetree.neo-tree = {
      enable = true;

      setupOpts.window.mappings.P = mkLuaInline ''
        {
          "toggle_preview",
          config = {
            use_float = true,
            use_snacks_image = false,
            use_image_nvim = false,
          },
        }
      '';

      setupOpts.filesystem = {
        window.mappings."\\" = "close_window";

        filtered_items = {
          visible = true;
          never_show = [".DS_Store" "thumbs.db"];
        };
      };
    };

    maps.normal."\\".action = ":Neotree reveal<CR>";
  };
}
