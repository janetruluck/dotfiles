" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/plugged')

" Color Scheme
Plug 'joshdick/onedark.vim'

" Powerline
Plug 'itchyny/lightline.vim'

" Commenting
Plug 'scrooloose/nerdcommenter'

" Search
Plug 'eugen0329/vim-esearch'

" Completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Syntax
Plug 'elixir-editors/vim-elixir'

" Initialize plugin system
call plug#end()
