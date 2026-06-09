return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      heading = {
        sign = false,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      bullet = {
        icons = { "●", "○", "◆", "◇" },
      }
    },
    ft = { "markdown", "norg", "rmd", "org"}
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function ()
      vim.fn.jobstart({"npm", "install"}, {cwd = vim.fn.stdpath("data") .. "/lazy/markdown-preview.nvim"})
    end,
    init = function ()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" }
  }
}
