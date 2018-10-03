" General Vim/NeoVim Configurations
" ------------------

" Directories
let base_dir = $HOME . '/.config/'
let backup_dir = base_dir . 'backups'
let undo_dir = base_dir . 'undos'
let swap_dir = base_dir . 'swaps'

" Settings
set t_Co=256                        " Set vim to 256 color
scriptencoding utf-8
filetype plugin indent on           " Automatically detect file types.
syntax on                           " Syntax highlighting
set mouse=a                         " Automatically enable mouse usage
set mousehide                       " Hide the mouse cursor while typing
set history=1000                    " Store a ton of history (default is 20)
set hidden                          " Allow buffer switching without saving"
set nospell
set virtualedit=onemore             " Allow for cursor beyond last character
set splitright                      " Split new files to the right with C-w + n
set backup                  	    " Enable Backups

" Setup Backup/Swap/Undo dir
if exists("*mkdir")
  if !isdirectory(base_dir)
    echo "[One time action] Creating base_dir at:" . base_dir
    call mkdir(base_dir)
  endif
endif

if isdirectory(base_dir)
  " Backup Dir
  if !isdirectory(backup_dir)
    echo "[One time action] Creating backup_dir at:" . backup_dir
    call mkdir(backup_dir)
  endif
  if isdirectory(backup_dir)
    exec "set backupdir=" . backup_dir
  else
    echo "Warning: Unable to find backup directory: " . backup_dir
    echo "Try: mkdir -p " . backup_dir
  end

  " Undo Dir
  if !isdirectory(undo_dir)
    echo "[One time action] Creating undo_dir at:" . undo_dir
    call mkdir(undo_dir)
  endif
  if isdirectory(undo_dir)
    exec "set undodir=" . undo_dir
  else
    echo "Warning: Unable to find undo directory: " . undo_dir
    echo "Try: mkdir -p " . undo_dir
  end

  " Swap Dir
  if !isdirectory(swap_dir)
    echo "[One time action] Creating swap_dir at:" . swap_dir
    call mkdir(swap_dir)
  endif
  if isdirectory(swap_dir)
    exec "set directory=" . swap_dir
  else
    echo "Warning: Unable to find swap directory: " . swap_dir
    echo "Try: mkdir -p " . swap_dir
  end
else
  echo "Warning: Unable to find base directory: " . base_dir
  echo "Try: mkdir -p " . base_dir
endif

" Setup Persistent Undo
if has('persistent_undo')
  set undofile                " Enable persistent undo
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif


" Use system clipboard {
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set clipboard+=unnamed
  else
    set clipboard+=unnamedplus
  endif
else
  set clipboard+=unnamedplus
endif


" Nice Defaults
set backspace=indent,eol,start  " Make backspace not dumb
set colorcolumn=80              " Add indicator for 80 character line length
set tabpagemax=10               " Only show 10 tabs
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set foldmethod=syntax
set foldlevel=100

" Formatting
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=2                " Use indents of 2 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every four columns
set softtabstop=2               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

" Highlight Whitespace
highlight ExtraWhitespace ctermbg=lightred guibg=lightred
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove Trailing whitespace on save and on [F5]
autocmd FileType c,cpp,java,go,php,javascript,python,ruby,twig,xml,vim,yml autocmd BufWritePre <buffer> :%s/\s\+$//e " Auto removal on save for certain file types
