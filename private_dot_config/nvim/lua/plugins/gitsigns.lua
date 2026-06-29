require("gitsigns").setup({
    current_line_blame = false,
})

vim.keymap.set("n", "<leader>gb", function()
    require("gitsigns").blame_line()
end, { desc = "Git blame line" })

