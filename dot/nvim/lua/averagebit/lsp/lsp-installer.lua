local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
	return
end

local servers = {
	"ansiblels",
	"bashls",
	"cssls",
	"dockerls",
	"eslint",
	"gopls",
	"graphql",
	"html",
	"rust_analyzer",
	"taplo",
	"tflint",
	"tsserver",
	"vuels",
	"yamlls",
	"jsonls",
	"sumneko_lua",
	"terraformls",
}

lsp_installer.setup()

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("averagebit.lsp.handlers").on_attach,
		capabilities = require("averagebit.lsp.handlers").capabilities,
	}

	if server == "sumneko_lua" then
		local sumneko_opts = require("averagebit.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "jsonls" then
		local jsonls_opts = require("averagebit.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	lspconfig[server].setup(opts)
end
