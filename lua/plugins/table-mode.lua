return {
  "dhruvasagar/vim-table-mode",
  ft = "markdown",
  init = function()
    -- init runs before plugin load; config would run too late for these
    vim.g.table_mode_disable_mappings = 1
    vim.g.table_mode_disable_tableize_mappings = 1
  end,
}
