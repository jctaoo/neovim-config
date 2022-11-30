local plugin = require("utils.plugin")

plugin.register_plugin({ "Pocco81/AutoSave.nvim" })

plugin.try_require_plugin(
  "autosave",
  function(autosave)
    autosave.setup(
      {
        enabled = true,
        execution_message = "📦 [AutoSave]: saved at " ..
            vim.fn.strftime("%H:%M:%S"),
        events = { "InsertLeave", "TextChanged" },
        conditions = {
          exists = true,
          filename_is_not = {},
          filetype_is_not = {},
          modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 1500,
        debounce_delay = 135
      }
    )
  end
)
