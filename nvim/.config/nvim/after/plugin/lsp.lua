vim.opt.signcolumn = 'yes'

local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'rust_analyzer',
  'gopls',
  'html',
  'bashls'
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false, desc = ""}

  opts["desc"] = "[G]oto [D]efinition (lsp)"
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  opts["desc"] = "Hover documentation (lsp)"
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  opts["desc"] = "[W]orkspace [S]ymbols (lsp)"
  vim.keymap.set("n", "<leader>ws", require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)
  opts["desc"] = "Open diagnotic float (lsp)"
  vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
  opts["desc"] = "Goto next diagnostic (lsp)"
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  opts["desc"] = "Goto next diagnostic (lsp)"
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  opts["desc"] = "[C]ode [A]action (lsp)"
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  opts["desc"] = "[G]oto [R]eferences (lsp)"
  --vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>gr", require('telescope.builtin').lsp_references, opts)
  opts["desc"] = "[R]e[n]ame (lsp)"
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  opts["desc"] = "Signature help (lsp)"
  -- vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
  -- vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
  opts["desc"] = "set loclist (lsp)"
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
end)

lsp.setup()
