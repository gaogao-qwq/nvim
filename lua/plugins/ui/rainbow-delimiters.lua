return {
	"HiPhish/rainbow-delimiters.nvim",
	event = "VeryLazy",
	opts = function()
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}
		return {
			highlight = highlight
		}
	end
}
