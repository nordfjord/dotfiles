local links = {
  ["@lsp.type.namespace.typescript"] = "@type"
}

return {
  "rose-pine/neovim",
  config = function()
    vim.cmd.colorscheme("rose-pine")
    for newgroup, oldgroup in pairs(links) do
      vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
    end
  end
}
