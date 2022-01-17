require'lsp_signature'.setup({
  bind = true,
  doc_lines = 10,
  floating_window_above_cur_line = true, 
  fix_pos = false,  
  hint_enable = true, 
  hint_prefix = "",
  hint_scheme = "String",
  use_lspsaga = false,
  hi_parameter = "LspSignatureActiveParameter", 
  max_height = 30, 
  max_width = 120, 
  handler_opts = {
    border = "single"   
  },
  always_trigger = true, 
})
