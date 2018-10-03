" Key Remaps
" -----------

let mapleader = ','  " Remap Leader key

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Use ctrl-[hjkl] to select the active split! {
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" RUNNING TESTS
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>
map <leader>c :w\|:!cucumber<cr>
map <leader>w :w\|:!cucumber --profile wip --tags @wip:99<cr>
map <leader>W :w\|:!cucumber --profile wip %<cr>
