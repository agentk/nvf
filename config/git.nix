_: {
  vim.git = {
    gitsigns = {
      enable = true;

      setupOpts.signs = {
        add = {text = "+";};
        change = {text = "~";};
        delete = {text = "_";};
        topdelete = {text = "‾";};
        changedelete = {text = "~";};
      };
    };
  };
}
