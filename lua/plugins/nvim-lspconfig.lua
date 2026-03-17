return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		--require('cmp_nvim_lsp').default_capabilities()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- bash --
		vim.lsp.config("bashls", {
			cmd = { "bash-language-server", "start" },
			filetypes = { "bash", "sh" },
			capabilities = capabilities,
		})
		vim.lsp.enable("bashls")

		-- rust language --
		vim.lsp.config("rust_analyzer", {
			cmd = { "/home/aka/.cargo/bin/rust-analyzer" },
			filetypes = { "rust" },
			cargo = {
				allFeatures = false,
				noDefaultFeatures = false,
			},
			check = {
				command = "check",
			},
			procmacro = {
				enable = false,
			},
			capabilities = capabilities,
		})

		vim.lsp.enable("rust_analyzer")

		-- c/cpp--
		vim.lsp.config("clangd", {
			cmd = { "clangd" },
			init_options = {
				fallbackFlags = { "-std=c++26" },
			},
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
			capabilities = capabilities,
		})
		vim.lsp.enable("clangd")

		-- lua language --
		vim.lsp.config("lua_ls", {
			--cmd = { "/home/aka/lua-language-server/bin/lua-language-server" },
			cmd = {"lua-language-server"},
			filetypes = { "lua" },
			capabilities = capabilities,
		})
		vim.lsp.enable("lua_ls")

		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition", noremap = true, silent = true })
		vim.keymap.set("n", "gb", "<C-o>", { desc = "Go back", noremap = true, silent = true })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation", noremap = true, silent = true })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References", noremap = true, silent = true })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename", noremap = true, silent = true })
		vim.keymap.set(
			"n",
			"<leader>ca",
			vim.lsp.buf.code_action,
			{ desc = "Code Action", noremap = true, silent = true }
		)
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "Format buffer", noremap = true, silent = true })
	end,
}
