return {
  'nvim-orgmode/orgmode',
  enabled = false,
  event = 'VeryLazy',
  ft = { 'org' },
  opts = {
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
    },
  init = function ()

    -- Experimental LSP support
    vim.lsp.enable('org')
  end,
}
