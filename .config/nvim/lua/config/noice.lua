require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
  cmdline = {
    format = {
      cmdline = {
        pattern = "^:",
        icon = "Command : ",
        lang = "vim",
      },
      search_down = {
        kind = "search",
        pattern = "^/",
        icon = "Search DOWN : ",
        lang = "regex",
      },
      search_up = {
        kind = "search",
        pattern = "^%?",
        icon = "Search UP : ",
        lang = "regex",
      },
    },
    view = "cmdline_popup",
  },
  views = {
    cmdline_popup = {
      border = {
        style = "single",
      },
    },
    popup = {
      border = {
        style = "single",
      },
    },
  },
})

vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { fg = "#83a598" })
vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = "#689d6a" })
vim.api.nvim_set_hl(0, "NoiceCmdline", { fg = "#8ec07c" })
vim.api.nvim_set_hl(0, "NoicePopup", { fg = "#83a598" })
vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = "#83a598" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#83a598" })
