return {
  'dmmulroy/tsc.nvim',
  cmd = 'TSC',
  opts = {
    enable_progress_notifications = false,
    flags = {
      watch = true,
    },
    pretty_errors = false,
    use_diagnostics = true,
    use_trouble_qflist = true,
  },
}
