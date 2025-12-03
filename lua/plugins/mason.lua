return {
	{
    	  "mason-org/mason.nvim",
    	  opts = {}
  	},
	{
    	"mason-org/mason-lspconfig.nvim",
    	opts = {
        	ensure_installed = { "pyright", },
    		},
 	   	dependencies = {
        	{ "mason-org/mason.nvim", opts = {} },
        	"neovim/nvim-lspconfig",
    		},
	}
}
