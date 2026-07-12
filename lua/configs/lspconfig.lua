-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()


vim.lsp.config.clangd = {
    cmd = {
        "clangd",
        "--query-driver=/usr/bin/clang++",
        "--offset-encoding=utf-16",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--offset-encoding=utf-16",
        "--header-insertion=never",
    },
}

vim.lsp.config.zig = {
    settings = {
        zls = {
            enable_build_on_save = true,
            enable_semantic_tokens = true,
        },
    },
}

vim.lsp.config.pyright = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },

    root_markers = {
        "pyproject.toml",
        "uv.lock",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        ".git",
    },

    settings = {
        python = {
            venvPath = ".",
            venv = "clk",

            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic",
            },
        },
    },
}

vim.lsp.config.just = {
    cmd = { "just" },
    filetypes = { "just" },
    root_markers = { "justfile", ".git" }
}

vim.lsp.enable { "clangd", "zls", "lua_ls", "pyright", "just" }
