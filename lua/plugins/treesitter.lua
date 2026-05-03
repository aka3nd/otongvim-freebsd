return {
	{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufRead", "BufNewFile" },
		version = false,
		build = ":TSUpdate",
		lazy = true,
		cmd = {
			"TSInstall",
			"TSInstallSync",
			"TSUpdate",
			"TSUpdateSync",
			"TSUninstall",
			"TSInstallInfo",
			"TSInstallFromGrammar",
		},
		opts = function()
			return {
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = { "lua", "luadoc", "vim", "vimdoc" },
				incremental_selection = {
					enable = true,
				},
				autopairs = {
					enable = true,
				},
			}
		end,
		config = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				---@type table<string, boolean>
				local added = {}
				opts.ensure_installed = vim.tbl_filter(function(lang)
					if added[lang] then
						return false
					end
					added[lang] = true
					return true
				end, opts.ensure_installed)
			end
			local ok, treesitter = pcall(require, "nvim-treesitter.configs")
			if not ok then
				return
			end
			treesitter.setup(opts)
		end,
	},
}
