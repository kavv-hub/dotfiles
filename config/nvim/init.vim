call plug#begin()
  Plug 'scrooloose/nerdtree'
  Plug 'Yggdroot/indentLine'
  Plug 'cohama/lexima.vim'

  " style
  Plug 'chriskempson/base16-vim'
  Plug 'camspiers/animate.vim'
  Plug 'camspiers/lens.vim'

  " git
  Plug 'tpope/vim-fugitive'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'neovim/nvim-lspconfig'

  " ruby
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'

  " elixir
  Plug 'elixir-editors/vim-elixir'
call plug#end()

source ~/.config/nvim/rc/colors.vim
source ~/.config/nvim/rc/lsp.vim

" basic
syntax on
filetype plugin indent on

set number
set splitright
set clipboard=unnamed

" ruby syntax
let g:ruby_indent_access_modifier_style = 'indent'
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_hanging_elements = 0

" shortcut
ca tn tabnew

nnoremap <C-h> :tabp<CR>                                                                            
nnoremap <C-l> :tabn<CR>
nnoremap <silent> ;; :FZF<CR>
nnoremap <silent> ff :Rg<CR>

vnoremap <C-c> "*y

command! -bang -nargs=* Rg call RipgrepFzf(<q-args>, <bang>0) 

function! RipgrepFzf(query, fullscreen)
  let command_fmt = "rg --column --line-number --no-heading --smart-case %s"
  let command = printf(command_fmt, shellescape(a:query))
  let spec = {'options': '--delimiter : --nth 4..'}
  call fzf#vim#grep(command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
