local options = {
    formatters_by_ft = {
        lua = { "emmylua_codeformat" },
        cpp = { "clang-format" },
        zig = { "zigfmt" },
        zon = { "zigfmt" },
        python = { "ruff_format" },
    },

    formatters = {
        emmylua_codeformat = {
            command = "emmylua-codeformat",
            args = { "format", "--stdin" },
            stdin = true,
        },

        ruff_format = {
            command = "ruff",
            args = { "format", "--stdin-filename", "$FILENAME", "-" },
            stdin = true,
        },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,



    },
}

return options
