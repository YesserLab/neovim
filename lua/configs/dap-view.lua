local dap = require("dap")
local dap_view = require("dap-view")

dap_view.setup {
    winbar = {
        show = true,
        -- You can add a "console" section to merge the terminal with the other views
        sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
        -- Must be one of the sections declared above
        default_section = "console",
        -- Append hints with keymaps within the labels
        show_keymap_hints = true,
        -- Configure each section individually
        base_sections = {
            -- Labels can be set dynamically with functions
            -- Each function receives the window's width and the current section as arguments
            breakpoints = { label = "Breakpoints", keymap = "B" },
            scopes = { label = "Scopes", keymap = "S" },
            exceptions = { label = "Exceptions", keymap = "E" },
            watches = { label = "Watches", keymap = "W" },
            threads = { label = "Threads", keymap = "T" },
            repl = { label = "REPL", keymap = "R" },
            sessions = { label = "Sessions", keymap = "K" },
            console = { label = "Console", keymap = "C" },
        },
        -- Add your own sections
        custom_sections = {},
        controls = {
            enabled = true,
            position = "right",
            buttons = {
                "play",
                "step_into",
                "step_over",
                "step_out",
                "step_back",
                "run_last",
                "terminate",
                "disconnect",
            },
            custom_buttons = {},
        },
    },
    windows = {
        size = 0.25,
        position = "below",
        terminal = {
            size = 0.5,
            position = "left",
            -- List of debug adapters for which the terminal should be ALWAYS hidden
            hide = {},
        },
    },
    -- Controls how to jump when selecting a breakpoint or navigating the stack
    -- Comma separated list, like the built-in 'switchbuf'. See :help 'switchbuf'
    -- Only a subset of the options is available: newtab, useopen, usetab and uselast
    -- Can also be a function that takes the current winnr and the bufnr that will jumped to
    -- If a function, should return the winnr of the destination window
    switchbuf = "usetab,useopen,uselast",
    -- Auto open when a session is started and auto close when all sessions finish
    -- Alternatively, can be a string:
    -- - "keep_terminal": as above, but keeps the terminal when the session finishes
    -- - "open_term": open the terminal when starting a new session, nothing else
    auto_toggle = true,
    -- Reopen dapview when switching to a different tab
    -- Can also be a function to dynamically choose when to follow, by returning a boolean
    -- If a function, receives the name of the adapter for the current session as an argument
    follow_tab = false,
}
