-- Utils about plugins such as installation.

local packer = require("packer")
local registered_plugins = {}

-- 注册插件
local function register_plugin(opt)
  table.insert(registered_plugins, opt)
end

-- 安装插件
local function commit_plugins()
  packer.startup({
    function(use)
      -- install plugins
      for _, value in ipairs(registered_plugins) do
        use(value)
      end

      -- Packer 可以管理自己本身
      use 'wbthomason/packer.nvim'
      -- 你的插件列表...

      --------------------- colorschemes -------------------
      use({ 'projekt0n/github-nvim-theme' })
      use({
        "catppuccin/nvim",
        as = "catppuccin"
      })
      -- tokyonight
      use("folke/tokyonight.nvim")
      use "EdenEast/nightfox.nvim"
      -- gruvbox
      use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
      use("dracula/vim")
      -------------------------------------------------------

      -- use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
      use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })

      use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
      use("arkav/lualine-lsp-progress")


      use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
      use("ahmedkhalf/project.nvim")

      use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })


      --------------------- LSP --------------------
      use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
      -- Lspconfig
      use({ "neovim/nvim-lspconfig" })

      -- 补全引擎
      use("hrsh7th/nvim-cmp")
      -- snippet 引擎
      -- use("hrsh7th/vim-vsnip")
      use("L3MON4D3/LuaSnip")
      -- 补全源
      use("saadparwaiz1/cmp_luasnip")
      use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
      use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
      use("hrsh7th/cmp-path") -- { name = 'path' }
      use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

      -- 常见编程语言代码段
      use("rafamadriz/friendly-snippets")

      -- ui (新增)
      use("onsails/lspkind-nvim")

      use("lukas-reineke/indent-blankline.nvim")
      use("tami5/lspsaga.nvim")
      use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
      use("b0o/schemastore.nvim")
      use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })

      use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
      }
    end,
    -- 安装插件时采用弹窗
    config = {
      display = {
        open_fn = function()
          return require("packer.util").float({ border = "single" })
        end
      }
    }
  })
end

-- 尝试引入插件
local function try_require_plugin(name, execution)
  local status, plugin = pcall(require, name)

  if not status then
    vim.notify("ﯧ 没有找到插件" .. name)
    return nil
  else
    return execution(plugin)
  end
end

return {
  register_plugin = register_plugin,
  commit_plugins = commit_plugins,
  try_require_plugin = try_require_plugin,
}
