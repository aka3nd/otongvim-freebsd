return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		--"nvim-lua/plenary.nvim",
		--"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("codecompanion").setup({
			-- Atur zai sebagai adapter default untuk semua strategi
			strategies = {
				chat = {
					adapter = "zai",
				},
				inline = {
					adapter = "zai",
				},
				agent = {
					adapter = "zai",
				},
			},

			adapters = {
				-- Mendefinisikan adapter kustom bernama "zai"
				zai = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						name = "zai-coding",
						env = {
							-- Ganti dengan Base URL API dari z.ai yang sebenarnya
							url = "https://api.z.ai/v1",
							-- Nama environment variable yang menyimpan API key Anda
							api_key = "7d94a2f0acf54634a6e885be542c1d11.e66nvBRWikcEjbD3",
							chat_url = "/chat/completions",
						},
						schema = {
							model = {
								-- Ganti dengan nama model spesifik dari z.ai yang ingin Anda gunakan
								default = "nama-model-zai-terbaik",
							},
						},
					})
				end,
			},
		})
	end,
}
