local mason_setup, mason = pcall(require, "mason")
if not mason_setup then
	print("Cannot find mason")
	return
end

local mason_lsp_config_setup, mason_lsp_config = pcall(require, "mason-lspconfig")
if not mason_lsp_config_setup then
	print("Cannot find mason-lspconfig")
	return
end

local mason_null_ls_setup, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_setup then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lsp_config.setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"tsserver",
		"html",
		"cssls",
		"bashls",
		"eslint",
		"jsonls",
		"pyright",
	},
	automatic_installation = true,
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
	},
	automatic_installation = true,
})
