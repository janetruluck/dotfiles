" Plugin Configurations
" ----------------------

" Lightline
set noshowmode

" Deoplete
let g:deoplete#enable_at_startup = 1

" ESearch
" Start esearch prompt autofilled with one of g:esearch.use initial patterns
call esearch#map('<leader>ff', 'esearch')
" Start esearch autofilled with a word under the cursor
call esearch#map('<leader>fw', 'esearch-word-under-cursor')
