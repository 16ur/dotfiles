require("blink.cmp").setup({
    keymap = {
        preset = "enter",
    },
    appearance = {
        nerd_font_variant = "mono",
        separator_style = "thin"
    },

    completion = {
        documentation = {
            auto_show = true,
        },
    },

    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
})
