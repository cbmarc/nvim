call plug#begin()
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'sheerun/vim-polyglot'
  Plug 'pangloss/vim-javascript'    " JavaScript support
  Plug 'leafgarland/typescript-vim' " TypeScript syntax
  Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
  Plug 'jparise/vim-graphql'        " GraphQL syntax
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'morhetz/gruvbox'
  Plug 'tomasr/molokai'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-commentary'
  Plug 'joshdick/onedark.vim'
call plug#end()

syntax enable
set background=dark
colorscheme onedark

let g:airline_theme = "onedark"

let g:molokai_original = 1


let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

let g:coc_global_extensions += ['coc-prettier']
"let g:coc_global_extensions += ['coc-eslint']

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

command! -bang -nargs=* Rg call fzf#vim#grep("rg -g '!dist' -g '!node_modules' --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Remap LEADER to SPACE
nnoremap <SPACE> <Nop>
let mapleader=" "

" Moving stuff around
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Kill buffer
nnoremap <C-c> :bn\|bd #<CR>

" CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

tnoremap <Esc> <C-\><C-n>

" Remove highlighting after search
nnoremap <silent> <Esc> :noh<CR>

" Open file search
nnoremap <silent> <LEADER>fo :Files<CR> 

" Search in files
nnoremap <silent> <LEADER>ff :Rg<CR>

" Quit, to close windows faster 
nnoremap <silent> <LEADER>q :q<CR>

set clipboard+=unnamedplus

filetype plugin on
set omnifunc=syntaxcomplete#Complete


" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif     
