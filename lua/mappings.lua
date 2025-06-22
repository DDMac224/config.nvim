local map = vim.keymap.set
local which_key = require("which-key")
local telebuiltin = require("telescope.builtin")

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		local mappings = {
			{ "<leader>l", group = "LSP" },
			{ "<leader>ld", telebuiltin.diagnostics, desc = "List diagnostics" },
			{ "<leader>lh", vim.lsp.buf.code_action, desc = "Code action" },
			{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
			{ "<leader>lsd", telebuiltin.lsp_document_symbols, desc = "List document symbols" },
			{ "<leader>lsw", telebuiltin.lsp_workspace_symbols, desc = "List workspace symbols" },
			{ "<leader>lci", telebuiltin.lsp_outgoing_calls, desc = "List outgoing calls" },
			{ "<leader>lco", telebuiltin.lsp_incoming_calls, desc = "List incoming calls" },
			{ "<leader>lf", vim.lsp.buf.format({ async = true }), desc = "Format buffer" },
			{ "K", vim.lsp.buf.hover, desc = "Show hover information" },
			{ "[d", vim.diagnostic.goto_next, desc = "Go to next diagnostic" },
			{ "]d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
			{ "gD", vim.lsp.buf.declaration, desc = "Go to declaration" },
			{ "gd", telebuiltin.lsp_definitions, desc = "Go to definition" },
			{ "gi", telebuiltin.lsp_implementations, desc = "Go to implementation" },
			{ "gl", vim.diagnostic.open_float, desc = "Open diagnostic float" },
			{ "go", telebuiltin.lsp_type_definitions, desc = "Go to type definition" },
			{ "gr", telebuiltin.lsp_references, desc = "References" },
		}

		which_key.add(mappings, opts)
	end,
})

map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>")
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>")
map({ "n", "i", "v" }, "<C-n>", "<cmd>NvimTreeToggle<cr>")
map("n", "<Esc>", "<cmd>noh<CR>")

map("n", "<leader>//", "gcc", { remap = true })
map("n", "<leader>/*", "gbc", { remap = true })
map("v", "<leader>//", "gc", { remap = true })
map("v", "<leader>/*", "gb", { remap = true })

which_key.add({
	{ "<leader>ff", telebuiltin.find_files, desc = "" },
	{ "<leader>fg", telebuiltin.git_files, desc = "" },
	{ "<leader>fw", telebuiltin.live_grep, desc = "" },
	{ "<leader>fb", telebuiltin.buffers, desc = "" },
	{ "<leader>fh", telebuiltin.help_tags, desc = "" },
})
