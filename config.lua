-- 定义别名
local builtin = lvim.builtin
local keymap = lvim.builtin.which_key.mappings
local nm = lvim.keys.normal_mode
local vm = lvim.keys.visual_mode
local im = lvim.keys.insert_mode
local v = vim

local banner1 = {
  [[                                              ,           ^'^  _     ]],
  [[                                              )               (_) ^'^]],
  [[         _/\_                    .---------. ((        ^'^           ]],
  [[         (('>                    )`'`'`'`'`( ||                 ^'^  ]],
  [[    _    /^|                    /`'`'`'`'`'`\||           ^'^        ]],
  [[    =>--/__|m---               /`'`'`'`'`'`'`\|                      ]],
  [[         ^^           ,,,,,,, /`'`'`'`'`'`'`'`\      ,               ]],
  [[                     .-------.`|`````````````|`  .   )               ]],
  [[                    / .^. .^. \|  ,^^, ,^^,  |  / \ ((               ]],
  [[                   /  |_| |_|  \  |__| |__|  | /,-,\||               ]],
  [[        _         /_____________\ |")| |  |  |/ |_| \|               ]],
  [[       (")         |  __   __  |  '==' '=='  /_______\     _         ]],
  [[      (' ')        | /  \ /  \ |   _______   |,^, ,^,|    (")        ]],
  [[       \  \        | |--| |--| |  ((--.--))  ||_| |_||   (' ')       ]],
  [[     _  ^^^ _      | |__| |("| |  ||  |  ||  |,-, ,-,|   /  /        ]],
  [[   ,' ',  ,' ',    |           |  ||  |  ||  ||_| |_||   ^^^         ]],
  [[.,,|RIP|,.|RIP|,.,,'==========='==''=='==''=='=======',,....,,,,.,ldb]],
  [[]],
}

local banner2 = {
  [[                                   /\                                ]],
  [[                              /\  //\\                               ]],
  [[                       /\    //\\///\\\        /\                    ]],
  [[                      //\\  ///\////\\\\  /\  //\\                   ]],
  [[         /\          /  ^ \/^ ^/^  ^  ^ \/^ \/  ^ \                  ]],
  [[        / ^\    /\  / ^   /  ^/ ^ ^ ^   ^\ ^/  ^^  \                 ]],
  [[       /^   \  / ^\/ ^ ^   ^ / ^  ^    ^  \/ ^   ^  \       *        ]],
  [[      /  ^ ^ \/^  ^\ ^ ^ ^   ^  ^   ^   ____  ^   ^  \     /|\       ]],
  [[     / ^ ^  ^ \ ^  _\___________________|  |_____^ ^  \   /||o\      ]],
  [[    / ^^  ^ ^ ^\  /______________________________\ ^ ^ \ /|o|||\     ]],
  [[   /  ^  ^^ ^ ^  /________________________________\  ^  /|||||o|\    ]],
  [[  /^ ^  ^ ^^  ^    ||___|___||||||||||||___|__|||      /||o||||||\   ]],
  [[ / ^   ^   ^    ^  ||___|___||||||||||||___|__|||          | |       ]],
  [[/ ^ ^ ^  ^  ^  ^   ||||||||||||||||||||||||||||||oooooooooo| |ooooooo]],
  [[ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],
}

-- 添加 neovide 配置
v.cmd('source ~/.config/nvim/neovide.vim')
-- 默认 shell 配置
-- v.opt.background = 'dark'
-- darker lighter oceanic palenight (deep ocean)
vim.g.material_style = 'darker'
v.opt.shell = "pwsh.exe -NoLogo"
v.opt.timeoutlen = 1
v.opt.relativenumber = false
v.opt.colorcolumn = "80"
v.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
v.cmd [[
  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=
]]

-- 向 whichKey 插件上添加新的快捷键
v.o.inccommand = "split"

-- 查询替换
keymap["S"] = { name = "Search And Replace" }
keymap["S"]["w"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Word" }
keymap["S"]["c"] = { "viw:lua require('spectre').open_file_search()<cr>", "Current Buffer" }
keymap["S"]["t"] = { "<cmd>MurenToggle<CR>", "Muren Toggle" }
keymap["S"]["o"] = { "<cmd>MurenOpen<CR>", "Muren Open" }
keymap["S"]["r"] = { "<cmd>MurenFresh<CR>", "Muren Refresh" }

keymap["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- 复制当前文件完整路径
keymap["y"] = { name = "Copy File Path" }
keymap["y"]["y"] = { ":Cppath<CR>", "Copy Current File Path" }

-- markdown 预览
keymap["m"] = { name = "Markdown Preview" }
keymap["m"]["p"] = { "<cmd>MarkdownPreview<CR>", "Markdown Preview" }
keymap["m"]["s"] = { "<cmd>MarkdownPreviewStop<CR>", "Markdown Preview Stop" }
keymap["m"]["t"] = { "<cmd>MarkdownPreviewToggle<CR>", "Markdown Preview Toggle" }

-- 剪切功能兼容
v.g.clipboard = {
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
lvim.colorscheme = "material"
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
-- nm["  "] = "/<C-r><C-w><CR>"
nm["zlg"] = "^v$hcconsole.log()<esc>P"
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
-- nm["ms "] = "ciw  <esc>P"
-- vm["ms "] = "c  <esc>P"
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
nm["<leader>k"] = "mjO<esc>`j"
im["<C-z>"] = "<esc>A"
im["<C-e>"] = "<esc>m`:s/\\v(.)$/\\=submatch(1)==';' ? '' : submatch(1).';'<CR>:nohl<CR><esc>``a"
im["<C-d>"] = "<esc>m`:s/\\v(.)$/\\=submatch(1)==',' ? '' : submatch(1).','<CR>:nohl<CR><esc>``a"

-- 激活一些插件及配置
builtin.alpha.active = true
builtin.dap.active = false
builtin.alpha.mode = "dashboard"
builtin.alpha.dashboard.section.header.val = banner2
builtin.terminal.active = true
builtin.cmp.cmdline.enable = true
builtin.terminal.shell = "pwsh.exe -NoLogo"
builtin.nvimtree.setup.diagnostics.enable = true
builtin.nvimtree.setup.filters.custom = nil
builtin.nvimtree.setup.git.enable = false
builtin.nvimtree.setup.update_cwd = nil
builtin.nvimtree.setup.update_focused_file.update_cwd = nil
-- builtin.nvimtree.setup.view.side = "left"
builtin.nvimtree.setup.view.float = {
  enable = true,
  quit_on_focus_loss = true,
  open_win_config = {
    relative = "editor",
    border = "rounded",
    width = 80,
    height = 35,
    row = 1,
    col = 1,
  },
}
builtin.nvimtree.setup.renderer.highlight_git = nil
builtin.nvimtree.setup.renderer.icons.show.git = nil

-- treesitter 插件相关配置
builtin.treesitter.ensure_installed = {}          -- 禁止自动安装相关语法解析
builtin.treesitter.ignore_install = { "haskell" } -- 忽略安装的语法解析语言
builtin.treesitter.highlight.enable = true        -- 开启高亮模式

-- 自定义安装插件
lvim.plugins = {
  {
    "windwp/nvim-spectre",
    event = "VeryLazy",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      v.api.nvim_set_keymap("n", "S", ":HopChar2<cr>", { silent = true })
      v.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })
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
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    event = "VeryLazy",
    config = function()
      v.g.mkdp_auto_start = 1
    end,
  },
  {
    'rmagatti/goto-preview',
    event = "VeryLazy",
    config = function()
      require('goto-preview').setup {
        width = 120,
        height = 20,
      }
    end
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = "VeryLazy",
  --   config = function()
  --     v.defer_fn(function()
  --       require("copilot").setup {
  --         plugin_manager_path = get_runtime_dir() .. "/site/pack/lazy",
  --         panel = {
  --           auto_refresh = true,
  --         },
  --         suggestion = {
  --           auto_trigger = true,
  --           keymap = {
  --             accept = "<A-f>",
  --             accept_word = false,
  --             accept_line = false,
  --             next = "<Tab>",
  --             prev = "<S-Tab>",
  --             dismiss = "<A-c>",
  --           },
  --         }
  --       }
  --     end, 100)
  --   end,
  -- },

  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua", "nvim-cmp" },
  --   config = function()
  --     require("copilot_cmp").setup {
  --       formatters = {
  --         insert_text = require("copilot_cmp.format").remove_existing,
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   'Bekaboo/deadcolumn.nvim',
  --   event = "VeryLazy",
  --   config = function()
  --     require('deadcolumn').setup({
  --       modes = { 'i', 'ic', 'ix', 'R', 'Rc', 'Rx', 'Rv', 'Rvc', 'Rvx', 'n' },
  --       blending = {
  --         threshold = 0.75,
  --         colorcode = "#9ece6a",
  --         hlgroup = {
  --           'Normal',
  --           'background',
  --         },
  --       },
  --       warning = {
  --         alpha = 1,
  --         offset = 0,
  --         colorcode = "#db4b4b",
  --         hlgroup = {
  --           'Error',
  --           'background',
  --         },
  --       },
  --     })
  --   end
  -- },
  {
    'AckslD/muren.nvim',
    config = true,
    event = "VeryLazy",
  },
  {
    'marko-cerovac/material.nvim'
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "TroubleToggle",
  }
}

table.insert(lvim.plugins, {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    vim.defer_fn(function()
      require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
      require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
    end, 100)
  end,
})

-- 创建自定义命令
v.api.nvim_create_user_command("Cppath", function()
  local path = v.fn.expand("%:p")
  v.fn.setreg("+", path)
  v.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

v.keymap.set(
  "n",
  "gpd",
  "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
  { noremap = true }
)
v.keymap.set(
  "n",
  "gpt",
  "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
  { noremap = true }
)
v.keymap.set(
  "n",
  "gpi",
  "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
  { noremap = true }
)
v.keymap.set("n",
  "gP",
  "<cmd>lua require('goto-preview').close_all_win()<CR>",
  { noremap = true }
)
v.keymap.set(
  "n",
  "gpr",
  "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
  { noremap = true }
)
lvim.builtin.cmp.formatting.source_names["copilot"] = "🤖"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
