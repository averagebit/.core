local ok, _ = pcall(require, "lspconfig")
if not ok then
	return
end

require("averagebit.lsp.lsp-installer")
require("averagebit.lsp.handlers").setup()
require("averagebit.lsp.null-ls")
