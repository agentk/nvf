_: {
  vim.mini = {
    ai = {
      # Better Around/Inside textobjects
      #
      #  - va)  - [V]isually select [A]round [)]paren
      #  - yinq - [Y]ank [I]nside [N]ext [']quote
      #  - ci'  - [C]hange [I]nside [']quote
      enable = true;
      setupOpts.n_lines = 500;
    };

    icons.enable = true;

    surround = {
      # Add/delete/replace surroundings (brackets, quotes, etc.)
      #
      # - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      # - sd'   - [S]urround [D]elete [']quotes
      # - sr)'  - [S]urround [R]eplace [)] [']
      enable = true;
    };
  };
}
