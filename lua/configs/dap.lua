local dap = require("dap")

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
        args = { "--port", "${port}" },
    },
}

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap" },
}

dap.configurations.cpp = {
    {
        name = "cwalk",
        type = "codelldb",
        request = "launch",
        program = function()
            return "./cwalk"
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        stopAtBeginningOfMainSubprogram = false,
        args = {
            "solve",
            "./test/debug/g20.jen",
            -- "--dot", "./test/debug/g20-sol.dot", "--adj", "./test/debug/g20-sol.adj"
        },
    },
}

-- dap.configurations.cpp = {
--     {
--         name = "cwalk",
--         type = "codelldb",
--         request = "launch",
--         program = function()
--             return "./cwalk"
--         end,
--         cwd = "${workspaceFolder}",
--         stopOnEntry = false,
--         args = { "solve", "./test/debug/foo.jen" },
--     },
-- }

-- =========================
-- DAP SIGNS (BREAKPOINT UI)
-- =========================

local function define_dap_signs()
    -- Breakpoint (red filled circle)
    vim.fn.sign_define("DapBreakpoint", {
        text = "\u{f111}",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "",
    })

    vim.api.nvim_set_hl(0, "DapBreakpoint", {
        fg = "#ff8b94",
    })

    -- Conditional Breakpoint (orange circle)
    vim.fn.sign_define("DapBreakpointCondition", {
        text = "\u{f059}",
        texthl = "DapBreakpointCondition",
        linehl = "",
        numhl = "",
    })

    vim.api.nvim_set_hl(0, "DapBreakpointCondition", {
        fg = "#ffa500",
    })

    -- Log Point (blue diamond)
    vim.fn.sign_define("DapLogPoint", {
        text = "◆",
        texthl = "DapLogPoint",
        linehl = "",
        numhl = "",
    })

    vim.api.nvim_set_hl(0, "DapLogPoint", {
        fg = "#61afef",
    })

    -- Debugger stopped line (green arrow)
    vim.fn.sign_define("DapStopped", {
        text = "▶",
        texthl = "DapStopped",
        linehl = "DapStoppedLine",
        numhl = "",
    })

    vim.api.nvim_set_hl(0, "DapStopped", {
        fg = "#feffa3",
    })

    vim.api.nvim_set_hl(0, "DapStoppedLine", {
        bg = "#feffa3",
        fg = "#000000",
    })
end

-- Apply immediately
define_dap_signs()

-- Re-apply after every colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = define_dap_signs,
})
