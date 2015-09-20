" Don't run syntax check on :wq
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = {
      \ 'mode': 'passive',
      \ 'active_filetypes': [
      \   'coffee',
      \   'html',
      \   'javascript',
      \   'json',
      \   'python',
      \   'ruby',
      \   'scss',
      \   'sh',
      \   'vim'
      \ ] }

let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_scss_checkers = ['scss_lint']

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

hi SyntasticErrorSign ctermfg=160
hi SyntasticWarningSign ctermfg=220

augroup syntastic_rubocop_rails
  autocmd!
  autocmd FileType ruby if exists('b:rails_root') |
        \ let b:syntastic_ruby_rubocop_options = '--rails' |
        \ endif
augroup END
