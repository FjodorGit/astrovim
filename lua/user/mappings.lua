-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    --
    -- quickly switch buffers / !!! conflicts with switching windows up and down
    -- ["<C-j>"] = { ":bp<cr>", desc = "Moves one tab to the left" },
    -- ["<C-k>"] = { ":bn<cr>", desc = "Moves one tab to the right" }
    ["<C-p>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<C-n>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    -- Testing
    ["<leader>t"] = { name = " Testing" },
    ["<leader>tt"] = {
      function() require("neotest").run.run() end,
      desc = "Run nearest test",
    },
    ["<leader>gg"] = {
      function() require("neogit").open() end,
      desc = "Open git status window",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    -- quickly switch buffers even when in insert mode
    ["<C-n>"] = { "<cmd>bp<cr>", desc = "Moves one tab to the left" },
    ["<C-p>"] = { "<cmd>:bn<cr>", desc = "Moves one tab to the right" },
  },
}
