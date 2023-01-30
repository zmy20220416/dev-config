-- 添加 neovide 配置
vim.cmd('source ~/.config/nvim/neovide.vim')

-- 默认 shell 配置
vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.timeoutlen = 1
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
                let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
                let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
                set shellquote= shellxquote=
  ]]

-- 定义别名
local xl = lvim.builtin
local keymap = lvim.builtin.which_key.mappings
local zmy = lvim.keys.normal_mode
local zh = lvim.keys.visual_mode

-- 向 whichKey 插件上添加新的快捷键
-- 查询和替换快捷键
keymap["r"] = { name = "SearchReplaceSingleBuffer" }

keymap["r"]["s"] =
{ "<CMD>SearchReplaceSingleBufferSelections<CR>", "SearchReplaceSingleBuffer [s]elction list" }
keymap["r"]["o"] = { "<CMD>SearchReplaceSingleBufferOpen<CR>", "[o]pen" }
keymap["r"]["w"] = { "<CMD>SearchReplaceSingleBufferCWord<CR>", "[w]ord" }
keymap["r"]["W"] = { "<CMD>SearchReplaceSingleBufferCWORD<CR>", "[W]ORD" }
keymap["r"]["e"] = { "<CMD>SearchReplaceSingleBufferCExpr<CR>", "[e]xpr" }
keymap["r"]["f"] = { "<CMD>SearchReplaceSingleBufferCFile<CR>", "[f]ile" }

keymap["r"]["b"] = { name = "SearchReplaceMultiBuffer" }

keymap["r"]["b"]["s"] =
{ "<CMD>SearchReplaceMultiBufferSelections<CR>", "SearchReplaceMultiBuffer [s]elction list" }
keymap["r"]["b"]["o"] = { "<CMD>SearchReplaceMultiBufferOpen<CR>", "[o]pen" }
keymap["r"]["b"]["w"] = { "<CMD>SearchReplaceMultiBufferCWord<CR>", "[w]ord" }
keymap["r"]["b"]["W"] = { "<CMD>SearchReplaceMultiBufferCWORD<CR>", "[W]ORD" }
keymap["r"]["b"]["e"] = { "<CMD>SearchReplaceMultiBufferCExpr<CR>", "[e]xpr" }
keymap["r"]["b"]["f"] = { "<CMD>SearchReplaceMultiBufferCFile<CR>", "[f]ile" }

lvim.keys.visual_block_mode["<C-r>"] = [[<CMD>SearchReplaceSingleBufferVisualSelection<CR>]]
lvim.keys.visual_block_mode["<C-s>"] = [[<CMD>SearchReplaceWithinVisualSelection<CR>]]
lvim.keys.visual_block_mode["<C-b>"] = [[<CMD>SearchReplaceWithinVisualSelectionCWord<CR>]]

vim.o.inccommand = "split"

-- 查询替换
keymap["S"] = { name = "Search And Replace" }
keymap["S"]["w"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Word" }
keymap["S"]["c"] = { "viw:lua require('spectre').open_file_search()<cr>", "Current Buffer" }

-- 复制当前文件完整路径
keymap["y"] = { name = "Copy File Path" }
keymap["y"]["y"] = { ":Cppath<CR>", "Copy Current File Path" }

-- markdown 预览
keymap["m"] = { name = "Markdown Preview" }
keymap["m"]["p"] = { "<cmd>MarkdownPreview<CR>", "Markdown Preview" }
keymap["m"]["s"] = { "<cmd>MarkdownPreviewStop<CR>", "Markdown Preview Stop" }
keymap["m"]["t"] = { "<cmd>MarkdownPreviewToggle<CR>", "Markdown Preview Toggle" }

-- 剪切功能兼容
vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}

-- 通用配置
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.transparent_window = false
lvim.colorscheme = "lunar"
lvim.leader = "space"

