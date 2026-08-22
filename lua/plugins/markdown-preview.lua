return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    require("lazy").load({ plugins = { "markdown-preview.nvim" } })
    vim.fn["mkdp#util#install"]()
  end,
  keys = {
    {
      "<leader>cp",
      ft = "markdown",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown Preview",
    },
  },
  config = function()
    vim.g.mkdp_open_to_the_world = 1 -- bind 0.0.0.0 so LAN machines can reach it
    vim.g.mkdp_echo_url = 1 -- print URL instead of trying to open a browser
    vim.cmd([[do FileType]])
  end,
}
