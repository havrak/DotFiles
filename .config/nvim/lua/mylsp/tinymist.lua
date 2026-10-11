return {
    single_file_support = true,
    root_markers = { "main.typ", ".git" },
    flags = {
        debounce_text_changes = 2500,
    },
    settings = {
        exportPdf = "onSave",
        outputPath = "$dir/$name",
        formatterMode = "typstyle",
        semanticTokens = "disable",

        -- Disables memory compilation on typing; compiles only on file save
        compileStatus = "onSave",

        -- Preview configuration
        preview = {
            -- Options: "onSave" or "never"
            refresh = "onSave",
            -- Prevent the preview server from watching in-memory edits
            invertColors = "never",
        },
    },
}
