return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			css = { "prettier" },
			go = { "gofmt", "goimports" },
			html = { "prettier" },
			java = { "google-java-format" },
			javascript = { "prettier" },
			lua = { "stylua" },
			python = { "isort", "black" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			timeout_ms = 500,
		},
		formatters = {
			clang_format = {
				prepend_args = { "--style=file", "--fallback-style=LLVM" },
			},
		},
	},
}
