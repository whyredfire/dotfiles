return {
    vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" }),
    vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" }),
    vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" }),
    vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" }),
}
