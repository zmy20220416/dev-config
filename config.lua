vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.timeoutlen = 1
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
                let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
                let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
                set shellquote= shellxquote=
  ]]

-- 向 whichKey 插件上添加新的快捷键
lvim.builtin.which_key.mappings["S"] = { -- 查询替换
  name = "Search And Replace",
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Word" },
  c = { "viw:lua require('spectre').open_file_search()<cr>", "Word" },
}
lvim.builtin.which_key.mappings["y"] = { -- 复制当前文件完整路径
  name = "Copy File Path",
  y = { ":Cppath<CR>", "Copy Current File Path" }
}

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
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode[","] = "$a,<esc>"
lvim.keys.normal_mode["<leader>1"] = ":BufferLineGoToBuffer 1<CR>"
lvim.keys.normal_mode["<leader>2"] = ":BufferLineGoToBuffer 2<CR>"
lvim.keys.normal_mode["<leader>3"] = ":BufferLineGoToBuffer 3<CR>"
lvim.keys.normal_mode["<leader>4"] = ":BufferLineGoToBuffer 4<CR>"
lvim.keys.normal_mode["<leader>5"] = ":BufferLineGoToBuffer 5<CR>"
lvim.keys.normal_mode["<leader>6"] = ":BufferLineGoToBuffer 6<CR>"
lvim.keys.normal_mode["<leader>7"] = ":BufferLineGoToBuffer 7<CR>"
lvim.keys.normal_mode["<leader>8"] = ":BufferLineGoToBuffer 8<CR>"
lvim.keys.normal_mode["<leader>9"] = ":BufferLineGoToBuffer 9<CR>"
lvim.keys.normal_mode[";"] = "$a;<esc>"
lvim.keys.normal_mode["}"] = "$a}<esc>"
lvim.keys.normal_mode["  "] = "/"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["L"] = "$"
lvim.keys.normal_mode["<S-g>"] = "Gzz"
lvim.keys.normal_mode["H"] = "^"
lvim.keys.visual_mode["L"] = "$"
lvim.keys.visual_mode["H"] = "^"
lvim.keys.normal_mode["  "] = "/"
lvim.keys.normal_mode["cp"] = "yap<S-}>p"
lvim.keys.normal_mode["cn"] = "*``cgn"
lvim.keys.normal_mode["cN"] = "*``cgN"
lvim.keys.normal_mode["<leader>a"] = "ggVG"
lvim.keys.normal_mode["<leader>="] = "m`=ip``"
lvim.keys.normal_mode["<leader>gt"] = ":GitBlameToggle<CR>"
lvim.keys.normal_mode["Q"] = "@q"
lvim.keys.normal_mode[";"] = "m`A;<esc>``"
lvim.keys.normal_mode[","] = "m`A,<esc>``"
lvim.keys.normal_mode["'"] = "ciw''<esc>P"
lvim.keys.normal_mode["`"] = "ciw``<esc>P"
lvim.keys.normal_mode["ms "] = "ciw  <esc>P"
lvim.keys.visual_mode["ms "] = "c  <esc>P"
lvim.keys.visual_mode["'"] = "c''<esc>P"
lvim.keys.normal_mode["("] = "ciw()<esc>P"
lvim.keys.visual_mode["("] = "c()<esc>P"
lvim.keys.normal_mode["["] = "ciw[  ]<esc>hP"
lvim.keys.visual_mode["["] = "c[  ]<esc>hP"
lvim.keys.normal_mode["{"] = "ciw{  }<esc>hP"
lvim.keys.visual_mode["{"] = "c{  }<esc>hP"
lvim.keys.normal_mode["\""] = "ciw\"\"<esc>P"
lvim.keys.visual_mode["\""] = "c\"\"<esc>P"
lvim.keys.normal_mode["<C-l"] = "<C-w>l"
lvim.keys.normal_mode["<C-h"] = "<C-w>h"
lvim.keys.normal_mode["<C-j"] = "<C-w>j"
lvim.keys.normal_mode["<C-k"] = "<C-w>k"
lvim.keys.normal_mode["<leader>j"] = "mjo<esc>`j"
lvim.keys.normal_mode["<leader>J"] = "mjO<esc>`j"

-- 激活一些插件及配置
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.shell = "pwsh.exe -NoLogo"
lvim.builtin.nvimtree.setup.diagnostics.enable = nil
lvim.builtin.nvimtree.setup.filters.custom = nil
lvim.builtin.nvimtree.setup.git.enable = nil
lvim.builtin.nvimtree.setup.update_cwd = nil
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = nil
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.highlight_git = nil
lvim.builtin.nvimtree.setup.renderer.icons.show.git = nil

-- treesitter 插件相关配置
lvim.builtin.treesitter.ensure_installed = {} -- 禁止自动安装相关语法解析
lvim.builtin.treesitter.ignore_install = { "haskell" } -- 忽略安装的语法解析语言
lvim.builtin.treesitter.highlight.enable = true -- 开启高亮模式


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
  }
}

-- 创建自定义命令
vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
