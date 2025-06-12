local map = vim.keymap.set
local which_key = require("which-key")

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		local mappings = {
			{ "<leader>l", group = "LSP" },
			{ "<leader>ld", vim.diagnostic.open_float, desc = "Open diagnostic float" },
			{ "<leader>lh", vim.lsp.buf.code_action, desc = "Code action" },
			{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
			{ "<leader>ls", vim.lsp.buf.signature_help, desc = "Signature help" },
			{ "<leader>lf", vim.lsp.buf.format({ async = true }), desc = "Format buffer" },
			{ "K", vim.lsp.buf.hover, desc = "Show hover information" },
			{ "[d", vim.diagnostic.goto_next, desc = "Go to next diagnostic" },
			{ "]d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
			{ "gD", vim.lsp.buf.declaration, desc = "Go to declaration" },
			{ "gd", vim.lsp.buf.definition, desc = "Go to definition" },
			{ "gi", vim.lsp.buf.implementation, desc = "Go to implementation" },
			{ "gl", vim.diagnostic.open_float, desc = "Open diagnostic float" },
			{ "go", vim.lsp.buf.type_definition, desc = "Go to type definition" },
			{ "gr", vim.lsp.buf.references, desc = "References" },
		}

		which_key.add(mappings, opts)
	end,
})

map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>")
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>")
map({ "n", "i", "v" }, "<C-n>", "<cmd>NvimTreeToggle<cr>")
map("n", "<Esc>", "<cmd>noh<CR>")

map("n", "<leader>//", "gcc")
map("n", "<leader>/*", "gbc")
map("v", "<leader>//", "gc")
map("v", "<leader>/*", "gb")
