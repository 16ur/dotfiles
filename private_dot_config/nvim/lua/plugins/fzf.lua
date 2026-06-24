local fzf = require("fzf-lua")

fzf.setup({
    winopts = {
        height = 0.85,
        width = 0.80,
        preview = {
            default = "bat",
        },
    },
})
