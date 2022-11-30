local plugin = require("utils.plugin")

plugin.register_plugin { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }

plugin.try_require_plugin(
  "flutter-tools",
  function(flutter)
    flutter.setup()
  end
)
