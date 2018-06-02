call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')

call smartinput#define_rule({
      \   'at'    : '(\%#)',
      \   'char'  : '<Space>',
      \   'input' : '<Space><Space><Left>',
      \   })

call smartinput#define_rule({
      \   'at'    : '{\%#}',
      \   'char'  : '<Space>',
      \   'input' : '<Space><Space><Left>',
      \   })

call smartinput#define_rule({
      \   'at'    : '( \%# )',
      \   'char'  : '<BS>',
      \   'input' : '<Del><BS>',
      \   })

call smartinput#define_rule({
      \   'at': '\s\+\%#',
      \   'char': '<CR>',
      \   'input': "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>",
      \   })

call smartinput#map_to_trigger('i', '$', '$', '$')

call smartinput#define_rule({
      \   'at'       : '`.*\%#.*`',
      \   'char'     : '$',
      \   'input'    : '${}<Left>',
      \   'filetype' : ['typescript'],
      \   })
