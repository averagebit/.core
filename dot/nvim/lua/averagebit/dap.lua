local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	return
end

local dapui_ok, dapui = pcall(require, "dapui")
if not dapui_ok then
	return
end

local dap_install_ok, dap_install = pcall(require, "dap-install")
if not dap_install_ok then
	return
end

dap_install.setup({})

dap_install.config("go", {})

dapui.setup({
	sidebar = {
		elements = {
			{
				id = "scopes",
				size = 0.25,
			},
			{
				id = "breakpoints",
				size = 0.25,
			},
		},
		size = 40,
		position = "right",
	},
	tray = {
		elements = {},
	},
})

vim.fn.sign_define("DapBreakpoint", {
	text = "",
	texthl = "DiagnosticSignError",
	linehl = "",
	numhl = "",
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
