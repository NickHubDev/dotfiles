-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Solo se ejecuta si abres Neovim vacío (sin abrir un archivo directamente)
        if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" then
            vim.cmd("Profile")
        end
    end,
})
