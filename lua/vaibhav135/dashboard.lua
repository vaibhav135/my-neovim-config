local dashboard = require("dashboard")


--Config for dashboard.
  dashboard.setup({
    theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        { desc = ' Update', group = '@property', action = 'PackerUpdate', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = '  Navigation',
          group = 'DiagnosticHint',
          action = 'NERDTree',
          key = 'n',
        },
        {
          desc = '  My Vimrc',
          group = 'Number',
          action = 'e $MYVIMRC',
          key = 'd',
        },
      },
    },
  })
