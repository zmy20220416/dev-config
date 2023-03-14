-- 添加 neovide 配置
vim.cmd('source ~/.config/vim/neovide.vim')
-- 默认 shell 配置
vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.timeoutlen = 1
vim.opt.relativenumber = true
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
local nm = lvim.keys.normal_mode
local vm = lvim.keys.visual_mode
local im = lvim.keys.insert_mode

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
lvim.transparent_window = true
lvim.colorscheme = "lunar"
lvim.leader = "space"

-- 添加自己的快捷键
nm["<C-s>"] = ":w<cr>"
nm[","] = "$a,<esc>"
nm["<leader>1"] = ":BufferLineGoToBuffer 1<CR>"
nm["<leader>2"] = ":BufferLineGoToBuffer 2<CR>"
nm["<leader>3"] = ":BufferLineGoToBuffer 3<CR>"
nm["<leader>4"] = ":BufferLineGoToBuffer 4<CR>"
nm["<leader>5"] = ":BufferLineGoToBuffer 5<CR>"
nm["<leader>6"] = ":BufferLineGoToBuffer 6<CR>"
nm["<leader>7"] = ":BufferLineGoToBuffer 7<CR>"
nm["<leader>8"] = ":BufferLineGoToBuffer 8<CR>"
nm["<leader>9"] = ":BufferLineGoToBuffer 9<CR>"
nm["}"] = "$a}<esc>"
nm["  "] = "/"
nm["n"] = "nzzzv"
nm["N"] = "Nzzzv"
nm["L"] = "$"
nm["<S-g>"] = "Gzz"
nm["H"] = "^"
vm["L"] = "$"
vm["H"] = "^"
nm["  "] = "/"
nm["cp"] = "yap<S-}>p"
nm["cn"] = "*``cgn"
nm["cN"] = "*``cgN"
nm["<leader>a"] = "ggVG"
nm["<leader>="] = "m`=ip``"
nm["<leader>gt"] = ":GitBlameToggle<CR>"
nm["Q"] = "@q"
nm["vv"] = "^v$h"
-- nm[";"] = "m`A;<esc>``"
-- nm[","] = "m`A,<esc>``"
nm[";"] = "m`:s/\\v(.)$/\\=submatch(1)==';' ? '' : submatch(1).';'<CR>:nohl<CR><esc>``"
nm[","] = "m`:s/\\v(.)$/\\=submatch(1)==',' ? '' : submatch(1).','<CR>:nohl<CR><esc>``"
nm["'"] = "ciw''<esc>P"
nm["`"] = "ciw``<esc>P"
nm["ms "] = "ciw  <esc>P"
vm["ms "] = "c  <esc>P"
vm["'"] = "c''<esc>P"
nm["("] = "m`ciw()<esc>P``"
vm["("] = "c()<esc>P"
nm["["] = "m`ciw[  ]<esc>hP``"
vm["["] = "c[  ]<esc>hP"
nm["{"] = "m`ciw{  }<esc>hP``"
vm["{"] = "c{  }<esc>hP"
nm["\""] = "ciw\"\"<esc>P"
vm["\""] = "c\"\"<esc>P"
nm["<C-l"] = "<C-w>l"
nm["<C-h"] = "<C-w>h"
nm["<C-j"] = "<C-w>j"
nm["<C-k"] = "<C-w>k"
nm["<leader>j"] = "mjo<esc>`j"
nm["<leader>J"] = "mjO<esc>`j"
im["<C-z>"] = "<esc>A"
im["<C-e>"] = "<esc>m`:s/\\v(.)$/\\=submatch(1)==';' ? '' : submatch(1).';'<CR>:nohl<CR><esc>``a"
im["<C-d>"] = "<esc>m`:s/\\v(.)$/\\=submatch(1)==',' ? '' : submatch(1).','<CR>:nohl<CR><esc>``a"

-- 激活一些插件及配置
xl.alpha.active = true
xl.dap.active = false
xl.alpha.mode = "dashboard"
xl.terminal.active = true
xl.cmp.cmdline.enable = true
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
xl.treesitter.ensure_installed = {}          -- 禁止自动安装相关语法解析
xl.treesitter.ignore_install = { "haskell" } -- 忽略安装的语法解析语言
xl.treesitter.highlight.enable = true        -- 开启高亮模式


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
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "less", "typescript" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "rmagatti/goto-preview",
    event = 'BufRead',
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 25; -- Height of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = 20; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>"),
        vim.cmd("nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>"),
        vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>"),
        vim.cmd("nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>"),
        vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>"),
      }
    end
  },
}

-- 创建自定义命令
vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
