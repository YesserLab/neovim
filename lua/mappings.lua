require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<space>ge", vim.diagnostic.open_float, { desc = "open floating diagnostics" })
map("n", "gs", "<CMD>LspClangdSwitchSourceHeader<CR>", { desc = "Switch source/header" })
map("n", "<leader>gR", ":lua require'telescope.builtin'.lsp_references{}<CR>", { desc = "Lsp Telescope References" })
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", {})

-- dap
map("n", "<leader>dv", "<CMD>DapViewToggle<CR>", { desc = "Toggle debugger view" })
map("n", "<leader>db", "<CMD>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dd", "<CMD>DapContinue<CR>", { desc = "Start/Continue debugging" })
map("n", "<leader>dt", "<CMD>DapTerminate<CR>", { desc = "Start/Continue debugging" })

-- Yank to the clipboard
map({ "n", "x" }, "y", function()
    if vim.v.register == '"' then
        return '"+y'
    end

    return "y"
end, { expr = true })
