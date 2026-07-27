local notify = require('notify')

notify.setup({
    background_colour = "#1E1E1E",
})

-- vim.notify = notify

-- vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
--   local client = vim.lsp.get_client_by_id(ctx.client_id)
--   local level = ({
--     "ERROR",
--     "WARN",
--     "INFO",
--     "DEBUG",
--   })[result.type]
--   notify(result.message, level, {
--     title = client and client.name or "LSP",
--     timeout = 3000, -- You can adjust the timeout for LSP notifications here
--   })
-- end

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, _)
--   local client = vim.lsp.get_client_by_id(ctx.client_id)
--   local diagnostics = result.diagnostics
--   for _, diagnostic in ipairs(diagnostics) do
--     local level = ({
--       [vim.diagnostic.severity.ERROR] = "ERROR",
--       [vim.diagnostic.severity.WARN] = "WARN",
--       [vim.diagnostic.severity.INFO] = "INFO",
--       [vim.diagnostic.severity.HINT] = "DEBUG",
--     })[diagnostic.severity]
--     notify(diagnostic.message, level, {
--       title = client.name .. " Diagnostic",
--       timeout = 3000, -- Adjust timeout
--     })
--   end
-- end
