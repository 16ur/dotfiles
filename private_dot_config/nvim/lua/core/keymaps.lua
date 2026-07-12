-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- Files
vim.keymap.set("n", "<leader>x", "<cmd>x<CR>", { desc = "Save and quit" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit window" })

-- Buffers
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
-- vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

vim.keymap.set("n", "<leader>bd", function()
    require("mini.bufremove").delete(0, false)
end, { desc = "Delete buffer" })


-- Splits
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontally" })

-- Window navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Go to right window" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })


vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Comments (mini.comment also provides `gcc` and `gc`)
vim.keymap.set("n", "<leader>c", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("x", "<leader>c", "gc", { remap = true, desc = "Toggle comment" })


-- Nvim tree
vim.keymap.set("n", "<leader>e", function()
    require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })


-- vim.keymap.set("n", "<leader>wo", function()
--     require("nvim-tree.api").tree.focus()
-- end, { desc = "Focus NvimTree" })


-- fzf
vim.keymap.set("n", "<leader>ff", function()
  if vim.bo.filetype == "NvimTree" then
      vim.cmd("wincmd p")
  end
  require("fzf-lua").files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fg", function()
    require("fzf-lua").live_grep()
end, { desc = "Live grep" })

vim.keymap.set("n", "<leader>fw", function()
    require("fzf-lua").grep_cword()
end, { desc = "Grep word under cursor" })

vim.keymap.set("n", "<leader>fb", function()
    require("fzf-lua").buffers()
end, { desc = "Buffers" })


-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>lf", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

local diagnostics_virtual_text_enabled = vim.diagnostic.config().virtual_text ~= false

vim.keymap.set("n", "<leader>ld", function()
    diagnostics_virtual_text_enabled = not diagnostics_virtual_text_enabled
    vim.diagnostic.config({
        virtual_text = diagnostics_virtual_text_enabled,
    })
end, { desc = "Toggle inline diagnostics" })



-- Open vertical terminal
vim.keymap.set("n", "<leader>st", function()
    vim.cmd("vsplit")
    vim.cmd("terminal")
    vim.cmd("startinsert")
end, { desc = "Vertical terminal" })


-- Open horizontal terminal
vim.keymap.set("n", "<leader>sT", function()
    vim.cmd("split")
    vim.cmd("terminal")
    vim.cmd("startinsert")
end, { desc = "Horizontal terminal" })


vim.api.nvim_create_autocmd("TermOpen", {
    callback = function(args)
        local opts = { buffer = args.buf }

        -- Escape terminal mode
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

        -- Close terminal window
        vim.keymap.set("n", "q", "<cmd>close<CR>", opts)
    end,
})
