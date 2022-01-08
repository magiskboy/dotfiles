require'lsp_signature'.setup({
  -- This is mandatory, otherwise border config won't get registered.
  bind = true,

 -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
  doc_lines = 10,

  -- try to place the floating above the current line when possible Note:
  floating_window_above_cur_line = true, 

  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap
  -- set to true, the floating window will not auto-close until finish all parameters
  fix_pos = false,  

  -- virtual hint enable
  hint_enable = true, 

  hint_prefix = "",

  hint_scheme = "String",

  use_lspsaga = false,

  -- how your parameter will be highlight
  hi_parameter = "LspSignatureActiveParameter", 

  -- max height of signature floating_window, if content is more than max_height, you can scroll down to view the hiding contents
  max_height = 30, 

  -- max_width of signature floating_window, line will be wrapped if exceed max_width
  max_width = 120, 

  handler_opts = {
    -- double, rounded, single, shadow, none
    border = "single"   
  },

  -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
  always_trigger = true, 
})
