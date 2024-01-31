-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

-- lvim.colorscheme = "dracula"
-- lvim.format_on_save.enabled = true
-- lvim.keys.normal_mode["<C-h>"] = ":!echo 11<CR>"


-- lvim.transparent_window = true
-- vim.opt.background = 'light'
vim.lsp.set_log_level("trace")
lvim.log.level = "info"

lvim.plugins = {
  "shaunsingh/solarized.nvim",
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
  -- "ellisonleao/gruvbox.nvim",
  "morhetz/gruvbox",
  "sainnhe/gruvbox-material",
  "luisiacc/gruvbox-baby",
  "ray-x/starry.nvim"
}


vim.g.codedark_italics = true
vim.g.codedark_modern = false
-- vim.g.codedark_transparent = true

-- disable default jdtls ---
-- vim.g.starry_italic_comments = true
-- vim.o.bg = "light"

vim.g.solarized_italic_comments = true
vim.g.solarized_italic_keywords = true
vim.g.solarized_italic_functions = true
vim.g.solarized_italic_variables = true
vim.g.solarized_contrast = true
vim.g.solarized_borders = true


-- lvim.colorscheme = "solarized"
-- lvim.colorscheme = "monokai-pro"
-- lvim.colorscheme = "codedark"
-- lvim.colorscheme = "seoul256"
lvim.colorscheme = "kanagawa"
-- lvim.colorscheme = "melange"
-- lvim.colorscheme = "everforest"
-- lvim.colorscheme = "visual_studio_code"

-- lvim.colorscheme = "material"
-- vim.g.material_style = "palenight"

-- lvim.colorscheme = "evergarden"
-- lvim.colorscheme = "nvcode"


-- vim.g.gruvbox_contrast_dark = "medium"
-- vim.g.gruvbox_italicize_comments = true
-- vim.g.gruvbox_contrast_dark = "soft"
-- vim.g.gruvbox_invert_tabline = true
-- lvim.colorscheme = "gruvbox"

-- lvim.colorscheme = "gruvbox-material"
-- lvim.colorscheme = "gruvbox-baby"

-- lvim.colorscheme = "oceanic"



vim.lsp.diagnostic.show_line_diagnostics = true -- * Use |vim.diagnostic.open_float()| instead.
vim.lsp.diagnostic.show_position_diagnostics = true


-- map <space>e :lua vim.diagnostic.open_float(0, {scope="line"})<CR>
-- lvim.keys.normal_mode['<S-t>'] = "<Cmd>echo Okay!<CR>"

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


-- set numberwidth = 5

vim.opt.signcolumn = "yes"

vim.opt.statuscolumn = " %C%s%l"
vim.opt.numberwidth = 7


vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

-- lvim.format_on_save = true -- Disable this line
lvim.format_on_save.enabled = true
-- lvim.format_on_save.pattern = { "*.lua", "*.py" }

-- vim.g.bac
-- vim.opt.background = 'light'
-- vim.opt.background = "light"
