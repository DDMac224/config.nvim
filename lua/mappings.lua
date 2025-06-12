local map = vim.keymap.set

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		map({ "n", "x" }, "<leader>lm", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		map("n", "<leader>lh", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>")
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>")
map({ "n", "i", "v" }, "<C-n>", "<cmd>NvimTreeToggle<cr>")
map("n", "<Esc>", "<cmd>noh<CR>")
