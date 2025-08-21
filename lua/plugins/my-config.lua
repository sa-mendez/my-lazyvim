-- every sp c file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  { "marko-cerovac/material.nvim" },

  { "lambdalisue/suda.vim" },

  { "kevinhwang91/nvim-bqf" },

  { "norcalli/nvim-colorizer.lua" },

  -- My tail plugin
  {
    "sa-mendez/tail.nvim",
    config = function()
      require("tail_nvim").setup({
        smart_tail = true,
        notifier = vim.notify,
      })
    end,
    event = "BufRead",
  },

  -- Enable the display of hidden and ignored files in all the pickers
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        ignored = true,
        sources = {
          files = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },

  -- which-key overrides for my own use
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        -- Add new buffer binding under Buffer group
        { "<leader>bn", "<cmd>enew<cr>", desc = "New Buffer" },

        --Lazy group under <leader>l
        { "<leader>lr", "<cmd>LazyRoot<cr>", desc = "Lazy Root" },
        { "<leader>ll", "<cmd>Lazy<cr>", desc = "Lazy" },
        { "<leader>lx", "<cmd>LazyExtra<cr>", desc = "Lazy Extra" },
        { "<leader>l", group = "+Lazy", icon = "💤" },

        -- Toggle group under <leader>t
        { "<leader>ta", "<cmd>ToggleTailBuffer<cr>", desc = "Toggle Tail Buffer" },
        { "<leader>tc", "<cmd>ColorizerToggle<cr>", desc = "Toggle Colorizer" },
        { "<leader>tl", "<cmd>set list!<cr>", desc = "Toggle List" },
        { "<leader>tm", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview" },
        {
          "<leader>tT",
          function()
            local buf_dir = vim.fn.expand("%:p:h")
            Snacks.terminal(nil, { cwd = buf_dir })
          end,
          desc = "Toggle Terminal (Buffer Dir)",
        },
        {
          "<leader>tt",
          function()
            Snacks.terminal(nil, { cwd = LazyVim.root() })
          end,
          desc = "Toggle Terminal (Root Dir)",
        },
        { "<leader>tw", "<cmd>set wrap!<cr>", desc = "Toggle Wrap" },
        {
          "<leader>t/",
          '<cmd>cex[] | execute \'g//caddexpr expand("%") . ":" . line(".") . ":" . getline(".")\' | cw<cr>',
          desc = "Quickfix from last search",
        },
        { "<leader>t", group = "+Toggle", icon = "" },

        -- Write group under <leader>a
        { "<leader>aa", "<cmd>w!<cr>", desc = "Save" },
        {
          "<leader>as",
          function()
            vim.ui.input({ prompt = "Save buffer as: " }, function(filename)
              if filename and filename ~= "" then
                vim.cmd("saveas " .. vim.fn.fnameescape(filename))
              end
            end)
          end,
          desc = "Save As",
        },
        { "<leader>au", "<cmd>SudaWrite<cr>", desc = "Sudo Save" },
        { "<leader>ax", "<cmd>e ++ff=dos<cr><cmd>set ff=unix<cr><cmd>w<cr>", desc = "Save force Unix" },
        { "<leader>a", group = "+Save", icon = "" },
      },
    },
  },

  -- header override for snacks.nvim dashboard
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
          ███████╗ █████╗ ███╗   ███╗    ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
          ██╔════╝██╔══██╗████╗ ████║    ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
          ███████╗███████║██╔████╔██║    ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
          ╚════██║██╔══██║██║╚██╔╝██║    ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
          ███████║██║  ██║██║ ╚═╝ ██║    ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
          ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝    ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
   ]],
        },
      },
    },
  },

  -- override the snacks.nvim bigfile logic to not trip on single line files that are still small
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      bigfile = {
        line_length = 1000000000,
      },
    },
  },
}
