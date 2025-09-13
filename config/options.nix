_: {
  vim = {
    # See `:help vim.opt`
    # For more options, you can see `:help option-list`

    globals = {
      # Local leader the same as global leader
      maplocalleader = " ";
    };

    options = {
      # Enable 24 bit RGB color in the terminal
      termguicolors = true;

      # Make line numbers default and relative
      number = true;
      relativenumber = true;

      # Enable mouse mode, can be useful for resizing splits for example!
      mouse = "a";

      # Don't show the mode, since it's already in the status line
      showmode = false;

      # Avante views can only be fully collapsed with the global statusline
      # laststatus = 3;

      # Use spaces instead of tabs
      expandtab = true;
      # Number of spaces to use for each step of (auto)indent
      shiftwidth = 2;
      # Number of spaces that a <Tab> in the file counts for
      tabstop = 2;
      # Number of spaces that a <Tab> counts for while editing
      softtabstop = 2;
      # Insert tabs and spaces when using <Tab> in insert mode
      smarttab = true;
      # Do smart auto indenting when starting a new line
      smartindent = true;
      # Copy indent from current line when starting a new line
      autoindent = true;

      # Sync clipboard between OS and Neovim.
      # clipboard = "unnamedplus";

      # Enable break indent
      breakindent = true;

      # Save undo history
      undofile = true;

      # Case-insensitive searching UNLESS \C or one or more capital letters in the search term
      ignorecase = true;
      smartcase = true;
      hlsearch = true;

      # Keep signcolumn on by default
      signcolumn = "yes";

      # Decrease update time
      updatetime = 250;

      # Decrease mapped sequence wait time
      # Displays which-key popup sooner
      timeoutlen = 500;

      # Configure how new splits should be opened
      splitright = true;
      splitbelow = true;

      # Sets how neovim will display certain whitespace characters in the editor.
      #  See `:help 'list'`
      #  and `:help 'listchars'`
      list = true;
      listchars = "tab:» ,trail:·,nbsp:␣";

      # Preview substitutions live, as you type!
      inccommand = "split";

      # Show which line your cursor is on
      cursorline = true;

      # Minimal number of screen lines to keep above and below the cursor.
      scrolloff = 10;

      # Disable the command line until needed for a cleaner look
      cmdheight = 0;

      # vim.api.nvim_create_autocmd('TermOpen', {
      #   group = vim.api.nvim_create_augroup('create-term-open', { clear = true }),
      #   callback = function()
      #     vim.opt_local.number = false
      #     vim.opt_local.relativenumber = false
      #     vim.opt_local.spell = false
      #   end,
      # })

      winborder = "rounded";
    };
  };
}
