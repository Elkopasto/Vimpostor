return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "elkopasto/spotifyline.nvim" },
  opts = function(_, opts)
    local spotify_component = {
      require("spotifyline").statusline,
      cond = function()
        if vim.uv.os_uname().sysname ~= "Darwin" then
          return false
        end
        local ok, spotify = pcall(require, "spotifyline")
        return ok and spotify.statusline() ~= ""
      end,
    }
    table.insert(opts.sections.lualine_x, 1, spotify_component)
  end,
}
