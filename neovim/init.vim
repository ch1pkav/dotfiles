" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'NLKNguyen/papercolor-theme'

Plug 'vim-airline/vim-airline'

Plug 'sheerun/vim-polyglot'

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'preservim/nerdtree'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'rust-lang/rust.vim'

Plug 'tpope/vim-surround'

Plug 'airblade/vim-rooter'

Plug 'preservim/nerdcommenter'

Plug 'justinmk/vim-sneak'

Plug 'tell-k/vim-autopep8'

Plug 'tpope/vim-repeat'

"Plug 'anosillus/vim-ipynb'

Plug 'github/copilot.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set completeopt=menu,menuone,noselect

lua <<EOF

  require'lspconfig'.pylsp.setup{}

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-h>'] = cmp.mapping.scroll_docs(-4),
      ['<C-l>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pylsp'].setup {
    capabilities = capabilities
  }
EOF

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
  "setlocal spell spelllang=en_us
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
autocmd FileType c map <buffer> <F9> :w<CR> :split<CR><C-W>j :ter gcc "%" -o .tmp; ./.tmp<CR> :startinsert <CR> 
map <F5> :NERDTreeToggle<CR>

autocmd filetype python map <F8> :lvimgrep /def\s/ % \| lw<CR>
:set mouse=a
:set nu rnu

let mapleader = "\\"

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

set t_Co=259

highlight Normal ctermbg=Black
highlight NonText ctermbg=Black

set background=dark

colorscheme PaperColor

