return {
	"rcarriga/nvim-dap-ui",
	requires = { "mfussenegger/nvim-dap" },
	config = function()
		require("dapui").setup()
	end,
}
