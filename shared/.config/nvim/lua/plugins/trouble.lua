return {
  { "artemave/workspace-diagnostics.nvim" },
  {
    "folke/trouble.nvim",
    keys = {
      {
        -- Command override
        "<leader>xx",
        function()
          -- Update project wide diagnostics list for active lsp clients
          for _, client in ipairs(vim.lsp.get_clients()) do
            require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
          end

          -- Open diagnostics list
          require("trouble").toggle("diagnostics")
        end,
        desc = "Diagnostics (Trouble)",
      },
    },
  },
}
