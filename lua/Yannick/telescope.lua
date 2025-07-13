require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "^%.",           -- Ignoriert alle versteckten Dateien/Ordner im Root (z.B. .vscode, .git)
            "/%.",           -- Ignoriert alle versteckten Dateien/Ordner in Unterverzeichnissen
            "node_modules/",    -- Ignoriert alles im node_modules-Ordner
            "node_modules/.*",  -- Ignoriert alles im node_modules-Ordner
            "node_modules/*",   -- Ignoriert alles im node_modules-Ordner
            "%.git/",           -- Ignoriert alles im .git-Ordner
            "%.lock",           -- Ignoriert alle .lock-Dateien
            "%.png",            -- Ignoriert alle PNG-Bilder
            "%.jpg",            -- usw.
            "build/",           -- Ignoriert Build-Ordner
            "%.cache/*",        -- Ignoriert Build-Ordner
            "%.cargo/*",        -- Ignoriert Build-Ordner
            "%.DS_Store",       -- Ignoriert Mac-OS-Metadaten
        },

        find_command = {
            "fd",
            "--type", "f",
            "--hidden",
            "--exclude", ".git",
            "--strip-cwd-prefix",
            "--no-ignore-vcs",
            ".*" }
    }
}
