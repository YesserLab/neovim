return {
    {
        "stevearc/conform.nvim",
        opts = require("configs.conform"),
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end,
    },
    {
        "hedyhli/outline.nvim",
        lazy = false,
        config = function()
            -- Example mapping to toggle outline
            vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

            require("outline").setup {
                -- Your setup opts here (leave empty to use defaults)
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "cpp",
                "python",
                "just",
            },
        },
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup {
                -- Configuration here, or leave empty to use defaults
            }
        end,
    },
    {
        "sindrets/diffview.nvim",
        lazy = false,
    },
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        config = function()
            require("configs.dap")
        end,
    },
    {
        "igorlfs/nvim-dap-view",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        lazy = false,
        config = function()
            require("configs.dap-view")
        end,
    },
}
