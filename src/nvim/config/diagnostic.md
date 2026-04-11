
# Diagnostic Configuration

```lua
-- [[ Diagnostic Config ]]
vim.diagnostic.config({
    -- Show diagnostics as virtual text at the end of the line.
    virtual_text = {
        enabled = true,
        spacing = 4,        -- spaces between the code and the virtual text
        prefix  = "●",      -- icon shown before each diagnostic message
        -- You can use nerd font icons: prefix = " "
    },

    -- Virtual lines.
    virtual_lines = false,

    -- Show diagnostic icons in the sign column.
    signs = true,

    -- Underline code that has a diagnostic.
    -- underline = true, -- show all diagnostics
    underline = { severity = { min = vim.diagnostic.severity.WARN } }, -- show WARN and ERROR diagnostics, skip HINT and INFO

    -- Don't update diagnostics while typing in insert mode (less interruption).
    update_in_insert = false,

    -- Show most severe diagnostics first (errors before warnings).
    severity_sort = true,

    -- Configuration for the floating diagnostic window (shown by vim.diagnostic.open_float).
    float = {
        border  = "rounded",   -- border style: "none", "single", "double", "rounded", "shadow"
        -- source  = "always", -- always show which linter/lsp produced the diagnostic
        source  = 'if_many',   -- show only if multiple sources
        header  = "",
        prefix  = "",
    },

    -- Automatically open the popup when you jump between diagnostics
    jump = { float = true },
})

-- Define the icons shown in the sign column for each diagnostic level.
-- Requires a Nerd Font for the icons to render correctly.
local signs = {
    Error = " ",
    Warn  = " ",
    Hint  = "󰠠 ",
    Info  = " ",
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
```

