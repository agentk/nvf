_: {
  vim.languages = {
    # TODO: Incorporate SchemaStore
    # {
    #   'b0o/SchemaStore.nvim',
    #   lazy = true,
    #   version = false, -- last release is way too old
    # },

    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;

    nix.enable = true;
    markdown.enable = true;
    bash.enable = true;
    clang.enable = true;
    lua.enable = true;
    yaml = {
      enable = true;
      extraFiletypes = [".yamllint"];
    };
  };
}
# -- LANGUAGE: caddy
# return {
#   {
#     'isobit/vim-caddyfile',
#   },
# }
# -- LANGUAGE: Lua
# return {
#   {
#     'folke/lazydev.nvim',
#     ft = 'lua', -- only load on lua files
#     cmd = 'LazyDev',
#     opts = {
#       library = {
#         -- See the configuration section for more details
#         -- Load luvit types when the `vim.uv` word is found
#         { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
#         -- { path = '~/workspace/avante.nvim/lua', words = { 'avante' } },
#       },
#     },
#   },
#   {
#     'saghen/blink.cmp',
#     opts = {
#       sources = {
#         default = { 'lazydev' },
#         providers = {
#           lazydev = {
#             name = 'LazyDev',
#             module = 'lazydev.integrations.blink',
#             -- make lazydev completions top priority (see `:h blink.cmp`)
#             score_offset = 100,
#           },
#         },
#       },
#     },
#     opts_extend = { 'sources.default' },
#   },
# }
# -- LANGUAGE: Markdown
# return {
#   {
#     'MeanderingProgrammer/render-markdown.nvim',
#     dependencies = {
#       'nvim-treesitter/nvim-treesitter',
#       'echasnovski/mini.icons',
#     },
#     ---@module 'render-markdown'
#     ---@type render.md.UserConfig
#     opts = {
#       completions = { lsp = { enabled = true } },
#       file_types = { 'markdown', 'Avante' },
#       latex = { enabled = false },
#     },
#     ft = { 'markdown', 'Avante' },
#     keys = {
#       { '<leader>mr', '<cmd>RenderMarkdown toggle<cr>', desc = '[M]arkdown [R]ender' },
#     },
#   },
#   {
#     'iamcco/markdown-preview.nvim',
#     cmd = {
#       'MarkdownPreviewToggle',
#       'MarkdownPreview',
#       'MarkdownPreviewStop',
#     },
#     ft = { 'markdown' },
#     build = 'cd app && npx --yes yarn install',
#     init = function() vim.g.mkdp_filetypes = { 'markdown' } end,
#     keys = {
#       { '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', desc = '[M]arkdown [P]review' },
#     },
#   },
# }
# -- LANGUAGE: dts
# vim.filetype.add({
#   extension = {
#     overlay = 'dts',
#   },
# })

