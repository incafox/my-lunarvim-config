vim.lsp.set_log_level("trace")
lvim.log.level = "info"

lvim.plugins = {
  "shaunsingh/solarized.nvim",
  -- {
  --   "maxmx03/solarized.nvim",
  --   config = function()
  --     require('solarized').setup({
  --       theme = 'neo',
  --       colors = function(colors, colorhelper)
  --         local darken = colorhelper.darken
  --         local lighten = colorhelper.lighten
  --         local blend = colorhelper.blend
  --         return {
  --           fg = '#d3d', -- output: #ffffff
  --           bg = lighten(colors.base03, 7)
  --         }
  --       end,
  --       highlights = function(colors)
  --         return {
  --           Normal = { fg = colors.fg, bg = colors.bg }
  --         }
  --       end
  --     })
  --   end
  -- },
  "folke/trouble.nvim",
  "Mofiqul/dracula.nvim",
  "ibhagwan/fzf-lua",
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        devicons = true,
        styles = {
          comment = { italic = true },
          keyword = { italic = true },       -- any other keyword
          type = { italic = true },          -- (preferred) int, long, char, etc
          storageclass = { italic = true },  -- static, register, volatile, etc
          structure = { italic = true },     -- struct, union, enum, etc
          parameter = { italic = true },     -- parameter pass in function
          annotation = { italic = true },
          tag_attribute = { italic = true }, -- attribute of tag in reactjs
        },
        filter = "pro",
      })
    end,
  },
  "mfussenegger/nvim-jdtls",
  "tomasiser/vim-code-dark",
  "junegunn/seoul256.vim",
  "rebelot/kanagawa.nvim",
  "savq/melange-nvim",
  "sainnhe/everforest",
  "askfiy/visual_studio_code",
  "marko-cerovac/material.nvim",
  "crispybaccoon/evergarden",
  "christianchiarulli/nvcode-color-schemes.vim",
  "morhetz/gruvbox",
  "sainnhe/gruvbox-material",
  "luisiacc/gruvbox-baby",
  "catppuccin/nvim",
  "mhartington/oceanic-next",
  "cpea2506/one_monokai.nvim",
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  "phha/zenburn.nvim",
  "srcery-colors/srcery-vim"
}


vim.g.codedark_italics = true
vim.g.codedark_modern = false
-- vim.g.codedark_transparent = true
-- disable default jdtls ---

-- vim.g.solarized_italic_comments = true
-- vim.g.solarized_italic_keywords = true
-- vim.g.solarized_italic_functions = true
-- vim.g.solarized_italic_variables = true
-- vim.g.solarized_contrast = true
vim.g.solarized_borders = true
lvim.colorscheme = "kanagawa"

vim.lsp.diagnostic.show_line_diagnostics = true -- * Use |vim.diagnostic.open_float()| instead.
vim.lsp.diagnostic.show_position_diagnostics = true

lvim.builtin.which_key.mappings["E"] = {
  "<Cmd>echo Okay!<CR>"
}

function OpenDiagnosticIfNoFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  -- THIS IS FOR BUILTIN LSP
  vim.diagnostic.open_float(0, {
    scope = "cursor",
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  })
end

vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua OpenDiagnosticIfNoFloat()",
  group = "lsp_diagnostics_hold",
})

vim.opt.signcolumn = "yes"
vim.opt.statuscolumn = " %C%s%l"
vim.opt.numberwidth = 7

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

lvim.format_on_save.enabled = true

require('indent_blankline').setup {
  scope = {
    show_start = false
  }
}

local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
  return
end

dapgo.setup()
