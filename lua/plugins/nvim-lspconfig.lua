return {
	"neovim/nvim-lspconfig",
	lazy = false,

	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Bash
		vim.lsp.config("bashls", {
			cmd = { "bash-language-server", "start" },
			filetypes = { "bash", "sh" },
			capabilities = capabilities,
		})

		vim.lsp.enable("bashls")

		-- Rust
		vim.lsp.config("rust_analyzer", {
			cmd = { "/usr/local/bin/rust-analyzer" },
			filetypes = { "rust" },

			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = false,
						noDefaultFeatures = false,
					},

					check = {
						command = "check",
					},

					procMacro = {
						enable = false,
					},
				},
			},

			capabilities = capabilities,
		})

		vim.lsp.enable("rust_analyzer")

		-- C
		vim.lsp.config("clangd-c", {
			cmd = { "clangd19" },
			filetypes = { "c" },

			init_options = {
				fallbackFlags = { "-std=c17" },
			},

			capabilities = capabilities,
		})

		vim.lsp.enable("clangd-c")

		-- C++
		vim.lsp.config("clangd-cpp", {
			cmd = { "clangd19" },
			filetypes = { "cpp", "cxx", "cc" },

			init_options = {
				fallbackFlags = { "-std=c++26" },
			},

			capabilities = capabilities,
		})

		vim.lsp.enable("clangd-cpp")

		-- Lua
		vim.lsp.config("lua_ls", {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			capabilities = capabilities,
		})

		vim.lsp.enable("lua_ls")

		-- Java
		vim.lsp.config("jdtls", {
			cmd = { "/home/aka/bin/jdtls" },
			filetypes = { "java" },

			root_markers = {
				"gradlew",
				"mvnw",
				".git",
				"pom.xml",
				"build.gradle",
			},

			init_options = {
				workspace = "/home/aka/.cache/jdtls_workspace",
			},

			settings = {
				java = {
					home = "/usr/local/openjdk17",

					signatureHelp = {
						enabled = true,
					},

					completion = {
						favoriteStaticMembers = {
							"org.junit.Assert.*",
						},
					},
				},
			},

			capabilities = capabilities,
		})

		vim.lsp.enable("jdtls")

		-- Keymaps
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
			desc = "Go to Definition",
		})

		vim.keymap.set("n", "gb", "<C-o>", {
			desc = "Go Back",
		})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {
			desc = "Hover Documentation",
		})

		vim.keymap.set("n", "gr", vim.lsp.buf.references, {
			desc = "References",
		})

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
			desc = "Rename",
		})

		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
			desc = "Code Action",
		})

		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({
				async = true,
			})
		end, {
			desc = "Format Buffer",
		})
	end,
}
