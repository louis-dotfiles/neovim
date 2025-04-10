vim.filetype.add({
    -- Use regular expressions.
    pattern = {
        -- Map the *Jenkinsfile* files to the 'groovy' filetype.
        [".*Jenkinsfile.*"] = "groovy",
        [".*git/config"] = "gitconfig",
    },
    filename = {
        ["condarc"] = "yaml",
    },
})

