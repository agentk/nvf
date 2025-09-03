_: {
  vim.statusline = {
    lualine = {
      enable = true;
      theme = "auto";
    };
  };
}
# return {
#   {
#     'nvim-lualine/lualine.nvim',
#     dependencies = {
#       'echasnovski/mini.icons',
#       'bwpge/lualine-pretty-path',
#     },
#     init = function()
#       vim.g.lualine_laststatus = vim.o.laststatus
#       if vim.fn.argc(-1) > 0 then
#         -- set an empty statusline till lualine loads
#         vim.o.statusline = ' '
#       else
#         -- hide the statusline on the starter page
#         vim.o.laststatus = 0
#       end
#     end,
#     opts = function()
#       -- PERF: we don't need this lualine require madness 🤷
#       local lualine_require = require('lualine_require')
#       lualine_require.require = require
#
#       vim.o.laststatus = vim.g.lualine_laststatus
#
#       local opts = {
#         options = {
#           globalstatus = vim.o.laststatus == 3,
#           disabled_filetypes = {
#             statusline = {
#               'dashboard',
#               'alpha',
#               'ministarter',
#             },
#           },
#           section_separators = '',
#           component_separators = '│',
#         },
#         sections = {
#           lualine_a = {
#             'mode',
#           },
#           lualine_b = {
#             'branch',
#             'diff',
#             'diagnostics',
#           },
#           lualine_c = {
#             'pretty_path',
#           },
#           lualine_x = {
#             'lsp_status',
#             {
#               function() return require('noice').api.status.command.get() end,
#               cond = function() return package.loaded['noice'] and require('noice').api.status.command.has() end,
#             },
#             {
#               function() return require('noice').api.status.mode.get() end,
#               cond = function() return package.loaded['noice'] and require('noice').api.status.mode.has() end,
#             },
#             {
#               function() return '  ' .. require('dap').status() end,
#               cond = function() return package.loaded['dap'] and require('dap').status() ~= '' end,
#             },
#             {
#               require('lazy.status').updates,
#               cond = require('lazy.status').has_updates,
#             },
#           },
#           lualine_y = {
#             {
#               -- 'encoding', but only if it's not utf-8
#               function()
#                 local ret, _ = (vim.bo.fenc or vim.go.enc):gsub('^utf%-8$', '')
#                 return ret
#               end,
#             },
#             {
#               -- 'fileformat', but only if not unix
#               function()
#                 local ret, _ = vim.bo.fileformat:gsub('^unix$', '')
#                 return ret
#               end,
#               -- icons_enabled = true,
#               -- symbols = {
#               --   unix = 'LF',
#               --   dos = 'CRLF',
#               --   mac = 'CR',
#               -- },
#             },
#             'filetype',
#             'filesize',
#           },
#           lualine_z = {
#             { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
#             { 'location', padding = { left = 0, right = 1 } },
#           },
#         },
#         extensions = { 'neo-tree', 'lazy' },
#       }
#
#       -- do not add trouble symbols if aerial is enabled
#       if vim.g.trouble_lualine then
#         local trouble = require('trouble')
#         local symbols = trouble.statusline
#           and trouble.statusline({
#             mode = 'symbols',
#             groups = {},
#             title = false,
#             filter = { range = true },
#             format = '{kind_icon}{symbol.name:Normal}',
#             hl_group = 'lualine_c_normal',
#           })
#         table.insert(opts.sections.lualine_c, {
#           symbols and symbols.get,
#           cond = symbols and symbols.has,
#         })
#       end
#
#       return opts
#     end,
#   },
# }

