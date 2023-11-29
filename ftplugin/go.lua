local bo = vim.bo

bo.tabstop = 4 -- size of a hard tabstop (ts).
bo.shiftwidth = 4 -- size of an indentation (sw).
bo.expandtab = false -- always uses spaces instead of tab characters (et).

vim.g.go_doc_keywordprg_enabled = 0 -- Disable keybind K to <Cmd>GoDoc<CR>
