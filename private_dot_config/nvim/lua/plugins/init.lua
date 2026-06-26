--- Plugins
vim.pack.add({
	"https://www.github.com/ibhagwan/fzf-lua",
	"https://www.github.com/nvim-tree/nvim-tree.lua",
	"https://www.github.com/nvim-mini/mini.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/akinsho/bufferline.nvim",
    {
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
    {
        src = "https://github.com/Saghen/blink.cmp",
        version = vim.version.range("1.*"),
    },
})
