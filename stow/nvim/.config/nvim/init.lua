--[[---------------------------------------------
- Description - Vilyaem's Neovim Configuration
- Author - Vilyaem
- -------------------------------------------]]

vim.g.mapleader = " "


--Vilyaem's Settings
vim.opt.autoindent = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = { tab = '>.' }
vim.opt.mouse = 'a'
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.spelllang = 'en_gb'
vim.opt.shiftwidth = 2
vim.opt.viminfo = ''
vim.opt.history = 1000

--Colouring
vim.cmd("highlight Comment guifg=NONE ")
vim.cmd("highlight @comment guifg=NONE ")
vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
vim.api.nvim_set_hl(0,"NormalFloat",{bg = "none"})
vim.api.nvim_set_hl(0, 'Comment', { fg = '#ADD8E6', ctermfg = 'lightblue' })
vim.api.nvim_set_hl(0, '@comment', { fg = '#ADD8E6', ctermfg = 'lightblue' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#ADD8E6', ctermfg = 'lightblue' })

--Enable King's English Spell Checking
vim.opt.spelllang = 'en_gb'
vim.opt.spell = true

-- Easy search and replace
vim.api.nvim_set_keymap('n', 'S', ':%s///g<Left><Left><Left>', { noremap = true })
vim.api.nvim_set_keymap('v', 'S', ':s///g<Left><Left><Left>', { noremap = true })

-- Easy save
vim.api.nvim_set_keymap('n', 'W', ':w<CR>', { noremap = true })

-- Function or File heading
function FileHeading()
    local line = vim.fn.line(".")
    vim.fn.setline(line, "/*********************************************")
    vim.fn.append(line, "* Description - ")
    vim.fn.append(line + 1, "* Author - Vilyaem")
    vim.fn.append(line + 2, "* *******************************************/")
end
vim.api.nvim_set_keymap('i', '<F4>', '<Esc>:lua FileHeading()<CR>g;kkA', { noremap = true })

-- Section
vim.api.nvim_set_keymap('i', '<F3>', '<Esc>I/*----------!----------*/<Esc>/!<CR>?<CR>xi', { noremap = true })

-- F6 talk to the soybot
vim.api.nvim_set_keymap("n","<F6>","<Esc>:Gen<CR>",{noremap = true, silent = true})

-- Somehow this was unset.
vim.api.nvim_set_keymap('n', '<C-v>', '<C-v>', { noremap = true, silent = true })

-- Set the key mappings for the GDB commands
vim.keymap.set("n", "<leader>db", "<cmd>GdbStart<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dc", "<cmd>GdbContinue<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dn", "<cmd>GdbNext<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ds", "<cmd>GdbStep<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>di", "<cmd>GdbStepInto<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>do", "<cmd>GdbStepOut<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>db", "<cmd>GdbBreakpoint<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dw", "<cmd>GdbWatch<cr>", { noremap = true, silent = true })

-- Calculate expression plugin
vim.api.nvim_create_user_command("Calculate", "lua require(\"calculator\").calculate()",
    { ["range"] = 1, ["nargs"] = 0 })

--softwrap
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true         -- Enable soft wrapping
    vim.opt_local.linebreak = true    -- Wrap at word boundaries
    vim.opt_local.textwidth = 80      -- Hard wrap at 80 if you use gq
    vim.opt_local.colorcolumn = "80"  -- Visual reminder
  end
})

-- Setup packer
-- Install packer.nvim for plugin management
local function bootstrap_packer()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd('packadd packer.nvim')
    return true
  end
  return false
end

local packer_bootstrap = bootstrap_packer()

-- Use packer to manage plugins
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'  -- Package manager

  use{"L3MON4D3/LuaSnip"}
  use{"vzze/calculator.nvim"}
  use{"hrsh7th/nvim-cmp"}
  use{"hrsh7th/cmp-buffer"}
  use{"hrsh7th/cmp-nvim-lsp"}
  use{"hrsh7th/cmp-nvim-lua"}
  use{"hrsh7th/cmp-path"}
  use{"saadparwaiz1/cmp_luasnip"}
  use{"stevearc/conform.nvim"}
  use{"rafamadriz/friendly-snippets"}
  use{"David-Kunz/gen.nvim"}
  use{"lewis6991/gitsigns.nvim"}
  use{"lukas-reineke/indent-blankline.nvim"}
  use{"williamboman/mason.nvim"}
  use{"williamboman/mason-lspconfig.nvim"}
  use{"windwp/nvim-autopairs"}
  use{"sakhnik/nvim-gdb"}
  use{"neovim/nvim-lspconfig"}
  use{"nvim-tree/nvim-tree.lua"}
  use{"nvim-treesitter/nvim-treesitter"}
  use{"nvim-lua/plenary.nvim"}
  use{"nvim-telescope/telescope.nvim"}
  use{"ThePrimeagen/vim-be-good"}
  use{"folke/which-key.nvim"}
  use{"ap/vim-buftabline"}
  use{"stevearc/oil.nvim"}

  use({'jakewvincent/mkdnflow.nvim',
  config = function()
  require('mkdnflow').setup({
  -- Config goes here; leave blank for defaults
      mappings = {
        MkdnNextLink = {'n', '<M-l>'},
        MkdnPrevLink = {'n', '<M-h>'},
    }
  })
  end
  })



  if packer_bootstrap then
    require('packer').sync()
  end
end)


-- Setup installed plugins
require("nvim-tree").setup()
require("mason").setup()
require("telescope").setup{}
require("oil").setup{}


require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./" } })

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}
    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(clangd)
      require('lspconfig').clangd.setup({
        capabilities = lsp_capabilities,
      })
    end,
  },
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = cmp.mapping.preset.insert({
    -- Enter key confirms completion item
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    -- Ctrl + space triggers completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-- Set package keybindings

local map = vim.keymap.set
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })


-- Insert timestamp as Markdown heading for Todolists
map("n", "<leader>t", function()
  local time = os.date("## %Y %m %d %H:%M:%S")
  vim.api.nvim_put({ time }, "l", true, true)
  --vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("kdd", true, false, true), "n", true)
end, { desc = "Insert time as Markdown section" })

-- Open oil on directory or empty file with nothing in stdin
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local args = vim.fn.argv()
    local stdin = vim.fn.line2byte('$') ~= -1
    local dir = vim.fn.isdirectory(args[1] or "")

    if #args == 0 and not stdin then
      require("oil").open()
    elseif #args == 1 and dir == 1 then
      require("oil").open(args[1])
    end
  end,
})

-- Key mappings for tab/buffer navigation
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })

-- Key mappings for closing and creating tabs/buffers
vim.api.nvim_set_keymap('n', '<leader>x', ':bdelete!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':enew<CR>', { noremap = true, silent = true })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

--luasnip snapping
vim.api.nvim_set_keymap("i", "<Ctrl-j>", "<cmd>lua require('luasnip').jump(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Ctrl-k>", "<cmd>lua require('luasnip').jump(-1)<CR>", { noremap = true, silent = true })


map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)
