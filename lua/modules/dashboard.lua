local plugin = require("utils.plugin")

plugin.register_plugin({ "glepnir/dashboard-nvim" })

plugin.try_require_plugin(
  "dashboard",
  function(dashboard)
    dashboard.preview_command = 'cat | chafa -f symbols -C on'
    dashboard.preview_file_path = '/Users/junso/new/Group@2x.png'

    dashboard.preview_file_height = 10
    dashboard.preview_file_width = 30

    dashboard.custom_footer = {
      "",
      "🎉  neovim by jctaoo (2022) ❤️",
      "",
      " `https://github.com/jctaoo`"
    }

    dashboard.custom_center = {
      {
        icon = "  ",
        desc = "Projects                            ",
        action = "Telescope projects",
      },
      {
        icon = "  ",
        desc = "Recently files                      ",
        action = "Telescope oldfiles",
      },
      {
        icon = "  ",
        desc = "Edit keybindings                    ",
        action = "edit ~/.config/nvim/lua/keybindings.lua",
      },
      {
        icon = "  ",
        desc = "Edit Projects                       ",
        action = "edit ~/.local/share/nvim/project_nvim/project_history",
      },
      -- {
      --   icon = "  ",
      --   desc = "Edit .bashrc                        ",
      --   action = "edit ~/.bashrc",
      -- },
      -- {
      --   icon = "  ",
      --   desc = "Change colorscheme                  ",
      --   action = "ChangeColorScheme",
      -- },
      -- {
      --   icon = "  ",
      --   desc = "Edit init.lua                       ",
      --   action = "edit ~/.config/nvim/init.lua",
      -- },
    }
  end
)
