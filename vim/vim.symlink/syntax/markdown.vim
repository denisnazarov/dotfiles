set nocursorcolumn
setlocal spell
set complete+=kspell

let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'python']

" Checkbox highlighting
syn match markdownCheckboxUnchecked "^\s*\[\s\]" contained
syn match markdownCheckboxChecked "^\s*\[X\]" contained
syn match markdownUnchecked "^\s*\[\s\] .*$" contains=markdownCheckboxUnchecked
syn match markdownChecked "^\s*\[X\] .*$" contains=markdownCheckboxChecked
