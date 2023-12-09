return {
  { "jbyuki/nabla.nvim",  ft = "markdown" },
  { "godlygeek/tabular",  ft = "markdown" },
  { "ixru/nvim-markdown", ft = "markdown" },
  {
    "TobinPalmer/pastify.nvim",
    ft = "markdown",
    opts = {
      opts = {
        absolute_path = false,   -- use absolute or relative path to the working directory
        apikey = "",             -- Api key, required for online saving
        local_path = "/images/", -- The path to put local files in, ex ~/Projects/<name>/assets/images/<imgname>.png
        save = "local",          -- Either 'local' or 'online'
      },
      ft = {
        markdown = "![]($IMG$)",
      },
    },
  },
}
