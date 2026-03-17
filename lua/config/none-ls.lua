--[[ local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua, --lua
	},
})

--vim.keymap.set('n', '<C>f', lua vim.lsp.buf.format(), {})
-- Contoh command untuk memformat kode menggunakan LSP
local opts = {noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Space>ff", "<cmd>lua vim.lsp.buf.format()<CR>", opts) ]]

--vim.api.keymap.set("n", "<Space>f", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })


-- Inisialisasi null-ls
local null_ls = require("null-ls")

-- Daftar tool eksternal yang ingin diintegrasikan
local sources = {
    -- Lua
    null_ls.builtins.formatting.stylua,
    
    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.flake8,
    
    -- JavaScript / TypeScript
    null_ls.builtins.formatting.prettier,
    --null_ls.builtins.diagnostics.eslint,
}

-- Setup null-ls
null_ls.setup({
    sources = sources,
    -- Bisa juga aktifkan on_attach untuk keymap
    on_attach = function(client)
        if client.supports_method("textDocument/formatting") then
            -- Keymap untuk memformat buffer aktif
            local opts = { noremap = true, silent = true }
            vim.api.nvim_set_keymap("n", "<Space>ff", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
        end
    end,
})

-- Opsional: command khusus untuk memformat buffer secara manual
vim.cmd([[
command! Format lua vim.lsp.buf.format()
]])

