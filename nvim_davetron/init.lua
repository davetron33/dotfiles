-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("nvim-treesitter.configs").setup({ highlight = { enable = true } })
require("lspconfig").lua_ls.setup({})
require("love2d").setup({
  path_to_love_bin = "/opt/homebrew/bin/love",
  path_to_love_library = "",
  restart_on_save = false,
})
