return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"L3MON4D3/LuaSnip",
		},

		opts = {
			-- Pemetaan tombol
			keymap = {
				preset = "enter",

				["<Tab>"] = {
					"select_next",
					"snippet_forward",
					"fallback",
				},

				["<S-Tab>"] = {
					"select_prev",
					"snippet_backward",
					"fallback",
				},

				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			},

			-- Tampilan ikon
			appearance = {
				nerd_font_variant = "mono",
			},

			-- signature
			signature = {
				enabled = true,
				window = {
					border = "rounded",
				},
			},

			completion = {
				-- Tambahkan tanda kurung saat menerima fungsi
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},

				-- Dokumentasi fungsi dan parameter
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,

					window = {
						border = "rounded",
					},
				},

				-- Jendela daftar autocomplete
				menu = {
					border = "rounded",
				},
			},

			-- Integrasi LuaSnip
			snippets = {
				preset = "luasnip",
			},

			-- Sumber autocomplete
			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
			},

			-- Gunakan implementasi fuzzy Lua
			fuzzy = {
				implementation = "lua",
			},
		},
	},
}
