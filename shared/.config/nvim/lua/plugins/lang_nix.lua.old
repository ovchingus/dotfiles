return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "nixpkgs-fmt",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    -- opts will be merged with the parent spec
    opts = {
      formatters_by_ft = {
        nix = { "nixpkgs_fmt" },
      },
    },
  },
}
