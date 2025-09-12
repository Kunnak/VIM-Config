# Neovim Konfiguration - Aufgeräumte Struktur

## 📁 **Aktive Dateien**
```
init.lua                    # 🔄 Switcher zwischen Lazy/Plug Konfigurationen
├── lua/
│   ├── init-plug-final.lua # ✅ Plug + CoC Konfiguration (alle Features)
│   ├── vscode-config.lua   # ✅ VSCode-Neovim Konfiguration  
│   └── coc-settings.json   # ✅ CoC Einstellungen für Code-Completion
```

## 🧹 **LazyVim Dateien (für Switcher behalten)**
```
├── lua/Yannick/                # LazyVim Module (für config_mode = "lazy")
│   ├── blink.lua              # Blink Completion
│   ├── inline-diagnostic.lua  # Diagnostics
│   ├── keymaps.lua            # LazyVim Keybindings
│   ├── lsp.lua                # LSP Konfiguration
│   ├── lualine.lua            # Status Line
│   ├── luasnip.lua            # Snippets
│   ├── noice.lua              # UI Enhancement
│   ├── options.lua            # Vim Options
│   ├── plugins.lua            # LazyVim Plugins
│   ├── popup-focus-fix.lua    # UI Fixes
│   ├── signs.lua              # Git Signs
│   ├── telescope.lua          # Fuzzy Finder
│   └── theme.lua              # Theme Settings
```

## 🗂️ **Sonstige Dateien**
```
├── lazy-lock.json             # LazyVim Plugin-Lock (nur für Lazy-Modus)
├── vscode-init.lua           # VSCode Config (Backup)
├── vscode-settings*.json     # VSCode Settings (Backup)
└── README.md                 # Diese Datei
```

## ⚡ **Aktuelle Features (init-plug-final.lua)**

### 🎯 **Navigation:**
- `<leader>e` → Nvim-tree im aktuellen Fenster (ersetzt netrw komplett)
- `<leader>E` → Nvim-tree in neuem Split  
- `<leader>m` → Wechsle zum Verzeichnis der aktuellen Datei

### 🔍 **Suche (Telescope):**  
- `<leader>f` → Find files (mit grauen Hintergründen)
- `<leader>g` → Live grep
- `<leader>F` → Buffers
- `<leader>h` → Help tags

### 💡 **CoC Features:**
- `<leader>k` → Dokumentation anzeigen (wie VSCode)
- `gd` → Go to definition
- `gr` → Go to references
- `<leader>ca` → Code actions
- `<leader>rn` → Rename

### 🎨 **UI Verbesserungen:**
- ✅ Nachrichten unten rechts (statt oben rechts)
- ✅ Command-Palette in der Bildschirmmitte
- ✅ Graue Hintergründe für Telescope und CoC
- ✅ Lualine Status Line (wie LazyVim)
- ✅ Gruvbox Theme mit transparentem Hintergrund

## 🔄 **Switcher-System:**
Ändere in `init.lua` die Variable `config_mode` um zwischen den Konfigurationen zu wechseln:

```lua
local config_mode = "plug"  -- Aktuelle Einstellung
```

**Verfügbare Modi:**
- **`"plug"`** → Plug + CoC Konfiguration (empfohlen)
  - ✅ Bessere Performance
  - ✅ CoC Code-Completion (wie VSCode) 
  - ✅ Alle deine gewünschten UI-Features
  
- **`"lazy"`** → LazyVim Konfiguration (Original)
  - ✅ Deine ursprüngliche Konfiguration
  - ✅ LSP statt CoC
  - ✅ Lazy Plugin Manager

- **`"vscode"`** → Automatisch in VSCode (wenn `vim.g.vscode` erkannt wird)
  - ✅ VSCode-spezifische Keybindings
  - ✅ Tab-Navigation mit `<leader>w/q`

## 🗑️ **Erfolgreich aufgeräumt:**
Diese Dateien wurden entfernt:
```
✅ lua/init-plug.lua            (ersetzt durch init-plug-final.lua)
✅ lua/init-plug-enhanced.lua   (ersetzt durch init-plug-final.lua)  
✅ mason.lua                   (nicht benötigt mit CoC)
✅ test-completion.js          (Test-Datei)
✅ test-snippets.xml           (Test-Datei)
✅ lua/MIGRATION_GUIDE.md      (nicht mehr nötig)
```
