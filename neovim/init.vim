" Plugins will be downloaded under the specified directory.
colorscheme industry

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-rooter'
Plug 'preservim/nerdcommenter'
Plug 'justinmk/vim-sneak'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-repeat'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  setlocal spell spelllang=en_us
  "set thesaurus+=/home/test/.vim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  "set complete+=s
endfu
map <F2> :call WordProcessor()<CR>

filetype plugin indent on
autocmd FileType python map <buffer> <F9> :w<CR> :split<CR><C-W>j :ter python3 "%"<CR> :startinsert <CR> 
autocmd FileType sh map <buffer> <F9> :w<CR> :split<CR><C-W>j :ter ./"%"<CR> :startinsert <CR> 
autocmd FileType rust map <buffer> <F9> :RustFmt <CR> :w<CR> :split<CR><C-W>j :ter cargo run<CR> :startinsert <CR>
autocmd FileType rust map <buffer> <F8> :RustFmt <CR> :w<CR> :split<CR><C-W>j :ter cargo check<CR> :startinsert <CR> 
map <F5> :NERDTreeToggle<CR>

autocmd filetype python map <F8> :lvimgrep /def\s/ % \| lw<CR>
:set mouse=a
:set nu rnu

let mapleader = ","

map <A-l> :tabn<CR>
map <A-h> :tabp<CR>
map <C-t> :tabedit .<CR>

nnoremap <C-n> :set rnu! nu!<CR>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

map <F3> gg"+yG

map <F4> :edit 
map <F6> :tabedit 

map <A-S-c> :so $MYVIMRC <CR>
map <A-S-e> :tabedit $MYVIMRC <CR>