-- 添加自己的快捷键
zmy["<C-s>"] = ":w<cr>"
zmy[","] = "$a,<esc>"
zmy["<leader>1"] = ":BufferLineGoToBuffer 1<CR>"
zmy["<leader>2"] = ":BufferLineGoToBuffer 2<CR>"
zmy["<leader>3"] = ":BufferLineGoToBuffer 3<CR>"
zmy["<leader>4"] = ":BufferLineGoToBuffer 4<CR>"
zmy["<leader>5"] = ":BufferLineGoToBuffer 5<CR>"
zmy["<leader>6"] = ":BufferLineGoToBuffer 6<CR>"
zmy["<leader>7"] = ":BufferLineGoToBuffer 7<CR>"
zmy["<leader>8"] = ":BufferLineGoToBuffer 8<CR>"
zmy["<leader>9"] = ":BufferLineGoToBuffer 9<CR>"
zmy[";"] = "$a;<esc>"
zmy["}"] = "$a}<esc>"
zmy["  "] = "/"
zmy["n"] = "nzzzv"
zmy["N"] = "Nzzzv"
zmy["L"] = "$"
zmy["<S-g>"] = "Gzz"
zmy["H"] = "^"
zh["L"] = "$"
zh["H"] = "^"
zmy["  "] = "/"
zmy["cp"] = "yap<S-}>p"
zmy["cn"] = "*``cgn"
zmy["cN"] = "*``cgN"
zmy["<leader>a"] = "ggVG"
zmy["<leader>="] = "m`=ip``"
zmy["<leader>gt"] = ":GitBlameToggle<CR>"
zmy["Q"] = "@q"
zmy[";"] = "m`A;<esc>``"
zmy[","] = "m`A,<esc>``"
zmy["'"] = "ciw''<esc>P"
zmy["`"] = "ciw``<esc>P"
zmy["ms "] = "ciw  <esc>P"
zh["ms "] = "c  <esc>P"
zh["'"] = "c''<esc>P"
zmy["("] = "ciw()<esc>P"
zh["("] = "c()<esc>P"
zmy["["] = "ciw[  ]<esc>hP"
zh["["] = "c[  ]<esc>hP"
zmy["{"] = "ciw{  }<esc>hP"
zh["{"] = "c{  }<esc>hP"
zmy["\""] = "ciw\"\"<esc>P"
zh["\""] = "c\"\"<esc>P"
zmy["<C-l"] = "<C-w>l"
zmy["<C-h"] = "<C-w>h"
zmy["<C-j"] = "<C-w>j"
zmy["<C-k"] = "<C-w>k"
zmy["<leader>j"] = "mjo<esc>`j"
zmy["<leader>J"] = "mjO<esc>`j"

-- 激活一些插件及配置
xl.alpha.active = true
xl.alpha.mode = "dashboard"
xl.terminal.active = true
xl.terminal.shell = "pwsh.exe -NoLogo"
xl.nvimtree.setup.diagnostics.enable = nil
xl.nvimtree.setup.filters.custom = nil
xl.nvimtree.setup.git.enable = nil
xl.nvimtree.setup.update_cwd = nil
xl.nvimtree.setup.update_focused_file.update_cwd = nil
xl.nvimtree.setup.view.side = "left"
xl.nvimtree.setup.renderer.highlight_git = nil
xl.nvimtree.setup.renderer.icons.show.git = nil

-- treesitter 插件相关配置
xl.treesitter.ensure_installed = {} -- 禁止自动安装相关语法解析
xl.treesitter.ignore_install = { "haskell" } -- 忽略安装的语法解析语言
xl.treesitter.highlight.enable = true -- 开启高亮模式


-- 自定义安装插件
lvim.plugins = {
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "S", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  {
    'f-person/git-blame.nvim',
    event = "BufRead"
  },
  {
    "roobert/search-replace.nvim",
    config = function()
      require("search-replace").setup({
        -- optionally override defaults
        default_replace_single_buffer_options = "gcI",
        default_replace_multi_buffer_options = "egcI",
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
}

-- 创建自定义命令
vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
