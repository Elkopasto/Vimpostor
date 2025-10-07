return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = vim.tbl_deep_extend("force", opts.keymap or {}, {
      preset = "super-tab",
      ["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    })
    opts.completion = vim.tbl_deep_extend("force", opts.completion or {}, {
      list = { selection = { preselect = true, auto_insert = true } },
      trigger = { show_in_snippet = false },
    })
  end,
}
