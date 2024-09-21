return {
	"chrisgrieser/nvim-lsp-endhints",
	event = "LspAttach",
	opts = {
        icons = {
            type = " ", --"󰫧 ",
            parameter = "󰊕 ",
            offspec = "󱔢 ", -- hint kind not defined in official LSP spec
            unknown = " ", -- hint kind is nil
        },
    }, -- required, even if empty
}