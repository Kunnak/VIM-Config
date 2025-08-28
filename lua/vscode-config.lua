-- VSCode-spezifische Neovim Konfiguration
-- Diese Datei wird nur geladen, wenn Neovim in VSCode läuft

-- Basis Einstellungen
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeoutlen = 500

-- VSCode-kompatible Keymaps
local keymap = vim.keymap.set

-- === TAB NAVIGATION ===
keymap('n', '<leader>w', ':call VSCodeNotify("workbench.action.nextEditor")<CR>')
keymap('n', '<leader>q', ':call VSCodeNotify("workbench.action.previousEditor")<CR>')

-- === NAVIGATION ===
keymap('n', '<leader>e', ':call VSCodeNotify("vsnetrw.open")<CR>')
keymap('n', '<leader>f', ':call VSCodeNotify("workbench.action.quickOpen")<CR>')
keymap('n', '<leader>p', ':call VSCodeNotify("workbench.action.showCommands")<CR>')

-- === SEARCH ===
keymap('n', '<leader>g', ':call VSCodeNotify("workbench.action.findInFiles")<CR>')
keymap('n', '<leader>r', ':call VSCodeNotify("editor.action.startFindReplaceAction")<CR>')
keymap('n', '<leader><Esc>', ':nohl<CR>')

-- === LSP ACTIONS (delegiert an VSCode) ===
keymap('n', 'gd', ':call VSCodeNotify("editor.action.revealDefinition")<CR>')
keymap('n', 'gr', ':call VSCodeNotify("editor.action.goToReferences")<CR>')
keymap('n', 'gi', ':call VSCodeNotify("editor.action.goToImplementation")<CR>')
keymap('n', 'gt', ':call VSCodeNotify("editor.action.goToTypeDefinition")<CR>')
keymap('n', 'K', ':call VSCodeNotify("editor.action.showHover")<CR>')
keymap('n', '<leader>ca', ':call VSCodeNotify("editor.action.quickFix")<CR>')
keymap('n', '<leader>rn', ':call VSCodeNotify("editor.action.rename")<CR>')

-- === DIAGNOSTICS ===
keymap('n', '<leader>d', ':call VSCodeNotify("workbench.actions.view.problems")<CR>')
keymap('n', '[d', ':call VSCodeNotify("editor.action.marker.prevInFiles")<CR>')
keymap('n', ']d', ':call VSCodeNotify("editor.action.marker.nextInFiles")<CR>')

-- === FORMAT ===
keymap('n', '<leader>fm', ':call VSCodeNotify("editor.action.formatDocument")<CR>')
keymap('v', '<leader>fm', ':call VSCodeNotify("editor.action.formatSelection")<CR>')

-- === SPLIT NAVIGATION ===
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')

-- === COMMENT TOGGLE ===
keymap('n', 'gcc', ':call VSCodeNotify("editor.action.commentLine")<CR>')
keymap('v', 'gc', ':call VSCodeNotify("editor.action.commentLine")<CR>')

-- === TABS/EDITORS ===
keymap('n', '<leader>1', ':call VSCodeNotify("workbench.action.openEditorAtIndex1")<CR>')
keymap('n', '<leader>2', ':call VSCodeNotify("workbench.action.openEditorAtIndex2")<CR>')
keymap('n', '<leader>3', ':call VSCodeNotify("workbench.action.openEditorAtIndex3")<CR>')

-- === TERMINAL ===
keymap('n', '<leader>t', ':call VSCodeNotify("workbench.action.terminal.toggle")<CR>')

-- === ZEN MODE ===
keymap('n', '<leader>z', ':call VSCodeNotify("workbench.action.toggleZenMode")<CR>')

print("VSCode-Neovim Konfiguration geladen!")
