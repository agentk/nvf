_: {
  vim = {
    filetree.neo-tree = {
      enable = true;

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
