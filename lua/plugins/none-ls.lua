return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					--formatter
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.clang_format,

					--linter
					--null_ls.builtins.diagnostics.cppcheck.with({
						--filetypes = { "c", "cpp", "objc", "objcpp" },
						--command = "/usr/local/bin/cppcheck",
					--}),
				},
			})

			-- Keymap modern <leader>f untuk format
			vim.keymap.set("n", "<leader>ff", function()
				vim.lsp.buf.format()
			end, { noremap = true, silent = true })
		end,
	},
}
