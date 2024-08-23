return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")

    dashboard.section.header.val = {
        [[           _                        _  __ _           ]],
        [[ __      _| |__  _   _ _ __ ___  __| |/ _(_)_ __ ___  ]],
        [[ \ \ /\ / / '_ \| | | | '__/ _ \/ _` | |_| | '__/ _ \ ]],
        [[  \ V  V /| | | | |_| | | |  __/ (_| |  _| | | |  __/ ]],
        [[   \_/\_/ |_| |_|\__, |_|  \___|\__,_|_| |_|_|  \___| ]],
        [[                 |___/                                ]],
    }

    alpha.setup(dashboard.opts)
  end,
}
