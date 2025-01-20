local function getCompletionStatusString()
	local status = vim.api.nvim_call_function("codeium#GetStatusString", {})
	return "ANT: " .. status
end

return {
	"nvim-lualine/lualine.nvim", -- Provides a nice statusline on bottom of editor
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			sections = {
				lualine_c = { "filename", getCompletionStatusString },
			},
		})
	end,
}
