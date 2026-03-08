return {
    -- Ensures it starts even if .git or main.typ is missing
    single_file_support = true,
    settings = {
        -- The modern setting for Tinymist as of 2026
        exportPdf = "onSave",
        outputPath = "$dir/$name.pdf", -- Explicit path can help
        formatterMode = "typstyle",
    },
    root_markers = { "main.typ", ".git" },
}
